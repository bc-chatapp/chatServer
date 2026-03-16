#include "pch.h"
#include "FriendService.h"
#include "../ServerSession.h"
#include "../PacketDispatcher.h"
#include "UserManager.h"
#include "../DB/FriendRepository.h"
#include "../DB/UserRepository.h"
#include "../CoreGlobal.h"

using namespace Protocol;

// ============================================
// Friend Request
// ============================================


bool FriendService::SearchUser(sessionPtr& session, uint64 reqId, const string& searchUserId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	LOG_INFO("[FriendService] 검색 요청: {}", searchUserId);

	cUserInfo userInfo;
	bool found = UserRepository::GetUser(searchUserId, userInfo);

	Protocol::S_SearchUser pkt;
	pkt.set_success(found);

	if (found) {
		// 찾은 유저 정보 설정
		Protocol::UserInfo* protoUserInfo = pkt.mutable_user_info();
		UserRepository::ConvertToProto(userInfo, protoUserInfo);


		// 관계 확인
		pkt.set_is_friend(FriendRepository::IsFriend(userId, userInfo.userId));
		pkt.set_has_sent_request(FriendRepository::HasSentRequest(userId, userInfo.userId));

	}


	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_search_user() = pkt;
	PacketDispatcher::SendEnvelope(session, env);

	return true;
}




bool FriendService::FetchFriendData(sessionPtr& session, uint64 reqId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	Protocol::S_FetchFriendData pkt;

	// 친구 목록
	auto friends = FriendRepository::GetFriends(userId);
	for (const auto& f : friends) {
		*pkt.add_friends() = FriendRepository::ToProtocolUserInfo(f);
	}

	// 받은 요청 목록
	auto received = FriendRepository::GetFriendRequests(userId);
	for (const auto& r : received) {
		auto* req = pkt.add_received_requests();
		*req = FriendRepository::ToProtocolFriendRequest(r, true);
	}

	// (3) 보낸 요청 목록
	auto sent = FriendRepository::GetSentFriendRequests(userId);
	for (const auto& s : sent) {
		auto* req = pkt.add_sent_requests();
		*req = FriendRepository::ToProtocolFriendRequest(s, false);
	}

	LOG_INFO("[FriendService] User: {} | Friends: {} | Recv: {} | Sent: {}", userId, friends.size(), received.size(), sent.size());

	// 응답 전송
	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_fetch_friend_data() = pkt;
	PacketDispatcher::SendEnvelope(session, env);

	return true;
}





bool FriendService::HandleFriendAction(sessionPtr& session, uint64 reqId, Protocol::C_FriendAction::ActionType action, const string& targetId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string myId = serverSession->GetUserId();

	// 기본 유효성 검사
	if (myId.empty() || targetId.empty() || myId == targetId) {
		HandleErr(session, reqId, ERR_INVALID_PACKET, "Invalid Request");
		return false;
	}

	bool success = false;
	string message = "";
	Protocol::UserInfo updatedFriendInfo; // 수락 시 클라 갱신용

	switch (action)
	{
	case Protocol::C_FriendAction::SEND_REQUEST:
		success = FriendRepository::AddFriendRequest(myId, targetId);
		message = success ? "친구 요청을 보냈습니다." : "이미 요청했거나 친구입니다.";

		if (success) {
			// 상대방에게 푸시: NEW_REQUEST (내 정보를 담아서 보냄)
			cUserInfo myInfo;
			if (UserRepository::GetUser(myId, myInfo)) {
				Protocol::UserInfo pushUser;
				UserRepository::ConvertToProto(myInfo, &pushUser);
				PushFriendEvent(targetId, Protocol::S_FriendPush::NEW_REQUEST, &pushUser);
			}
		}
		break;

	case Protocol::C_FriendAction::CANCEL_REQUEST:
		success = FriendRepository::CancelFriendRequest(myId, targetId);
		message = success ? "요청을 취소했습니다." : "취소 실패"; 
		break;

	case Protocol::C_FriendAction::ACCEPT_REQUEST:
		success = FriendRepository::AcceptFriendRequest(myId, targetId);
		message = success ? "친구 요청을 수락했습니다." : "수락 실패"; 
		if (success) {
			// 새 친구 정보 포함 (클라 목록 갱신용)
			cUserInfo friendInfo;
			if (UserRepository::GetUser(targetId, friendInfo)) {
				UserRepository::ConvertToProto(friendInfo, &updatedFriendInfo);

				updatedFriendInfo.set_status("online"); // 제거할지 말지 체크
			}

			// 상대방에게 푸시: REQUEST_ACCEPTED (내 정보를 담아서 보냄)
			cUserInfo myInfo;
			if (UserRepository::GetUser(myId, myInfo)) {
				Protocol::UserInfo pushUser;
				UserRepository::ConvertToProto(myInfo, &pushUser);

				PushFriendEvent(targetId, Protocol::S_FriendPush::ACCEPTED, &pushUser);
			}
		}
		break;

	case Protocol::C_FriendAction::REJECT_REQUEST:
		success = FriendRepository::RejectFriendRequest(myId, targetId);
		message = success ? "요청을 거절했습니다." : "거절 실패";
		break;

	case Protocol::C_FriendAction::DELETE_FRIEND:
		success = FriendRepository::RemoveFriend(myId, targetId);
		message = success ? "친구가 삭제되었습니다." : "삭제 실패";

		if (success) {
			// 상대방에게 푸시: FRIEND_DELETED (내 ID만 있으면 됨)
			// 삭제된 친구 ID를 알리기 위해 임시 객체 사용 가능하지만, 
			// 보통은 클라가 전체 갱신하거나 Push 타입만 보고 처리
			PushFriendEvent(targetId, Protocol::S_FriendPush::DELETED, nullptr);
		}
		break;
	}

	// 결과 응답 전송
	Protocol::S_FriendAction pkt;
	pkt.set_success(success);
	pkt.set_message(message);

	// 수락일 경우에만 갱신된 친구 정보 포함
	if (success && action == Protocol::C_FriendAction::ACCEPT_REQUEST) {
		*pkt.mutable_updated_friend() = updatedFriendInfo;
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_friend_action() = pkt;
	PacketDispatcher::SendEnvelope(session, env);

	return true;
}



void FriendService::PushFriendEvent(const string& targetUserId, Protocol::S_FriendPush::PushType type, const Protocol::UserInfo* info)
{
	auto targetSession = GUserManager->FindSession(targetUserId);
	if (!targetSession) return;	// 오프라인 상태


	Protocol::S_FriendPush pkt;
	pkt.set_push_type(type);
	if (info) {
		*pkt.mutable_user_info() = *info;
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(0); 
	*env.mutable_s_friend_push() = pkt;

	PacketDispatcher::SendEnvelope(targetSession, env);
}









void FriendService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
	LOG_ERROR("[FriendService] Error: {} (code: {})", errMessage, static_cast<int>(errorCode));
	PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}

