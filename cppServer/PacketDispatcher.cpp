#include "pch.h"
#include "PacketDispatcher.h"
#include "ServerSession.h"

#include "Service/UserManager.h"
#include "Service/ChatService.h"
#include "Service/FriendService.h"
#include "Service/AuthService.h"
#include "Service/FileService.h"
#include "Service/GroupService.h"
#include "Service/NotificationService.h"
#include "Service/PaymentService.h"
#include "Service/BlockService.h"


#include "DB/UserRepository.h"
#include "DB/FriendRepository.h"
#include "DB/MessageRepository.h"
#include "DB/GroupRepository.h"
#include "DB/FcmTokenRepository.h"
#include "DB/SubscriptionRepository.h"
#include "DB/DBManager.h"


using namespace Protocol;


void PacketDispatcher::DispatchPacket(sessionPtr& session, Protocol::Envelope& envelope)
{
	/* Version Check */
	if (envelope.version() != GProtoVersion) {
		DispatchError(session, envelope.request_id(), ERR_VERSION_MISMATCH);
		return;
	}

	/* Auth Token Check */
	const bool passAuth =
		(envelope.body_case() == Protocol::Envelope::kCSignup) ||
		(envelope.body_case() == Protocol::Envelope::kCLogin) ||
		(envelope.body_case() == Protocol::Envelope::kCCheckId) ||
		(envelope.body_case() == Protocol::Envelope::kCCheckEmail) ||
		(envelope.body_case() == Protocol::Envelope::kCHeartbeat);

	auto serverSession = static_pointer_cast<ServerSession>(session);
	if (!passAuth) {
		if (false == serverSession->IsAuthenticated(envelope.auth_token())) {

			string userId;
			if (UserRepository::GetUserIdByToken(envelope.auth_token(), userId)) {
				// 토큰이 유효하면 세션 설정
				serverSession->SetUserId(userId);
				serverSession->SetAuthToken(envelope.auth_token());
				GUserManager->UpsertSession(userId, session);
				
				// 오프라인 정보 푸시 (한 번만)

			} else {
				DispatchError(session, envelope.request_id(), ERR_INVALID_TOKEN);
				return;
			}
		} else {
			// 이미 인증된 세션이지만 오프라인 정보를 아직 푸시하지 않았다면 푸시

		}
	}

	// HeartBeat 저장
	serverSession->SetLastActiveTime();

	/* Pkt */
	switch (envelope.body_case())
	{
		/* 회원가입 관련*/
	case Protocol::Envelope::kCCheckId:
		Dispatch_C_CheckId(session, envelope.request_id(), envelope.c_check_id());
		break;

	case Protocol::Envelope::kCCheckEmail:
		Dispatch_C_CheckEmail(session, envelope.request_id(), envelope.c_check_email());
		break;

	case Protocol::Envelope::kCSignup:
		Dispatch_C_SignUp(session, envelope.request_id(), envelope.c_signup());
		break;

		/* 로그인*/
	case Protocol::Envelope::kCLogin:
		Dispatch_C_Login(session, envelope.request_id(), envelope);
		break;
	case Protocol::Envelope::kCLogout:
		Dispatch_C_Logout(session, envelope.request_id(), envelope.c_logout());
		break;
	case Protocol::Envelope::kCGetMyDevices:
		Dispatch_C_GetMyDevices(session, envelope.request_id(), envelope.c_get_my_devices());
		break;
	case Protocol::Envelope::kCRemoveDevice:
		Dispatch_C_RemoveDevice(session, envelope.request_id(), envelope.c_remove_device());
		break;
	case Protocol::Envelope::kCFetchOffline:
		Dispatch_C_FetchOffline(session, envelope.request_id(), envelope.c_fetch_offline());
		break;

		/* ★ 내 정보 관리(MyInfo) 추가 */
	case Protocol::Envelope::kCFetchMyInfo:
		Dispatch_C_FetchMyInfo(session, envelope.request_id(), envelope.c_fetch_my_info());
		break;
	case Protocol::Envelope::kCEditMyInfo:
		Dispatch_C_EditMyInfo(session, envelope.request_id(), envelope.c_edit_my_info());
		break;

	case Protocol::Envelope::kCRegisterFcmToken:
		Dispatch_C_RegisterFcmToken(session, envelope.request_id(), envelope.c_register_fcm_token());
		break;

		/* 이메일 인증 */
	case Protocol::Envelope::kCReqEmailVerify:
		Dispatch_C_ReqEmailVerify(session, envelope.request_id(), envelope.c_req_email_verify());
		break;
	case Protocol::Envelope::kCConfirmEmailVerify:
		Dispatch_C_ConfirmEmailVerify(session, envelope.request_id(), envelope.c_confirm_email_verify());
		break;

		/* 계정 관리 (이메일/비밀번호 변경) */
	case Protocol::Envelope::kCChangeEmail:
		Dispatch_C_ChangeEmail(session, envelope.request_id(), envelope.c_change_email());
		break;
	case Protocol::Envelope::kCChangePassword:
		Dispatch_C_ChangePassword(session, envelope.request_id(), envelope.c_change_password());
		break;

		/* 회원 탈퇴 */
	case Protocol::Envelope::kCWithdraw:
		Dispatch_C_Withdraw(session, envelope.request_id(), envelope.c_withdraw());
		break;

		/* 채팅 */
	case Protocol::Envelope::kCChat:
		Dispatch_C_Chat(session, envelope.request_id(), envelope.c_chat());
		break;

	case Protocol::Envelope::kCAck:
		Dispatch_C_Ack(session, envelope.request_id(), envelope.c_ack());
		break;

	case Protocol::Envelope::kCReqHistory:
		Dispatch_C_ReqHistory(session, envelope.request_id(), envelope.c_req_history());
		break;

	case Protocol::Envelope::kCDeleteMessage:
		Dispatch_C_DeleteMessage(session, envelope.request_id(), envelope.c_delete_message());
		break;

	case Protocol::Envelope::kCEditMessage:
		Dispatch_C_EditMessage(session, envelope.request_id(), envelope.c_edit_message());
		break;

	case Protocol::Envelope::kCReadReceipt:
		Dispatch_C_ReadReceipt(session, envelope.request_id(), envelope.c_read_receipt());
		break;

	case Protocol::Envelope::kCGetSubscription:
		Dispatch_C_GetSubscription(session, envelope.request_id(), envelope.c_get_subscription());
		break;

	case Protocol::Envelope::kCVerifyPurchase:
		Dispatch_C_VerifyPurchase(session, envelope.request_id(), envelope.c_verify_purchase());
		break;

	case Protocol::Envelope::kCUploadFile:
		Dispatch_C_UploadFile(session, envelope.request_id(), envelope.c_upload_file());
		break;

	case Protocol::Envelope::kCHeartbeat:
	{
		Protocol::Envelope res;
		res.set_request_id(envelope.request_id());
		res.mutable_s_heartbeat();
		SendEnvelope(session, res);
		break;
	}

	
		/* 차단 / 신고 */
	case Protocol::Envelope::kCBlockUser:
		Dispatch_C_BlockUser(session, envelope.request_id(), envelope.c_block_user());
		break;
	case Protocol::Envelope::kCUnblockUser:
		Dispatch_C_UnblockUser(session, envelope.request_id(), envelope.c_unblock_user());
		break;
	case Protocol::Envelope::kCGetBlockedList:
		Dispatch_C_GetBlockedList(session, envelope.request_id(), envelope.c_get_blocked_list());
		break;
	case Protocol::Envelope::kCReportUser:
		Dispatch_C_ReportUser(session, envelope.request_id(), envelope.c_report_user());
		break;

		/* 친구 관련 */
	case Protocol::Envelope::kCFriendAction:
		Dispatch_C_FriendAction(session, envelope.request_id(), envelope.c_friend_action());
		break;
	case Protocol::Envelope::kCSearchUser:
		Dispatch_C_SearchUser(session, envelope.request_id(), envelope.c_search_user());
		break;
	case Protocol::Envelope::kCFetchFriendData:
		Dispatch_C_FetchFriendData(session, envelope.request_id(), envelope.c_fetch_friend_data());
		break;


		/* 그룹 관련 */
	case Protocol::Envelope::kCCreateGroup:
		Dispatch_C_CreateGroup(session, envelope.request_id(), envelope.c_create_group());
		break;
	case Protocol::Envelope::kCGroupList:
		Dispatch_C_GroupList(session, envelope.request_id(), envelope.c_group_list());
		break;
	case Protocol::Envelope::kCJoinGroup:
		Dispatch_C_JoinGroup(session, envelope.request_id(), envelope.c_join_group());
		break;
	case Protocol::Envelope::kCLeaveGroup:
		Dispatch_C_LeaveGroup(session, envelope.request_id(), envelope.c_leave_group());
		break;
	case Protocol::Envelope::kCGroupMemberList:
		Dispatch_C_GroupMemberList(session, envelope.request_id(), envelope.c_group_member_list());
		break;
	case Protocol::Envelope::kCGroupInfo:
		Dispatch_C_GroupInfo(session, envelope.request_id(), envelope.c_group_info());
		break;
	case Protocol::Envelope::kCEditGroup:
		Dispatch_C_EditGroup(session, envelope.request_id(), envelope.c_edit_group());
		break;
	case Protocol::Envelope::kCDeleteGroup:
		Dispatch_C_DeleteGroup(session, envelope.request_id(), envelope.c_delete_group());
		break;

	default:
		DispatchError(session, envelope.request_id(), ERR_INVALID_PACKET);
		break;
	}
}


shared_ptr<SendBuffer> PacketDispatcher::MakeSendBuffer(Protocol::Envelope& envelope)
{
	string body;
	if (false == envelope.SerializeToString(&body)) return nullptr;

	uint32 bodyLen = static_cast<uint32>(body.size());

	// size_t를 int32로 명시적 캐스팅
	auto sendBuffer = make_shared<SendBuffer>(static_cast<int32>(sizeof(uint32) + bodyLen));

	::memcpy(sendBuffer->Buffer(), &bodyLen, sizeof(uint32));
	::memcpy(sendBuffer->Buffer() + sizeof(uint32), body.data(), bodyLen);

	// 여기도 명시적 캐스팅
	sendBuffer->Close(static_cast<int32>(sizeof(uint32) + bodyLen));
	return sendBuffer;
}

void PacketDispatcher::SendEnvelope(sessionPtr& session, Protocol::Envelope& envelope)
{
	auto sendBuffer = MakeSendBuffer(envelope);
	if (sendBuffer)
		session->Send(sendBuffer);
}


void PacketDispatcher::DispatchError(sessionPtr& session, uint64 reqId, const string& errMessage)
{
	// 하위 호환성을 위해 기본 에러 코드 사용
	DispatchError(session, reqId, ERR_UNKNOWN, errMessage);
}


void PacketDispatcher::DispatchError(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
	Protocol::S_Error pkt_error;
	pkt_error.set_error_code(errorCode);
	
	// HTTP 스타일 코드 매핑 (하위 호환성)
	uint32 httpCode = 400; // 기본값
	switch (errorCode) {
		case ERR_SUCCESS:
			httpCode = 200;
			break;
		case ERR_UNAUTHORIZED:
		case ERR_INVALID_TOKEN:
			httpCode = 401;
			break;
		case ERR_INVALID_PACKET:
		case ERR_VERSION_MISMATCH:
			httpCode = 400;
			break;
		case ERR_SERVER_INTERNAL:
			httpCode = 500;
			break;
		case ERR_USER_NOT_FOUND:
			httpCode = 404;
			break;
		default:
			httpCode = 400;
			break;
	}
	
	pkt_error.set_code(httpCode);
	
	// 메시지 설정 (비어있으면 기본 메시지 사용)
	if (errMessage.empty()) {
		// ErrorCode에 따른 기본 메시지
		switch (errorCode) {
			case ERR_UNAUTHORIZED:
				pkt_error.set_message("unauthorized");
				break;
			case ERR_INVALID_TOKEN:
				pkt_error.set_message("invalid token");
				break;
			case ERR_VERSION_MISMATCH:
				pkt_error.set_message("version mismatch");
				break;
			case ERR_INVALID_PACKET:
				pkt_error.set_message("unknown packet");
				break;
			case ERR_USER_NOT_FOUND:
				pkt_error.set_message("user not found");
				break;
			case ERR_INVALID_PASSWORD:
				pkt_error.set_message("invalid password");
				break;
			default:
				pkt_error.set_message("unknown error");
				break;
		}
	} else {
		pkt_error.set_message(errMessage);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_error() = pkt_error;

	SendEnvelope(session, env);
}



void PacketDispatcher::PushOfflineData(sessionPtr& session, uint64 reqId, const string& userId, int64_t since_ts)
{
	cout << "[PacketDispatcher] PushOfflineData: userId = " << userId << endl;

	int totalMessages = 0;
	const int INIT_LIMIT = 50;
	const int OFFLINE_LIMIT = 300;

	Protocol::S_MessageBatch pkt_batch;

	/* 1:1 채팅방 */
	auto conversations = MessageRepository::GetUserConversations(userId);
	for (const auto& convId : conversations) {
		vector<MessageInfo> messages;

		if (since_ts > 0) {
			messages = MessageRepository::GetMessagesAfter(convId, since_ts, OFFLINE_LIMIT);
		}
		else {
			messages = MessageRepository::GetRecentMessages(convId, INIT_LIMIT);
		}

		int unreadCount = MessageRepository::GetUnreadCount(userId, convId);

		if (!messages.empty() || unreadCount > 0) {
			auto* convBatch = pkt_batch.add_batches();
			convBatch->set_conv_id(convId);
			convBatch->set_unread_count(unreadCount);

			for (const auto& msgInfo : messages) {
				auto* sChat = convBatch->add_messages();
				Protocol::S_Chat tempChat;

				if (tempChat.ParseFromString(msgInfo.messageData)) {
					*sChat = tempChat;
					// 시퀀스 번호 재확인
					sChat->set_msg_seq(msgInfo.msgSeq);
					totalMessages++;
				}
			}
		}
	}

	/* 그룹 채팅방 */
	auto groups = GroupRepository::GetUserGroups(userId);
	for (const auto& group : groups) {
		string convId = "group:" + group.groupId;

		vector<MessageInfo> messages;

		if (since_ts > 0) 
			messages = MessageRepository::GetMessagesAfter(convId, since_ts, OFFLINE_LIMIT);
		else 
			messages = MessageRepository::GetRecentMessages(convId, INIT_LIMIT);
		
		int unreadCount = MessageRepository::GetUnreadCount(userId, convId);

		if (!messages.empty() || unreadCount > 0) {
			auto* convBatch = pkt_batch.add_batches();
			convBatch->set_conv_id(convId);
			convBatch->set_unread_count(unreadCount);

			for (const auto& msgInfo : messages) {
				auto* sChat = convBatch->add_messages();
				Protocol::S_Chat tempChat;
				if (tempChat.ParseFromString(msgInfo.messageData)) {
					*sChat = tempChat;
					sChat->set_msg_seq(msgInfo.msgSeq);
					totalMessages++;
				}
			}
		}
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_message_batch() = pkt_batch;

	SendEnvelope(session, env);
	cout << "[PacketDispatcher] PushOfflineData 완료: Messages = " << totalMessages << "개" << endl;

}






bool PacketDispatcher::Dispatch_C_CheckId(sessionPtr& session, uint64 reqId, const Protocol::C_CheckId& pkt)
{
	const string userId = pkt.user_id();

	return GAuthService->CheckIdAvailable(session, reqId, userId);
}


bool PacketDispatcher::Dispatch_C_CheckEmail(sessionPtr& session, uint64 reqId, const Protocol::C_CheckEmail& pkt)
{
	const string email = pkt.email();

	return GAuthService->CheckEmailAvailable(session, reqId, email);
}


bool PacketDispatcher::Dispatch_C_SignUp(sessionPtr& session, uint64 reqId, const Protocol::C_SignUp& pkt)
{
	const string userId = pkt.user_id();
	const string password = pkt.password();
	const string name = pkt.name();
	const string email = pkt.email();

	// AuthService로 위임
	return GAuthService->SignUp(session, reqId, userId, password, name, email);
}



bool PacketDispatcher::Dispatch_C_Login(sessionPtr& session, uint64 reqId, const Protocol::Envelope& envelope)
{
	auto pkt = envelope.c_login();

	const string userId = pkt.user_id();
	const string password = pkt.password();
	const string reqToken = envelope.auth_token();

	if (!reqToken.empty()&& password.empty()){
		return GAuthService->LoginByToken(session, reqId, reqToken, userId);
	} 

	if (!userId.empty() && !password.empty()) {
		return GAuthService->Login(session, reqId, userId, password);
	}

	// 그 외는 에러
	DispatchError(session, reqId, ERR_UNAUTHORIZED);
	return false;
}


bool PacketDispatcher::Dispatch_C_FetchOffline(sessionPtr& session, uint64 reqId, const Protocol::C_FetchOffline& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	int64_t sinceTs = pkt.since_ts();

	PushOfflineData(session, reqId, userId, sinceTs);

	serverSession->SetHasPushedOfflineData(true);

	return true;
}


bool PacketDispatcher::Dispatch_C_FetchMyInfo(sessionPtr& session, uint64 reqId, const Protocol::C_FetchMyInfo& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	// TODO: GUserManager 또는 GMyInfoService를 통해 UserInfo 조회 후 전송
	//return GUserManager->FetchMyInfo(session, reqId, userId);
}




bool PacketDispatcher::Dispatch_C_EditMyInfo(sessionPtr& session, uint64 reqId, const Protocol::C_EditMyInfo& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	// pkt(C_EditMyInfo)에 담긴 이름, 상태메시지, 폰번호 등을 업데이트
	return GAuthService->HandleEditMyInfo(session, reqId, pkt);
}




bool PacketDispatcher::Dispatch_C_Chat(sessionPtr& session, uint64 reqId, const Protocol::C_Chat& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string senderId = serverSession->GetUserId();
	if (senderId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	if (!pkt.has_payload()) {
		DispatchError(session, reqId, ERR_PAYLOAD_EMPTY);
		return false;
	}

	/* TODO : Payload image/text/file 구분  */
	string targetId;
	ConvType type = ParseConvId(pkt.conv_id(), targetId);


	string msgText = "[첨부]";
	if (pkt.has_payload() && pkt.payload().has_text()) {
		msgText = pkt.payload().text().message();
	}
	cout << "[Server] C_Chat conv=" << pkt.conv_id() << " msg=\"" << msgText << "\"" << endl;


	if (type == ConvType::Direct) {
		return GChatService->SendDirect(session, reqId, targetId, pkt);
	}
	else if (type == ConvType::Group) {
		return GChatService->SendGroup(session, reqId, targetId, pkt);
	}

	DispatchError(session, reqId, ERR_INVALID_CONV_ID);
	return false;
}



bool PacketDispatcher::Dispatch_C_Ack(sessionPtr& session, uint64 reqId, const Protocol::C_Ack& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string senderId = serverSession->GetUserId();
	if (senderId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	string targetId;
	ConvType type = ParseConvId(pkt.conv_id(), targetId);

	if (type == ConvType::Error || targetId.empty()) {
		cout << "[Dispatcher] Ack 포맷 에러: " << pkt.conv_id() << endl;
		DispatchError(session, reqId, ERR_INVALID_ACK);
		return false;
	}

	bool bDirect = (type == ConvType::Direct);
	return GChatService->HandleAck(session, reqId, bDirect, targetId, pkt.msg_seq());
}



bool PacketDispatcher::Dispatch_C_ReqHistory(sessionPtr& session, uint64 reqId, const Protocol::C_ReqHistory& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GChatService->HandleReqHistory(session, reqId, pkt);
}






/*---------------------------------
			File Upload
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_UploadFile(sessionPtr& session, uint64 reqId, const Protocol::C_UploadFile& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}
	
	if (GFileService) {
		return GFileService->HandleUploadFileRequest(session, reqId, pkt);
	}

	DispatchError(session, reqId, ERR_FILE_SERVICE_NOT_INITIALIZED);
	return false;
}




/*---------------------------------
		Friend Request Handler
-----------------------------------*/
bool PacketDispatcher::Dispatch_C_SearchUser(sessionPtr& session, uint64 reqId, const Protocol::C_SearchUser& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GFriendService->SearchUser(session, reqId, pkt.user_id());
}

bool PacketDispatcher::Dispatch_C_FriendAction(sessionPtr& session, uint64 reqId, const Protocol::C_FriendAction& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GFriendService->HandleFriendAction(session, reqId, pkt.action(), pkt.target_user_id());
}

bool PacketDispatcher::Dispatch_C_FetchFriendData(sessionPtr& session, uint64 reqId, const Protocol::C_FetchFriendData& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GFriendService->FetchFriendData(session, reqId);
}












/*---------------------------------
			Group Handler
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_CreateGroup(sessionPtr& session, uint64 reqId, const Protocol::C_CreateGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}
	return GGroupService->CreateGroup(session, reqId, const_cast<Protocol::C_CreateGroup&>(pkt));
}

bool PacketDispatcher::Dispatch_C_GroupList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupList& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}
	return GGroupService->GetGroupList(session, reqId);
}

bool PacketDispatcher::Dispatch_C_JoinGroup(sessionPtr& session, uint64 reqId, const Protocol::C_JoinGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	if (pkt.group_code().empty()) {
		DispatchError(session, reqId, ERR_INVALID_PACKET, "초대 코드를 입력해주세요.");
		return false;
	}

	return GGroupService->JoinGroup(session, reqId, pkt.group_code());
}

bool PacketDispatcher::Dispatch_C_LeaveGroup(sessionPtr& session, uint64 reqId, const Protocol::C_LeaveGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	return GGroupService->LeaveGroup(session, reqId, pkt.group_id());
}

bool PacketDispatcher::Dispatch_C_GroupMemberList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupMemberList& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}
	return GGroupService->GetGroupMemberList(session, reqId, pkt.group_id());
}




bool PacketDispatcher::Dispatch_C_GroupInfo(sessionPtr& session, uint64 reqId, const Protocol::C_GroupInfo& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	return GGroupService->GetGroupInfo(session, reqId, pkt.group_id());
}

bool PacketDispatcher::Dispatch_C_EditGroup(sessionPtr& session, uint64 reqId, const Protocol::C_EditGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	return GGroupService->UpdateGroupInfo(session, reqId, const_cast<Protocol::C_EditGroup&>(pkt));
}

bool PacketDispatcher::Dispatch_C_DeleteGroup(sessionPtr& session, uint64 reqId, const Protocol::C_DeleteGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	return GGroupService->DeleteGroup(session, reqId, pkt.group_id());
}


/*---------------------------------
		FCM Token Handler
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_RegisterFcmToken(sessionPtr& session, uint64 reqId, const Protocol::C_RegisterFcmToken& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GNotificationService->RegisterFcmToken(session, reqId, pkt);
}


/*---------------------------------
	Email Verification Handler
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_ReqEmailVerify(sessionPtr& session, uint64 reqId, const Protocol::C_RequestEmailVerify& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GAuthService->HandleReqEmailVerify(session, reqId, pkt.email());
}

bool PacketDispatcher::Dispatch_C_ConfirmEmailVerify(sessionPtr& session, uint64 reqId, const Protocol::C_ConfirmEmailVerify& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GAuthService->HandleConfirmEmailVerify(session, reqId, pkt.email(), pkt.code());
}


/*---------------------------------
	Account Management Handler
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_ChangeEmail(sessionPtr& session, uint64 reqId, const Protocol::C_ChangeEmail& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GAuthService->HandleChangeEmail(session, reqId, pkt.new_email());
}

bool PacketDispatcher::Dispatch_C_ChangePassword(sessionPtr& session, uint64 reqId, const Protocol::C_ChangePassword& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GAuthService->HandleChangePassword(session, reqId, pkt.current_password(), pkt.new_password());
}


/*---------------------------------
	Withdraw Handler (회원 탈퇴)
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_Withdraw(sessionPtr& session, uint64 reqId, const Protocol::C_Withdraw& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GAuthService->HandleWithdraw(session, reqId, pkt.password(), pkt.reason());
}


/*---------------------------------
	Logout Handler (로그아웃)
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_Logout(sessionPtr& session, uint64 reqId, const Protocol::C_Logout& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GAuthService->HandleLogout(session, reqId, pkt.fcm_token(), pkt.device_id());
}


/*---------------------------------
	Device Management Handler
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_GetMyDevices(sessionPtr& session, uint64 reqId, const Protocol::C_GetMyDevices& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	// 현재 세션의 deviceId 가져오기 (TODO: 세션에 deviceId 저장 필요)
	string currentDeviceId = ""; // serverSession->GetDeviceId();

	return GNotificationService->GetMyDevices(session, reqId, currentDeviceId);
}

bool PacketDispatcher::Dispatch_C_RemoveDevice(sessionPtr& session, uint64 reqId, const Protocol::C_RemoveDevice& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GNotificationService->RemoveDevice(session, reqId, pkt.device_id());
}


/*---------------------------------
	Message Delete/Edit Handler
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_DeleteMessage(sessionPtr& session, uint64 reqId, const Protocol::C_DeleteMessage& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GChatService->HandleDeleteMessage(session, reqId, pkt);
}

bool PacketDispatcher::Dispatch_C_EditMessage(sessionPtr& session, uint64 reqId, const Protocol::C_EditMessage& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GChatService->HandleEditMessage(session, reqId, pkt);
}

bool PacketDispatcher::Dispatch_C_ReadReceipt(sessionPtr& session, uint64 reqId, const Protocol::C_ReadReceipt& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	return GChatService->HandleReadReceipt(session, reqId, pkt);
}


/*---------------------------------
	Subscription Handler (구독 관리)
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_GetSubscription(sessionPtr& session, uint64 reqId, const Protocol::C_GetSubscription& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	try {
		// 1) 사용자 정보 조회
		cUserInfo userInfo;
		if (!UserRepository::GetUser(userId, userInfo)) {
			DispatchError(session, reqId, ERR_USER_NOT_FOUND);
			return false;
		}

		Protocol::S_GetSubscription response;
		response.set_success(true);
		response.set_current_grade(static_cast<int32>(userInfo.subGrade));
		response.set_storage_capacity_bytes(userInfo.storageCapacity);
		response.set_storage_usage_bytes(userInfo.storageUsage);

		// 2) 현재 구독 정보 조회 (SubscriptionRepository)
		cSubscriptionInfo subInfo;
		if (SubscriptionRepository::GetActiveSubscription(userId, subInfo)) {
			if (subInfo.expiresAt > 0) {
				response.set_expires_at(subInfo.expiresAt);
			}
			response.set_auto_renew(subInfo.autoRenew);
		}

		// 3) 이용 가능한 플랜 목록 조회 (SubscriptionRepository)
		auto plans = SubscriptionRepository::GetAvailablePlans("personal");
		for (const auto& planInfo : plans) {
			auto* plan = response.add_available_plans();
			plan->set_plan_id(planInfo.planId);
			plan->set_plan_type(planInfo.planType);
			plan->set_name(planInfo.name);
			plan->set_grade(planInfo.grade);
			plan->set_storage_bytes(planInfo.storageBytes);
			plan->set_max_file_size(planInfo.maxFileSize);
			plan->set_monthly_price(planInfo.monthlyPrice);

			for (const auto& feature : planInfo.features) {
				plan->add_features(feature);
			}

			// 현재 플랜 이름 매칭
			if (planInfo.grade == static_cast<int>(userInfo.subGrade)) {
				response.set_current_plan_name(planInfo.name);
			}
		}

		// 무료 플랜인 경우 기본 이름
		if (response.current_plan_name().empty()) {
			response.set_current_plan_name("무료");
		}

		Protocol::Envelope env;
		env.set_version(GProtoVersion);
		env.set_request_id(reqId);
		*env.mutable_s_get_subscription() = response;
		SendEnvelope(session, env);

		return true;
	}
	catch (const exception& e) {
		cerr << "[PacketDispatcher] GetSubscription 실패: " << e.what() << endl;
		DispatchError(session, reqId, ERR_SERVER_INTERNAL, "구독 정보 조회 실패");
		return false;
	}
}


/*---------------------------------
	Payment Handler (결제 검증)
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_VerifyPurchase(sessionPtr& session, uint64 reqId, const Protocol::C_VerifyPurchase& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	if (!GPaymentService) {
		DispatchError(session, reqId, ERR_SERVER_INTERNAL, "결제 서비스가 초기화되지 않았습니다.");
		return false;
	}

	return GPaymentService->HandleVerifyPurchase(session, reqId, pkt);
}


/*-----------------------------------
    Block / Report (차단/신고)
-----------------------------------*/

bool PacketDispatcher::Dispatch_C_BlockUser(sessionPtr& session, uint64 reqId, const Protocol::C_BlockUser& pkt)
{
    if (!GBlockService) { DispatchError(session, reqId, ERR_SERVER_INTERNAL); return false; }
    return GBlockService->HandleBlockUser(session, reqId, pkt);
}

bool PacketDispatcher::Dispatch_C_UnblockUser(sessionPtr& session, uint64 reqId, const Protocol::C_UnblockUser& pkt)
{
    if (!GBlockService) { DispatchError(session, reqId, ERR_SERVER_INTERNAL); return false; }
    return GBlockService->HandleUnblockUser(session, reqId, pkt);
}

bool PacketDispatcher::Dispatch_C_GetBlockedList(sessionPtr& session, uint64 reqId, const Protocol::C_GetBlockedList& pkt)
{
    if (!GBlockService) { DispatchError(session, reqId, ERR_SERVER_INTERNAL); return false; }
    return GBlockService->HandleGetBlockedList(session, reqId, pkt);
}

bool PacketDispatcher::Dispatch_C_ReportUser(sessionPtr& session, uint64 reqId, const Protocol::C_ReportUser& pkt)
{
    if (!GBlockService) { DispatchError(session, reqId, ERR_SERVER_INTERNAL); return false; }
    return GBlockService->HandleReportUser(session, reqId, pkt);
}

