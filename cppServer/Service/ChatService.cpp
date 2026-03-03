#include "pch.h"
#include "ChatService.h"
#include "ServerSession.h"
#include "PacketDispatcher.h"
#include "UserManager.h"
#include "../DB/MessageRepository.h"
#include "../DB/UserRepository.h"
#include "../DB/GroupRepository.h"
#include "../DB/FcmTokenRepository.h"
#include "../DB/BlockRepository.h"
#include "../DB/PollRepository.h"
#include "../Cloud/FcmClient.h"

#include "../CoreGlobal.h"
#include <random>
#include "json.hpp"

using namespace Protocol;





bool ChatService::SendDirect(sessionPtr& senderSession, uint64 reqId, const string& receiverId, const Protocol::C_Chat& pkt)
{
    auto session = static_pointer_cast<ServerSession>(senderSession);
    const string senderId = session->GetUserId();
    string senderName = GetUserNameWithId(senderId);

    // 차단 관계 확인 (어느 쪽이든 차단 시 전송 거부)
    if (BlockRepository::IsBlockedEither(senderId, receiverId)) {
        PacketDispatcher::DispatchError(senderSession, reqId, ERR_NOT_A_FRIEND, "차단된 사용자입니다.");
        return false;
    }

    const string convId = MessageRepository::CreateConversationId(senderId, receiverId);
    MessageRepository::CreateOrGetConversation(convId, "direct", senderId, receiverId);

    // GCS 경로 검증 (path traversal 방지)
    string gcsPath = pkt.gcs_path();
    if (!gcsPath.empty()) {
        if (gcsPath.find("..") != string::npos || gcsPath.find("//") != string::npos ||
            gcsPath.length() > 512) {
            gcsPath = "";
        }
    }

    int64 fileSize = 0;
    string fileType;
    int64 fileRetentionExpiresAt = 0;
    auto pkt_s_chat = Build_S_Chat(convId, senderId, fileSize, fileType, fileRetentionExpiresAt, pkt);
    // mentionedUserIds → JSON 배열 문자열 (최대 50명, userId 100자 제한)
    string mentionJson;
    int mentionCount = min(pkt.mentioned_user_ids_size(), 50);
    if (mentionCount > 0) {
        mentionJson = "[";
        bool first = true;
        for (int i = 0; i < mentionCount; ++i) {
            const auto& uid = pkt.mentioned_user_ids(i);
            if (uid.length() > 100) continue;
            if (!first) mentionJson += ",";
            nlohmann::json uidJson = uid;
            mentionJson += uidJson.dump();
            first = false;
        }
        mentionJson += "]";
    }

    int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, pkt_s_chat,
                                                   gcsPath, fileRetentionExpiresAt, mentionJson);

    // server_msg_id를 실제 msg_seq로 설정
    if (msgSeq >= 0) {
        pkt_s_chat.set_msg_seq(msgSeq);
        MessageRepository::UpdateReadStatus(senderId, convId, msgSeq);

        // UpdateReadStatus 이후: 발신자가 이미 읽은 상태 → 나머지 참여자 수 = 미읽음 수
        int unreadCount = MessageRepository::GetMsgUnreadCount(convId, msgSeq);
        pkt_s_chat.set_unread_count(unreadCount);

        if (fileSize > 0) {
            UserRepository::SaveUserAsset(senderId, msgSeq, fileSize, fileType);
        }
    }

    PushEnvelope(senderSession, reqId, pkt_s_chat); /* Ack to self */

    /* 나와의 채팅이면 Ack만 보내고 끝 (중복 전송 방지) */
    if (senderId == receiverId) {
        return true;
    }

    /* To receiver */
    if (msgSeq >= 0) {
        if (auto target = _userManager.FindSession(receiverId)) {
            // 온라인 - 소켓으로 전송
            PushEnvelope(target, 0, pkt_s_chat);
        }
        else if (GFcmClient) {
            // 오프라인 - FCM 푸시 발송
            LOG_INFO("[ChatService] SendDirect FCM: sender={}, receiver={}", senderId, receiverId);
            auto tokens = FcmTokenRepository::GetUserTokens(receiverId);
            LOG_INFO("[ChatService] Found {} FCM tokens for {}", tokens.size(), receiverId);
            if (!tokens.empty()) {
                string msgPreview = "[메시지]";
                if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_text()) {
                    msgPreview = pkt_s_chat.payload().text().message();
                    if (msgPreview.length() > 50) {
                        msgPreview = msgPreview.substr(0, 50) + "...";
                    }
                }
                else if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_image()) {
                    msgPreview = "[사진]";
                }
                else if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_file()) {
                    msgPreview = "[파일]";
                }
                else if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_audio()) {
                    msgPreview = "[음성 메시지]";
                }

                map<string, string> data = {
                    {"type", "chat"},
                    {"conv_id", convId},
                    {"sender_id", senderId}
                };

                for (const auto& tokenInfo : tokens) {
                    LOG_INFO("[ChatService] Sending FCM to userId={}, token={}...", tokenInfo.userId, tokenInfo.fcmToken.substr(0, 20));
                    bool invalidToken = false;
                    bool ok = GFcmClient->SendPush(tokenInfo.fcmToken, senderName, msgPreview, data, &invalidToken);
                    if (!ok && invalidToken) {
                        LOG_INFO("[ChatService] Deleting stale FCM token for {}", tokenInfo.userId);
                        FcmTokenRepository::DeleteToken(tokenInfo.userId, tokenInfo.fcmToken);
                    }
                }
            }
        }
    }
    return true;
}






bool ChatService::SendGroup(sessionPtr& senderSession, uint64 reqId, const string& groupId, const Protocol::C_Chat& pkt)
{
    auto session = static_pointer_cast<ServerSession>(senderSession);
    const string senderId = session->GetUserId();
    string senderName = GetUserNameWithId(senderId);

    const string convId = "group:" + groupId;
    MessageRepository::CreateOrGetConversation(convId, "group");

    // GCS 경로 검증 (path traversal 방지)
    string gcsPath = pkt.gcs_path();
    if (!gcsPath.empty()) {
        if (gcsPath.find("..") != string::npos || gcsPath.find("//") != string::npos ||
            gcsPath.length() > 512) {
            gcsPath = "";
        }
    }

    int64 fileSize = 0;
    string fileType;
    int64 fileRetentionExpiresAt = 0;
    auto pkt_s_chat = Build_S_Chat(convId, senderId, fileSize, fileType, fileRetentionExpiresAt, pkt);

    /* To Group (멤버 목록 먼저 조회 — unread count 계산에도 활용) */
    auto members = GroupRepository::GetGroupMembers(groupId);

    // mentionedUserIds → JSON 배열 문자열 (최대 50명, userId 100자 제한)
    string mentionJsonGroup;
    int mentionCountGroup = min(pkt.mentioned_user_ids_size(), 50);
    if (mentionCountGroup > 0) {
        mentionJsonGroup = "[";
        bool first = true;
        for (int i = 0; i < mentionCountGroup; ++i) {
            const auto& uid = pkt.mentioned_user_ids(i);
            if (uid.length() > 100) continue;
            if (!first) mentionJsonGroup += ",";
            // JSON 이스케이프: nlohmann::json으로 안전하게 직렬화
            nlohmann::json uidJson = uid;
            mentionJsonGroup += uidJson.dump();
            first = false;
        }
        mentionJsonGroup += "]";
    }

    int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, pkt_s_chat,
                                                   gcsPath, fileRetentionExpiresAt, mentionJsonGroup);
    if (msgSeq >= 0) {
        pkt_s_chat.set_msg_seq(msgSeq);

        MessageRepository::UpdateReadStatus(senderId, convId, msgSeq);

        // 그룹 미읽음 = 전체 멤버 수 - 1 (발신자)
        int unreadCount = (int)members.size() - 1;
        if (unreadCount < 0) unreadCount = 0;
        pkt_s_chat.set_unread_count(unreadCount);

        if (fileSize > 0) {
            GroupRepository::SaveGroupAsset(groupId, senderId, msgSeq, fileSize, fileType);
        }
    }

    PushEnvelope(senderSession, reqId, pkt_s_chat); /* Ack to self */

    // 그룹 이름 가져오기
    cGroupInfo groupInfo;
    GroupRepository::GetGroupInfoById(groupId, groupInfo);
    string groupName = groupInfo.groupName.empty() ? "그룹" : groupInfo.groupName;

    // 메시지 미리보기 준비
    string msgPreview = "[메시지]";
    if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_text()) {
        msgPreview = pkt_s_chat.payload().text().message();
        if (msgPreview.length() > 50) {
            msgPreview = msgPreview.substr(0, 50) + "...";
        }
    }
    else if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_image()) {
        msgPreview = "[사진]";
    }
    else if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_file()) {
        msgPreview = "[파일]";
    }
    else if (pkt_s_chat.has_payload() && pkt_s_chat.payload().has_audio()) {
        msgPreview = "[음성 메시지]";
    }

    for (const auto& member : members) {
        if (member.userId == senderId) continue;

        if (auto target = _userManager.FindSession(member.userId)) {
            // 온라인 - 소켓으로 전송
            PushEnvelope(target, 0, pkt_s_chat);
        }
        else if (GFcmClient) {
            // 오프라인 - FCM 푸시 발송
            auto tokens = FcmTokenRepository::GetUserTokens(member.userId);
            if (!tokens.empty()) {
                string title = groupName + " - " + senderName;

                map<string, string> data = {
                    {"type", "chat"},
                    {"conv_id", convId},
                    {"sender_id", senderId},
                    {"group_id", groupId}
                };

                for (const auto& tokenInfo : tokens) {
                    bool invalidToken = false;
                    bool ok = GFcmClient->SendPush(tokenInfo.fcmToken, title, msgPreview, data, &invalidToken);
                    if (!ok && invalidToken) {
                        LOG_INFO("[ChatService] Deleting stale FCM token for {}", tokenInfo.userId);
                        FcmTokenRepository::DeleteToken(tokenInfo.userId, tokenInfo.fcmToken);
                    }
                }
            }
        }
    }

    return true;
}





bool ChatService::SendSystemMessage(const string& groupId, const string& message)
{
    auto members = GroupRepository::GetGroupMembers(groupId);
    if (members.empty()) return false;

    Protocol::S_Chat sendPkt;
    sendPkt.set_conv_id("group:" + groupId);
    sendPkt.set_sender_id("SYSTEM");
    sendPkt.set_sender_name("System"); // 클라이언트가 이름으로 쓸 것
    sendPkt.set_ts_server(Nowts());

    auto* sysPayload = sendPkt.mutable_payload()->mutable_system();
    sysPayload->set_message(message);
    sysPayload->set_type(0);

    int64 msgSeq = MessageRepository::SaveMessage("group:" + groupId, "SYSTEM", sendPkt);
    if (msgSeq > 0) sendPkt.set_msg_seq(msgSeq);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(0);
    *env.mutable_s_chat() = sendPkt;

    for (const auto& member : members) {
        if (auto target = _userManager.FindSession(member.userId)) {
            PushEnvelope(target, 0, sendPkt);
        }
    }

    LOG_INFO("[ChatService] System Msg to Group({}): {}", groupId, message);
    return true;
}





bool ChatService::HandleAck(sessionPtr& session, uint64 reqId, bool bDirect, const string& targetId, int64 msg_seq)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) return false;

    string dbConvId;

    if (bDirect) {
        if (userId < targetId) {
            dbConvId = "direct:" + userId + "_" + targetId;
        }
        else {
            dbConvId = "direct:" + targetId + "_" + userId;
        }
    }
    else {
        dbConvId = "group:" + targetId;
    }



    bool success = MessageRepository::UpdateReadStatus(userId, dbConvId, msg_seq);
    if (!success) {
        LOG_INFO("[ChatService] DB Update 실패");
        return false;
    }
    /* TODO 상대가 읽음 처리 */

    LOG_INFO("[ChatService] Ack 처리: User={} ReadUpTo={}", userId, msg_seq);

    return true;
}







bool ChatService::HandleReqHistory(sessionPtr& session, uint64 reqId, const Protocol::C_ReqHistory& pkt)
{
    string convId = pkt.conv_id();
    int64 lastSeq = pkt.last_msg_seq();
    int limit = pkt.limit();

    if (limit <= 0) limit = 30; // 기본값
    if (limit > 100) limit = 100; // 최대값 방어

    auto history = MessageRepository::GetHistoryMessages(convId, lastSeq, limit);

    Protocol::S_ReqHistory res;
    res.set_conv_id(convId);
    res.set_is_end(history.size() < limit);

    for (const auto& msgInfo : history) {
        Protocol::S_Chat sChat;

        if (sChat.ParseFromString(msgInfo.messageData)) {
            // 시퀀스 번호 재확인
            sChat.set_msg_seq(msgInfo.msgSeq);
            *res.add_messages() = sChat;
        }
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId); 

    env.mutable_s_req_history()->CopyFrom(res);
    PacketDispatcher::SendEnvelope(session, env);

    return true;
}




Protocol::S_Chat ChatService::Build_S_Chat(const string& convId, const string& senderId,
                                           int64& OUT fileSize, string& OUT fileType,
                                           int64& OUT fileRetentionExpiresAt,
                                           const Protocol::C_Chat& pkt)
{
    string senderName = GetUserNameWithId(senderId);

    Protocol::S_Chat pkt_s_chat;
    pkt_s_chat.set_conv_id(convId);
    pkt_s_chat.set_client_msg_id(pkt.client_msg_id());
    pkt_s_chat.set_sender_id(senderId);
    pkt_s_chat.set_sender_name(senderName);
    pkt_s_chat.set_ts_server(Nowts());

    // 답장 정보 복사
    if (pkt.reply_to_seq() > 0) {
        pkt_s_chat.set_reply_to_seq(pkt.reply_to_seq());
        auto replyInfo = MessageRepository::GetMessageBySeq(convId, pkt.reply_to_seq());
        if (replyInfo.found) {
            pkt_s_chat.set_reply_to_sender_name(replyInfo.senderName);
            pkt_s_chat.set_reply_to_text(replyInfo.text);
        }
    }

    // 멘션 정보 복사
    for (const auto& uid : pkt.mentioned_user_ids()) {
        pkt_s_chat.add_mentioned_user_ids(uid);
    }

    if (pkt.has_payload()) {
        auto* payload = pkt_s_chat.mutable_payload();
        if (pkt.payload().has_text()) {
            payload->mutable_text()->set_message(pkt.payload().text().message());
        }
        else if (pkt.payload().has_image()) {
            payload->mutable_image()->set_url(pkt.payload().image().url());
            payload->mutable_image()->set_thumbnail(pkt.payload().image().thumbnail());
            payload->mutable_image()->set_size(pkt.payload().image().size());
            fileSize = pkt.payload().image().size();
            fileType = "image";
        }
        else if (pkt.payload().has_video()) {
            payload->mutable_video()->set_url(pkt.payload().video().url());
            payload->mutable_video()->set_thumbnail(pkt.payload().video().thumbnail());
            payload->mutable_video()->set_size(pkt.payload().video().size());
            fileSize = pkt.payload().video().size();
            fileType = "video";
        }
        else if (pkt.payload().has_file()) {
            payload->mutable_file()->set_url(pkt.payload().file().url());
            payload->mutable_file()->set_filename(pkt.payload().file().filename());
            payload->mutable_file()->set_size(pkt.payload().file().size());
            fileSize = pkt.payload().file().size();
            fileType = "file";
        }
        else if (pkt.payload().has_audio()) {
            payload->mutable_audio()->set_url(pkt.payload().audio().url());
            payload->mutable_audio()->set_duration_sec(pkt.payload().audio().duration_sec());
            payload->mutable_audio()->set_size(pkt.payload().audio().size());
            fileSize = pkt.payload().audio().size();
            fileType = "audio";
        }
    }

    // 파일 보관 만료 정보 설정 (미디어 메시지이고 gcs_path가 있는 경우)
    // FileService에서 이미 계산한 만료 시각을 클라이언트가 gcs_path와 함께 전달
    // 현재는 gcs_path 기반으로 file_uploads 테이블에서 조회 가능하지만,
    // 클라이언트가 S_UploadFile.file_retention_expires_at을 저장해두고 C_Chat에는 없으므로
    // DB에서 gcs_path로 조회
    if (!pkt.gcs_path().empty() && fileSize > 0) {
        // gcs_path로 file_uploads에서 retention 만료 시각 조회
        // (이 정보는 FileService가 DB에 저장)
        // TODO: FileRepository::GetFileMetadataByPath(gcsPath, fileInfo) 구현 시 사용
        // 현재는 pkt에 file_retention_expires_at 필드가 없으므로
        // FileService 저장값을 GetStorageInfo의 subGrade로 재계산
        UserRepository::StorageInfo storInfo;
        if (UserRepository::GetStorageInfo(senderId, storInfo)) {
            if (storInfo.subGrade <= 0) {
                const int64 FREE_RETENTION_MS = 7LL * 24 * 3600 * 1000;
                fileRetentionExpiresAt = pkt_s_chat.ts_server() + FREE_RETENTION_MS;
            }
            // subGrade > 0: 영구 (fileRetentionExpiresAt = 0)
        }

        // S_Chat에 파일 만료 정보 포함
        pkt_s_chat.set_file_expires_at(fileRetentionExpiresAt);
        pkt_s_chat.set_file_status("active");
    }

    return pkt_s_chat;
}

void ChatService::PushEnvelope(sessionPtr& session, uint64 reqId, const Protocol::S_Chat& pkt_s_chat)
{
    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_chat()->CopyFrom(pkt_s_chat);

    PacketDispatcher::SendEnvelope(session, env);
}



string ChatService::GetUserNameWithId(const string& userId)
{
    string name;
    if (UserRepository::GetUserNameWithId(userId, name)) {
        return name;
    }
    return userId;
}


bool ChatService::HandleDeleteMessage(sessionPtr& session, uint64 reqId, const Protocol::C_DeleteMessage& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string senderId = serverSession->GetUserId();
    if (senderId.empty()) return false;

    const string clientConvId = pkt.conv_id();
    int64 msgSeq = pkt.msg_seq();

    if (clientConvId.empty() || msgSeq <= 0) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "잘못된 삭제 요청입니다.");
        return false;
    }

    // 클라이언트 convId → DB convId 변환
    // 클라이언트: "direct:targetId" → DB: "direct:userA_userB" (정렬)
    string convId = clientConvId;
    if (clientConvId.find("direct:") == 0) {
        string targetId = clientConvId.substr(7);
        convId = MessageRepository::CreateConversationId(senderId, targetId);
    }

    bool success = MessageRepository::SoftDeleteMessage(convId, msgSeq, senderId);
    if (!success) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "메시지 삭제에 실패했습니다.");
        return false;
    }

    // 발신자에게 응답
    Protocol::S_DeleteMessage pkt_res;
    pkt_res.set_success(success);
    pkt_res.set_conv_id(convId);
    pkt_res.set_msg_seq(msgSeq);

    Protocol::Envelope envSender;
    envSender.set_version(GProtoVersion);
    envSender.set_request_id(reqId);
    *envSender.mutable_s_delete_message() = pkt_res;
    PacketDispatcher::SendEnvelope(session, envSender);

    if (!success) return false;

    // 상대방/그룹 멤버에게 브로드캐스트
    Protocol::Envelope envPush;
    envPush.set_version(GProtoVersion);
    envPush.set_request_id(0);
    *envPush.mutable_s_delete_message() = pkt_res;

    string targetId;
    if (convId.find("direct:") == 0) {
        // 1:1 - 상대방에게 전송
        string pairStr = convId.substr(7); // "direct:" 이후
        // "userA_userB" 에서 상대 추출
        auto sep = pairStr.find('_');
        if (sep != string::npos) {
            string userA = pairStr.substr(0, sep);
            string userB = pairStr.substr(sep + 1);
            string receiverId = (userA == senderId) ? userB : userA;
            if (auto target = _userManager.FindSession(receiverId)) {
                PacketDispatcher::SendEnvelope(target, envPush);
            }
        }
    }
    else if (convId.find("group:") == 0) {
        string groupId = convId.substr(6);
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& m : members) {
            if (m.userId == senderId) continue;
            if (auto target = _userManager.FindSession(m.userId)) {
                PacketDispatcher::SendEnvelope(target, envPush);
            }
        }
    }

    LOG_INFO("[ChatService] DeleteMessage: conv={} seq={}", convId, msgSeq);
    return true;
}


bool ChatService::HandleEditMessage(sessionPtr& session, uint64 reqId, const Protocol::C_EditMessage& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string senderId = serverSession->GetUserId();
    if (senderId.empty()) return false;

    const string clientConvId = pkt.conv_id();
    int64 msgSeq = pkt.msg_seq();
    const string newText = pkt.new_text();

    if (clientConvId.empty() || msgSeq <= 0 || newText.empty()) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "잘못된 수정 요청입니다.");
        return false;
    }

    // 클라이언트 convId → DB convId 변환
    string convId = clientConvId;
    if (clientConvId.find("direct:") == 0) {
        string targetId = clientConvId.substr(7);
        convId = MessageRepository::CreateConversationId(senderId, targetId);
    }

    int64 editedAt = Nowts();

    bool success = MessageRepository::EditMessage(convId, msgSeq, senderId, newText, editedAt);
    if (!success) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "메시지 수정에 실패했습니다.");
        return false;
    }

    // 발신자에게 응답
    Protocol::S_EditMessage pkt_res;
    pkt_res.set_success(success);
    pkt_res.set_conv_id(convId);
    pkt_res.set_msg_seq(msgSeq);
    pkt_res.set_new_text(newText);
    pkt_res.set_edited_at(editedAt);

    Protocol::Envelope envSender;
    envSender.set_version(GProtoVersion);
    envSender.set_request_id(reqId);
    *envSender.mutable_s_edit_message() = pkt_res;
    PacketDispatcher::SendEnvelope(session, envSender);

    if (!success) return false;

    // 상대방/그룹 멤버에게 브로드캐스트
    Protocol::Envelope envPush;
    envPush.set_version(GProtoVersion);
    envPush.set_request_id(0);
    *envPush.mutable_s_edit_message() = pkt_res;

    if (convId.find("direct:") == 0) {
        string pairStr = convId.substr(7);
        auto sep = pairStr.find('_');
        if (sep != string::npos) {
            string userA = pairStr.substr(0, sep);
            string userB = pairStr.substr(sep + 1);
            string receiverId = (userA == senderId) ? userB : userA;
            if (auto target = _userManager.FindSession(receiverId)) {
                PacketDispatcher::SendEnvelope(target, envPush);
            }
        }
    }
    else if (convId.find("group:") == 0) {
        string groupId = convId.substr(6);
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& m : members) {
            if (m.userId == senderId) continue;
            if (auto target = _userManager.FindSession(m.userId)) {
                PacketDispatcher::SendEnvelope(target, envPush);
            }
        }
    }

    LOG_INFO("[ChatService] EditMessage: conv={} seq={} newText=\"{}\"", convId, msgSeq, newText);
    return true;
}


bool ChatService::HandleReadReceipt(sessionPtr& session, uint64 reqId, const Protocol::C_ReadReceipt& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) return false;

    string convId = pkt.conv_id();
    int64 lastReadSeq = pkt.last_read_seq();
    if (convId.empty() || lastReadSeq <= 0) return false;

    // DB 업데이트
    bool ok = MessageRepository::UpdateReadStatus(userId, convId, lastReadSeq);
    if (!ok) return false;

    LOG_INFO("[ChatService] ReadReceipt: user={} conv={} seq={}", userId, convId, lastReadSeq);

    // S_ReadReceipt 브로드캐스트 (본인 제외 참여자들에게)
    Protocol::S_ReadReceipt sReadReceipt;
    sReadReceipt.set_conv_id(convId);
    sReadReceipt.set_reader_id(userId);
    sReadReceipt.set_last_read_seq(lastReadSeq);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(0); // 서버 푸시
    env.mutable_s_read_receipt()->CopyFrom(sReadReceipt);

    if (convId.find("direct:") == 0) {
        // 1:1 채팅: 상대방에게 전송
        // convId 형식: direct:userA_userB
        string participants = convId.substr(7);
        size_t sep = participants.find('_');
        if (sep != string::npos) {
            string user1 = participants.substr(0, sep);
            string user2 = participants.substr(sep + 1);
            string targetId = (user1 == userId) ? user2 : user1;

            auto targetSession = _userManager.FindSession(targetId);
            if (targetSession) {
                PacketDispatcher::SendEnvelope(targetSession, env);
            }
        }
    }
    else if (convId.find("group:") == 0) {
        // 그룹 채팅: 본인 제외 모든 온라인 멤버에게 전송
        string groupId = convId.substr(6);
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& member : members) {
            if (member.userId == userId) continue;
            auto memberSession = _userManager.FindSession(member.userId);
            if (memberSession) {
                PacketDispatcher::SendEnvelope(memberSession, env);
            }
        }
    }

    return true;
}


bool ChatService::HandleAddReaction(sessionPtr& session, uint64 reqId, const Protocol::C_AddReaction& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string clientConvId = pkt.conv_id();
    int64 msgSeq = pkt.msg_seq();
    const string& emoji = pkt.emoji();

    // 클라이언트 convId → DB convId 변환
    // 클라이언트: "direct:targetId" → DB: "direct:userA_userB" (정렬)
    string convId = clientConvId;
    string directTargetId; // 1:1일 때 상대방 userId
    if (clientConvId.find("direct:") == 0) {
        directTargetId = clientConvId.substr(7);
        convId = MessageRepository::CreateConversationId(userId, directTargetId);
    }

    bool outRemoved = false;
    if (!MessageRepository::ToggleReaction(convId, msgSeq, userId, emoji, outRemoved)) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "반응 처리 실패");
        return false;
    }

    // S_AddReaction 구성 (convId는 클라이언트 원본 형식으로 전달)
    Protocol::S_AddReaction pkt_res;
    pkt_res.set_conv_id(clientConvId);
    pkt_res.set_msg_seq(msgSeq);
    pkt_res.set_user_id(userId);
    pkt_res.set_emoji(emoji);
    pkt_res.set_removed(outRemoved);

    // 브로드캐스트
    if (clientConvId.find("group:") == 0) {
        // 그룹 채팅
        string groupId = clientConvId.substr(6); // "group:" 제거
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& member : members) {
            if (auto memberSession = _userManager.FindSession(member.userId)) {
                Protocol::Envelope env;
                env.set_version(GProtoVersion);
                env.set_request_id(member.userId == userId ? reqId : 0);
                *env.mutable_s_add_reaction() = pkt_res;
                PacketDispatcher::SendEnvelope(memberSession, env);
            }
        }
    } else {
        // 1:1 채팅: 발신자와 수신자 각각에게 전송
        for (const auto& pid : {userId, directTargetId}) {
            if (pid.empty()) continue;
            if (auto peerSession = _userManager.FindSession(pid)) {
                Protocol::Envelope env;
                env.set_version(GProtoVersion);
                env.set_request_id(pid == userId ? reqId : 0);
                *env.mutable_s_add_reaction() = pkt_res;
                PacketDispatcher::SendEnvelope(peerSession, env);
            }
        }
    }

    return true;
}


/*======================
    HandleCreatePoll
========================*/
bool ChatService::HandleCreatePoll(sessionPtr& session, uint64 reqId, const Protocol::C_CreatePoll& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& clientConvId = pkt.conv_id();
    if (clientConvId.find("group:") != 0) {
        HandleErr(session, reqId, ERR_INVALID_CONV_ID, "투표는 그룹에서만 가능");
        return false;
    }

    string groupId = clientConvId.substr(6);
    string convId = clientConvId;

    // pollId 생성: "poll_" + timestamp + random
    int64 now = Nowts();
    std::ostringstream pollIdStream;
    pollIdStream << "poll_" << now << "_" << (rand() % 100000);
    string pollId = pollIdStream.str();

    // options -> JSON 배열
    std::ostringstream optionsOss;
    optionsOss << "[";
    for (int i = 0; i < pkt.options_size(); i++) {
        if (i > 0) optionsOss << ",";
        optionsOss << "\"";
        // Escape quotes in option text
        for (char c : pkt.options(i)) {
            if (c == '"') optionsOss << "\\\"";
            else if (c == '\\') optionsOss << "\\\\";
            else optionsOss << c;
        }
        optionsOss << "\"";
    }
    optionsOss << "]";
    string optionsJson = optionsOss.str();

    // msg_type=5 (POLL) 메시지로 저장
    int64 msgSeq = MessageRepository::GetNextMessageSeq(convId);
    if (msgSeq < 0) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "msgSeq 생성 실패");
        return false;
    }

    // polls 테이블에 저장
    if (!PollRepository::CreatePoll(pollId, convId, msgSeq, userId,
                                     pkt.question(), optionsJson,
                                     pkt.is_multi_select(), pkt.is_anonymous(),
                                     pkt.expires_at(), now)) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "투표 생성 실패");
        return false;
    }

    // poll JSON을 message로 저장 (msg_type=5)
    Protocol::S_Chat sChat;
    sChat.set_conv_id(convId);
    sChat.set_sender_id(userId);
    sChat.set_sender_name(GetUserNameWithId(userId));
    sChat.set_ts_server(now);
    sChat.set_msg_seq(msgSeq);

    // poll 정보를 message payload에 JSON으로 저장
    std::ostringstream pollJsonOss;
    pollJsonOss << "{\"pollId\":\"" << pollId << "\""
                << ",\"question\":\"";
    for (char c : pkt.question()) {
        if (c == '"') pollJsonOss << "\\\"";
        else if (c == '\\') pollJsonOss << "\\\\";
        else pollJsonOss << c;
    }
    pollJsonOss << "\",\"options\":" << optionsJson
                << ",\"isMultiSelect\":" << (pkt.is_multi_select() ? "true" : "false")
                << ",\"isAnonymous\":" << (pkt.is_anonymous() ? "true" : "false")
                << ",\"expiresAt\":" << pkt.expires_at()
                << ",\"creatorId\":\"" << userId << "\""
                << ",\"status\":\"active\""
                << ",\"votes\":{}}";
    string pollJson = pollJsonOss.str();
    sChat.mutable_payload()->mutable_text()->set_message(pollJson);

    MessageRepository::SaveMessage(convId, userId, sChat, "", 0, "", 5 /* POLL */);

    // S_CreatePoll 브로드캐스트
    Protocol::S_CreatePoll pkt_res;
    pkt_res.set_conv_id(clientConvId);
    pkt_res.set_poll_id(pollId);
    pkt_res.set_msg_seq(msgSeq);
    pkt_res.set_creator_id(userId);
    pkt_res.set_creator_name(GetUserNameWithId(userId));
    pkt_res.set_question(pkt.question());
    for (int i = 0; i < pkt.options_size(); i++) {
        pkt_res.add_options(pkt.options(i));
    }
    pkt_res.set_is_multi_select(pkt.is_multi_select());
    pkt_res.set_is_anonymous(pkt.is_anonymous());
    pkt_res.set_expires_at(pkt.expires_at());
    pkt_res.set_ts_server(now);

    auto members = GroupRepository::GetGroupMembers(groupId);
    for (const auto& member : members) {
        if (auto memberSession = _userManager.FindSession(member.userId)) {
            Protocol::Envelope env;
            env.set_version(GProtoVersion);
            env.set_request_id(member.userId == userId ? reqId : 0);
            *env.mutable_s_create_poll() = pkt_res;
            PacketDispatcher::SendEnvelope(memberSession, env);
        }
    }

    LOG_INFO("[ChatService] CreatePoll: {} in {}", pollId, convId);
    return true;
}

/*======================
    HandleVote
========================*/
bool ChatService::HandleVote(sessionPtr& session, uint64 reqId, const Protocol::C_Vote& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& pollId = pkt.poll_id();

    // 투표 존재 + 상태 확인
    PollInfo pollInfo = PollRepository::GetPollInfo(pollId);
    if (pollInfo.pollId.empty()) {
        HandleErr(session, reqId, ERR_POLL_NOT_FOUND, "투표를 찾을 수 없음");
        return false;
    }
    if (pollInfo.status != "active") {
        HandleErr(session, reqId, ERR_POLL_CLOSED, "이미 종료된 투표");
        return false;
    }

    // 자동 만료 체크
    if (pollInfo.expiresAt > 0 && Nowts() > pollInfo.expiresAt) {
        PollRepository::ClosePoll(pollId, pollInfo.creatorId);
        HandleErr(session, reqId, ERR_POLL_CLOSED, "만료된 투표");
        return false;
    }

    // 선택지 유효성 검사
    vector<int> selectedOptions;
    for (int i = 0; i < pkt.selected_options_size(); i++) {
        selectedOptions.push_back(pkt.selected_options(i));
    }

    // 투표 저장
    if (!PollRepository::Vote(pollId, userId, selectedOptions)) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "투표 처리 실패");
        return false;
    }

    // 최신 투표 현황
    string votesJson = PollRepository::GetPollVotes(pollId);

    // S_Vote 브로드캐스트
    Protocol::S_Vote pkt_res;
    pkt_res.set_conv_id(pkt.conv_id());
    pkt_res.set_poll_id(pollId);
    pkt_res.set_msg_seq(pkt.msg_seq());
    pkt_res.set_voter_id(userId);
    pkt_res.set_voter_name(GetUserNameWithId(userId));
    for (int opt : selectedOptions) {
        pkt_res.add_selected_options(opt);
    }
    pkt_res.set_votes_json(votesJson);

    string clientConvId = pkt.conv_id();
    if (clientConvId.find("group:") == 0) {
        string groupId = clientConvId.substr(6);
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& member : members) {
            if (auto memberSession = _userManager.FindSession(member.userId)) {
                Protocol::Envelope env;
                env.set_version(GProtoVersion);
                env.set_request_id(member.userId == userId ? reqId : 0);
                *env.mutable_s_vote() = pkt_res;
                PacketDispatcher::SendEnvelope(memberSession, env);
            }
        }
    }

    LOG_INFO("[ChatService] Vote: {} by {}", pollId, userId);
    return true;
}

/*======================
    HandleClosePoll
========================*/
bool ChatService::HandleClosePoll(sessionPtr& session, uint64 reqId, const Protocol::C_ClosePoll& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& pollId = pkt.poll_id();

    if (!PollRepository::ClosePoll(pollId, userId)) {
        HandleErr(session, reqId, ERR_NO_PERMISSION, "투표 종료 권한 없음 또는 이미 종료됨");
        return false;
    }

    // S_ClosePoll 브로드캐스트
    Protocol::S_ClosePoll pkt_res;
    pkt_res.set_conv_id(pkt.conv_id());
    pkt_res.set_poll_id(pollId);
    pkt_res.set_msg_seq(pkt.msg_seq());

    string clientConvId = pkt.conv_id();
    if (clientConvId.find("group:") == 0) {
        string groupId = clientConvId.substr(6);
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& member : members) {
            if (auto memberSession = _userManager.FindSession(member.userId)) {
                Protocol::Envelope env;
                env.set_version(GProtoVersion);
                env.set_request_id(member.userId == userId ? reqId : 0);
                *env.mutable_s_close_poll() = pkt_res;
                PacketDispatcher::SendEnvelope(memberSession, env);
            }
        }
    }

    LOG_INFO("[ChatService] ClosePoll: {}", pollId);
    return true;
}


bool ChatService::HandleSetAnnouncement(sessionPtr& session, uint64 reqId, const Protocol::C_SetAnnouncement& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& clientConvId = pkt.conv_id();
    int64 msgSeq = pkt.msg_seq();
    const string& text = pkt.text();
    const string& senderName = pkt.sender_name();

    // convId 변환 (direct:targetId → direct:userA_userB)
    string convId = clientConvId;
    if (convId.find("direct:") == 0) {
        string targetId = convId.substr(7);
        convId = "direct:" + MessageRepository::CreateConversationId(userId, targetId);
    }

    // DB 저장/삭제
    if (msgSeq == 0) {
        MessageRepository::ClearAnnouncement(convId);
    } else {
        MessageRepository::SetAnnouncement(convId, msgSeq, text, senderName, userId);
    }

    // S_SetAnnouncement 빌드
    Protocol::S_SetAnnouncement res;
    res.set_conv_id(clientConvId); // 클라이언트 원본 conv_id 유지
    res.set_msg_seq(msgSeq);
    res.set_text(text);
    res.set_sender_name(senderName);
    res.set_setter_id(userId);

    // 그룹이면 전체 브로드캐스트, 1:1이면 양쪽에 전송
    if (clientConvId.find("group:") == 0) {
        string groupId = clientConvId.substr(6);
        auto members = GroupRepository::GetGroupMembers(groupId);
        for (const auto& member : members) {
            if (auto memberSession = _userManager.FindSession(member.userId)) {
                Protocol::Envelope env;
                env.set_version(GProtoVersion);
                env.set_request_id(member.userId == userId ? reqId : 0);
                *env.mutable_s_set_announcement() = res;
                PacketDispatcher::SendEnvelope(memberSession, env);
            }
        }
    } else if (clientConvId.find("direct:") == 0) {
        // 요청자에게 응답
        Protocol::Envelope env;
        env.set_version(GProtoVersion);
        env.set_request_id(reqId);
        *env.mutable_s_set_announcement() = res;
        PacketDispatcher::SendEnvelope(session, env);

        // 상대방에게 전달
        string targetId = clientConvId.substr(7);
        if (auto targetSession = _userManager.FindSession(targetId)) {
            Protocol::Envelope env2;
            env2.set_version(GProtoVersion);
            env2.set_request_id(0);
            *env2.mutable_s_set_announcement() = res;
            PacketDispatcher::SendEnvelope(targetSession, env2);
        }
    }

    LOG_INFO("[ChatService] SetAnnouncement: convId={}, msgSeq={}", convId, msgSeq);
    return true;
}


/*======================
    HandleCreateBallDrop
========================*/
bool ChatService::HandleCreateBallDrop(sessionPtr& session, uint64 reqId, const Protocol::C_CreateBallDrop& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& clientConvId = pkt.conv_id();
    if (clientConvId.find("group:") != 0) {
        HandleErr(session, reqId, ERR_INVALID_CONV_ID, "공 뽑기는 그룹에서만 가능");
        return false;
    }

    string groupId = clientConvId.substr(6);
    string convId = clientConvId;

    // 참가자 목록 결정
    auto allMembers = GroupRepository::GetGroupMembers(groupId);

    struct ParticipantInfo {
        string uId;
        string name;
        int32_t ballCount;
    };
    vector<ParticipantInfo> participants;

    if (pkt.participant_ids_size() == 0) {
        // 전체 멤버 — ball_counts가 비어있으면 기본 3개
        int32_t defaultCount = pkt.ball_counts_size() > 0 ? 3 : 3;
        for (size_t i = 0; i < allMembers.size(); i++) {
            int32_t bc = (i < (size_t)pkt.ball_counts_size()) ? pkt.ball_counts(i) : defaultCount;
            if (bc < 1) bc = 1;
            if (bc > 20) bc = 20;
            participants.push_back({allMembers[i].userId, allMembers[i].name, bc});
        }
    } else {
        // 지정된 멤버
        for (int i = 0; i < pkt.participant_ids_size(); i++) {
            const string& pid = pkt.participant_ids(i);
            int32_t bc = (i < pkt.ball_counts_size()) ? pkt.ball_counts(i) : 3;
            if (bc < 1) bc = 1;
            if (bc > 20) bc = 20;
            for (const auto& m : allMembers) {
                if (m.userId == pid) {
                    participants.push_back({m.userId, m.name, bc});
                    break;
                }
            }
        }
    }

    if (participants.size() < 2) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "최소 2명 이상 필요");
        return false;
    }

    int32_t totalBalls = 0;
    for (const auto& p : participants) totalBalls += p.ballCount;
    if (totalBalls < 2 || totalBalls > 100) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "총 공 개수는 2~100개");
        return false;
    }

    // seed 생성
    std::random_device rd;
    uint64_t seed = ((uint64_t)rd() << 32) | rd();

    // 공 뽑기 시뮬레이션: 각 공의 도착 시간 결정 (시드 기반)
    // 공 리스트 생성
    struct BallInfo {
        int ownerIdx;
        double arrivalTime;
    };
    vector<BallInfo> balls;
    for (size_t pi = 0; pi < participants.size(); pi++) {
        for (int bi = 0; bi < participants[pi].ballCount; bi++) {
            balls.push_back({(int)pi, 0.0});
        }
    }

    // mulberry32 PRNG (클라이언트와 동일 알고리즘 — 결과 검증용)
    std::mt19937_64 rng(seed);

    // 셔플 공 순서 (드롭 순서)
    for (int i = (int)balls.size() - 1; i > 0; i--) {
        std::uniform_int_distribution<int> dist(0, i);
        int j = dist(rng);
        std::swap(balls[i], balls[j]);
    }

    // 도착 시간 계산: 시작 딜레이 + 속도 변동
    double dropInterval = std::max(60.0, 300.0 / balls.size());
    double baseSegDuration = 180.0;
    int pegRows = 10;
    int pathLen = pegRows + 2; // 시작점 + 페그들 + 착지점

    for (size_t i = 0; i < balls.size(); i++) {
        std::uniform_real_distribution<double> speedDist(0.85, 1.15);
        double speedVar = speedDist(rng);
        double segDuration = baseSegDuration / speedVar;
        double startDelay = i * dropInterval;
        balls[i].arrivalTime = startDelay + segDuration * pathLen;
    }

    // 마지막 도착 공 = 당첨자
    int lastBallIdx = 0;
    double maxArrival = 0;
    for (size_t i = 0; i < balls.size(); i++) {
        if (balls[i].arrivalTime > maxArrival) {
            maxArrival = balls[i].arrivalTime;
            lastBallIdx = (int)i;
        }
    }

    int winnerOwnerIdx = balls[lastBallIdx].ownerIdx;
    const string& winnerId = participants[winnerOwnerIdx].uId;
    const string& winnerName = participants[winnerOwnerIdx].name;

    // 게임 JSON 생성
    int64 now = Nowts();
    int64 animationEndsAt = now + 5 * 60 * 1000; // 5분

    auto escapeJson = [](const string& s) -> string {
        string out;
        for (char c : s) {
            if (c == '"') out += "\\\"";
            else if (c == '\\') out += "\\\\";
            else out += c;
        }
        return out;
    };

    std::ostringstream oss;
    oss << "{\"gameType\":\"ballDrop\""
        << ",\"seed\":" << seed
        << ",\"participants\":[";
    for (size_t i = 0; i < participants.size(); i++) {
        if (i > 0) oss << ",";
        oss << "{\"userId\":\"" << escapeJson(participants[i].uId) << "\""
            << ",\"name\":\"" << escapeJson(participants[i].name) << "\""
            << ",\"ballCount\":" << participants[i].ballCount << "}";
    }
    string creatorName = GetUserNameWithId(userId);
    oss << "],\"winnerId\":\"" << escapeJson(winnerId) << "\""
        << ",\"winnerName\":\"" << escapeJson(winnerName) << "\""
        << ",\"creatorId\":\"" << escapeJson(userId) << "\""
        << ",\"creatorName\":\"" << escapeJson(creatorName) << "\""
        << ",\"createdAt\":" << now
        << ",\"animationEndsAt\":" << animationEndsAt
        << "}";
    string gameJson = oss.str();

    // msg_type=7 (GAME) 메시지 저장
    int64 msgSeq = MessageRepository::GetNextMessageSeq(convId);
    if (msgSeq < 0) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "msgSeq 생성 실패");
        return false;
    }

    Protocol::S_Chat sChat;
    sChat.set_conv_id(convId);
    sChat.set_sender_id(userId);
    sChat.set_sender_name(creatorName);
    sChat.set_ts_server(now);
    sChat.set_msg_seq(msgSeq);
    sChat.mutable_payload()->mutable_text()->set_message(gameJson);

    MessageRepository::SaveMessage(convId, userId, sChat, "", 0, "", 7 /* GAME */);

    // S_CreateBallDrop 브로드캐스트
    Protocol::S_CreateBallDrop pkt_res;
    pkt_res.set_conv_id(clientConvId);
    pkt_res.set_msg_seq(msgSeq);
    pkt_res.set_game_json(gameJson);

    for (const auto& member : allMembers) {
        if (auto memberSession = _userManager.FindSession(member.userId)) {
            Protocol::Envelope env;
            env.set_version(GProtoVersion);
            env.set_request_id(member.userId == userId ? reqId : 0);
            *env.mutable_s_create_ball_drop() = pkt_res;
            PacketDispatcher::SendEnvelope(memberSession, env);
        }
    }

    // FCM 오프라인 멤버
    if (GFcmClient) {
        for (const auto& member : allMembers) {
            if (member.userId == userId) continue;
            if (!_userManager.FindSession(member.userId)) {
                auto tokens = FcmTokenRepository::GetUserTokens(member.userId);
                map<string, string> data = {
                    {"type", "chat"},
                    {"conv_id", convId},
                    {"sender_id", userId}
                };
                for (const auto& tokenInfo : tokens) {
                    bool invalidToken = false;
                    GFcmClient->SendPush(tokenInfo.fcmToken, creatorName, "[공 뽑기]", data, &invalidToken);
                    if (invalidToken) {
                        FcmTokenRepository::DeleteToken(tokenInfo.userId, tokenInfo.fcmToken);
                    }
                }
            }
        }
    }

    LOG_INFO("[ChatService] CreateBallDrop: convId={}, participants={}, totalBalls={}, winner={}", convId, participants.size(), totalBalls, winnerName);
    return true;
}


/*
=============================================
    HandleCreatePhotoSlide (포토 슬라이드)
=============================================
*/
bool ChatService::HandleCreatePhotoSlide(sessionPtr& session, uint64 reqId, const Protocol::C_CreatePhotoSlide& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& clientConvId = pkt.conv_id();
    if (clientConvId.find("group:") != 0) {
        HandleErr(session, reqId, ERR_INVALID_CONV_ID, "포토 슬라이드는 그룹에서만 가능");
        return false;
    }

    string groupId = clientConvId.substr(6);
    string convId = clientConvId;

    // 유효성 검사
    int imageCount = pkt.image_urls_size();
    if (imageCount < 2 || imageCount > 10) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "사진은 2~10장 필요");
        return false;
    }

    string message = pkt.message();
    if (message.size() > 600) { // UTF-8 최대 200자 × 3바이트
        message = message.substr(0, 600);
    }

    string endingMessage = pkt.ending_message();
    if (endingMessage.size() > 600) {
        endingMessage = endingMessage.substr(0, 600);
    }

    int fontSize = pkt.font_size();
    if (fontSize < 18 || fontSize > 40) fontSize = 26; // 기본값

    auto escapeJson = [](const string& s) -> string {
        string out;
        for (char c : s) {
            if (c == '"') out += "\\\"";
            else if (c == '\\') out += "\\\\";
            else if (c == '\n') out += "\\n";
            else if (c == '\r') out += "\\r";
            else if (c == '\t') out += "\\t";
            else out += c;
        }
        return out;
    };

    // PhotoSlideData JSON 생성
    int64 now = Nowts();
    string creatorName = GetUserNameWithId(userId);

    std::ostringstream oss;
    oss << "{\"type\":\"photoSlide\""
        << ",\"images\":[";
    for (int i = 0; i < imageCount; i++) {
        if (i > 0) oss << ",";
        oss << "{\"url\":\"" << escapeJson(pkt.image_urls(i)) << "\"";
        if (i < pkt.thumbnail_urls_size() && !pkt.thumbnail_urls(i).empty()) {
            oss << ",\"thumbUrl\":\"" << escapeJson(pkt.thumbnail_urls(i)) << "\"";
        }
        oss << "}";
    }
    oss << "],\"slideMessage\":\"" << escapeJson(message) << "\""
        << ",\"endingMessage\":\"" << escapeJson(endingMessage) << "\""
        << ",\"fontSize\":" << fontSize
        << ",\"message\":\"" << escapeJson(message) << "\""
        << ",\"textPosition\":\"" << escapeJson(pkt.text_position()) << "\""
        << ",\"fontStyle\":\"" << escapeJson(pkt.font_style()) << "\""
        << ",\"bgTheme\":\"" << escapeJson(pkt.bg_theme()) << "\""
        << ",\"creatorId\":\"" << escapeJson(userId) << "\""
        << ",\"creatorName\":\"" << escapeJson(creatorName) << "\""
        << ",\"createdAt\":" << now
        << "}";
    string slideJson = oss.str();

    // msg_type=8 (PHOTO_SLIDE) 메시지 저장
    int64 msgSeq = MessageRepository::GetNextMessageSeq(convId);
    if (msgSeq < 0) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "msgSeq 생성 실패");
        return false;
    }

    Protocol::S_Chat sChat;
    sChat.set_conv_id(convId);
    sChat.set_sender_id(userId);
    sChat.set_sender_name(creatorName);
    sChat.set_ts_server(now);
    sChat.set_msg_seq(msgSeq);
    sChat.mutable_payload()->mutable_text()->set_message(slideJson);

    MessageRepository::SaveMessage(convId, userId, sChat, "", 0, "", 8 /* PHOTO_SLIDE */);

    // S_CreatePhotoSlide 브로드캐스트
    Protocol::S_CreatePhotoSlide pkt_res;
    pkt_res.set_conv_id(clientConvId);
    pkt_res.set_msg_seq(msgSeq);
    pkt_res.set_slide_json(slideJson);

    auto allMembers = GroupRepository::GetGroupMembers(groupId);
    for (const auto& member : allMembers) {
        if (auto memberSession = _userManager.FindSession(member.userId)) {
            Protocol::Envelope env;
            env.set_version(GProtoVersion);
            env.set_request_id(member.userId == userId ? reqId : 0);
            *env.mutable_s_create_photo_slide() = pkt_res;
            PacketDispatcher::SendEnvelope(memberSession, env);
        }
    }

    // FCM 오프라인 멤버
    if (GFcmClient) {
        for (const auto& member : allMembers) {
            if (member.userId == userId) continue;
            if (!_userManager.FindSession(member.userId)) {
                auto tokens = FcmTokenRepository::GetUserTokens(member.userId);
                map<string, string> data = {
                    {"type", "chat"},
                    {"conv_id", convId},
                    {"sender_id", userId}
                };
                for (const auto& tokenInfo : tokens) {
                    bool invalidToken = false;
                    GFcmClient->SendPush(tokenInfo.fcmToken, creatorName, "[포토 슬라이드]", data, &invalidToken);
                    if (invalidToken) {
                        FcmTokenRepository::DeleteToken(tokenInfo.userId, tokenInfo.fcmToken);
                    }
                }
            }
        }
    }

    LOG_INFO("[ChatService] CreatePhotoSlide: convId={}, images={}, creator={}", convId, imageCount, creatorName);
    return true;
}


void ChatService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    LOG_ERROR("[ChatService] Error: {} (code: {})", errMessage, static_cast<int>(errorCode));
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
