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

bool FriendService::FindUser(sessionPtr& session, uint64 reqId, const string& searchUserId)
{
	// UserRepository에서 사용자 정보 조회
	UserInfo userInfo;
	if (!UserRepository::GetUser(searchUserId, userInfo)) {
		// 사용자 없음
		Protocol::S_FriendRequest_Find pkt;
		pkt.set_exist(false);
		
		Protocol::Envelope env;
		env.set_version(GProtoVersion);
		env.set_request_id(reqId);
		*env.mutable_s_frient_request_find() = pkt;
		PacketDispatcher::SendEnvelope(session, env);
		return false;
	}
	
	// 사용자 정보 반환
	Protocol::FriendInfo friendInfo;
	friendInfo.set_user_id(userInfo.userId);
	friendInfo.set_name(userInfo.name);
	friendInfo.set_status_message(userInfo.email);
	friendInfo.set_profile_image_url(userInfo.profileImageUrl);
	friendInfo.set_last_seen(userInfo.lastSeen);
	friendInfo.set_status(""); // 검색 결과에는 status 불필요
	
	Protocol::S_FriendRequest_Find pkt;
	pkt.set_exist(true);
	*pkt.mutable_user_info() = friendInfo;
	
	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_frient_request_find() = pkt;
	PacketDispatcher::SendEnvelope(session, env);
	
	cout << "[FriendService] FindUser: userId=" << searchUserId << " found=true" << endl;
	return true;
}

bool FriendService::AddFriendRequest(sessionPtr& session, uint64 reqId, const string& friendId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	if (userId == friendId) {
		return false;
	}

	cout << "[FriendService] AddFriendRequest userId=" << userId << " friendId=" << friendId << endl;

	// DB
	bool success = FriendRepository::AddFriendRequest(userId, friendId);
	
	Protocol::S_FriendRequest_Add pkt_s_friend_add;
	if (success) {
		pkt_s_friend_add.set_success(true);
		pkt_s_friend_add.set_message("Friend request sent");

		// 
		auto requests = FriendRepository::GetFriendRequests(friendId);
		for (const auto& reqInfo : requests) {
			if (reqInfo.requesterUserId == userId) {
				Protocol::FriendRequest request = FriendRepository::ToProtocolFriendRequest(reqInfo);
				PushFriendRequestEvent(friendId, Protocol::S_FriendRequest_Push::REQUEST_RECEIVED, &request);
				break;
			}
		}
	}
	else {
		pkt_s_friend_add.set_success(false);
		pkt_s_friend_add.set_message("Failed to send friend request");
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_request_add()->CopyFrom(pkt_s_friend_add);

	PacketDispatcher::SendEnvelope(session, env);
	return success;
}

bool FriendService::CancelFriendRequest(sessionPtr& session, uint64 reqId, const string& friendId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	cout << "[FriendService] CancelFriendRequest userId=" << userId << " friendId=" << friendId << endl;

	// DB에서 친구 요청 취소
	bool success = FriendRepository::CancelFriendRequest(userId, friendId);

	Protocol::S_FriendRequest_Cancel pkt_s_friend_cancel;
	if (success) {
		pkt_s_friend_cancel.set_success(true);
		pkt_s_friend_cancel.set_message("Friend request cancelled");

		// ?섏떊?먯뿉寃?Push 硫붿떆吏 ?꾩넚 (?붿껌 痍⑥냼??
		PushFriendRequestEvent(friendId, Protocol::S_FriendRequest_Push::REQUEST_CANCELLED, nullptr, nullptr, userId);
	}
	else {
		pkt_s_friend_cancel.set_success(false);
		pkt_s_friend_cancel.set_message("Failed to cancel friend request");
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_request_cancel()->CopyFrom(pkt_s_friend_cancel);

	PacketDispatcher::SendEnvelope(session, env);
	return success;
}

bool FriendService::GetFriendRequestList(sessionPtr& session, uint64 reqId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	cout << "[FriendService] GetFriendRequestList userId=" << userId << endl;

	// DB?먯꽌 ?섏뿉寃???移쒓뎄 ?붿껌 紐⑸줉 議고쉶
	auto requests = FriendRepository::GetFriendRequests(userId);

	Protocol::S_FriendRequest_List pkt_s_list;
	for (const auto& reqInfo : requests) {
		Protocol::FriendRequest* request = pkt_s_list.add_requests();
		*request = FriendRepository::ToProtocolFriendRequest(reqInfo);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_request_list()->CopyFrom(pkt_s_list);

	PacketDispatcher::SendEnvelope(session, env);
	return true;
}

bool FriendService::GetSentFriendRequestList(sessionPtr& session, uint64 reqId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	cout << "[FriendService] GetSentFriendRequestList userId=" << userId << endl;

	// DB에서 보낸 친구 요청 목록 조회
	auto requests = FriendRepository::GetSentFriendRequests(userId);

	Protocol::S_FriendRequest_List pkt_s_list;
	for (const auto& reqInfo : requests) {
		Protocol::FriendRequest* request = pkt_s_list.add_requests();
		*request = FriendRepository::ToProtocolFriendRequest(reqInfo);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_request_list()->CopyFrom(pkt_s_list);

	PacketDispatcher::SendEnvelope(session, env);
	return true;
}

bool FriendService::RespondToFriendRequest(sessionPtr& session, uint64 reqId, const string& requesterId, bool accept)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	cout << "[FriendService] RespondToFriendRequest userId=" << userId << " requesterId=" << requesterId 
		 << " accept=" << (accept ? "true" : "false") << endl;

	bool success = false;
	Protocol::S_FriendRequest_Respond pkt_s_respond;

	if (accept) {
		// 친구 요청 수락
		success = FriendRepository::AcceptFriendRequest(userId, requesterId);
		if (success) {
			pkt_s_respond.set_success(true);
			pkt_s_respond.set_message("Friend request accepted");

			// 친구 정보 조회하여 응답에 포함
			auto friends = FriendRepository::GetFriends(userId);
			for (const auto& friendInfo : friends) {
				if (friendInfo.friendId == requesterId) {
					*pkt_s_respond.mutable_friend_() = FriendRepository::ToProtocolFriendInfo(friendInfo);
					break;
				}
			}

			// ?붿껌?먯뿉寃?Push 硫붿떆吏 ?꾩넚 (?붿껌 ?섎씫??
			auto requesterFriends = FriendRepository::GetFriends(requesterId);
			for (const auto& friendInfo : requesterFriends) {
				if (friendInfo.friendId == userId) {
					Protocol::FriendInfo acceptedFriendInfo = FriendRepository::ToProtocolFriendInfo(friendInfo);
					PushFriendRequestEvent(requesterId, Protocol::S_FriendRequest_Push::REQUEST_ACCEPTED, nullptr, &acceptedFriendInfo);
					break;
				}
			}
		}
		else {
			pkt_s_respond.set_success(false);
			pkt_s_respond.set_message("Failed to accept friend request");
		}
	}
	else {
		// 친구 요청 거절
		success = FriendRepository::RejectFriendRequest(userId, requesterId);
		if (success) {
			pkt_s_respond.set_success(true);
			pkt_s_respond.set_message("Friend request rejected");
		}
		else {
			pkt_s_respond.set_success(false);
			pkt_s_respond.set_message("Failed to reject friend request");
		}
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_request_respond()->CopyFrom(pkt_s_respond);

	PacketDispatcher::SendEnvelope(session, env);
	return success;
}

bool FriendService::RemoveFriend(sessionPtr& session, uint64 reqId, const string& friendId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	cout << "[FriendService] RemoveFriend userId=" << userId << " friendId=" << friendId << endl;

	// 기존 친구인지 확인
	if (!FriendRepository::IsFriend(userId, friendId)) {
		return false;
	}

	// DB에서 친구 삭제 (양방향)
	bool success = FriendRepository::RemoveFriend(userId, friendId);

	Protocol::S_FriendRequest_Remove pkt_s_remove;
	if (success) {
		pkt_s_remove.set_success(true);
		pkt_s_remove.set_message("Friend removed");

		// ?곷?諛⑹뿉寃?Push 硫붿떆吏 ?꾩넚 (移쒓뎄 ??젣??
		PushFriendRequestEvent(friendId, Protocol::S_FriendRequest_Push::REQUEST_CANCELLED, nullptr, nullptr, userId);
	}
	else {
		pkt_s_remove.set_success(false);
		pkt_s_remove.set_message("Failed to remove friend");
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_request_remove()->CopyFrom(pkt_s_remove);

	PacketDispatcher::SendEnvelope(session, env);
	return success;
}

// ============================================
// Friend List
// ============================================

bool FriendService::GetFriendList(sessionPtr& session, uint64 reqId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		return false;
	}

	cout << "[FriendService] GetFriendList userId=" << userId << endl;

	// DB?먯꽌 移쒓뎄 紐⑸줉 議고쉶 (accepted ?곹깭留?
	auto friends = FriendRepository::GetFriends(userId);

	Protocol::S_FriendList pkt_s_list;
	for (const auto& friendInfo : friends) {
		Protocol::FriendInfo* friendInfoProto = pkt_s_list.add_friends();
		*friendInfoProto = FriendRepository::ToProtocolFriendInfo(friendInfo);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_friend_list()->CopyFrom(pkt_s_list);

	PacketDispatcher::SendEnvelope(session, env);
	return true;
}

bool FriendService::GetAlreadyFriend(const string& userId, const string& friendId)
{
	return FriendRepository::IsFriend(userId, friendId);
}

// ============================================
// Push Message Helper
// ============================================
/*
 * PushFriendRequestEvent: 移쒓뎄 ?붿껌 愿???대깽?몃? ?ㅼ떆媛꾩쑝濡??꾩넚?섎뒗 ?ы띁 ?⑥닔
 * 
 * 濡쒖쭅 ?ㅻ챸:
 * 1. ????ъ슜??userId)???몄뀡??UserManager?먯꽌 議고쉶
 * 2. ?몄뀡???놁쑝硫??ㅽ봽?쇱씤 ?곹깭?대?濡?濡쒓렇留?異쒕젰?섍퀬 醫낅즺
 *    (?ν썑 ?ㅽ봽?쇱씤 硫붿떆吏 ?먯뿉 ??ν븷 ???덉쓬)
 * 3. ?대깽????낆뿉 ?곕씪 ?곸젅???곗씠?곕? S_FriendRequest_Push???ㅼ젙:
 *    - REQUEST_RECEIVED: 移쒓뎄 ?붿껌??諛쏆븯????(request ?곗씠???ы븿)
 *    - REQUEST_ACCEPTED: 移쒓뎄 ?붿껌???섎씫?섏뿀????(friendInfo ?곗씠???ы븿)
 *    - REQUEST_CANCELLED: 移쒓뎄 ?붿껌??痍⑥냼?섏뿀????(cancelled_user_id ?ы븿)
 * 4. Envelope???댁븘???대떦 ?몄뀡?쇰줈 ?꾩넚
 * 5. request_id??0?쇰줈 ?ㅼ젙 (Push 硫붿떆吏???대씪?댁뼵???붿껌??????묐떟???꾨떂)
 * 
 * ?ν썑 ?뺤옣:
 * - 洹몃９ 梨꾪똿?먯꽌 移쒓뎄 異붽? ??洹몃９ 硫ㅻ쾭?ㅼ뿉寃뚮룄 Push 媛??
 * - ?ㅽ봽?쇱씤 ?ъ슜?먯뿉寃뚮뒗 硫붿떆吏 ?먯뿉 ???
 */

void FriendService::PushFriendRequestEvent(const string& userId, Protocol::S_FriendRequest_Push::EventType eventType,
										   const Protocol::FriendRequest* request,
										   const Protocol::FriendInfo* friendInfo,
										   const string& cancelledUserId)
{
	// 1. ?대떦 ?ъ슜?먯쓽 ?몄뀡 李얘린
	auto targetSession = GUserManager->FindSession(userId);
	if (!targetSession) {
		// ?ㅽ봽?쇱씤 ?ъ슜??- ?섏쨷???ㅽ봽?쇱씤 硫붿떆吏 ?먯뿉 ??ν븷 ???덉쓬
		cout << "[FriendService] PushFriendRequestEvent: User " << userId << " is offline" << endl;
		return;
	}

	// 2. Push 硫붿떆吏 ?앹꽦
	Protocol::S_FriendRequest_Push pkt_push;
	pkt_push.set_event_type(eventType);

	// 3. ?대깽????낆뿉 ?곕씪 ?곸젅???곗씠???ㅼ젙
	switch (eventType) {
	case Protocol::S_FriendRequest_Push::REQUEST_RECEIVED:
		// 移쒓뎄 ?붿껌??諛쏆븯???? ?붿껌???뺣낫 ?ы븿
		if (request) {
			*pkt_push.mutable_request() = *request;
		}
		break;

	case Protocol::S_FriendRequest_Push::REQUEST_ACCEPTED:
		// 移쒓뎄 ?붿껌???섎씫?섏뿀???? ?덈줈 異붽???移쒓뎄 ?뺣낫 ?ы븿
		if (friendInfo) {
			*pkt_push.mutable_friend_() = *friendInfo;
		}
		break;

	case Protocol::S_FriendRequest_Push::REQUEST_CANCELLED:
		// 移쒓뎄 ?붿껌??痍⑥냼?섏뿀???? 痍⑥냼???ъ슜??ID ?ы븿
		if (!cancelledUserId.empty()) {
			pkt_push.set_cancelled_user_id(cancelledUserId);
		}
		break;
	}

	// 4. Envelope???댁븘???꾩넚
	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(0);  // Push 硫붿떆吏??request_id = 0 (?대씪?댁뼵???붿껌??????묐떟???꾨떂)
	env.mutable_s_friend_request_push()->CopyFrom(pkt_push);

	PacketDispatcher::SendEnvelope(targetSession, env);
	cout << "[FriendService] PushFriendRequestEvent sent to userId=" << userId << " eventType=" << eventType << endl;
}

void FriendService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
	cerr << "[FriendService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
	PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}

