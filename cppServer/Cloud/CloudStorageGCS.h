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

    string GenerateUploadUrl(const string& fileId, const string& path,
        const string& mimeType, int64 expiresInSeconds = 3600) override;

    string GenerateDownloadUrl(const string& path, int64 expiresInSeconds = 31536000) override;

    bool UploadFile(const string& path, const vector<uint8>& data, const string& mimeType) override;

    bool RemoveFile(const string& path) override;

    bool FileExists(const string& path) override;

private:
    /* Helpers */
    bool LoadServiceAccountJson(const string& filePath);
    bool RefreshAccessToken();
    bool EnsureValidToken();
    string CreateJWT();
    string UrlEncode(const string& str);
    string Base64Encode(const vector<uint8>& data);
    string SignString(const string& data);


    inline void HandleErr(const string& err) {
        cerr << "[CloudStorageGCS] " << err << " Failed " << endl;
    }

    inline void HandleErr(const string& err, const string& msg) {
        cerr << "[CloudStorageGCS] " << err << " Failed: " << msg << endl;
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






/*
* 
번호	의미	                상황              설명 (개발자 해석)
200	OK	                성공!             (업로드/다운로드 완료)
201	Created	            생성됨            (최초 업로드 성공 시 가끔 뜸)
204	No Content	        삭제 성공         (데이터는 없지만 성공함)
400	Bad Request	        요청이 이상함.    (JSON 형식이 깨졌거나, 파라미터 누락)
401	Unauthorized	    인증 실패.        (토큰이 없거나, 만료되었거나, 가짜임)
403	Forbidden	        권한 없음.        (로그인은 됐는데, "너 이 버킷 건드릴 권한 없어" 상태)
404	Not Found	        파일 없음.        (다운로드하려는데 파일이 없거나, 경로 오타)
500	Internal Error	    구글 서버 터짐.   (내 잘못 아님. 잠시 후 다시 시도)

*/



/*

enum class GcsError {
    // 0: 성공
    Success = 0,

    // 1~99: 내 서버 내부 문제 (Internal)
    LocalFileNotFound = 1,   // 업로드하려는데 내 컴퓨터에 파일이 없음
    FileOpenFailed = 2,      // 파일이 열리지 않음 (사용 중이거나 권한 문제)
    JsonParseFailed = 3,     // JSON 형식이 깨져서 파싱 불가
    JwtGenerationFailed = 4, // 인증 토큰 만들기 실패
    NetworkError = 5,        // 인터넷 연결 끊김, OpenSSL 오류 등

    // 400~599: HTTP 표준 오류 (구글 응답 그대로 매핑)
    BadRequest = 400,
    Unauthorized = 401,      // 토큰 문제
    Forbidden = 403,         // 권한 문제 (제일 많이 봄)
    NotFound = 404,          // 파일 없음
    ServerError = 500,       // 구글 잘못
    Unknown = 999            // 알 수 없는 오류
};

// 에러 코드를 사람이 읽을 수 있는 문자열로 바꿔주는 헬퍼 함수
inline std::string GetErrorString(GcsError err) {
    switch (err) {
        case GcsError::Success:             return "Success";
        case GcsError::LocalFileNotFound:   return "Local File Not Found";
        case GcsError::FileOpenFailed:      return "File Open Failed";
        case GcsError::JsonParseFailed:     return "JSON Parse Failed";
        case GcsError::JwtGenerationFailed: return "JWT Generation Failed";
        case GcsError::NetworkError:        return "Network/SSL Error";
        case GcsError::BadRequest:          return "HTTP 400: Bad Request";
        case GcsError::Unauthorized:        return "HTTP 401: Unauthorized (Token Invalid)";
        case GcsError::Forbidden:           return "HTTP 403: Forbidden (Permission Denied)";
        case GcsError::NotFound:            return "HTTP 404: Not Found";
        case GcsError::ServerError:         return "HTTP 500: Google Server Error";
        default:                            return "Unknown Error";
    }
}


*/