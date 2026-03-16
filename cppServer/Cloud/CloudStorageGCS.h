#pragma once

#include "CloudStorage.h"

#define CPPHTTPLIB_OPENSSL_SUPPORT
#include "httplib.h"

// GCP Cloud Storage (REST API 기반)
class CloudStorageGCS : public CloudStorage
{
public:
    CloudStorageGCS(const string& projectId, const string& bucketName, const string& credentialsPath = "");

    bool Initialize() override;

    string GenerateUploadUrl(const string& fileId, const string& path, const string& mimeType, int64 expiresInSeconds = 3600) override;
    string GenerateDownloadUrl(const string& path, int64 expiresInSeconds = 31536000) override;

    bool UploadFile(const string& path, const vector<uint8>& data, const string& mimeType) override;
    bool RemoveFile(const string& path) override;
    bool FileExists(const string& path) override;

private:
    /* Helpers */
    bool LoadServiceAccountJson(const string& filePath);
    bool RefreshAccessToken();
    bool CheckValidToken();

    string CreateJWT();
    string UrlEncode(const string& str);
    string SignString(const string& data);
    string Base64Encode(const vector<uint8>& data);
   

    string HexEncode(const vector<uint8>& data);  // SHA256 해시를 hex 문자열로
    string Sha256Hash(const string& data);        // 문자열을 SHA256 해시
    
    // GCS Signed URL 헬퍼 함수
    void GetTimestamp(string& timestamp, string& dateStr);  // 타임스탬프와 날짜 생성
    string CreateCanonicalPath(const string& path);  // Canonical 경로 생성
    string CreateCanonicalRequest(const string& method, const string& canonicalPath,
        const string& queryParams, const string& canonicalHeaders, const string& signedHeaders);
    string BuildCredentialScope(const string& dateStr) const;   // date -> credential scope
    string NormalizeObjectPath(const string& path) const;       // 버킷명 + 정리된 object path

    string SignStringHex(const string& data);

    inline void HandleErr(const string& err) {
        LOG_ERROR("[CloudStorageGCS] {} Failed", err);
    }

    inline void HandleErr(const string& err, const string& msg) {
        LOG_ERROR("[CloudStorageGCS] {} Failed: {}", err, msg);
    }

private:
    string _projectId;
    string _bucketName;
    string _credentialsPath;  // 서비스 계정 키 파일 경로 (선택)

    /* OAuth Token */
    string _accessToken;
    int64 _tokenExpiresTime = 0;

    /* Service Account Info : From JWT */
    string _serviceAccountEmail;
    string _privateKeyId;
    string _privateKey;

    // HTTP 클라이언트
    unique_ptr<httplib::Client> _httpClient;

};



