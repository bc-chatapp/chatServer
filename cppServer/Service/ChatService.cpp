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
#include "../Cloud/FcmClient.h"

#include "../CoreGlobal.h"

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
    
    int64 fileSize = 0;
    string fileType;
    auto pkt_s_chat = Build_S_Chat(convId, senderId, fileSize, fileType, pkt);
    int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, pkt_s_chat);
    
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
            cout << "[ChatService] SendDirect FCM: sender=" << senderId << ", receiver=" << receiverId << endl;
            auto tokens = FcmTokenRepository::GetUserTokens(receiverId);
            cout << "[ChatService] Found " << tokens.size() << " FCM tokens for " << receiverId << endl;
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

                map<string, string> data = {
                    {"type", "chat"},
                    {"conv_id", convId},
                    {"sender_id", senderId}
                };

                for (const auto& tokenInfo : tokens) {
                    cout << "[ChatService] Sending FCM to userId=" << tokenInfo.userId
                         << ", token=" << tokenInfo.fcmToken.substr(0, 20) << "..." << endl;
                    GFcmClient->SendPush(tokenInfo.fcmToken, senderName, msgPreview, data);
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
  
    int64 fileSize = 0;
    string fileType;
    auto pkt_s_chat = Build_S_Chat(convId, senderId, fileSize, fileType, pkt);

    /* To Group (멤버 목록 먼저 조회 — unread count 계산에도 활용) */
    auto members = GroupRepository::GetGroupMembers(groupId);

    int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, pkt_s_chat);
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
                    GFcmClient->SendPush(tokenInfo.fcmToken, title, msgPreview, data);
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

    cout << "[ChatService] System Msg to Group(" << groupId << "): " << message << endl;
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
        cout << "[ChatService] DB Update 실패" << endl;
        return false;
    }
    /* TODO 상대가 읽음 처리 */

    cout << "[ChatService] Ack 처리: User=" << userId << " ReadUpTo=" << msg_seq << endl;

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




Protocol::S_Chat ChatService::Build_S_Chat(const string& convId, const string& senderId, int64& OUT fileSize, string& OUT fileType, const Protocol::C_Chat& pkt)
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
            payload->mutable_video()->set_thumbnail(pkt.payload().video().thumbnail());
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

    cout << "[ChatService] DeleteMessage: conv=" << convId << " seq=" << msgSeq << endl;
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

    cout << "[ChatService] EditMessage: conv=" << convId << " seq=" << msgSeq << " newText=\"" << newText << "\"" << endl;
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

    cout << "[ChatService] ReadReceipt: user=" << userId
         << " conv=" << convId << " seq=" << lastReadSeq << endl;

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


void ChatService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    cerr << "[ChatService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
