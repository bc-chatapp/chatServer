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


    // 메시지 삭제 (전송 완료 후)
    static bool DeleteMessage(const string& convId, int64 msgSeq);
    
    
    /* 읽음 상태 */
    static int64 GetLastReadSeq(const string& userId, const string& convId);
    static bool UpdateReadStatus(const string& userId, const string& convId, int64 msgSeq);
    static int GetUnreadCount(const string& userId, const string& convId);

protected:
    // 메시지를 메모장에 즉시 추가
    static bool AppendMessageToLog(const string& convId, const string& senderId,
        const Protocol::S_Chat& sChat);


};

