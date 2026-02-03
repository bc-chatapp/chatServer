#pragma once

#include "Session.h"
#include "../protocol.pb.h"
#include "UserManager.h"

using sessionPtr = shared_ptr<Session>;

class NotificationService
{
public:
    explicit NotificationService(UserManager& userManager) : _userManager(userManager) { }
    ~NotificationService() = default;

    // FCM 토큰 등록
    bool RegisterFcmToken(sessionPtr& session, uint64 reqId, const Protocol::C_RegisterFcmToken& pkt);

    // FCM 토큰 삭제 (로그아웃 시 호출)
    bool UnregisterFcmToken(sessionPtr& session, uint64 reqId, const string& fcmToken);

    // 내 기기 목록 조회
    bool GetMyDevices(sessionPtr& session, uint64 reqId, const string& currentDeviceId);

    // 특정 기기 삭제 (원격 로그아웃)
    bool RemoveDevice(sessionPtr& session, uint64 reqId, const string& deviceId);

private:
    UserManager& _userManager;

    // 에러 처리
    void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};
