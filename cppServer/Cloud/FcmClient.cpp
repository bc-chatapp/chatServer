#include "pch.h"
#include "FcmClient.h"
#include "../CoreGlobal.h"

#include <fstream>
#include <sstream>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>

#include "json.hpp"
using json = nlohmann::json;

FcmClient* GFcmClient = nullptr;


FcmClient::FcmClient(const string& projectId, const string& credentialsPath)
    : _projectId(projectId), _credentialsPath(credentialsPath)
{
    _httpClient = make_unique<httplib::Client>("https://fcm.googleapis.com");
    _httpClient->set_connection_timeout(10, 0);
    _httpClient->set_read_timeout(30, 0);
}


bool FcmClient::Initialize()
{
    try {
        LOG_INFO("[FcmClient] Initializing: projectId={}", _projectId);

        if (_projectId.empty()) {
            HandleErr("Initialize", "projectId is empty");
            return false;
        }

        if (!_credentialsPath.empty()) {
            if (!LoadServiceAccountJson(_credentialsPath)) {
                HandleErr("Initialize", "Failed to load credentials");
                return false;
            }
        }
        else {
            HandleErr("Initialize", "credentialsPath is empty");
            return false;
        }

        if (!RefreshAccessToken()) {
            HandleErr("Initialize", "OAuth2 token refresh failed");
            return false;
        }

        LOG_INFO("[FcmClient] Initialized successfully");
        return true;
    }
    catch (const exception& e) {
        HandleErr("Initialize", e.what());
        return false;
    }
}


bool FcmClient::SendPush(const string& fcmToken, const string& title, const string& body,
                         const map<string, string>& data, bool* outInvalidToken)
{
    if (!CheckValidToken()) {
        HandleErr("SendPush", "Token validation failed");
        return false;
    }

    try {
        // FCM HTTP v1 API 엔드포인트
        string url = "/v1/projects/" + _projectId + "/messages:send";

        // 메시지 JSON 구성
        json message = {
            {"message", {
                {"token", fcmToken},
                {"notification", {
                    {"title", title},
                    {"body", body}
                }},
                {"android", {
                    {"priority", "high"},
                    {"notification", {
                        {"sound", "default"},
                        {"click_action", "FLUTTER_NOTIFICATION_CLICK"}
                    }}
                }},
                {"apns", {
                    {"payload", {
                        {"aps", {
                            {"sound", "default"},
                            {"badge", 1}
                        }}
                    }}
                }}
            }}
        };

        // 커스텀 데이터 추가
        if (!data.empty()) {
            json dataJson;
            for (const auto& [key, value] : data) {
                dataJson[key] = value;
            }
            message["message"]["data"] = dataJson;
        }

        string jsonBody = message.dump();

        httplib::Headers headers = {
            {"Authorization", "Bearer " + _accessToken},
            {"Content-Type", "application/json"}
        };

        auto res = _httpClient->Post(url.c_str(), headers, jsonBody, "application/json");

        if (!res) {
            HandleErr("SendPush", "HTTP request failed");
            return false;
        }

        if (res->status == 200) {
            LOG_INFO("[FcmClient] Push sent successfully to: {}...", fcmToken.substr(0, 20));
            return true;
        }
        else {
            HandleErr("SendPush", "HTTP " + to_string(res->status) + ": " + res->body);

            // UNREGISTERED 토큰 감지 (404 응답의 errorCode 파싱)
            if (outInvalidToken) {
                try {
                    json errJson = json::parse(res->body);
                    if (errJson.contains("error")) {
                        auto& errObj = errJson["error"];
                        if (errObj.contains("details")) {
                            for (auto& detail : errObj["details"]) {
                                if (detail.contains("errorCode") &&
                                    detail["errorCode"].get<string>() == "UNREGISTERED") {
                                    *outInvalidToken = true;
                                    break;
                                }
                            }
                        }
                    }
                } catch (...) {}
            }

            return false;
        }
    }
    catch (const exception& e) {
        HandleErr("SendPush", e.what());
        return false;
    }
}


bool FcmClient::SendPushToMultiple(const vector<string>& fcmTokens, const string& title,
                                   const string& body, const map<string, string>& data)
{
    bool allSuccess = true;

    for (const string& token : fcmTokens) {
        if (!SendPush(token, title, body, data)) {
            allSuccess = false;
        }
    }

    return allSuccess;
}


bool FcmClient::LoadServiceAccountJson(const string& filePath)
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
        }
        else {
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
        }
        else {
            HandleErr("LoadServiceAccountJson", "private_key not found");
            return false;
        }

        if (_serviceAccountEmail.empty() || _privateKey.empty()) {
            HandleErr("LoadServiceAccountJson", "Required fields are empty");
            return false;
        }

        LOG_INFO("[FcmClient] Service account loaded: {}", _serviceAccountEmail);
        return true;
    }
    catch (const json::parse_error& e) {
        HandleErr("LoadServiceAccountJson", "JSON parse error: " + string(e.what()));
        return false;
    }
    catch (const exception& e) {
        HandleErr("LoadServiceAccountJson", e.what());
        return false;
    }
}


bool FcmClient::RefreshAccessToken()
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

            int64 expiresIn = 3600;
            if (response.contains("expires_in")) {
                expiresIn = response["expires_in"].get<int64>();
            }
            _tokenExpiresTime = Nowts() + (expiresIn * 1000);

            LOG_INFO("[FcmClient] Access token obtained, expires in {} seconds", expiresIn);
            return true;
        }
        else {
            HandleErr("RefreshAccessToken", "access_token not found in response");
            return false;
        }
    }
    catch (const exception& e) {
        HandleErr("RefreshAccessToken", e.what());
        return false;
    }
}


bool FcmClient::CheckValidToken()
{
    if (_accessToken.empty() || Nowts() >= _tokenExpiresTime) {
        return RefreshAccessToken();
    }
    return true;
}


string FcmClient::CreateJWT()
{
    json header = { {"alg", "RS256"}, {"typ", "JWT"} };

    int64 now = Nowts() / 1000;

    // FCM 전용 scope
    json payload = {
        {"iss", _serviceAccountEmail},
        {"scope", "https://www.googleapis.com/auth/firebase.messaging"},
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
    if (signature.empty()) {
        return "";
    }

    replace(signature.begin(), signature.end(), '+', '-');
    replace(signature.begin(), signature.end(), '/', '_');
    signature.erase(remove(signature.begin(), signature.end(), '='), signature.end());

    return toSign + "." + signature;
}


string FcmClient::SignString(const string& data)
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


string FcmClient::Base64Encode(const vector<uint8>& data)
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
