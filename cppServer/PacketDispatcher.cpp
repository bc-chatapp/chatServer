#include "pch.h"
#include "PacketDispatcher.h"
#include "ServerSession.h"

#include "Service/UserManager.h"
#include "Service/ChatService.h"
#include "Service/FriendService.h"
#include "Service/AuthService.h"
#include "Service/FileService.h"
#include "Service/GroupService.h"


#include "DB/UserRepository.h"
#include "DB/FriendRepository.h"
#include "DB/MessageRepository.h"
#include "DB/GroupRepository.h"


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
				/*if (!serverSession->HasPushedOfflineData()) {
					PushOfflineData(session, userId);
					serverSession->SetHasPushedOfflineData(true);
				}*/

				// 이제는 클라이언트에서 요청

			} else {
				DispatchError(session, envelope.request_id(), ERR_INVALID_TOKEN);
				return;
			}
		} else {
			// 이미 인증된 세션이지만 오프라인 정보를 아직 푸시하지 않았다면 푸시
			/*if (!serverSession->HasPushedOfflineData()) {
				const string userId = serverSession->GetUserId();
				if (!userId.empty()) {
					PushOfflineData(session, userId);
					serverSession->SetHasPushedOfflineData(true);
				}
			}*/

			// 이제는 클라이언트에서 요청
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
		Dispatch_C_Login(session, envelope.request_id(), envelope.c_login());
		break;
	case Protocol::Envelope::kCFetchOffline:
		Dispatch_C_FetchOffline(session, envelope.request_id(), envelope.c_fetch_offline());
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

	case Protocol::Envelope::kCUploadFile:
		Dispatch_C_UploadFile(session, envelope.request_id(), envelope.c_upload_file());
		break;

	case Protocol::Envelope::kCHeartbeat:
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

bool PacketDispatcher::Dispatch_C_Login(sessionPtr& session, uint64 reqId, const Protocol::C_Login& pkt)
{
	const string userId = pkt.user_id();
	const string password = pkt.password();

	// AuthService로 위임
	return GAuthService->Login(session, reqId, userId, password);
}


bool PacketDispatcher::Dispatch_C_FetchOffline(sessionPtr& session, uint64 reqId, const Protocol::C_FetchOffline& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	PushOfflineData(session, reqId, userId);

	serverSession->SetHasPushedOfflineData(true);

	return true;
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
	return GChatService->HandleAck(session, reqId, bDirect, targetId, pkt.server_msg_id());
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






void PacketDispatcher::PushOfflineData(sessionPtr& session, uint64 reqId, const string& userId)
{
	cout << "[PacketDispatcher] PushOfflineData: userId = " << userId << endl;
	

	int totalMessages = 0;
	const int INIT_LIMIT = 50;

	auto conversations = MessageRepository::GetUserConversations(userId);
	
	Protocol::S_MessageBatch pkt_batch;

	for (const auto& convId : conversations) {
		//auto unreadMessages = MessageRepository::GetUnreadMessages(userId, convId, 0);
		auto recentMsgs = MessageRepository::GetRecentMessages(convId, INIT_LIMIT);
		int unreadCount = MessageRepository::GetUnreadCount(userId, convId);

		if (!recentMsgs.empty() || unreadCount > 0) {

			auto* convBatch = pkt_batch.add_batches();
			convBatch->set_conv_id(convId);
			convBatch->set_unread_count(unreadCount);


			for (const auto& msgInfo : recentMsgs) {
				auto* sChat = convBatch->add_messages();

				Protocol::S_Chat tempChat;
				if (MessageRepository::DeserializeMessage(msgInfo.messageData, tempChat)) {
					*sChat = tempChat;
					sChat->set_server_msg_id(msgInfo.msgSeq);
					totalMessages++;
				}
			}
		}
	}

	if (pkt_batch.batches_size() > 0) {
		Protocol::Envelope env;
		env.set_version(GProtoVersion); 
		env.set_request_id(reqId);          // 0 = Server Push
		*env.mutable_s_message_batch() = pkt_batch;

		SendEnvelope(session, env);
	}
	
	cout << "[PacketDispatcher] PushOfflineData 완료: userId = " << userId 
		 << ", Messages=" << totalMessages << "개" << endl;
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

