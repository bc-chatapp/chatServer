#pragma once

#include "Session.h"
#include "../protocol.pb.h"

using sessionPtr = shared_ptr<Session>;
class UserManager;


class GroupService 
{
public:
	explicit GroupService(UserManager& userManager) : _userManager(userManager) { }
	~GroupService() = default;

	bool CreateGroup(sessionPtr& session, uint64 reqId, Protocol::C_CreateGroup& pkt);
	bool GetGroupList(sessionPtr& session, uint64 reqId);
	bool JoinGroup(sessionPtr& session, uint64 reqId, const string& groupCode);
	bool LeaveGroup(sessionPtr& session, uint64 reqId, const string& groupId);

	bool InviteFriend(sessionPtr& session, const Protocol::C_InviteFriend& pkt);

	bool GetGroupMemberList(sessionPtr& session, uint64 reqId, const string& groupId);

private:
	UserManager& _userManager;

	// 에러 처리
	void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};