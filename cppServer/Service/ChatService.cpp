#include "pch.h"
#include "ChatService.h"
#include "ServerSession.h"
#include "PacketDispatcher.h"
#include "UserManager.h"
#include "../DB/MessageRepository.h"
#include "../CoreGlobal.h"

using namespace Protocol;





bool ChatService::SendDirect(sessionPtr& senderSession, uint64 reqId, const string& receiverId, const Protocol::C_Chat& pkt)
{
    auto session = static_pointer_cast<ServerSession>(senderSession);
    const string senderId = session->GetUserId();

    // 대화방 ID 생성 (알파벳 순서로 정렬하여 일관성 유지)
    const string convId = MessageRepository::CreateConversationId(senderId, receiverId);
    
    // 대화방 생성 또는 조회
    MessageRepository::CreateOrGetConversation(convId, "direct", senderId, receiverId);
    
    // S_Chat 패킷 생성 (임시로 server_msg_id = 0)
    auto pkt_s_chat = Build_S_Chat(convId, senderId, pkt);

    // 메시지 저장 (DB에 저장) - 저장된 msg_seq 반환
    int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, receiverId, pkt_s_chat);
    
    // server_msg_id를 실제 msg_seq로 설정
    if (msgSeq >= 0) {
        pkt_s_chat.set_server_msg_id(msgSeq);
    }

    
    PushEnvelope(senderSession, reqId, pkt_s_chat); /* Ack to self */

    /* To receiver*/
    if (msgSeq >= 0) {  // 메시지 저장 성공한 경우만
        if (auto target = _userManager.FindSession(receiverId)) {
            // 수신자가 온라인: 즉시 전송
            PushEnvelope(target, 0, pkt_s_chat);
            
            // 전송 완료 처리
            MessageRepository::MarkMessageAsDelivered(convId, msgSeq, receiverId);
            
            // 메모장 저장은 SaveMessage에서 이미 처리됨
        } else {
            // 수신자가 오프라인: 메시지는 이미 저장됨 (is_delivered = 0)
            // 메모장 저장은 SaveMessage에서 이미 처리됨
            // 로그인 시 PushOfflineData에서 처리
        }
    }

    return true;
}

bool ChatService::SendGroup(sessionPtr& senderSession, uint64 reqId, const string& groupId, const Protocol::C_Chat& pkt)
{
    auto session = static_pointer_cast<ServerSession>(senderSession);
    const string senderId = session->GetUserId();

    const string convId = "group:" + groupId;
    
    // 대화방 생성 또는 조회
    MessageRepository::CreateOrGetConversation(convId, "group");
    
    auto pkt_s_chat = Build_S_Chat(convId, senderId, pkt);

    PushEnvelope(senderSession, reqId, pkt_s_chat); /* Ack to self */

    /* To Group */
    auto members = _userManager.Members(groupId);
    
    for (const auto& member : members) {
        if (member == senderId) continue;
        
        // 각 멤버별로 메시지 저장 (그룹 채팅은 각 멤버가 receiver)
        int64 msgSeq = MessageRepository::SaveMessage(convId, senderId, member, pkt_s_chat);
        
        if (msgSeq >= 0) {  // 메시지 저장 성공한 경우만
            if (auto target = _userManager.FindSession(member)) {
                // 온라인: 즉시 전송
                PushEnvelope(target, 0, pkt_s_chat);
                
                // 전송 완료 처리
                MessageRepository::MarkMessageAsDelivered(convId, msgSeq, member);
                
                // 읽음 상태 업데이트
                MessageRepository::UpdateReadStatus(member, convId, msgSeq);
            } else {
                // 오프라인: 메시지는 이미 저장됨 (is_delivered = 0)
            }
        }
    }

    return true;
}

bool ChatService::HandleAck(sessionPtr& session, uint64 reqId, const string& convId, int64 serverMsgId)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    
    if (userId.empty()) {
        return false;
    }
    
    cout << "[ChatService] HandleAck: userId=" << userId 
         << ", convId=" << convId << ", serverMsgId=" << serverMsgId << endl;
    
    // ACK는 읽음 확인용으로만 사용 (메모장 저장은 이미 SaveMessage에서 처리됨)
    // 필요시 읽은 메시지를 DB에서 삭제할 수 있지만, 일단은 유지
    // (최근 메시지 조회를 위해 DB에 보관)
    
    cout << "[ChatService] HandleAck 완료: 읽음 확인" << endl;
    return true;
}

Protocol::S_Chat ChatService::Build_S_Chat(const string& convId, const string& senderId, const Protocol::C_Chat& pkt)
{
    Protocol::S_Chat pkt_s_chat;
    pkt_s_chat.set_conv_id(convId);
    pkt_s_chat.set_client_msg_id(pkt.client_msg_id());
    pkt_s_chat.set_server_msg_id(0);  // 나중에 msg_seq로 설정됨
    pkt_s_chat.set_sender_id(senderId);
    pkt_s_chat.set_ts_server(Nowts());
    pkt_s_chat.mutable_payload()->CopyFrom(pkt.payload());

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

void ChatService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    cerr << "[ChatService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
