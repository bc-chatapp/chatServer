#pragma once

#include "pch.h"
#include "../protocol.pb.h"
#include "DBManager.h"

struct MessageInfo {
    int64 id;
    string convId;

    int64 msgSeq;

    string senderId;
    string senderName;

    string messageData;  // Protobuf 직렬화된 데이터

    int64 clientMsgId;
    int64 serverMsgId;
    int64 timestamp;

    bool isDelivered;
    int64 deliveredAt;
};

class MessageRepository 
{
public:

    static string CreateConversationId(const string& user1, const string& user2);
    static string CreateOrGetConversation(const string& convId, const string& convType,
                                          const string& participant1 = "", const string& participant2 = "");
   
    static bool AddParticipant(const string& convId, const string& userId);
    static bool AddParticipants(const string& convId, const vector<string>& userIds);

    /* 저장 */ //저장된 msg_seq (실패 시 -1)
    static int64 SaveMessage(const string& convId, const string& senderId, const Protocol::S_Chat& sChat);
    

    /* 조회 */
    static int64 GetNextMessageSeq(const string& convId);

    static vector<string> GetUserConversations(const string& userId);
    static void ParseChatPacket(Protocol::S_Chat& sChat, const mysqlx::Row& row);
    static vector<MessageInfo> GetRecentMessages(const string& convId, int limit);
    static vector<MessageInfo> GetMessagesAfter(const string& convId, int64_t timestamp, int limit);
    static vector<MessageInfo> GetHistoryMessages(string convId, int64 lastMsgSeq, int limit);


    // 메시지 삭제 (물리적 삭제)
    static bool DeleteMessage(const string& convId, int64 msgSeq);

    // 메시지 소프트 삭제 (is_deleted = 1, 내용 변경)
    static bool SoftDeleteMessage(const string& convId, int64 msgSeq, const string& senderId);

    // 메시지 수정
    static bool EditMessage(const string& convId, int64 msgSeq, const string& senderId, const string& newText, int64 editedAt);

    // 특정 seq의 메시지 조회 (답장 원본 조회용)
    struct ReplyInfo {
        string senderName;
        string text;
        bool found = false;
    };
    static ReplyInfo GetMessageBySeq(const string& convId, int64 msgSeq);

    // 메시지 발신자 확인
    static string GetMessageSenderId(const string& convId, int64 msgSeq);


    /* 읽음 상태 */
    static int64 GetLastReadSeq(const string& userId, const string& convId);
    static bool UpdateReadStatus(const string& userId, const string& convId, int64 msgSeq);
    static int GetUnreadCount(const string& userId, const string& convId);

    // 특정 메시지의 읽지 않은 참여자 수 (참여자 수 - 읽은 사람 수)
    static int GetMsgUnreadCount(const string& convId, int64 msgSeq);

protected:
    // 메시지를 메모장에 즉시 추가
    static bool AppendMessageToLog(const string& convId, const string& senderId,
        const Protocol::S_Chat& sChat);


};

