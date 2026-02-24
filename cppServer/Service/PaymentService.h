#pragma once

#include "pch.h"
#include "protocol.pb.h"
#include "Session.h"

#define CPPHTTPLIB_OPENSSL_SUPPORT
#include "httplib.h"

using sessionPtr = shared_ptr<Session>;

class UserManager;

class PaymentService
{
public:
    PaymentService(UserManager& userManager);
    ~PaymentService() = default;

    bool Initialize(const string& credentialsPath);

    bool HandleVerifyPurchase(sessionPtr& session, uint64 reqId, const Protocol::C_VerifyPurchase& pkt);
    bool HandleCancelSubscription(sessionPtr& session, uint64 reqId);

private:
    bool VerifyGooglePurchase(const string& userId, const string& productId,
                               const string& purchaseToken, int& outPlanId,
                               int64& outExpiresAt);

    bool VerifyApplePurchase(const string& userId, const string& productId,
                              const string& receiptData, int& outPlanId,
                              int64& outExpiresAt);

    bool UpdateSubscription(const string& userId, int planId, const string& platform,
                             const string& productId, const string& transactionId,
                             const string& purchaseToken, int64 expiresAt);

    int GetPlanIdFromProductId(const string& productId);

    // OAuth2 (GCP 서비스 계정 재사용)
    bool LoadServiceAccountJson(const string& filePath);
    bool RefreshAccessToken();
    bool CheckValidToken();
    string CreateJWT();
    string SignString(const string& data);
    string Base64Encode(const vector<uint8>& data);

    string LoadAppleSharedSecret();

    inline void HandleErr(const string& func, const string& msg = "") {
        if (msg.empty())
            cerr << "[PaymentService] " << func << " Failed" << endl;
        else
            cerr << "[PaymentService] " << func << " Failed: " << msg << endl;
    }

private:
    UserManager& _userManager;

    // OAuth2
    string _accessToken;
    int64 _tokenExpiresTime = 0;
    string _serviceAccountEmail;
    string _privateKey;

    // HTTP Clients
    unique_ptr<httplib::Client> _googleClient;
    unique_ptr<httplib::Client> _appleClient;
    unique_ptr<httplib::Client> _appleSandboxClient;

    string _packageName;  // Android package name
    string _appleSharedSecret;
};

extern PaymentService* GPaymentService;
