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
    const string& deviceName = pkt.device_name();
    const string& appVersion = pkt.app_version();

    // 유효성 검사
    if (fcmToken.empty()) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "FCM token is empty");
        return false;
    }

    cout << "[NotificationService] FCM 토큰 등록 요청: userId=" << userId
         << ", platform=" << platform
         << ", device=" << deviceName
         << ", token=" << fcmToken.substr(0, 30) << "..." << endl;

    // DB에 토큰 저장
    bool success = FcmTokenRepository::UpsertFcmToken(userId, fcmToken, platform, deviceId, deviceName, appVersion);

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


bool NotificationService::GetMyDevices(sessionPtr& session, uint64 reqId, const string& currentDeviceId)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();

    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    cout << "[NotificationService] 기기 목록 조회: userId=" << userId << endl;

    // 사용자의 모든 기기 조회
    auto tokens = FcmTokenRepository::GetUserTokens(userId);

    Protocol::S_GetMyDevices response;

    for (const auto& token : tokens) {
        auto* device = response.add_devices();
        device->set_device_id(token.deviceId);
        device->set_device_name(token.deviceName.empty() ? "Unknown Device" : token.deviceName);
        device->set_platform(token.platform);
        device->set_last_active(token.lastActive);
        device->set_registered_at(token.createdAt);
        device->set_app_version(token.appVersion);
        device->set_is_current(token.deviceId == currentDeviceId);
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_get_my_devices() = response;

    PacketDispatcher::SendEnvelope(session, env);

    cout << "[NotificationService] 기기 목록 응답: " << tokens.size() << "개" << endl;
    return true;
}


bool NotificationService::RemoveDevice(sessionPtr& session, uint64 reqId, const string& deviceId)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();

    if (userId.empty()) {
        HandleErr(session, reqId, ERR_UNAUTHORIZED);
        return false;
    }

    if (deviceId.empty()) {
        HandleErr(session, reqId, ERR_INVALID_PACKET, "Device ID is empty");
        return false;
    }

    cout << "[NotificationService] 기기 삭제 요청: userId=" << userId << ", deviceId=" << deviceId << endl;

    bool success = FcmTokenRepository::DeleteTokenByDeviceId(userId, deviceId);

    Protocol::S_RemoveDevice response;
    response.set_success(success);
    response.set_message(success ? "기기가 삭제되었습니다." : "기기 삭제에 실패했습니다.");

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_remove_device() = response;

    PacketDispatcher::SendEnvelope(session, env);

    return success;
}


void NotificationService::HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage)
{
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
