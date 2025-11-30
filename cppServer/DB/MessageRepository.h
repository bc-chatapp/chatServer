#pragma once

#include "pch.h"
#include "../protocol.pb.h"

struct MessageInfo {
    int64 id;
    string convId;
    int64 msgSeq;
    string senderId;
    string receiverId;
    string messageData;  // Protobuf 직렬화된 데이터
    int64 clientMsgId;
    int64 serverMsgId;
    int64 timestamp;
    bool isDelivered;
    int64 deliveredAt;
};

class MessageRepository {
public:
    // ============================================
    // 대화방 관리
    // ============================================
    
    // 대화방 ID 생성 (1:1 채팅의 경우 알파벳 순서로 정렬)
    static string CreateConversationId(const string& user1, const string& user2);
    
    // 대화방 생성 또는 조회
    static string CreateOrGetConversation(const string& convId, const string& convType,
                                          const string& participant1 = "", 
                                          const string& participant2 = "");
    
    // ============================================
    // 메시지 저장
    // ============================================
    
    // 메시지 저장 (대화방 ID, 순차 번호 자동 생성)
    // 반환값: 저장된 msg_seq (실패 시 -1)
    static int64 SaveMessage(const string& convId, const string& senderId, 
                             const string& receiverId, const Protocol::S_Chat& sChat);
    
    // 다음 메시지 순차 번호 가져오기
    static int64 GetNextMessageSeq(const string& convId);
    
    // ============================================
    // 메시지 조회
    // ============================================
    
    // 오프라인 메시지 조회 (읽지 않은 메시지)
    static vector<MessageInfo> GetUnreadMessages(const string& userId, const string& convId, int64 lastReadSeq);
    
    // 사용자의 모든 대화방 목록 조회
    static vector<string> GetUserConversations(const string& userId);
    
    // ============================================
    // 메시지 상태 업데이트
    // ============================================
    
    // 메시지 전송 완료 처리
    static bool MarkMessageAsDelivered(const string& convId, int64 msgSeq, const string& receiverId);
    
    // 메시지 삭제 (전송 완료 후)
    static bool DeleteMessage(const string& convId, int64 msgSeq);
    
    // ============================================
    // 읽음 상태 관리
    // ============================================
    
    // 마지막 읽은 메시지 번호 조회
    static int64 GetLastReadSeq(const string& userId, const string& convId);
    
    // 읽음 상태 업데이트
    static bool UpdateReadStatus(const string& userId, const string& convId, int64 msgSeq);
    
    // 읽은 메시지를 txt 파일로 아카이브하고 DB에서 삭제
    static bool ArchiveReadMessages(const string& convId, const string& userId, int64 lastReadSeq);
    
    // 메시지를 메모장에 즉시 추가 (간단한 방식)
    static bool AppendMessageToLog(const string& convId, const string& senderId, 
                                    const Protocol::S_Chat& sChat);
    
    // ============================================
    // Protobuf 직렬화/역직렬화
    // ============================================
    
    // 메시지 직렬화/역직렬화 (Hex 인코딩으로 TEXT 컬럼에 안전하게 저장)
    static string SerializeMessage(const Protocol::S_Chat& sChat);
    static bool DeserializeMessage(const string& data, Protocol::S_Chat& sChat);

private:
    // 바이너리 <-> Hex 문자열 변환 유틸
    static string ToHex(const string& input);
    static string FromHex(const string& hex);
};

