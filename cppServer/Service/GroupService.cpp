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

	cGroupInfo groupInfo;
	if (!GroupRepository::GetGroupInfoById(groupCode, groupInfo)) {
		HandleErr(session, reqId, Protocol::ERR_INVALID_PACKET, "유효하지 않은 초대 코드입니다.");
		return false;
	}

	if (GroupRepository::IsMember(groupInfo.groupId, userId)) {
		HandleErr(session, reqId, Protocol::ERR_INVALID_PACKET, "이미 가입된 그룹입니다.");
		return false;
	}

	if (!GroupRepository::AddMember(groupInfo.groupId, userId, "member")) {
		HandleErr(session, reqId, Protocol::ERR_SERVER_INTERNAL, "입장 실패");
		return false;
	}

	Protocol::S_JoinGroup pkt_s_join;
	pkt_s_join.set_success(true);

	auto* info = pkt_s_join.mutable_group();
	info->set_group_id(groupInfo.groupId);
	info->set_group_name(groupInfo.groupName);
	info->set_group_code(groupInfo.groupCode);
	info->set_description(groupInfo.description);
	info->set_group_image_url(groupInfo.groupImageUrl);
	info->set_storage_capacity_bytes(groupInfo.storageLimit);
	info->set_storage_usage_bytes(groupInfo.storageUsage);

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_join_group() = pkt_s_join;
	PacketDispatcher::SendEnvelope(session, env);

	cout << "[GroupService] User(" << userId << ") Joined Group(" << groupInfo.groupId << ")" << endl;

	GChatService->SendSystemMessage(groupInfo.groupId, userId + " 님이 입장하셨습니다.");

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

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_leave_group() = pkt_leave;
	PacketDispatcher::SendEnvelope(session, env);

	GChatService->SendSystemMessage(groupId, userId + " 님이 퇴장하셨습니다.");

	return true;
}



bool GroupService::GetGroupInfo(sessionPtr& session, uint64 reqId, const string& groupId)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;


	cGroupInfo dbInfo;
	if (!GroupRepository::GetGroupInfoById(groupId, dbInfo)) {
		// HandleErr(session, reqId, ERR_GROUP_NOT_FOUND);
		return false;
	}

	Protocol::S_GroupInfo pkt_groupInfo;
	auto* info = pkt_groupInfo.mutable_group();

	info->set_group_id(dbInfo.groupId);
	info->set_group_name(dbInfo.groupName);
	info->set_group_code(dbInfo.groupCode);
	info->set_description(dbInfo.description);
	info->set_group_image_url(dbInfo.groupImageUrl);
	info->set_member_count(dbInfo.memberCount);

	info->set_storage_capacity_bytes(dbInfo.storageLimit);
	info->set_storage_usage_bytes(dbInfo.storageUsage);


	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	env.mutable_s_group_info()->CopyFrom(pkt_groupInfo);

	PacketDispatcher::SendEnvelope(session, env);
	return true;
}



bool GroupService::UpdateGroupInfo(sessionPtr& session, uint64 reqId, Protocol::C_EditGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	string role = GroupRepository::GetMemberRole(pkt.group_id(), userId);
	if (role != "owner" && role != "admin") { // admin도 있다면 추가
		HandleErr(session, reqId, ERR_NO_PERMISSION, "관리자 권한이 필요합니다.");
		return false;
	}

	cout << "[GroupService] Update : " << pkt.new_name() << endl;
	cout << "[GroupService] Update : " << pkt.new_image_url() << endl;

	if (GroupRepository::UpdateGroupInfo(pkt.group_id(), pkt.new_name(), pkt.new_image_url()))
	{
		cGroupInfo groupInfo;
		GroupRepository::GetGroupInfoById(pkt.group_id(), groupInfo);

		Protocol::S_EditGroup pkt;
		pkt.set_success(true);
		
		auto groupData = pkt.mutable_group();
		groupData->set_group_id(groupInfo.groupId);
		groupData->set_group_name(groupInfo.groupName);
		groupData->set_group_image_url(groupInfo.groupImageUrl);

		Protocol::Envelope env;
		env.set_version(GProtoVersion);
		env.set_request_id(reqId);
		*env.mutable_s_edit_group() = pkt;
		PacketDispatcher::SendEnvelope(session, env);

		/* TODO Notify */


		return true;
	}
	
	return false;
}





bool GroupService::InviteFriend(sessionPtr& session, const Protocol::C_InviteFriend& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) return false;

	// 

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
	Protocol::S_GroupMemberList pkt_res;
	pkt_res.set_group_id(groupId);

	for (const auto& m : members) {
		auto* memberInfo = pkt_res.add_members();

		auto* userInfo = memberInfo->mutable_user_info();
		userInfo->set_user_id(m.userId);
		userInfo->set_name(m.name);
		userInfo->set_profile_image_url(m.profileImageUrl);
		userInfo->set_status_message(m.statusMessage);

		// String Role -> Proto Enum Role 변환
		if (m.role == "owner") memberInfo->set_role(Protocol::GroupRole::OWNER);
		else if (m.role == "admin") memberInfo->set_role(Protocol::GroupRole::ADMIN);
		else memberInfo->set_role(Protocol::GroupRole::MEMBER);

		memberInfo->set_joined_at(m.joinedAt);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_member_list() = pkt_res;
	PacketDispatcher::SendEnvelope(session, env);

	return true;
}





void GroupService::HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage)
{
	cerr << "[GroupService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
	PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
