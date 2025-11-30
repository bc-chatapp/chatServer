#include "pch.h"
#include "ServerSession.h"
#include "SendBuffer.h"
#include "PacketDispatcher.h"

#include "Service/UserManager.h"

void ServerSession::OnConnected()
{
	cout << "OnConnected.." << endl;
}

void ServerSession::OnDisconnected()
{
	cout << "OnDisconnected.." << endl;

	if (!_userId.empty() && GUserManager) {
		GUserManager->RemoveSession(_userId);
	}
}

void ServerSession::OnRecv(BYTE* buffer, int32 len)
{
	if (len < 4) { Disconnect(); return; }

	uint32 bodyPos = 0;
	::memcpy(&bodyPos, buffer, 4);
	const uint32 bodyLen = bodyPos;

	if (len < 4 + static_cast<int32>(bodyLen)) {
		// 프레임이 덜 왔음(누적 버퍼에서 이어서 받는 구조라면 여기서 return)
		return;
	}

	// 2. Protobuf Parsing
	Protocol::Envelope envelope;
	if (envelope.ParseFromArray(buffer + 4, bodyLen) == false)
	{
		cout << "[Error] Envelope Parse Failed!" << endl;
		Disconnect();
		return;
	}

	auto session = static_pointer_cast<Session>(shared_from_this());
	PacketDispatcher::DispatchPacket(session, envelope);
}


void ServerSession::OnSend(int32 len)
{
	wcout << "ServerSession::OnSendPacket Size : " << len << endl;
}
