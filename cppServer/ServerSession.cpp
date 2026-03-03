#include "pch.h"
#include "ServerSession.h"
#include "SendBuffer.h"
#include "PacketDispatcher.h"

#include "Service/UserManager.h"

void ServerSession::OnConnected()
{
	LOG_INFO("OnConnected..");
}

void ServerSession::OnDisconnected()
{
	LOG_INFO("OnDisconnected..");

	if (!_userId.empty() && GUserManager) {
		// 자기 자신을 인자로 넘김
		auto myself = static_pointer_cast<Session>(shared_from_this());
		GUserManager->RemoveSession(_userId, myself);
	}
}

void ServerSession::OnRecv(BYTE* buffer, int32 len)
{
	SetLastActiveTime();	// 하트비트

	if (len < 4) { Disconnect(); return; }

	uint32 bodyPos = 0;
	::memcpy(&bodyPos, buffer, 4);
	const uint32 bodyLen = bodyPos;

	if (len < 4 + static_cast<int32>(bodyLen)) {
		// 프레임이 덜 왔음(누적 버퍼에서 이어서 받는 구조라면 여기서 return)
		return;
	}

	// Protobuf Parsing
	Protocol::Envelope envelope;
	if (envelope.ParseFromArray(buffer + 4, bodyLen) == false)
	{
		LOG_INFO("[Error] Envelope Parse Failed!");
		Disconnect();
		return;
	}

	auto session = static_pointer_cast<Session>(shared_from_this());
	PacketDispatcher::DispatchPacket(session, envelope);
}


void ServerSession::OnSend(int32 len)
{
	LOG_INFO("ServerSession::OnSendPacket Size : {}", len);
}
