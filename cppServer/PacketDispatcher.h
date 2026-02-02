#pragma once

#include "protocol.pb.h"
#include "Session.h"
#include "SendBuffer.h"

#include "CoreGlobal.h"

using sessionPtr = shared_ptr<Session>;
class ServerSession;


enum : uint16
{
    PKT_C_LOGIN = 1000,
    PKT_S_LOGIN = 1001,
    PKT_C_JOIN_DIRECT = 1002,
    PKT_C_JOIN_GROUP = 1003,

    PKT_S_ERROR = 1004,
    PKT_C_HEARTBEAT = 1005,
    PKT_S_HEARTBEAT = 1016,

    PKT_C_CHAT = 2000,
    PKT_S_CHAT = 2001,
    PKT_C_FETCH_OFFLINE = 2002,
    PKT_S_MESSAGE_BATCH = 2003,

};


class PacketDispatcher
{
public:
    static void DispatchPacket(sessionPtr& session, Protocol::Envelope& envelope);

    static shared_ptr<SendBuffer> MakeSendBuffer(Protocol::Envelope& envelope);
    static void SendEnvelope(sessionPtr& session, Protocol::Envelope& envelope);

    // 에러 전송 (기존 방식 )
    static void DispatchError(sessionPtr& session, uint64 reqId, const string& errMessage);
    // 에러 전송 (ErrorCode 사용)
    static void DispatchError(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
    
    // 오프라인 정보 푸시
    static void PushOfflineData(sessionPtr& session, uint64 reqId, const string& userId, int64_t since_ts);


protected:
    static bool Dispatch_C_CheckId(sessionPtr& session, uint64 reqId, const Protocol::C_CheckId& pkt);
    static bool Dispatch_C_CheckEmail(sessionPtr& session, uint64 reqId, const Protocol::C_CheckEmail& pkt);
    static bool Dispatch_C_SignUp(sessionPtr& session, uint64 reqId, const Protocol::C_SignUp& pkt);
 
    static bool Dispatch_C_Login(sessionPtr& session, uint64 reqId, const Protocol::Envelope& envelope);
    static bool Dispatch_C_FetchOffline(sessionPtr& session, uint64 reqId, const Protocol::C_FetchOffline& pkt);
    

    static bool Dispatch_C_FetchMyInfo(sessionPtr& session, uint64 reqId, const Protocol::C_FetchMyInfo& pkt);
    static bool Dispatch_C_EditMyInfo(sessionPtr& session, uint64 reqId, const Protocol::C_EditMyInfo& pkt);

    
    
    static bool Dispatch_C_Chat(sessionPtr& session, uint64 reqId, const Protocol::C_Chat& pkt);
    static bool Dispatch_C_Ack(sessionPtr& session, uint64 reqId, const Protocol::C_Ack& pkt);
    static bool Dispatch_C_ReqHistory(sessionPtr& session, uint64 reqId, const Protocol::C_ReqHistory& pkt);

    //static bool Dispatch_C_Heartbeat(sessionPtr& session, uint64 reqId, const Protocol::C_Heartbeat& pkt);

    // File Upload Handler
    static bool Dispatch_C_UploadFile(sessionPtr& session, uint64 reqId, const Protocol::C_UploadFile& pkt);


    // Friend Request Handlers ()
  
    static bool Dispatch_C_SearchUser(sessionPtr& session, uint64 reqId, const Protocol::C_SearchUser& pkt);
    static bool Dispatch_C_FriendAction(sessionPtr& session, uint64 reqId, const Protocol::C_FriendAction& pkt);
    static bool Dispatch_C_FetchFriendData(sessionPtr& session, uint64 reqId, const Protocol::C_FetchFriendData& pkt);

    // Group Handlers
    static bool Dispatch_C_CreateGroup(sessionPtr& session, uint64 reqId, const Protocol::C_CreateGroup& pkt);
    static bool Dispatch_C_GroupList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupList& pkt);
    static bool Dispatch_C_JoinGroup(sessionPtr& session, uint64 reqId, const Protocol::C_JoinGroup& pkt);
    static bool Dispatch_C_LeaveGroup(sessionPtr& session, uint64 reqId, const Protocol::C_LeaveGroup& pkt);
    static bool Dispatch_C_GroupMemberList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupMemberList& pkt);
    static bool Dispatch_C_GroupInfo(sessionPtr& session, uint64 reqId, const Protocol::C_GroupInfo& pkt);
    static bool Dispatch_C_EditGroup(sessionPtr& session, uint64 reqId, const Protocol::C_EditGroup& pkt);

    // FCM Token Handler
    static bool Dispatch_C_RegisterFcmToken(sessionPtr& session, uint64 reqId, const Protocol::C_RegisterFcmToken& pkt);

    // Email Verification Handlers
    static bool Dispatch_C_ReqEmailVerify(sessionPtr& session, uint64 reqId, const Protocol::C_RequestEmailVerify& pkt);
    static bool Dispatch_C_ConfirmEmailVerify(sessionPtr& session, uint64 reqId, const Protocol::C_ConfirmEmailVerify& pkt);

    // Account Management Handlers
    static bool Dispatch_C_ChangeEmail(sessionPtr& session, uint64 reqId, const Protocol::C_ChangeEmail& pkt);
    static bool Dispatch_C_ChangePassword(sessionPtr& session, uint64 reqId, const Protocol::C_ChangePassword& pkt);

    // Withdraw Handler (회원 탈퇴)
    static bool Dispatch_C_Withdraw(sessionPtr& session, uint64 reqId, const Protocol::C_Withdraw& pkt);

private:

    enum class ConvType { Error = 0, Direct = 1, Group = 2 };
    static ConvType ParseConvId(const string& rawConvId, string& outId)
    {
        constexpr const char* pDirect = "direct:";
        constexpr const char* pGroup = "group:";

        if (rawConvId.find(pDirect) == 0) {
            outId = rawConvId.substr(strlen(pDirect));
            return ConvType::Direct;
        }
        else if (rawConvId.find(pGroup) == 0) {
            outId = rawConvId.substr(strlen(pGroup));
            return ConvType::Group;
        }

        return ConvType::Error;
    }
};


