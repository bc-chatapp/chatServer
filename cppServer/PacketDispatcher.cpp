#include "pch.h"
#include "PacketDispatcher.h"
#include "ServerSession.h"
#include "Service/UserManager.h"
#include "Service/ChatService.h"
#include "Service/FriendService.h"
#include "Service/AuthService.h"
#include "Service/FileService.h"
#include "DB/UserRepository.h"
#include "DB/FriendRepository.h"
#include "DB/MessageRepository.h"
#include "DB/GroupRepository.h"
#include "CoreGlobal.h"

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
			// 토큰 검증 실패 시 DB에서 토큰으로 사용자 조회
			string userId;
			if (UserRepository::GetUserIdByToken(envelope.auth_token(), userId)) {
				// 토큰이 유효하면 세션 설정
				serverSession->SetUserId(userId);
				serverSession->SetAuthToken(envelope.auth_token());
				GUserManager->UpsertSession(userId, session);
				
				// 오프라인 정보 푸시 (한 번만)
				if (!serverSession->HasPushedOfflineData()) {
					PushOfflineData(session, userId);
					serverSession->SetHasPushedOfflineData(true);
				}
			} else {
				DispatchError(session, envelope.request_id(), ERR_INVALID_TOKEN);
				return;
			}
		} else {
			// 이미 인증된 세션이지만 오프라인 정보를 아직 푸시하지 않았다면 푸시
			if (!serverSession->HasPushedOfflineData()) {
				const string userId = serverSession->GetUserId();
				if (!userId.empty()) {
					PushOfflineData(session, userId);
					serverSession->SetHasPushedOfflineData(true);
				}
			}
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

		/* 채팅 */
	case Protocol::Envelope::kCChat:
		Dispatch_C_Chat(session, envelope.request_id(), envelope.c_chat());
		break;
	case Protocol::Envelope::kCAck:
		Dispatch_C_Ack(session, envelope.request_id(), envelope.c_ack());
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
	case Protocol::Envelope::kCGroupJoinRequest:
		Dispatch_C_GroupJoinRequest(session, envelope.request_id(), envelope.c_group_join_request());
		break;
	case Protocol::Envelope::kCGroupJoinResponse:
		Dispatch_C_GroupJoinResponse(session, envelope.request_id(), envelope.c_group_join_response());
		break;
	case Protocol::Envelope::kCGroupJoinRequestList:
		Dispatch_C_GroupJoinRequestList(session, envelope.request_id(), envelope.c_group_join_request_list());
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

	const string convId = pkt.conv_id();
	constexpr const char* pDirect = "direct:";
	constexpr const char* pGroup = "group:";

	string msgText = "[첨부]";
	if (pkt.has_payload() && pkt.payload().has_text()) {
		msgText = pkt.payload().text().message();
	}
	cout << "[Server] C_Chat conv=" << pkt.conv_id() << " msg=\"" << msgText << "\"" << endl;

	if (convId.rfind(pDirect, 0) == 0) {
		const string receiverId = convId.substr(strlen(pDirect));
		if (receiverId.empty()) {
			DispatchError(session, reqId, ERR_INVALID_RECEIVER_ID);
			return false;
		}

		return GChatService->SendDirect(session, reqId, receiverId, pkt);
	}
	else if (convId.rfind(pGroup, 0) == 0)
	{
		const string groupId = convId.substr(strlen(pGroup));
		if (groupId.empty()) {
			DispatchError(session, reqId, ERR_INVALID_RECEIVER_ID);
			return false;
		} 

		return GChatService->SendGroup(session, reqId, groupId, pkt);
	}


	DispatchError(session, reqId, ERR_INVALID_CONV_ID);
	return false;
}

bool PacketDispatcher::Dispatch_C_Ack(sessionPtr& session, uint64 reqId, const Protocol::C_Ack& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED);
		return false;
	}

	const string convId = pkt.conv_id();
	int64 serverMsgId = pkt.server_msg_id();

	cout << "[Server] C_Ack 수신: userId=" << userId << ", convId=" << convId 
		 << ", serverMsgId=" << serverMsgId << endl;

	if (convId.empty() || serverMsgId <= 0) {
		DispatchError(session, reqId, ERR_INVALID_ACK);
		return false;
	}

	// ChatService로 위임
	return GChatService->HandleAck(session, reqId, convId, serverMsgId);
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






void PacketDispatcher::PushOfflineData(sessionPtr& session, const string& userId)
{
	cout << "[PacketDispatcher] PushOfflineData: userId=" << userId << endl;
	
	

	
	// 오프라인 메시지 푸시
	// read_status 없이 단순하게: is_delivered = 0인 메시지만 조회
	int totalMessages = 0;
	auto conversations = MessageRepository::GetUserConversations(userId);
	for (const auto& convId : conversations) {
		// 오프라인 메시지 조회 (is_delivered = 0인 메시지)
		auto unreadMessages = MessageRepository::GetUnreadMessages(userId, convId, 0);
		
		if (!unreadMessages.empty()) {
			// S_MessageBatch 생성
			Protocol::S_MessageBatch batch;
			
			for (const auto& msgInfo : unreadMessages) {
				// Hex 문자열을 Protobuf 메시지로 역직렬화
				Protocol::S_Chat sChat;
				if (MessageRepository::DeserializeMessage(msgInfo.messageData, sChat)) {
					// 메시지 전송 완료 처리
					MessageRepository::MarkMessageAsDelivered(convId, msgInfo.msgSeq, userId);
					
					// 배치에 추가
					*batch.add_messages() = sChat;
					totalMessages++;
				}
			}
			
			// 배치 전송 (메시지가 있는 경우만)
			if (batch.messages_size() > 0) {
				Protocol::Envelope env;
				env.set_version(GProtoVersion);
				env.set_request_id(0);  // 서버 푸시
				*env.mutable_s_message_batch() = batch;
				SendEnvelope(session, env);
			}
		}
	}
	
	cout << "[PacketDispatcher] PushOfflineData 완료: userId=" << userId 
		 << ", offlineMessages=" << totalMessages << "개" << endl;
}

bool PacketDispatcher::Dispatch_C_CreateGroup(sessionPtr& session, uint64 reqId, const Protocol::C_CreateGroup& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	// 그룹 이름 검증
	if (pkt.group_name().empty()) {
		DispatchError(session, reqId, ERR_INVALID_PACKET, "그룹 이름이 필요합니다.");
		return false;
	}

	// 그룹 ID 생성 (timestamp 기반)
	int64_t timestamp = Nowts();
	string groupId = "group_" + to_string(timestamp) + "_" + userId.substr(0, min(static_cast<size_t>(6), userId.length()));

	// 그룹 코드 생성 (랜덤 6자리)
	string groupCode = GroupRepository::GenerateGroupCode();

	// DB에 그룹 저장
	if (!GroupRepository::CreateGroup(groupId, pkt.group_name(), groupCode, userId)) {
		DispatchError(session, reqId, ERR_SERVER_INTERNAL, "그룹 생성 실패: 데이터베이스 오류");
		return false;
	}

	// 응답 생성
	Protocol::S_CreateGroup response;
	response.set_success(true);
	response.set_message("그룹이 생성되었습니다.");
	response.set_group_id(groupId);
	response.set_group_name(pkt.group_name());
	response.set_group_code(groupCode);

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_create_group() = response;
	SendEnvelope(session, env);

	cout << "[PacketDispatcher] 그룹 생성 성공: userId=" << userId 
		 << ", groupId=" << groupId 
		 << ", groupName=" << pkt.group_name()
		 << ", groupCode=" << groupCode << endl;

	return true;
}

bool PacketDispatcher::Dispatch_C_GroupList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupList& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	// 사용자가 속한 그룹 목록 조회
	auto groups = GroupRepository::GetUserGroups(userId);

	// 응답 생성
	Protocol::S_GroupList response;
	for (const auto& groupInfo : groups) {
		Protocol::GroupInfo* group = response.add_groups();
		group->set_group_id(groupInfo.groupId);
		group->set_group_name(groupInfo.groupName);
		group->set_group_code(groupInfo.groupCode);
		group->set_creator_id(groupInfo.creatorId);
		group->set_member_count(0);
	}

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_list() = response;
	SendEnvelope(session, env);

	cout << "[PacketDispatcher] 그룹 목록 조회: userId=" << userId 
		 << ", groups=" << groups.size() << "개" << endl;

	return true;
}






bool PacketDispatcher::Dispatch_C_GroupJoinRequest(sessionPtr& session, uint64 reqId, const Protocol::C_GroupJoinRequest& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	if (pkt.group_code().empty()) {
		DispatchError(session, reqId, ERR_INVALID_PACKET, "그룹 코드가 필요합니다.");
		return false;
	}

	// 그룹 코드로 그룹 조회
	::GroupInfo groupInfo;  // GroupRepository.h의 GroupInfo 구조체 사용
	if (!GroupRepository::GetGroupByCode(pkt.group_code(), groupInfo)) {
		DispatchError(session, reqId, ERR_INVALID_PACKET, "존재하지 않는 그룹 코드입니다.");
		return false;
	}

	// 이미 멤버인지 확인
	if (GroupRepository::IsMember(groupInfo.groupId, userId)) {
		DispatchError(session, reqId, ERR_INVALID_PACKET, "이미 그룹 멤버입니다.");
		return false;
	}

	// TODO: 그룹 가입 신청을 DB에 저장 (group_join_requests 테이블)
	// 현재는 신청만 저장하고 바로 가입하지 않음 (그룹장 승인 필요)
	// 실제 구현 시: group_join_requests 테이블에 저장
	// 예: INSERT INTO group_join_requests (group_id, requester_user_id, requested_at) VALUES (?, ?, NOW())
	
	// 임시로 바로 멤버 추가하지 않고 신청만 처리
	// 주의: 현재는 DB 테이블이 없으므로 신청만 저장하고 멤버 추가는 하지 않음
	// 그룹장이 승인하면 그때 AddMember 호출
	
	// 응답 생성 (신청 완료, 승인 대기 중)
	Protocol::S_GroupJoinRequest response;
	response.set_success(true);
	response.set_message("그룹 가입 신청이 완료되었습니다. 그룹장의 승인을 기다려주세요.");
	response.set_group_id(groupInfo.groupId);
	response.set_group_name(groupInfo.groupName);

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_join_request() = response;
	SendEnvelope(session, env);

	cout << "[PacketDispatcher] 그룹 가입 신청: userId=" << userId 
		 << ", groupId=" << groupInfo.groupId 
		 << ", groupCode=" << pkt.group_code() << endl;

	return true;
}

bool PacketDispatcher::Dispatch_C_GroupJoinResponse(sessionPtr& session, uint64 reqId, const Protocol::C_GroupJoinResponse& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	// 그룹장 권한 확인
	string role = GroupRepository::GetMemberRole(pkt.group_id(), userId);
	if (role != "owner" && role != "admin") {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "그룹장 또는 관리자만 승인할 수 있습니다.");
		return false;
	}

	// TODO: 그룹 가입 신청을 DB에서 조회하여 처리
	// 현재는 바로 멤버 추가/거절 처리
	if (pkt.accept()) {
		if (!GroupRepository::AddMember(pkt.group_id(), pkt.requester_user_id(), "member")) {
			DispatchError(session, reqId, ERR_SERVER_INTERNAL, "멤버 추가 실패.");
			return false;
		}
	}

	// TODO: 그룹 가입 신청을 DB에서 삭제

	// 응답 생성
	Protocol::S_GroupJoinResponse response;
	response.set_success(true);
	response.set_message(pkt.accept() ? "가입 신청을 수락했습니다." : "가입 신청을 거절했습니다.");

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_join_response() = response;
	SendEnvelope(session, env);

	cout << "[PacketDispatcher] 그룹 가입 신청 응답: groupId=" << pkt.group_id()
		 << ", requesterId=" << pkt.requester_user_id()
		 << ", accept=" << (pkt.accept() ? "true" : "false") << endl;

	return true;
}

bool PacketDispatcher::Dispatch_C_GroupJoinRequestList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupJoinRequestList& pkt)
{
	auto serverSession = static_pointer_cast<ServerSession>(session);
	const string userId = serverSession->GetUserId();
	if (userId.empty()) {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "인증이 필요합니다.");
		return false;
	}

	// 그룹장 권한 확인
	string role = GroupRepository::GetMemberRole(pkt.group_id(), userId);
	if (role != "owner" && role != "admin") {
		DispatchError(session, reqId, ERR_UNAUTHORIZED, "그룹장 또는 관리자만 조회할 수 있습니다.");
		return false;
	}

	// TODO: 그룹 가입 신청 목록을 DB에서 조회
	// 현재는 빈 목록 반환
	Protocol::S_GroupJoinRequestList response;

	Protocol::Envelope env;
	env.set_version(GProtoVersion);
	env.set_request_id(reqId);
	*env.mutable_s_group_join_request_list() = response;
	SendEnvelope(session, env);

	cout << "[PacketDispatcher] 그룹 가입 신청 목록 조회: groupId=" << pkt.group_id() << endl;

	return true;
}
