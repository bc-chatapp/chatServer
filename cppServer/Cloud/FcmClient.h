#pragma once

#include "pch.h"

#define CPPHTTPLIB_OPENSSL_SUPPORT
#include "httplib.h"

// FCM HTTP v1 API 클라이언트
class FcmClient
{
public:
    FcmClient(const string& projectId, const string& credentialsPath);
    ~FcmClient() = default;

    bool Initialize();

    // 단일 디바이스에 푸시 발송
    // outInvalidToken: 토큰이 만료/미등록(UNREGISTERED)이면 true로 설정됨
    bool SendPush(const string& fcmToken, const string& title, const string& body,
                  const map<string, string>& data = {}, bool* outInvalidToken = nullptr);

    // 여러 디바이스에 푸시 발송
    bool SendPushToMultiple(const vector<string>& fcmTokens, const string& title,
                            const string& body, const map<string, string>& data = {});

private:
    bool LoadServiceAccountJson(const string& filePath);
    bool RefreshAccessToken();
    bool CheckValidToken();

    string CreateJWT();
    string SignString(const string& data);
    string Base64Encode(const vector<uint8>& data);

    inline void HandleErr(const string& func, const string& msg = "") {
        if (msg.empty())
            cerr << "[FcmClient] " << func << " Failed" << endl;
        else
            cerr << "[FcmClient] " << func << " Failed: " << msg << endl;
    }

private:
    string _projectId;
    string _credentialsPath;

    // OAuth
    string _accessToken;
    int64 _tokenExpiresTime = 0;

    // Service Account Info
    string _serviceAccountEmail;
    string _privateKey;

    // HTTP Client
    unique_ptr<httplib::Client> _httpClient;
};

extern FcmClient* GFcmClient;
