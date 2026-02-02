#include "pch.h"
#include "NotificationService.h"
#include "../ServerSession.h"
#include "../PacketDispatcher.h"
#include "../DB/FcmTokenRepository.h"
#include "../CoreGlobal.h"

#include <iostream>

using namespace Protocol;


bool NotificationService::RegisterFcmToken(sessionPtr& session, uint64 reqId, const Protocol::C_RegisterFcmToken& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();

    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    const string& fcmToken = pkt.fcm_token();
    const string& platform = pkt.platform();
    const string& deviceId = pkt.device_id();

    // 유효성 검사
    if (fcmToken.empty()) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "FCM token is empty");
        return false;
    }

    cout << "[NotificationService] FCM 토큰 등록 요청: userId=" << userId
         << ", platform=" << platform
         << ", token=" << fcmToken.substr(0, 30) << "..." << endl;

    // DB에 토큰 저장
    bool success = FcmTokenRepository::UpsertFcmToken(userId, fcmToken, platform, deviceId);

    // 응답 생성
    Protocol::S_RegisterFcmToken response;
    response.set_success(success);

    if (success) {
        response.set_message("FCM token registered successfully");
        cout << "[NotificationService] FCM 토큰 등록 성공: " << userId << endl;
    }
    else {
        response.set_message("Failed to register FCM token");
        cerr << "[NotificationService] FCM 토큰 등록 실패: " << userId << endl;
    }

    // Envelope로 감싸서 전송
    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_register_fcm_token() = response;

    PacketDispatcher::SendEnvelope(session, env);

    return success;
}


bool NotificationService::UnregisterFcmToken(sessionPtr& session, uint64 reqId, const string& fcmToken)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();

    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    if (fcmToken.empty()) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "FCM token is empty");
        return false;
    }

    cout << "[NotificationService] FCM 토큰 삭제 요청: userId=" << userId << endl;

    bool success = FcmTokenRepository::DeleteToken(userId, fcmToken);

    return success;
}


void NotificationService::HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage)
{
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
