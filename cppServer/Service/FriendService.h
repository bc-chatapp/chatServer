#pragma once

#include "Session.h"
#include "../protocol.pb.h"

using sessionPtr = shared_ptr<Session>;
class UserManager;

class FriendService
{
public:
	explicit FriendService(UserManager& userManager) : _userManager(userManager) { }
	~FriendService() = default;

	// Friend Request
	bool FindUser(sessionPtr& session, uint64 reqId, const string& searchUserId);
	bool AddFriendRequest(sessionPtr& session, uint64 reqId, const string& friendId);
	bool CancelFriendRequest(sessionPtr& session, uint64 reqId, const string& friendId);
	bool GetFriendRequestList(sessionPtr& session, uint64 reqId);  // 받은 요청 목록
	bool GetSentFriendRequestList(sessionPtr& session, uint64 reqId);  // 보낸 요청 목록
	bool RespondToFriendRequest(sessionPtr& session, uint64 reqId, const string& requesterId, bool accept);
	bool RemoveFriend(sessionPtr& session, uint64 reqId, const string& friendId);
	
	// Friend List
	bool GetFriendList(sessionPtr& session, uint64 reqId);

	bool GetAlreadyFriend(const string& userId, const string& friendId);

	// Push Message Helper (public으로 변경하여 외부에서 호출 가능)
	static void PushFriendRequestEvent(const string& userId, Protocol::S_FriendRequest_Push::EventType eventType,
									   const Protocol::FriendRequest* request = nullptr,
									   const Protocol::FriendInfo* friendInfo = nullptr,
									   const string& cancelledUserId = "");

protected:

private:
	UserManager& _userManager;
	
	// 에러 처리
	void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};

