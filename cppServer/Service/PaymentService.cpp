#include "pch.h"
#include "PaymentService.h"
#include "../CoreGlobal.h"
#include "../PacketDispatcher.h"
#include "../ServerSession.h"
#include "../DB/DBManager.h"
#include "../DB/UserRepository.h"

#include <fstream>
#include <sstream>
#include <filesystem>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>

#include "json.hpp"
using json = nlohmann::json;

PaymentService* GPaymentService = nullptr;


PaymentService::PaymentService(UserManager& userManager)
    : _userManager(userManager)
{
    _googleClient = make_unique<httplib::Client>("https://androidpublisher.googleapis.com");
    _googleClient->set_connection_timeout(10, 0);
    _googleClient->set_read_timeout(30, 0);

    _appleClient = make_unique<httplib::Client>("https://buy.itunes.apple.com");
    _appleClient->set_connection_timeout(10, 0);
    _appleClient->set_read_timeout(30, 0);

    _appleSandboxClient = make_unique<httplib::Client>("https://sandbox.itunes.apple.com");
    _appleSandboxClient->set_connection_timeout(10, 0);
    _appleSandboxClient->set_read_timeout(30, 0);
}


bool PaymentService::Initialize(const string& credentialsPath)
{
    try {
        cout << "[PaymentService] Initializing..." << endl;

        if (!LoadServiceAccountJson(credentialsPath)) {
            HandleErr("Initialize", "Failed to load credentials");
            return false;
        }

        if (!RefreshAccessToken()) {
            HandleErr("Initialize", "OAuth2 token refresh failed");
            return false;
        }

        // Android package name 로드
        ::filesystem::path configDir = "config";
        ::filesystem::path packageFile = configDir / "android_package.txt";
        if (::filesystem::exists(packageFile)) {
            ifstream file(packageFile);
            if (file.is_open()) {
                getline(file, _packageName);
                _packageName.erase(0, _packageName.find_first_not_of(" \t\r\n"));
                _packageName.erase(_packageName.find_last_not_of(" \t\r\n") + 1);
                file.close();
            }
        }
        if (_packageName.empty()) {
            _packageName = "com.moachat.app"; // 기본값
        }

        // Apple shared secret 로드
        _appleSharedSecret = LoadAppleSharedSecret();

        cout << "[PaymentService] Initialized: package=" << _packageName << endl;
        return true;
    }
    catch (const exception& e) {
        HandleErr("Initialize", e.what());
        return false;
    }
}


bool PaymentService::HandleVerifyPurchase(sessionPtr& session, uint64 reqId,
                                           const Protocol::C_VerifyPurchase& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();

    const string& platform = pkt.platform();
    const string& productId = pkt.product_id();
    const string& transactionId = pkt.transaction_id();
    const string& purchaseToken = pkt.purchase_token();

    cout << "[PaymentService] VerifyPurchase: user=" << userId
         << " platform=" << platform
         << " product=" << productId
         << " txn=" << transactionId << endl;

    int planId = 0;
    int64 expiresAt = 0;
    bool verified = false;

    if (platform == "android") {
        verified = VerifyGooglePurchase(userId, productId, purchaseToken, planId, expiresAt);
    }
    else if (platform == "ios") {
        verified = VerifyApplePurchase(userId, productId, purchaseToken, planId, expiresAt);
    }
    else {
        PacketDispatcher::DispatchError(session, reqId, Protocol::ERR_PAYMENT_FAILED,
                                         "지원하지 않는 플랫폼입니다.");
        return false;
    }

    if (!verified) {
        PacketDispatcher::DispatchError(session, reqId, Protocol::ERR_RECEIPT_INVALID,
                                         "영수증 검증에 실패했습니다.");
        return false;
    }

    // DB 업데이트
    if (!UpdateSubscription(userId, planId, platform, productId, transactionId, purchaseToken, expiresAt)) {
        PacketDispatcher::DispatchError(session, reqId, Protocol::ERR_SERVER_INTERNAL,
                                         "구독 업데이트에 실패했습니다.");
        return false;
    }

    // 사용자 정보 재조회
    cUserInfo userInfo;
    UserRepository::GetUser(userId, userInfo);

    // 응답
    Protocol::S_VerifyPurchase response;
    response.set_success(true);
    response.set_message("구독이 활성화되었습니다.");
    response.set_new_grade(static_cast<int32>(userInfo.subGrade));
    response.set_expires_at(expiresAt);
    response.set_storage_capacity(userInfo.storageCapacity);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_verify_purchase() = response;
    PacketDispatcher::SendEnvelope(session, env);

    cout << "[PaymentService] VerifyPurchase 성공: user=" << userId
         << " grade=" << userInfo.subGrade << endl;
    return true;
}


bool PaymentService::VerifyGooglePurchase(const string& userId, const string& productId,
                                            const string& purchaseToken, int& outPlanId,
                                            int64& outExpiresAt)
{
    if (!CheckValidToken()) {
        HandleErr("VerifyGooglePurchase", "Token validation failed");
        return false;
    }

    try {
        // Google Play Developer API v3 - subscriptions v2
        string url = "/androidpublisher/v3/applications/" + _packageName +
                     "/purchases/subscriptionsv2/tokens/" + purchaseToken;

        httplib::Headers headers = {
            {"Authorization", "Bearer " + _accessToken},
            {"Content-Type", "application/json"}
        };

        auto res = _googleClient->Get(url.c_str(), headers);

        if (!res) {
            HandleErr("VerifyGooglePurchase", "HTTP request failed");
            return false;
        }

        if (res->status != 200) {
            HandleErr("VerifyGooglePurchase", "HTTP " + to_string(res->status) + ": " + res->body);
            return false;
        }

        json response = json::parse(res->body);

        // subscriptionState 확인
        string state = response.value("subscriptionState", "");
        if (state != "SUBSCRIPTION_STATE_ACTIVE" && state != "SUBSCRIPTION_STATE_IN_GRACE_PERIOD") {
            HandleErr("VerifyGooglePurchase", "Invalid subscription state: " + state);
            return false;
        }

        // lineItems에서 expiryTime 추출
        if (response.contains("lineItems") && response["lineItems"].is_array() &&
            !response["lineItems"].empty()) {
            auto& lineItem = response["lineItems"][0];
            if (lineItem.contains("expiryTime")) {
                string expiryTimeStr = lineItem["expiryTime"].get<string>();
                // ISO 8601 → Unix timestamp ms (간단 파싱)
                // 형식: "2026-03-16T18:00:00.000Z"
                struct tm tm = {};
                sscanf(expiryTimeStr.c_str(), "%d-%d-%dT%d:%d:%d",
                       &tm.tm_year, &tm.tm_mon, &tm.tm_mday,
                       &tm.tm_hour, &tm.tm_min, &tm.tm_sec);
                tm.tm_year -= 1900;
                tm.tm_mon -= 1;
                time_t t = _mkgmtime(&tm);
                outExpiresAt = static_cast<int64>(t) * 1000;
            }
        }

        outPlanId = GetPlanIdFromProductId(productId);

        cout << "[PaymentService] Google 검증 성공: product=" << productId
             << " expires=" << outExpiresAt << endl;
        return true;
    }
    catch (const exception& e) {
        HandleErr("VerifyGooglePurchase", e.what());
        return false;
    }
}


bool PaymentService::VerifyApplePurchase(const string& userId, const string& productId,
                                           const string& receiptData, int& outPlanId,
                                           int64& outExpiresAt)
{
    try {
        json requestBody = {
            {"receipt-data", receiptData},
            {"password", _appleSharedSecret},
            {"exclude-old-transactions", true}
        };

        string jsonStr = requestBody.dump();

        // 먼저 production 서버에 요청
        auto res = _appleClient->Post("/verifyReceipt", jsonStr, "application/json");

        if (!res) {
            HandleErr("VerifyApplePurchase", "HTTP request failed");
            return false;
        }

        json response = json::parse(res->body);
        int status = response.value("status", -1);

        // status 21007 → sandbox 영수증이므로 sandbox 서버로 재요청
        if (status == 21007) {
            res = _appleSandboxClient->Post("/verifyReceipt", jsonStr, "application/json");
            if (!res) {
                HandleErr("VerifyApplePurchase", "Sandbox HTTP request failed");
                return false;
            }
            response = json::parse(res->body);
            status = response.value("status", -1);
        }

        if (status != 0) {
            HandleErr("VerifyApplePurchase", "Invalid status: " + to_string(status));
            return false;
        }

        // latest_receipt_info에서 만료일 추출
        if (response.contains("latest_receipt_info") &&
            response["latest_receipt_info"].is_array() &&
            !response["latest_receipt_info"].empty()) {

            auto& latestReceipt = response["latest_receipt_info"].back();
            if (latestReceipt.contains("expires_date_ms")) {
                string expiresMs = latestReceipt["expires_date_ms"].get<string>();
                outExpiresAt = stoll(expiresMs);
            }
        }

        outPlanId = GetPlanIdFromProductId(productId);

        cout << "[PaymentService] Apple 검증 성공: product=" << productId
             << " expires=" << outExpiresAt << endl;
        return true;
    }
    catch (const exception& e) {
        HandleErr("VerifyApplePurchase", e.what());
        return false;
    }
}


bool PaymentService::UpdateSubscription(const string& userId, int planId,
                                          const string& platform, const string& productId,
                                          const string& transactionId,
                                          const string& purchaseToken, int64 expiresAt)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();

        // 1) payment_transactions INSERT
        // insert().values()에서는 mysqlx::expr() 사용 불가 → 현재 시간 문자열 생성
        time_t now = ::time(nullptr);
        struct tm tmNow = {};
        localtime_s(&tmNow, &now);
        char nowStr[32];
        strftime(nowStr, sizeof(nowStr), "%Y-%m-%d %H:%M:%S", &tmNow);

        auto txnTable = schema.getTable("payment_transactions");
        txnTable.insert("user_id", "plan_id", "platform", "product_id",
                         "transaction_id", "purchase_token", "status", "verified_at")
            .values(userId, planId, platform, productId,
                    transactionId, purchaseToken, "verified",
                    string(nowStr))
            .execute();

        // 2) subscription_plans에서 등급/용량 조회
        auto planTable = schema.getTable("subscription_plans");
        auto planResult = planTable.select("grade", "storage_bytes")
            .where("plan_id = :pid")
            .bind("pid", planId)
            .execute();

        auto planRow = planResult.fetchOne();
        if (!planRow) {
            HandleErr("UpdateSubscription", "Plan not found: " + to_string(planId));
            return false;
        }

        int grade = planRow[0].get<int>();
        int64 storageBytes = planRow[1].get<int64>();

        // 3) subscriptions UPSERT
        // 기존 active 구독 확인
        auto subsTable = schema.getTable("subscriptions");
        auto existResult = subsTable.select("id")
            .where("user_id = :uid AND status = 'active'")
            .limit(1)
            .bind("uid", userId)
            .execute();

        auto existRow = existResult.fetchOne();
        if (existRow) {
            // UPDATE
            int existId = existRow[0].get<int>();

            // expires_at을 타임스탬프 문자열로 변환
            time_t expSecUpd = static_cast<time_t>(expiresAt / 1000);
            struct tm tmExpUpd = {};
            gmtime_s(&tmExpUpd, &expSecUpd);
            char expStrUpd[32];
            strftime(expStrUpd, sizeof(expStrUpd), "%Y-%m-%d %H:%M:%S", &tmExpUpd);

            subsTable.update()
                .set("plan_id", planId)
                .set("expires_at", string(expStrUpd))
                .set("status", "active")
                .set("auto_renew", 1)
                .where("id = :id")
                .bind("id", existId)
                .execute();
        }
        else {
            // INSERT — expires_at을 타임스탬프 문자열로 변환
            time_t expSec = static_cast<time_t>(expiresAt / 1000);
            struct tm tmExp = {};
            gmtime_s(&tmExp, &expSec);
            char expStr[32];
            strftime(expStr, sizeof(expStr), "%Y-%m-%d %H:%M:%S", &tmExp);

            subsTable.insert("user_id", "plan_id", "expires_at", "auto_renew", "status")
                .values(userId, planId, string(expStr), 1, "active")
                .execute();
        }

        // 4) users 테이블 업데이트 (sub_grade, storage_capacity_bytes)
        auto usersTable = schema.getTable("users");
        usersTable.update()
            .set("sub_grade", grade)
            .set("storage_capacity_bytes", storageBytes)
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        cout << "[PaymentService] DB 업데이트 완료: user=" << userId
             << " grade=" << grade << " storage=" << storageBytes << endl;
        return true;
    }
    catch (const exception& e) {
        HandleErr("UpdateSubscription", e.what());
        return false;
    }
}


int PaymentService::GetPlanIdFromProductId(const string& productId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();

        // product_id → plan_id 매핑 (subscription_plans 테이블에 product_id 컬럼이 없으므로 하드코딩)
        if (productId == "moa_pro_monthly") return 2;        // Pro
        if (productId == "moa_premium_monthly") return 3;    // Premium

        HandleErr("GetPlanIdFromProductId", "Unknown product: " + productId);
        return 1; // 무료 플랜 기본값
    }
    catch (...) {
        return 1;
    }
}


// ===== OAuth2 (FcmClient와 동일한 로직) =====

bool PaymentService::LoadServiceAccountJson(const string& filePath)
{
    try {
        ifstream file(filePath);
        if (!file.is_open()) {
            HandleErr("LoadServiceAccountJson", "File open failed: " + filePath);
            return false;
        }

        json j;
        file >> j;
        file.close();

        if (j.contains("client_email")) {
            _serviceAccountEmail = j["client_email"].get<string>();
        } else {
            HandleErr("LoadServiceAccountJson", "client_email not found");
            return false;
        }

        if (j.contains("private_key")) {
            _privateKey = j["private_key"].get<string>();
            size_t pos = 0;
            while ((pos = _privateKey.find("\\n", pos)) != string::npos) {
                _privateKey.replace(pos, 2, "\n");
                pos += 1;
            }
        } else {
            HandleErr("LoadServiceAccountJson", "private_key not found");
            return false;
        }

        return true;
    }
    catch (const exception& e) {
        HandleErr("LoadServiceAccountJson", e.what());
        return false;
    }
}


bool PaymentService::RefreshAccessToken()
{
    try {
        string jwt = CreateJWT();
        if (jwt.empty()) {
            HandleErr("RefreshAccessToken", "JWT creation failed");
            return false;
        }

        httplib::Client oauthClient("https://oauth2.googleapis.com");
        httplib::Params params = {
            {"grant_type", "urn:ietf:params:oauth:grant-type:jwt-bearer"},
            {"assertion", jwt}
        };

        auto res = oauthClient.Post("/token", params);

        if (!res || res->status != 200) {
            HandleErr("RefreshAccessToken", res ? to_string(res->status) : "HTTP request failed");
            return false;
        }

        json response = json::parse(res->body);

        if (response.contains("access_token")) {
            _accessToken = response["access_token"].get<string>();
            int64 expiresIn = response.value("expires_in", (int64)3600);
            _tokenExpiresTime = Nowts() + (expiresIn * 1000);
            return true;
        }

        HandleErr("RefreshAccessToken", "access_token not found");
        return false;
    }
    catch (const exception& e) {
        HandleErr("RefreshAccessToken", e.what());
        return false;
    }
}


bool PaymentService::CheckValidToken()
{
    if (_accessToken.empty() || Nowts() >= _tokenExpiresTime) {
        return RefreshAccessToken();
    }
    return true;
}


string PaymentService::CreateJWT()
{
    json header = { {"alg", "RS256"}, {"typ", "JWT"} };

    int64 now = Nowts() / 1000;

    json payload = {
        {"iss", _serviceAccountEmail},
        {"scope", "https://www.googleapis.com/auth/androidpublisher"},
        {"aud", "https://oauth2.googleapis.com/token"},
        {"exp", now + 3600},
        {"iat", now}
    };

    string headerStr = header.dump();
    string payloadStr = payload.dump();

    vector<uint8> headerBytes(headerStr.begin(), headerStr.end());
    vector<uint8> payloadBytes(payloadStr.begin(), payloadStr.end());

    string encodedHeader = Base64Encode(headerBytes);
    string encodedPayload = Base64Encode(payloadBytes);

    replace(encodedHeader.begin(), encodedHeader.end(), '+', '-');
    replace(encodedHeader.begin(), encodedHeader.end(), '/', '_');
    replace(encodedPayload.begin(), encodedPayload.end(), '+', '-');
    replace(encodedPayload.begin(), encodedPayload.end(), '/', '_');

    encodedHeader.erase(remove(encodedHeader.begin(), encodedHeader.end(), '='), encodedHeader.end());
    encodedPayload.erase(remove(encodedPayload.begin(), encodedPayload.end(), '='), encodedPayload.end());

    string toSign = encodedHeader + "." + encodedPayload;

    string signature = SignString(toSign);
    if (signature.empty()) return "";

    replace(signature.begin(), signature.end(), '+', '-');
    replace(signature.begin(), signature.end(), '/', '_');
    signature.erase(remove(signature.begin(), signature.end(), '='), signature.end());

    return toSign + "." + signature;
}


string PaymentService::SignString(const string& data)
{
    BIO* bio = BIO_new_mem_buf(_privateKey.c_str(), static_cast<int>(_privateKey.length()));
    EVP_PKEY* pkey = PEM_read_bio_PrivateKey(bio, nullptr, nullptr, nullptr);
    BIO_free(bio);

    if (!pkey) {
        HandleErr("SignString", "Failed to load private key");
        return "";
    }

    EVP_MD_CTX* mdctx = EVP_MD_CTX_new();
    EVP_DigestSignInit(mdctx, nullptr, EVP_sha256(), nullptr, pkey);
    EVP_DigestSignUpdate(mdctx, data.c_str(), data.length());

    size_t sigLen = 0;
    EVP_DigestSignFinal(mdctx, nullptr, &sigLen);

    vector<uint8> sig(sigLen);
    EVP_DigestSignFinal(mdctx, sig.data(), &sigLen);

    EVP_MD_CTX_free(mdctx);
    EVP_PKEY_free(pkey);

    return Base64Encode(sig);
}


string PaymentService::Base64Encode(const vector<uint8>& data)
{
    BIO* bio = BIO_new(BIO_s_mem());
    BIO* b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);

    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL);
    BIO_write(bio, data.data(), static_cast<int>(data.size()));
    BIO_flush(bio);

    BUF_MEM* bufferPtr;
    BIO_get_mem_ptr(bio, &bufferPtr);

    string result(bufferPtr->data, bufferPtr->length);
    BIO_free_all(bio);

    return result;
}


string PaymentService::LoadAppleSharedSecret()
{
    try {
        ::filesystem::path secretFile = ::filesystem::path("config") / "apple_iap_secret.txt";
        if (!::filesystem::exists(secretFile)) {
            cout << "[PaymentService] Apple shared secret file not found (iOS IAP will not work)" << endl;
            return "";
        }

        ifstream file(secretFile);
        if (!file.is_open()) return "";

        string secret;
        getline(file, secret);
        secret.erase(0, secret.find_first_not_of(" \t\r\n"));
        secret.erase(secret.find_last_not_of(" \t\r\n") + 1);
        file.close();

        cout << "[PaymentService] Apple shared secret loaded" << endl;
        return secret;
    }
    catch (...) {
        return "";
    }
}
