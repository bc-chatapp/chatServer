#include "pch.h"
#include "GroupService.h"
#include "UserManager.h"
#include "ServerSession.h"
#include "PacketDispatcher.h"
#include "../DB/GroupRepository.h"
#include "../DB/UserRepository.h"
#include "../DB/MessageRepository.h"

#include "ChatService.h"

using namespace Protocol;



bool GroupService::CreateGroup(sessionPtr& session, uint64 reqId, Protocol::C_CreateGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	if (pkt.group_name().empty()) {
		HandleErr(session, reqId, ERR_INVALID_PACKET, "그룹 이름이 필요합니다.");
		return false;
	}


	
	cGroupInfo groupInfo;
	if (!GroupRepository::CreateGroup(pkt.group_name(), userId, groupInfo))
	{
		HandleErr(session, reqId, ERR_SERVER_INTERNAL, "그룹 생성 실패");
		return false;
	}

	Protocol::S_CreateGroup pkt_s_createGroup;
	pkt_s_createGroup.set_success(true);
	pkt_s_createGroup.set_message("그룹이 생성되었습니다.");

	auto* info = pkt_s_createGroup.mutable_group();
	info->set_group_id(groupInfo.groupId);
	info->set_group_name(groupInfo.groupName);
	info->set_group_code(groupInfo.groupCode);
	info->set_description(groupInfo.description);
	info->set_group_image_url(groupInfo.groupImageUrl);
	info->set_member_count(1);
	info->set_storage_capacity_bytes(groupInfo.storageLimit); // 10GB 예시
	info->set_storage_usage_bytes(groupInfo.storageUsage);

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_create_group() = pkt_s_createGroup;
	PacketDispatcher::SendEnvelope(session, env);

	cout << "[GroupService] Created: " << pkt.group_name() << " (" << groupInfo.groupName << ")" << endl;
	return true;
}


bool GroupService::GetGroupList(sessionPtr& session, uint64 reqId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	auto groups = GroupRepository::GetUserGroups(userId);

	Protocol::S_GroupList pkt_s_list;
	for (const auto& g : groups) {
		auto* info = pkt_s_list.add_groups();
		info->set_group_id(g.groupId);
		info->set_group_name(g.groupName);
		info->set_group_code(g.groupCode);
		info->set_description(g.description);
		info->set_group_image_url(g.groupImageUrl);

		info->set_storage_capacity_bytes(g.storageLimit);
		info->set_storage_usage_bytes(g.storageUsage);
		info->set_member_count(g.memberCount);
	}
	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_list() = pkt_s_list;
	PacketDispatcher::SendEnvelope(session, env);

	return true;
}




bool GroupService::JoinGroup(sessionPtr& session, uint64 reqId, const string& groupCode)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	cGroupInfo dbInfo;
	if (!GroupRepository::GetGroupByCode(groupCode, dbInfo)) {
		HandleErr(session, reqId, Protocol::ERR_INVALID_PACKET, "유효하지 않은 초대 코드입니다.");
		return false;
	}

	if (GroupRepository::IsMember(dbInfo.groupId, userId)) {
		HandleErr(session, reqId, Protocol::ERR_INVALID_PACKET, "이미 가입된 그룹입니다.");
		return false;
	}

	if (!GroupRepository::AddMember(dbInfo.groupId, userId, "member")) {
		HandleErr(session, reqId, Protocol::ERR_SERVER_INTERNAL, "입장 실패");
		return false;
	}

	Protocol::S_JoinGroup pkt_s_join;
	pkt_s_join.set_success(true);
	pkt_s_join.set_message("그룹에 입장했습니다.");

	auto* info = pkt_s_join.mutable_group();
	info->set_group_id(dbInfo.groupId);
	info->set_group_name(dbInfo.groupName);
	info->set_group_code(dbInfo.groupCode);
	info->set_description(dbInfo.description);
	info->set_group_image_url(dbInfo.groupImageUrl);
	info->set_storage_capacity_bytes(dbInfo.storageLimit);
	info->set_storage_usage_bytes(dbInfo.storageUsage);

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_join_group() = pkt_s_join;
	PacketDispatcher::SendEnvelope(session, env);

	cout << "[GroupService] User(" << userId << ") Joined Group(" << dbInfo.groupId << ")" << endl;

	GChatService->SendSystemMessage(dbInfo.groupId, userId + " 님이 입장하셨습니다.");

	return true;
}



bool GroupService::LeaveGroup(sessionPtr& session, uint64 reqId, const string& groupId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;


	string role = GroupRepository::GetMemberRole(groupId, userId);
	if (role.empty()) {
		HandleErr(session, reqId, Protocol::ERR_INVALID_PACKET, "가입되지 않은 그룹입니다.");
		return false;
	}

	if (role == "owner") {
		HandleErr(session, reqId, Protocol::ERR_UNAUTHORIZED, "방장은 그룹을 나갈 수 없습니다. (그룹 삭제 필요)");
		return false;
	}

	if (!GroupRepository::RemoveMember(groupId, userId)) {
		HandleErr(session, reqId, Protocol::ERR_SERVER_INTERNAL, "탈퇴 실패");
		return false;
	}

	Protocol::S_LeaveGroup pkt_leave;
	pkt_leave.set_success(true);
	pkt_leave.set_message("그룹을 떠났습니다.");

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_leave_group() = pkt_leave;
	PacketDispatcher::SendEnvelope(session, env);

	GChatService->SendSystemMessage(groupId, userId + " 님이 퇴장하셨습니다.");

	return true;
}





bool GroupService::InviteFriend(sessionPtr& session, const Protocol::C_InviteFriend& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	string senderName = "";
	if (!UserRepository::GetUserNameWithId(userId, senderName))
	{
		return false;
	}

	string groupId = pkt.group_id();
	cGroupInfo groupInfo;
	if (!GroupRepository::GetGroupByCode(groupId, groupInfo)) {
		// 실패 응답
		return false;
	}

	for (const string& friendId : pkt.friend_user_ids()) {

		if (GroupRepository::IsMember(groupId, friendId)) continue;

		Protocol::S_Chat pkt_invite;
		string convId = MessageRepository::CreateConversationId(userId, friendId); // 1:1 방 ID 계산
		pkt_invite.set_conv_id(convId);
		pkt_invite.set_sender_id(userId); // 내가 보낸 것처럼
		pkt_invite.set_sender_name(senderName);
		pkt_invite.set_ts_server(Nowts());

		// ★ Payload: System 타입 (Invite)
		auto* sysPayload = pkt_invite.mutable_payload()->mutable_system();
		sysPayload->set_message(senderName + " 님이 '" + groupInfo.groupName + "' 그룹에 초대했습니다.");
		sysPayload->set_type(1); // 1 = 초대장
		sysPayload->set_invite_group_id(groupId);
		sysPayload->set_invite_group_code(groupInfo.groupCode);
		sysPayload->set_invite_group_name(groupInfo.groupName);

		// DB 저장 & 전송 (ChatService 기능 재사용 권장)
		// 여기선 개념적으로 작성:
		// MessageRepository::SaveMessage(convId, senderId, friendId, inviteMsg);
		// 타겟 유저가 온라인이면 PushEnvelope(targetSession, inviteMsg);
	}

	// 성공 응답 전송
	Protocol::S_InviteFriend res;
	res.set_success(true);
	// SendEnvelope(session, res);

	return true;
}






bool GroupService::GetGroupMemberList(sessionPtr& session, uint64 reqId, const string& groupId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	if (!GroupRepository::IsMember(groupId, userId)) {
		HandleErr(session, reqId, Protocol::ERR_UNAUTHORIZED, "그룹 멤버만 조회할 수 있습니다.");
		return false;
	}

	auto members = GroupRepository::GetGroupMembers(groupId);
	Protocol::S_GroupMemberList pkt_s_list;
	pkt_s_list.set_group_id(groupId);

	for (const auto& m : members) {
		auto* info = pkt_s_list.add_members();
		info->set_user_id(m.userId);
		info->set_name(m.name);
		info->set_profile_image_url(m.profileImageUrl);
		info->set_status_message(m.statusMessage);

		// String Role -> Proto Enum Role 변환
		if (m.role == "owner") info->set_role(Protocol::GroupRole::OWNER);
		else if (m.role == "admin") info->set_role(Protocol::GroupRole::ADMIN);
		else info->set_role(Protocol::GroupRole::MEMBER);

		info->set_joined_at(m.joinedAt);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_member_list() = pkt_s_list;
	PacketDispatcher::SendEnvelope(session, env);

	return true;
}





void GroupService::HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage)
{
	cerr << "[GroupService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
	PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
