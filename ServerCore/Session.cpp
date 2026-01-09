#include "pch.h"
#include "Session.h"


LPFN_CONNECTEX		Session::ConnectEx = nullptr;
LPFN_DISCONNECTEX	Session::DisconnectEx = nullptr;

Session::Session() : _recvBuffer(BUFFER_SIZE)
{
	_socket = ::WSASocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, NULL, 0, WSA_FLAG_OVERLAPPED);
	ASSERT_CRASH(_socket != INVALID_SOCKET);

	Init();
	_connectEvent = ConnectEvent();
	_disconnectEvent = DisconnectEvent();
	_recvEvent = RecvEvent();
	_sendEvent = SendEvent();
}


Session::~Session()
{
	::closesocket(_socket);
}

void Session::Init()
{
	{
		DWORD bytes = 0;
		GUID guid = WSAID_CONNECTEX;
		ASSERT_CRASH(::WSAIoctl(_socket, SIO_GET_EXTENSION_FUNCTION_POINTER, &guid, sizeof(guid), 
			&ConnectEx, sizeof(ConnectEx), OUT & bytes, NULL, NULL) != SOCKET_ERROR);
	}

	{
		DWORD bytes = 0;
		GUID guid = WSAID_DISCONNECTEX;
		ASSERT_CRASH(::WSAIoctl(_socket, SIO_GET_EXTENSION_FUNCTION_POINTER, &guid, sizeof(guid), 
			&DisconnectEx, sizeof(DisconnectEx), OUT & bytes, NULL, NULL) != SOCKET_ERROR);
	}
	RegisterRecv();
}



void Session::Send(shared_ptr<SendBuffer> sendBuffer)
{
	if (IsConnected() == false) return;

	bool registered = false;

	{
		WRITE_LOCK;

		_sendQueue.push(sendBuffer);

		if (_sendRegistered.exchange(true) == false)
			registered = true;

		if (registered)
			RegisterSend();
	}
}

bool Session::Connect()
{
	return RegisterConnect();
}

void Session::Disconnect()
{
	if (_connected.exchange(false) == false)
		return;

	wcout << "Disconnected! " << endl;

	RegisterDisconnect();
}

HANDLE Session::GetHandle()
{
	return reinterpret_cast<HANDLE>(_socket);
}

void Session::Dispatch(IocpEvent* iocpEvent, int32 Bytes)
{
	switch (iocpEvent->eventType)
	{
	case EventType::CONNECT:
		ProcessConnect();
		break;
	case EventType::DISCONNECT:
		ProcessDisconnect();
		break;
	case EventType::RECV:
		ProcessRecv(Bytes);
		break;
	case EventType::SEND:
		ProcessSend(Bytes);
		break;
	
	default:
		break;
	}

}

bool Session::RegisterConnect()
{
	if (IsConnected()) return false;

	int opt = 1;
	::setsockopt(_socket, SOL_SOCKET, SO_REUSEADDR, reinterpret_cast<char*>(&opt), sizeof(opt));

	SOCKADDR_IN address;
	address.sin_family = AF_INET;
	address.sin_addr.s_addr = htonl(INADDR_ANY);
	address.sin_port = 0;

	ASSERT_CRASH(::bind(_socket, reinterpret_cast<const SOCKADDR*>(&address), sizeof(address)) != SOCKET_ERROR);

	_connectEvent.Init();
	_connectEvent.owner = shared_from_this();

	DWORD bytes = 0;
	SOCKADDR_IN sockAddr = _netAddress.GetSockAddr();
	if (false == ConnectEx(_socket, reinterpret_cast<SOCKADDR*>(&sockAddr), 
		sizeof(sockAddr), nullptr, 0, &bytes, &_connectEvent))
	{
		const int32 errCode = ::WSAGetLastError();
		if (errCode != WSA_IO_PENDING)
		{
			std::cout << "[Error] ConnectEx() failed. Error Code: " << errCode << std::endl;
			_connectEvent.owner = nullptr;
			return false;
		}
	}

	return true;
}

bool Session::RegisterDisconnect()
{
	_disconnectEvent.Init();
	_disconnectEvent.owner = shared_from_this();

	if (false == DisconnectEx(_socket, &_disconnectEvent, TF_REUSE_SOCKET, 0))
	{
		const int32 errCode = ::WSAGetLastError();
		if (errCode != WSA_IO_PENDING) 
		{
			_disconnectEvent.owner = nullptr;

			ProcessDisconnect();
			return false;
		}
	}
	return true;
}

void Session::RegisterRecv()
{
	if (IsConnected() == false) return;

	_recvEvent.Init();
	_recvEvent.owner = shared_from_this();

	WSABUF wsaBuf;
	wsaBuf.buf = reinterpret_cast<char*>(_recvBuffer.WritePos());
	wsaBuf.len = _recvBuffer.FreeSize();

	DWORD bytes = 0;
	DWORD flags = 0;
	if (SOCKET_ERROR == ::WSARecv(_socket, &wsaBuf, 1, &bytes, &flags, &_recvEvent, nullptr))
	{
		const int32 errCode = ::WSAGetLastError();
		if (errCode != WSA_IO_PENDING)
		{
			_recvEvent.owner = nullptr;
			Disconnect();
			return;
		}
	}

}

void Session::RegisterSend()
{
	if (IsConnected() == false) return;

	_sendEvent.Init();
	_sendEvent.owner = shared_from_this();

	{
		int32 writeSize = 0;
		while (false == _sendQueue.empty())
		{
			shared_ptr<SendBuffer> buffer = _sendQueue.front();

			writeSize += buffer->WriteSize();

			_sendQueue.pop();
			_sendEvent.sendBuffers.push_back(buffer);
		}
	}

	vector<WSABUF> wsaBufs;
	wsaBufs.reserve(_sendEvent.sendBuffers.size());
	for (shared_ptr<SendBuffer> buffer : _sendEvent.sendBuffers)
	{
		WSABUF wsabuf;
		wsabuf.buf = reinterpret_cast<char*>(buffer->Buffer());
		wsabuf.len = buffer->WriteSize();

		wsaBufs.push_back(wsabuf);
	}

	DWORD bytes;
	if (SOCKET_ERROR == ::WSASend(_socket, wsaBufs.data(), 
		static_cast<DWORD>(wsaBufs.size()), &bytes, 0, &_sendEvent, nullptr))
	{
		const int32 errCode = ::WSAGetLastError();
		if (errCode != WSA_IO_PENDING)
		{
			_sendEvent.owner = nullptr;
			_sendEvent.sendBuffers.clear();
			_sendRegistered.store(false);
		}
	}

	
}

void Session::ProcessConnect()
{
	_connectEvent.owner = nullptr;

	::setsockopt(_socket, SOL_SOCKET, SO_UPDATE_CONNECT_CONTEXT, nullptr, 0);

	_connected.store(true);

	OnConnected();
	RegisterRecv();
}

void Session::ProcessDisconnect()
{
	_disconnectEvent.owner = nullptr;

	OnDisconnected();

	/* TODO 세션 삭제*/

	if (auto service = _service.lock())
		service->ReleaseSession(GetSession());
}

void Session::ProcessRecv(int32 Bytes)
{
	_recvEvent.owner = nullptr;
	if (Bytes == 0) {
		Disconnect();
		return;
	}

	if (false == _recvBuffer.OnWrite(Bytes)) {
		Disconnect();
		return;
	}

	while (true)
	{
		int32 dataSize = _recvBuffer.DataSize();

		if (dataSize < sizeof(int32)) break;


		uint32 bodyLen = 0;
		::memcpy(&bodyLen, _recvBuffer.ReadPos(), sizeof(uint32));

		const int32 packetSize = sizeof(uint32) + bodyLen;
		if (dataSize < packetSize) break;

		OnRecv(_recvBuffer.ReadPos(), packetSize);

		if (_recvBuffer.OnRead(packetSize) == false)
			break;
	}

	_recvBuffer.Clean();
	RegisterRecv();
	
}

void Session::ProcessSend(int32 Bytes)
{
	_sendEvent.owner = nullptr;
	_sendEvent.sendBuffers.clear();

	if (Bytes == 0) {

		return;
	}

	OnSend(Bytes);

	WRITE_LOCK;

	if (_sendQueue.empty())
		_sendRegistered.store(false);
	else
		RegisterSend();

}
