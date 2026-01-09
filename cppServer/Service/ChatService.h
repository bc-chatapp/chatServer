#pragma once

#include "Session.h"
#include "../protocol.pb.h"

using sessionPtr = shared_ptr<Session>;

class ChatService
{
public:
	explicit ChatService(UserManager& usermanager) : _userManager(usermanager) { }
	~ChatService() = default;


	bool SendDirect(sessionPtr& senderSession, uint64 reqId, const string& receiverId, const Protocol::C_Chat& pkt);
	bool SendGroup(sessionPtr& senderSession, uint64 reqId, const string& groupId, const Protocol::C_Chat& pkt);
	
	bool SendSystemMessage(const string& groupId, const string& message);


	bool HandleAck(sessionPtr& session, uint64 reqId, bool bDirect, const string& targetId, int64 msg_seq);
	bool HandleReqHistory(sessionPtr& session, uint64 reqId, const Protocol::C_ReqHistory& pkt);


protected:
	/* Helpers */
	static Protocol::S_Chat Build_S_Chat(const string& convId, const string& senderId, int64& OUT fileSize, string& OUT fileType, const Protocol::C_Chat& pkt);
	static void PushEnvelope(sessionPtr& session, uint64 reqId, const Protocol::S_Chat& pkt_s_chat);
	static string GetUserNameWithId(const string& userId);
private:
	UserManager& _userManager;
	
	// 에러 처리
	void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};



