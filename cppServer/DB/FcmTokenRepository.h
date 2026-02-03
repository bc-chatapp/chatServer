#pragma once

#include "pch.h"

struct cFcmTokenInfo {
    string userId;
    string fcmToken;
    string platform;      // "android" or "ios"
    string deviceId;
    string deviceName;    // 기기 이름 (예: "Galaxy S24")
    string appVersion;    // 앱 버전
    int64 createdAt = 0;
    int64 lastActive = 0; // 마지막 활동 시간
};

class FcmTokenRepository {
public:
    // FCM 토큰 저장/업데이트 (이미 존재하면 업데이트)
    static bool UpsertFcmToken(const string& userId, const string& fcmToken,
                               const string& platform, const string& deviceId = "",
                               const string& deviceName = "", const string& appVersion = "");

    // 특정 사용자의 모든 FCM 토큰 조회
    static vector<cFcmTokenInfo> GetUserTokens(const string& userId);

    // 특정 사용자의 특정 디바이스 토큰 조회
    static bool GetTokenByDevice(const string& userId, const string& deviceId, cFcmTokenInfo& OUT tokenInfo);

    // 토큰 삭제
    static bool DeleteToken(const string& userId, const string& fcmToken);
    static bool DeleteTokenByDeviceId(const string& userId, const string& deviceId);
    static bool DeleteAllUserTokens(const string& userId);

    // 마지막 활동 시간 업데이트
    static bool UpdateLastActive(const string& userId, const string& deviceId);

    static bool TokenExists(const string& fcmToken);
};
