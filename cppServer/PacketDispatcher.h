#pragma once

#include "protocol.pb.h"
#include "Session.h"
#include "SendBuffer.h"

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

    // 에러 전송 (기존 방식 - 하위 호환성)
    static void DispatchError(sessionPtr& session, uint64 reqId, const string& errMessage);
    
    // 에러 전송 (ErrorCode 사용 - 권장)
    static void DispatchError(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
    
    // 오프라인 정보 푸시
    static void PushOfflineData(sessionPtr& session, const string& userId);


protected:
    static bool Dispatch_C_SignUp(sessionPtr& session, uint64 reqId, const Protocol::C_SignUp& pkt);
    static bool Dispatch_C_Login(sessionPtr& session, uint64 reqId, const Protocol::C_Login& pkt);
    static bool Dispatch_C_Chat(sessionPtr& session, uint64 reqId, const Protocol::C_Chat& pkt);
    static bool Dispatch_C_Ack(sessionPtr& session, uint64 reqId, const Protocol::C_Ack& pkt);

    //static bool Dispatch_C_Heartbeat(sessionPtr& session, uint64 reqId, const Protocol::C_Heartbeat& pkt);

    // File Upload Handler
    static bool Dispatch_C_UploadFile(sessionPtr& session, uint64 reqId, const Protocol::C_UploadFile& pkt);


    // Friend Request Handlers ()
    static bool Dispatch_C_FriendRequest_Find(sessionPtr& session, uint64 reqId, const Protocol::C_FriendRequest_Find& pkt);
    static bool Dispatch_C_FriendRequest_Add(sessionPtr& session, uint64 reqId, const Protocol::C_FriendRequest_Add& pkt);
    static bool Dispatch_C_FriendRequest_Cancel(sessionPtr& session, uint64 reqId, const Protocol::C_FriendRequest_Cancel& pkt);
    static bool Dispatch_C_FriendRequest_List(sessionPtr& session, uint64 reqId, const Protocol::C_FriendRequest_List& pkt);
    static bool Dispatch_C_FriendRequest_Respond(sessionPtr& session, uint64 reqId, const Protocol::C_FriendRequest_Respond& pkt);
    static bool Dispatch_C_FriendRequest_Remove(sessionPtr& session, uint64 reqId, const Protocol::C_FriendRequest_Remove& pkt);
    static bool Dispatch_C_FriendList(sessionPtr& session, uint64 reqId, const Protocol::C_FriendList& pkt);

    // Group Handlers
    static bool Dispatch_C_CreateGroup(sessionPtr& session, uint64 reqId, const Protocol::C_CreateGroup& pkt);
    static bool Dispatch_C_GroupList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupList& pkt);
    static bool Dispatch_C_GroupJoinRequest(sessionPtr& session, uint64 reqId, const Protocol::C_GroupJoinRequest& pkt);
    static bool Dispatch_C_GroupJoinResponse(sessionPtr& session, uint64 reqId, const Protocol::C_GroupJoinResponse& pkt);
    static bool Dispatch_C_GroupJoinRequestList(sessionPtr& session, uint64 reqId, const Protocol::C_GroupJoinRequestList& pkt);
    
public:

};






/* 추가 내요 */