#pragma once

#include "pch.h"
#include "../protocol.pb.h"

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
    static int64 GetNextMessageSeq(const string& convId);
    

    /* 조회 */
    static int GetUnreadCount(const string& userId, const string& convId);
    static vector<string> GetUserConversations(const string& userId);
    static vector<MessageInfo> GetRecentMessages(const string& convId, int limit);
    static vector<MessageInfo> GetHistoryMessages(string convId, int64 lastMsgSeq, int limit);

        

    // 메시지 삭제 (전송 완료 후)
    static bool DeleteMessage(const string& convId, int64 msgSeq);
    
    
    /* 읽음 상태 */
    static int64 GetLastReadSeq(const string& userId, const string& convId);
    static bool UpdateReadStatus(const string& userId, const string& convId, int64 msgSeq);
    



    // 메시지를 메모장에 즉시 추가
    static bool AppendMessageToLog(const string& convId, const string& senderId,
        const Protocol::S_Chat& sChat);

    // 읽은 메시지를 txt 파일로 아카이브하고 DB에서 삭제
    //static bool ArchiveReadMessages(const string& convId, const string& userId, int64 lastReadSeq);

    static string SerializeMessage(const Protocol::S_Chat& sChat);
    static bool DeserializeMessage(const string& data, Protocol::S_Chat& sChat);

private:
    // Util
    static string ToHex(const string& input);
    static string FromHex(const string& hex);

    
};

