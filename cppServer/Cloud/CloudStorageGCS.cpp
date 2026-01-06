#include "pch.h"
#include "CloudStorageGCS.h"

#include <fstream>
#include <sstream>
#include <iomanip>
#include <ctime>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>
#include <openssl/rsa.h>
#include <openssl/sha.h>
#include <openssl/bn.h>

#include "json.hpp" 
using json = nlohmann::json; 


CloudStorageGCS::CloudStorageGCS(const string& projectId, const string& bucketName, const string& credentialsPath)
    : _projectId(projectId), _bucketName(bucketName), _credentialsPath(credentialsPath)
{
    _httpClient = make_unique<httplib::Client>("https://storage.googleapis.com");
    _httpClient->set_connection_timeout(10, 0);  // 10초 타임아웃
    _httpClient->set_read_timeout(30, 0);        // 30초 읽기 타임아웃
}


bool CloudStorageGCS::Initialize() 
{
    try {
        cout << "[CloudStorageGCS] Init: projectId=" << _projectId << ", bucketName=" << _bucketName << endl;

        if (_bucketName.empty()) {
            HandleErr("Initialize", "bucket is empty");
            return false;
        }

        if (!_credentialsPath.empty()) {
            if (!LoadServiceAccountJson(_credentialsPath)) {
                HandleErr("Initialize", "credentials key Load");
                return false;
            }
        }
        else {
            HandleErr("Initialize", "credentialsPath Load");
            return false;
        }

        /* OAuth */
        if (!RefreshAccessToken()) {
            HandleErr("OAuth2");
            return false;
        }

        /* bucket check */

        cout << "[CloudStorageGCS] Initailize (REST API)" << endl;
        return true;
    }
    catch (const exception& e) {
        HandleErr("Initialize", e.what());
        return false;
    }
}


string CloudStorageGCS::GenerateUploadUrl(const string& fileId, const string& path, const string& mimeType, int64 expiresInSeconds)
{
    try {
        // 1. 입력값 정리 (공백/슬래시 제거)
        string cleanMimeType = mimeType;
        cleanMimeType.erase(remove_if(cleanMimeType.begin(), cleanMimeType.end(), ::isspace), cleanMimeType.end());

        string cleanPath = path;
        if (!cleanPath.empty() && cleanPath.front() == '/') cleanPath.erase(0, 1);

        string timestamp, dateStr;
        GetTimestamp(timestamp, dateStr);
        string credentialScope = BuildCredentialScope(dateStr);

        // 2. Canonical Path & Headers
        // Path-Style: /버킷명/경로
        string objectPath = NormalizeObjectPath(cleanPath);
        string canonicalPath = CreateCanonicalPath(objectPath);

        // 헤더: content-type과 host를 포함 (알파벳 순서)
        string h_ContentType = "content-type:" + cleanMimeType + "\n";
        string h_Host = "host:storage.googleapis.com\n";

        string canonicalHeaders = h_ContentType + h_Host;
        string signedHeaders = "content-type;host";

        // 3. Query Parameters (Canonical Query String)
        string q_Algo = "X-Goog-Algorithm=GOOG4-RSA-SHA256";
        string q_Cred = "X-Goog-Credential=" + UrlEncode(_serviceAccountEmail + "/" + credentialScope);
        string q_Date = "X-Goog-Date=" + timestamp;
        string q_Exp = "X-Goog-Expires=" + to_string(expiresInSeconds);
        string q_Head = "X-Goog-SignedHeaders=" + UrlEncode(signedHeaders);

        string canonicalQueryString = q_Algo + "&" + q_Cred + "&" + q_Date + "&" + q_Exp + "&" + q_Head;

        // 4. Canonical Request 조립 (페이로드는 UNSIGNED-PAYLOAD)
        string canonicalRequest = CreateCanonicalRequest(
            "PUT",
            canonicalPath,
            canonicalQueryString,
            canonicalHeaders,
            signedHeaders);

        // 5. 서명 생성
        string canonicalRequestHash = Sha256Hash(canonicalRequest);
        string stringToSign = "GOOG4-RSA-SHA256\n" + string(timestamp) + "\n" + credentialScope + "\n" + canonicalRequestHash;

        // [수정] Hex 서명 함수 사용
        string signature = SignStringHex(stringToSign);

        if (signature.empty()) return "";

        // 6. 최종 URL 조합
        // 서명(signature)이 이제 Hex 문자열이므로 URL 인코딩이나 Base64 처리가 필요 없습니다.
        string signedUrl = "https://storage.googleapis.com/" + objectPath + "?" + canonicalQueryString + "&X-Goog-Signature=" + signature;

        cout << "[CloudStorageGCS] Upload URL generated." << endl;
        return signedUrl;
    }
    catch (const exception& e) {
        HandleErr("GenerateUploadUrl", e.what());
        return "";
    }
}


string CloudStorageGCS::GenerateDownloadUrl(const string& path, int64 expiresInSeconds)
{
    try {
        string objectPath = NormalizeObjectPath(path);

        if (objectPath.empty()) return "";

        string publicUrl = "https://storage.googleapis.com/" + objectPath;

        cout << "[CloudStorageGCS] Public Download URL generated: " << publicUrl << endl;

        return publicUrl;
    }
    catch (const exception& e) {
        HandleErr("GenerateDownloadUrl", e.what());
        return "";
    }
}





bool CloudStorageGCS::UploadFile(const string& path, const vector<uint8>& data, const string& mimeType)
{
    if (!CheckValidToken()) {
        HandleErr("UploadFile", "Token validation failed");
        return false;
    }

    try {
        string encodedPath = UrlEncode(path);
        string url = "/upload/storage/v1/b/" + _bucketName + "/o?uploadType=media&name=" + encodedPath;

        httplib::Headers headers = {
            {"Authorization", "Bearer " + _accessToken},
            {"Content-Type", mimeType.empty() ? "application/octet-stream" : mimeType}
        };

        auto res = _httpClient->Post(url.c_str(), headers,
            reinterpret_cast<const char*>(data.data()), data.size(),
            mimeType.empty() ? "application/octet-stream" : mimeType.c_str());

        if (!res) {
            HandleErr("UploadFile", "HTTP request failed");
            return false;
        }

        if (res->status == 200 || res->status == 201) {
            cout << "[CloudStorageGCS] File uploaded: " << path << endl;
            return true;
        }
        else {
            HandleErr("UploadFile", "HTTP " + to_string(res->status));
            return false;
        }
    }
    catch(const exception& e){
        HandleErr("UploadFile", e.what());
        return false;
    }
}



bool CloudStorageGCS::RemoveFile(const string& gcsPath) 
{
    if (!CheckValidToken()) {
        HandleErr("DeleteFile", "Token validation failed");
        return false;
    }
    try {
        string encodedPath = UrlEncode(gcsPath);
        string url = "/storage/v1/b/" + _bucketName + "/o/" + encodedPath;

        httplib::Headers headers = {
            {"Authorization", "Bearer " + _accessToken}
        };

        auto res = _httpClient->Delete(url.c_str(), headers);

        if (!res) {
            HandleErr("RemoveFile", "HTTP request failed");  
            return false;
        }

        if (res->status == 204 || res->status == 200) {
            cout << "[CloudStorageGCS] File deleted: " << gcsPath << endl;
            return true;
        }
        else if (res->status == 404) {
            cout << "[CloudStorageGCS] File not found: " << gcsPath << endl;
            return false;
        }
        else {
            HandleErr("RemoveFile", "HTTP " + to_string(res->status)); 
            return false;
        }
    }
    catch (const exception& e) {
        HandleErr("RemoveFile", e.what()); 
        return false;
    }
}

bool CloudStorageGCS::FileExists(const string& path) 
{
    if (!CheckValidToken()) {
        HandleErr("FileExists", "Token validation failed");
        return false;
    }

    try {
        string encodedPath = UrlEncode(path);
        string url = "/storage/v1/b/" + _bucketName + "/o/" + encodedPath;

        httplib::Headers headers = {
            {"Authorization", "Bearer " + _accessToken}
        };

        auto res = _httpClient->Head(url.c_str(), headers);

        if (!res) {
            HandleErr("FileExists", "HTTP request failed");
            return false;
        }

        return res->status == 200;
    }
    catch (const exception& e) {
        HandleErr("FileExists", e.what());
        return false;
    }
}



/* -------------------------
            Helpers 
---------------------------*/

bool CloudStorageGCS::LoadServiceAccountJson(const string& filePath)
{
    try {
        ifstream file(filePath);
        if (!file.is_open()) {
            HandleErr("File Open");
            return false;
        }

        json j;
        file >> j;
        file.close();

        /* client email */
        if (j.contains("client_email")) {
            _serviceAccountEmail = j["client_email"].get<string>();
        }
        else {
            HandleErr("LoadServiceAccountJson", "client_email not found");
            return false;
        }

        /* private Key */
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

        /* private Key Id */
        if (j.contains("private_key_id")) {
            _privateKeyId = j["private_key_id"].get<string>();
        }
        else {
            cout << "[CloudStorageGCS] Warning: private_key_id not found" << endl;
        }

        // 필수 필드 검증
        if (_serviceAccountEmail.empty() || _privateKey.empty()) {
            HandleErr("LoadServiceAccountJson", "Required fields are empty");
            return false;
        }

        cout << "[CloudStorageGCS] Service account loaded: " << _serviceAccountEmail << endl;
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

bool CloudStorageGCS::RefreshAccessToken()
{
    try {
        string jwt = CreateJWT();
        if (jwt.empty()) {
            HandleErr("RefreshAccessToken", "JWT creation failed");
            return false;
        }

        /* Request OAuth2  */
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

        // JSON 응답 파싱
        json response = json::parse(res->body);

        if (response.contains("access_token")) {
            _accessToken = response["access_token"].get<string>();

            // 만료 시간 저장
            int64 expiresIn = 3600;  // 기본값
            if (response.contains("expires_in")) {
                expiresIn = response["expires_in"].get<int64>();
            }
            _tokenExpiresTime = Nowts() + (expiresIn * 1000);  // 밀리초 단위

            cout << "[CloudStorageGCS] Access token obtained, expires in " << expiresIn << " seconds" << endl;
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

bool CloudStorageGCS::CheckValidToken()
{
    if (_accessToken.empty() || Nowts() >= _tokenExpiresTime) {
        return RefreshAccessToken();
    }
    return true;
}

string CloudStorageGCS::CreateJWT()
{
    // JWT 헤더
    json header = { {"alg", "RS256"}, {"typ", "JWT"} };

    int64 now = Nowts() / 1000;

    json payload = {
        {"iss", _serviceAccountEmail},
        {"scope", "https://www.googleapis.com/auth/cloud-platform"},
        {"aud", "https://oauth2.googleapis.com/token"},
        {"exp", now + 3600},  // 1시간 후 만료
        {"iat", now}
    };

    string headerStr = header.dump();
    string payloadStr = payload.dump();

    vector<uint8> headerBytes(headerStr.begin(), headerStr.end());
    vector<uint8> payloadBytes(payloadStr.begin(), payloadStr.end());

    string encodedHeader = Base64Encode(headerBytes);
    string encodedPayload = Base64Encode(payloadBytes);

    /* Convert:  + -> - */
    replace(encodedHeader.begin(), encodedHeader.end(), '+', '-');
    replace(encodedHeader.begin(), encodedHeader.end(), '/', '_');
    replace(encodedPayload.begin(), encodedPayload.end(), '+', '-');
    replace(encodedPayload.begin(), encodedPayload.end(), '/', '_');

    /* Eliminate:  = */
    encodedHeader.erase(remove(encodedHeader.begin(), encodedHeader.end(), '='), encodedHeader.end());
    encodedPayload.erase(remove(encodedPayload.begin(), encodedPayload.end(), '='), encodedPayload.end());

    string toSign = encodedHeader + "." + encodedPayload;

    /* Signature */
    string signature = SignString(toSign);
    if (signature.empty()) {
        return "";
    }


    replace(signature.begin(), signature.end(), '+', '-');
    replace(signature.begin(), signature.end(), '/', '_');
    signature.erase(remove(signature.begin(), signature.end(), '='), signature.end());

    // JWT 조합
    return toSign + "." + signature;
}

string CloudStorageGCS::UrlEncode(const string& str) 
{
    ostringstream encoded;
    encoded.fill('0');

    // uppercase를 추가하여 대문자(A-F)로 출력하게 변경
    encoded << hex << uppercase;

    for (char c : str) {
        if (isalnum(c) || c == '-' || c == '_' || c == '.' || c == '~') {
            encoded << c;
        }
        else {
            encoded << '%' << setw(2) << int((BYTE)c);
        }
    }
    return encoded.str();
}

string CloudStorageGCS::SignString(const string& data)
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

    vector<unsigned char> signature(sigLen);
    EVP_DigestSignFinal(mdctx, signature.data(), &sigLen);
    EVP_MD_CTX_free(mdctx);
    EVP_PKEY_free(pkey);

    return Base64Encode(signature);
}


string CloudStorageGCS::Base64Encode(const vector<uint8>& data)
{
    BIO* bio = BIO_new(BIO_s_mem());
    BIO* b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);

    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL);
    BIO_write(bio, data.data(), static_cast<int>(data.size()));
    BIO_flush(bio);

    BUF_MEM* bufferPtr;
    BIO_get_mem_ptr(bio, &bufferPtr);

    string encoded(bufferPtr->data, bufferPtr->length);
    BIO_free_all(bio);

    return encoded;
}

string CloudStorageGCS::HexEncode(const vector<uint8>& data)
{
    ostringstream hex;
    hex << ::hex << ::setfill('0');
    for (uint8 byte : data) {
        hex << setw(2) << static_cast<int>(byte);
    }
    return hex.str();
}

string CloudStorageGCS::Sha256Hash(const string& data)
{
    unsigned char hash[SHA256_DIGEST_LENGTH];

    SHA256(reinterpret_cast<const unsigned char*>(data.c_str()), data.size(), hash);

    vector<uint8> hashVec(hash, hash + SHA256_DIGEST_LENGTH);
    return HexEncode(hashVec);
}



void CloudStorageGCS::GetTimestamp(string& timestamp, string& dateStr)
{
    time_t now = static_cast<time_t>(Nowts() / 1000);  // ms -> s 
    struct tm* gmTime = gmtime(&now);
    
    char ts[17];
    strftime(ts, sizeof(ts), "%Y%m%dT%H%M%SZ", gmTime);
    timestamp = ts;
    
    char date[9];
    strftime(date, sizeof(date), "%Y%m%d", gmTime);
    dateStr = date;
}

string CloudStorageGCS::CreateCanonicalPath(const string& path)
{
    // Virtual-hosted style URL의 경우 Canonical Request 경로는 버킷 이름 없이 object path만 사용
    // 경로는 URL 인코딩 (슬래시는 그대로 유지)
    string canonicalPath = "/";
    for (char c : path) {
        if (c == '/') {
            canonicalPath += '/';
        } else if (isalnum(c) || c == '-' || c == '_' || c == '.' || c == '~') {
            canonicalPath += c;
        } else {
            canonicalPath += '%';
            char hex[3];
            sprintf(hex, "%02X", (unsigned char)c);
            canonicalPath += hex;
        }
    }
    return canonicalPath;
}

string CloudStorageGCS::CreateCanonicalRequest(const string& method, const string& canonicalPath,
    const string& queryParams, const string& canonicalHeaders, const string& signedHeaders)
{
    return method + "\n"
        + canonicalPath + "\n"
        + queryParams + "\n"
        + canonicalHeaders + "\n" // ⭐️ 여기서 하드코딩된 host 제거하고 인자 사용
        + signedHeaders + "\n"
        + "UNSIGNED-PAYLOAD";
}

string CloudStorageGCS::BuildCredentialScope(const string& dateStr) const
{
    // GCS v4 서명에서 credential scope는 고정 패턴: {date}/auto/storage/goog4_request
    return dateStr + "/auto/storage/goog4_request";
}

string CloudStorageGCS::NormalizeObjectPath(const string& path) const
{
    // 맨 앞의 '/'를 제거한 뒤, "bucketName/objectPath" 형태로 조합
    string cleanPath = path;
    if (!cleanPath.empty() && cleanPath.front() == '/') {
        cleanPath.erase(0, 1);
    }
    return _bucketName + "/" + cleanPath;
}


string CloudStorageGCS::SignStringHex(const string& data)
{
    BIO* bio = BIO_new_mem_buf(_privateKey.c_str(), static_cast<int>(_privateKey.length()));
    EVP_PKEY* pkey = PEM_read_bio_PrivateKey(bio, nullptr, nullptr, nullptr);
    BIO_free(bio);

    if (!pkey) {
        HandleErr("SignStringHex", "Failed to load private key");
        return "";
    }

    EVP_MD_CTX* mdctx = EVP_MD_CTX_new();
    EVP_DigestSignInit(mdctx, nullptr, EVP_sha256(), nullptr, pkey);
    EVP_DigestSignUpdate(mdctx, data.c_str(), data.length());

    size_t sigLen = 0;
    EVP_DigestSignFinal(mdctx, nullptr, &sigLen);

    vector<uint8> signature(sigLen);
    EVP_DigestSignFinal(mdctx, signature.data(), &sigLen);

    EVP_MD_CTX_free(mdctx);
    EVP_PKEY_free(pkey);

    // ⭐️ [중요] Base64가 아니라 Hex 문자열로 반환해야 합니다.
    return HexEncode(signature);
}