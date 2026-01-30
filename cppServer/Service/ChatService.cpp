#include "pch.h"
#include "ChatService.h"
#include "ServerSession.h"
#include "PacketDispatcher.h"
#include "UserManager.h"
#include "../DB/MessageRepository.h"
#include "../DB/UserRepository.h"
#include "../DB/GroupRepository.h"
#include "../DB/FcmTokenRepository.h"
#include "../Cloud/FcmClient.h"

#include "../CoreGlobal.h"

using namespace Protocol;





bool ChatService::SendDirect(sessionPtr& senderSession, uint64 reqId, const string& receiverId, const Protocol::C_Chat& pkt)
{
    auto session = static_pointer_cast<ServerSession>(senderSession);
    const string senderId = session->GetUserId();
    string senderName = GetUserNameWithId(senderId);

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
    }

    PushEnvelope(senderSession, reqId, pkt_s_chat); /* Ack to self */

    /* To receiver */
    if (msgSeq >= 0) {
        if (auto target = _userManager.FindSession(receiverId)) {
            // 온라인 - 소켓으로 전송
            PushEnvelope(target, 0, pkt_s_chat);
        }
        else if (GFcmClient) {
            // 오프라인 - FCM 푸시 발송
            auto tokens = FcmTokenRepository::GetUserTokens(receiverId);
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

    int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, pkt_s_chat);
    if (msgSeq >= 0) {
        pkt_s_chat.set_msg_seq(msgSeq);

        MessageRepository::UpdateReadStatus(senderId, convId, msgSeq);

        if (fileSize > 0) {
            GroupRepository::SaveGroupAsset(groupId, senderId, msgSeq, fileSize, fileType);
        }
    }

    PushEnvelope(senderSession, reqId, pkt_s_chat); /* Ack to self */

    /* To Group */
    auto members = GroupRepository::GetGroupMembers(groupId);

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


void ChatService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    cerr << "[ChatService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
