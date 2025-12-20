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
	const string myUserId = serverSession->GetUserId();

	cout << "[FriendService] 검색 요청: " << searchUserId << endl;

	UserInfo userInfo;
	bool found = UserRepository::GetUser(searchUserId, userInfo);

	Protocol::S_SearchUser pkt;
	pkt.set_success(found);

	if (found) {
		// 찾은 유저 정보 설정
		Protocol::FriendInfo* info = pkt.mutable_user_info();
		info->set_user_id(userInfo.userId);
		info->set_name(userInfo.name);
		info->set_status_message(userInfo.status_message);
		info->set_profile_image_url(userInfo.profileImageUrl);
		// info->set_last_seen(userInfo.lastSeen); // 필요 시

		// 관계 상태 확인 (나랑 무슨 사이인지)
		if (!myUserId.empty()) {
			bool isFriend = FriendRepository::IsFriend(myUserId, userInfo.userId);
			bool hasSent = FriendRepository::HasSentRequest(myUserId, userInfo.userId);

			pkt.set_is_friend(isFriend);
			pkt.set_has_sent_request(hasSent);
		}
	}

	// 응답 전송
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

	// (1) 이미 친구인 목록
	auto friends = FriendRepository::GetFriends(userId);
	for (const auto& f : friends) {
		*pkt.add_friends() = FriendRepository::ToProtocolFriendInfo(f);
	}

	// (2) 받은 요청 목록
	auto received = FriendRepository::GetFriendRequests(userId);
	for (const auto& r : received) {
		auto* req = pkt.add_received_requests();
		req->set_user_id(r.userId);
		req->set_name(r.name);
		req->set_status_message(r.statusMessage);
		req->set_profile_image_url(r.profileImageUrl);
		req->set_is_received(true);
	}

	// (3) 보낸 요청 목록
	auto sent = FriendRepository::GetSentFriendRequests(userId);
	for (const auto& s : sent) {
		auto* req = pkt.add_sent_requests();
		req->set_user_id(s.userId);
		req->set_name(s.name);
		req->set_status_message(s.statusMessage);
		req->set_profile_image_url(s.profileImageUrl);
		req->set_is_received(false);
	}

	cout << "[FetchFriendData] User: " << userId
		<< " | Friends: " << friends.size()
		<< " | Recv: " << received.size()
		<< " | Sent: " << sent.size() << endl;

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
	Protocol::FriendInfo updatedFriendInfo; // 수락 시 클라 갱신용

	switch (action)
	{
	case Protocol::C_FriendAction::SEND_REQUEST:
		success = FriendRepository::AddFriendRequest(myId, targetId);
		message = success ? "친구 요청을 보냈습니다." : "이미 요청했거나 친구입니다.";

		if (success) {
			// 상대방에게 푸시: NEW_REQUEST (내 정보를 담아서 보냄)
			UserInfo myInfo;
			if (UserRepository::GetUser(myId, myInfo)) {
				Protocol::FriendInfo pkt_req;
				pkt_req.set_user_id(myInfo.userId);
				pkt_req.set_name(myInfo.name);
				pkt_req.set_status_message(myInfo.status_message);
				pkt_req.set_profile_image_url(myInfo.profileImageUrl);

				PushFriendEvent(targetId, Protocol::S_FriendPush::NEW_REQUEST, &pkt_req);
			}
		}
		break;

	case Protocol::C_FriendAction::CANCEL_REQUEST:
		success = FriendRepository::CancelFriendRequest(myId, targetId);
		message = success ? "요청이 취소되었습니다." : "취소 실패";
		break;

	case Protocol::C_FriendAction::ACCEPT_REQUEST:
		success = FriendRepository::AcceptFriendRequest(myId, targetId);
		message = success ? "친구 요청을 수락했습니다." : "수락 실패";

		if (success) {
			// (A) 응답 패킷에 새 친구 정보 포함 (클라 목록 갱신용)
			UserInfo friendInfo;
			if (UserRepository::GetUser(targetId, friendInfo)) {
				updatedFriendInfo.set_user_id(friendInfo.userId);
				updatedFriendInfo.set_name(friendInfo.name);
				updatedFriendInfo.set_status_message(friendInfo.status_message);
				updatedFriendInfo.set_profile_image_url(friendInfo.profileImageUrl);
				updatedFriendInfo.set_status("online"); // 일단 온라인으로 가정하거나 상태 조회 필요
			}

			// (B) 상대방에게 푸시: REQUEST_ACCEPTED (내 정보를 담아서 보냄)
			UserInfo myInfo;
			if (UserRepository::GetUser(myId, myInfo)) {
				Protocol::FriendInfo myProto;
				myProto.set_user_id(myInfo.userId);
				myProto.set_name(myInfo.name);
				myProto.set_status_message(myInfo.status_message);
				myProto.set_profile_image_url(myInfo.profileImageUrl);

				PushFriendEvent(targetId, Protocol::S_FriendPush::REQUEST_ACCEPTED, &myProto);
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
			PushFriendEvent(targetId, Protocol::S_FriendPush::FRIEND_DELETED, nullptr);
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



void FriendService::PushFriendEvent(const string& targetUserId, Protocol::S_FriendPush::PushType type, const Protocol::FriendInfo* info)
{
	// GUserManager는 싱글톤이나 전역 객체여야 합니다. (CoreGlobal.h 확인)
	auto targetSession = GUserManager->FindSession(targetUserId);

	// 상대가 오프라인이면 푸시 안 함 (나중에 FetchFriendData로 가져감)
	if (!targetSession) return;

	Protocol::S_FriendPush pkt;
	pkt.set_type(type);
	if (info) {
		*pkt.mutable_user_info() = *info;
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(0); // Server Push는 reqId 0
	*env.mutable_s_friend_push() = pkt;

	PacketDispatcher::SendEnvelope(targetSession, env);
}









void FriendService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
	cerr << "[FriendService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
	PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}

