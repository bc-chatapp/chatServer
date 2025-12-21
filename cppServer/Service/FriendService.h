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

	// [1] 유저 검색 (C_SearchUser 대응)
	bool SearchUser(sessionPtr& session, uint64 reqId, const string& searchUserId);

	// [2] 친구 데이터 전체 조회 (C_FetchFriendData 대응 - 친구목록, 받은요청, 보낸요청)
	bool FetchFriendData(sessionPtr& session, uint64 reqId);

	// [3] 친구 관리 액션 통합 (C_FriendAction 대응 - 요청, 수락, 거절, 취소, 삭제)
	bool HandleFriendAction(sessionPtr& session, uint64 reqId, Protocol::C_FriendAction::ActionType action, const string& targetId);

	// [4] 실시간 푸시 알림 헬퍼 (static)
	static void PushFriendEvent(const string& targetUserId, Protocol::S_FriendPush::PushType type, const Protocol::FriendInfo* info = nullptr);
	

protected:

private:
	UserManager& _userManager;
	
	// 에러 처리
	void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};

