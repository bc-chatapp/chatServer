#include "pch.h"
#include "Listener.h"

#include "Service.h"
#include "IocpEvent.h"
#include "Session.h"

LPFN_ACCEPTEX Listener::AcceptEx = nullptr;

Listener::~Listener()
{
	::closesocket(_socket);
}

bool Listener::Start(shared_ptr<Service> service)
{
	_service = service;

	_socket = ::WSASocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, NULL, 0, WSA_FLAG_OVERLAPPED);
	if (_socket == INVALID_SOCKET) return false;

	if (_service->GetIocpCore()->Register(shared_from_this(), 0) == false) return false;

	SOCKADDR_IN sockAddr = _service->GetNetAddress().GetSockAddr();

	if (::bind(_socket, reinterpret_cast<SOCKADDR*>(&sockAddr), sizeof(sockAddr)) == SOCKET_ERROR)
		return false;
	if (::listen(_socket, SOMAXCONN) == SOCKET_ERROR)
		return false;

	GUID guid = WSAID_ACCEPTEX;
	LPVOID* fn = reinterpret_cast<LPVOID*>(&AcceptEx);
	DWORD bytes = 0;
	if (SOCKET_ERROR == ::WSAIoctl(_socket, SIO_GET_EXTENSION_FUNCTION_POINTER, &guid, sizeof(guid),
		fn, sizeof(*fn), OUT & bytes, NULL, NULL))
	{
		return false;
	}

	RegisterAccept();

	return true;
}

HANDLE Listener::GetHandle()
{
	return reinterpret_cast<HANDLE>(_socket);
}

void Listener::Dispatch(IocpEvent* iocpEvent, int32 numOfBytes)
{
	AcceptEvent* acceptEvent = reinterpret_cast<AcceptEvent*>(iocpEvent);
	ProcessAccept(acceptEvent);

	delete acceptEvent;
}

void Listener::RegisterAccept()
{
	shared_ptr<Session> session = _service->CreateSession();
	ASSERT_CRASH(session != nullptr);

	SOCKET socket = session->GetSocket();
	ASSERT_CRASH(socket != INVALID_SOCKET);


	AcceptEvent* acceptEvent = new AcceptEvent();
	acceptEvent->Init();
	acceptEvent->owner = shared_from_this();
	acceptEvent->session = session;
	
	DWORD bytes = 0;
	if (false == AcceptEx(_socket, socket, session->GetAcceptBuffer(), 0,
		sizeof(SOCKADDR_IN) + 16, sizeof(SOCKADDR_IN) + 16, &bytes, acceptEvent))
	{
		const int32 errorCode = ::WSAGetLastError();
		if (errorCode != WSA_IO_PENDING)
		{
			::closesocket(socket);
			delete acceptEvent;
			return;
		}
	}
}

void Listener::ProcessAccept(AcceptEvent* acceptEvent)
{
	shared_ptr<Session> session = acceptEvent->session;


	if (SOCKET_ERROR == ::setsockopt(session->GetSocket(), SOL_SOCKET, SO_UPDATE_ACCEPT_CONTEXT,
		reinterpret_cast<char*>(&_socket), sizeof(_socket)))
	{
		::closesocket(session->GetSocket());
		RegisterAccept();
		return;
	}

	SOCKADDR_IN address;
	int32 sizeadd = sizeof(address);
	if (SOCKET_ERROR == ::getpeername(session->GetSocket(), OUT reinterpret_cast<SOCKADDR*>(&address), &sizeadd))
	{
		RegisterAccept();
		return;
	}
	session->SetAddress(address);

	// _connecteㅇ 체킹
	session->ProcessConnect();

	_service->AddSession(session);
	RegisterAccept();
}
