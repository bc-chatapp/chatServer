#pragma once

#include "pch.h"

struct cFcmTokenInfo {
    string userId;
    string fcmToken;
    string platform;    // "android" or "ios"
    string deviceId;
    int64 createdAt = 0;
    int64 updatedAt = 0;
};

class FcmTokenRepository {
public:
    // FCM 토큰 저장/업데이트 (이미 존재하면 업데이트)
    static bool UpsertFcmToken(const string& userId, const string& fcmToken,
                               const string& platform, const string& deviceId = "");

    // 특정 사용자의 모든 FCM 토큰 조회
    static vector<cFcmTokenInfo> GetUserTokens(const string& userId);

    // 특정 사용자의 특정 디바이스 토큰 조회
    static bool GetTokenByDevice(const string& userId, const string& deviceId, cFcmTokenInfo& OUT tokenInfo);


    static bool DeleteToken(const string& userId, const string& fcmToken);
    static bool DeleteAllUserTokens(const string& userId);


    static bool TokenExists(const string& fcmToken);


};
