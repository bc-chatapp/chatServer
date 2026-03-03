#include "pch.h"
#include "AuthService.h"
#include "../DB/UserRepository.h"
#include "../DB/GroupRepository.h"
#include "../DB/FcmTokenRepository.h"
#include "../DB/FileRepository.h"
#include "UserManager.h"
#include "../ServerSession.h"
#include "../PacketDispatcher.h"
#include "../CoreGlobal.h"

#include "VerificationManager.h"

#include "TokenManager.h"
#include <sstream>
#include <iomanip>

#include "bcrypt/bcrypt_lib.h"
#include "curl/curl.h"
#include "json.hpp"


using namespace Protocol;




bool AuthService::CheckIdAvailable(sessionPtr& session, uint64 reqId, const string& userId)
{
    bool exists = UserRepository::UserExists(userId);


    if (exists) LOG_INFO("[AuthService] : {} is exists.", userId);
    else LOG_INFO("[AuthService] : {} can use.", userId);

    Protocol::S_CheckId pkt;
    pkt.set_is_available(!exists); // 존재하지 않아야 사용 가능

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_check_id()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return !exists;
}





bool AuthService::CheckEmailAvailable(sessionPtr& session, uint64 reqId, const string& email)
{
    bool exists = UserRepository::EmailExists(email);

    if (exists) LOG_INFO("[AuthService] : {} is exists.", email);
    else LOG_INFO("[AuthService] : {} can use.", email);

    Protocol::S_CheckEmail pkt;
    pkt.set_is_available(!exists); // 없어야 사용 가능(true)

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_check_email()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return !exists;

}






/*--------------------
        SignUp
---------------------*/
bool AuthService::SignUp(sessionPtr& session, uint64 reqId, const string& userId,
                         const string& password, const string& name,
                         const string& email) {

    LOG_INFO("[AuthService] SignUp 요청: userId={}, name={}", userId, name);
    
    // 입력 검증
    if (userId.empty()) { HandleErr(session, reqId, ERR_USER_ID_REQUIRED);  return false; }
    if (password.empty()) { HandleErr(session, reqId, ERR_PASSWORD_REQUIRED); return false; }
    if (name.empty()) { HandleErr(session, reqId, ERR_NAME_REQUIRED); return false; }
    if (email.empty()) { HandleErr(session, reqId, ERR_EMAIL_REQUIRED); return false; }
    

    if (UserRepository::UserExists(userId)) {
        HandleErr(session, reqId, ERR_USER_ALREADY_EXISTS, "user_id already exists");
        return false;
    }

    if (UserRepository::EmailExists(email)) {
        HandleErr(session, reqId, ERR_EMAIL_ALREADY_EXISTS, "email already exists");
        return false;
    }
    


    string passwordHash = BcryptPassword(password);
    bool success = UserRepository::CreateUser(userId, passwordHash, name, email);
    

    Protocol::S_SignUp pkt_s_signup;
    if (success) {
        pkt_s_signup.set_success(true);
        pkt_s_signup.set_message("Registration successful. Please check your email for verification.");
        pkt_s_signup.set_user_id(userId);
        
        LOG_INFO("[AuthService] 회원가입 성공: userId={}", userId);

        std::thread([userId, email]() {
            AuthService::TriggerEmailVerification(userId, email);
            }).detach();

    } else {
        pkt_s_signup.set_success(false);
        pkt_s_signup.set_message("Failed to create user");
        
        LOG_INFO("[AuthService] 회원가입 실패: userId={}", userId);
    }
    
    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_signup()->CopyFrom(pkt_s_signup);
    
    PacketDispatcher::SendEnvelope(session, env);
    return success;
}





/*--------------------
        Login
---------------------*/
bool AuthService::Login(sessionPtr& session, uint64 reqId, const string& userId, const string& password) 
{
    LOG_INFO("[AuthService] Login 요청: userId={}", userId);
    
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_USER_ID_REQUIRED);
        return false;
    }
    
    if (password.empty()) {
        HandleErr(session, reqId, ERR_PASSWORD_REQUIRED);
        return false;
    }
    
    cUserInfo userInfo;
    if (!UserRepository::GetUserWithPassword(userId, userInfo)) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND);
        return false;
    }
    
    if (!bcrypt::validatePassword(password, userInfo.passwordHash)) {
        HandleErr(session, reqId, ERR_INVALID_PASSWORD);
        return false;
    }

    // 탈퇴 계정 체크
    if (userInfo.isDeleted) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND, "삭제 요청된 계정입니다.");
        return false;
    }

    // 이메일 미인증이어도 로그인 허용 (파일 업로드만 차단)

    string authToken = GenerateAuthToken(userId);
    UserRepository::UpdateAuthToken(userId, authToken);
    UserRepository::UpdateLastSeen(userId);
    

    auto serverSession = static_pointer_cast<ServerSession>(session);
    serverSession->SetUserId(userId);
    serverSession->SetAuthToken(authToken);
    
    // 기존 세션 확인 및 처리
    if (auto logined = GUserManager->FindSession(userId)) {
        if (logined != session) {
            logined->Disconnect();
        }
    }
    GUserManager->UpsertSession(userId, session);
    

    Protocol::S_Login pkt_s_login;
    pkt_s_login.set_success(true);
    pkt_s_login.set_auth_token(authToken);

    Protocol::UserInfo* myInfo = pkt_s_login.mutable_my_info();
    UserRepository::ConvertToProto(userInfo, myInfo);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_login()->CopyFrom(pkt_s_login);

    PacketDispatcher::SendEnvelope(session, env);
    
    LOG_INFO("[AuthService] 로그인 성공: userId={}", userId);
    return true;
}








bool AuthService::TriggerEmailVerification(const string& userId, const string& email)
{
    CURL* curl = curl_easy_init();
    if (!curl) return false;

    string url = "http://localhost:8080/api/internal/v1/auth/send-verification";
    nlohmann::json payload = {{"userId", userId}, {"email", email}};
    string jsonPayload = payload.dump();

    struct curl_slist* headers = nullptr;
    headers = curl_slist_append(headers, "Content-Type: application/json");

    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, jsonPayload.c_str());
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 5L);

    CURLcode res = curl_easy_perform(curl);
    long http_code = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &http_code);

    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);

    if (res == CURLE_OK && http_code == 200) {
        LOG_INFO("[AuthService] Java 서버 이메일 발송 요청 성공: {}", email);
        return true;
    }

    LOG_ERROR("[AuthService] Java 서버 요청 실패! CURL: {}, HTTP: {}", static_cast<int>(res), http_code);
    return false;
}








bool AuthService::LoginByToken(sessionPtr& session, uint64 reqId, const string& token, const string& userId)
{
    LOG_INFO("[AuthService] Token Login 요청: ID={}", userId);

    string dbUserId;
    if (token.empty() || !UserRepository::GetUserIdByToken(token, dbUserId)) {
        HandleErr(session, reqId, ERR_INVALID_TOKEN);
        return false;
    }

    if (dbUserId != userId) {
        HandleErr(session, reqId, ERR_INVALID_TOKEN); 
        return false;
    }

    cUserInfo userInfo;
    if (!UserRepository::GetUser(dbUserId, userInfo)) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND);
        return false;
    }

    // 탈퇴 계정 체크
    if (userInfo.isDeleted) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND, "삭제 요청된 계정입니다.");
        return false;
    }

    UserRepository::UpdateLastSeen(dbUserId);

    auto serverSession = static_pointer_cast<ServerSession>(session);
    serverSession->SetUserId(userId);
    serverSession->SetAuthToken(token);

    // 기존 세션 확인 및 처리
    if (auto logined = GUserManager->FindSession(userId)) {
        if (logined != session) {
            logined->Disconnect();
        }
    }
    GUserManager->UpsertSession(userId, session);

    Protocol::S_Login pkt_s_login;
    pkt_s_login.set_success(true);
    pkt_s_login.set_auth_token(token);

    Protocol::UserInfo* myInfo = pkt_s_login.mutable_my_info();
    UserRepository::ConvertToProto(userInfo, myInfo);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_login()->CopyFrom(pkt_s_login);
    PacketDispatcher::SendEnvelope(session, env);

    LOG_INFO("[AuthService] 로그인 성공: userId={}", userId);

    return true;
}




bool AuthService::HandleEditMyInfo(sessionPtr& session, uint64 reqId, const Protocol::C_EditMyInfo& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();


    bool success = UserRepository::UpdateMyInfo(userId, pkt);



    cUserInfo userInfo;
    UserRepository::GetUser(userId, userInfo);

    Protocol::S_EditMyInfo resPkt;
    resPkt.set_success(success);
    resPkt.set_message(success ? "정보가 수정되었습니다." : "수정 중 오류가 발생했습니다.");

    UserRepository::ConvertToProto(userInfo, resPkt.mutable_updated_info());



    Protocol::Envelope env;
    env.set_request_id(reqId);
    env.mutable_s_edit_my_info()->CopyFrom(resPkt);

    PacketDispatcher::SendEnvelope(session, env);
    return success;
}











string AuthService::BcryptPassword(const string& password)
{
    return bcrypt::generateHash(password);
}






// ============================================
// Auth Token 생성
// ============================================


string AuthService::GenerateAuthToken(const string& userId) {
    // JWT 기반 토큰 생성 (userId, name 포함)
    return TokenManager::GenerateToken(userId);
}

void AuthService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    LOG_ERROR("[AuthService] Error: {} (code: {})", errMessage, static_cast<int>(errorCode));
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}


/*--------------------
    Email Verify
---------------------*/

// curl response callback
static size_t WriteCallback(void* contents, size_t size, size_t nmemb, string* userp) {
    userp->append((char*)contents, size * nmemb);
    return size * nmemb;
}

bool AuthService::HandleReqEmailVerify(sessionPtr& session, uint64 reqId, const string& email)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();

    LOG_INFO("[AuthService] 이메일 인증 요청: userId={}, email={}", userId, email);

    // Java 서버에 인증 요청
    CURL* curl = curl_easy_init();
    if (!curl) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "CURL init failed");
        return false;
    }

    string url = "http://localhost:8080/api/internal/v1/auth/send-verification";
    nlohmann::json payload = {{"userId", userId}, {"email", email}};
    string jsonPayload = payload.dump();

    struct curl_slist* headers = nullptr;
    headers = curl_slist_append(headers, "Content-Type: application/json");

    string response;
    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, jsonPayload.c_str());
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 10L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response);

    CURLcode res = curl_easy_perform(curl);
    long httpCode = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &httpCode);

    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);

    Protocol::S_RequestEmailVerify pkt;
    if (res == CURLE_OK && httpCode == 200) {
        pkt.set_success(true);
        pkt.set_message("인증 메일이 발송되었습니다.");
        LOG_INFO("[AuthService] 이메일 인증 요청 성공: {}", email);
    } else {
        pkt.set_success(false);
        pkt.set_message("인증 메일 발송에 실패했습니다.");
        LOG_ERROR("[AuthService] 이메일 인증 요청 실패: CURL={}, HTTP={}", static_cast<int>(res), httpCode);
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_req_email_verify()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return pkt.success();
}


bool AuthService::HandleConfirmEmailVerify(sessionPtr& session, uint64 reqId, const string& email, const string& code)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();

    LOG_INFO("[AuthService] 이메일 인증 확인: userId={}, email={}, code=****", userId, email);

    // Java 서버에 인증 코드 확인 요청
    CURL* curl = curl_easy_init();
    if (!curl) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "CURL init failed");
        return false;
    }

    string url = "http://localhost:8080/api/internal/v1/auth/verify-code";
    nlohmann::json payload = {{"userId", userId}, {"email", email}, {"code", code}};
    string jsonPayload = payload.dump();

    struct curl_slist* headers = nullptr;
    headers = curl_slist_append(headers, "Content-Type: application/json");

    string response;
    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, jsonPayload.c_str());
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 10L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response);

    CURLcode res = curl_easy_perform(curl);
    long httpCode = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &httpCode);

    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);

    Protocol::S_ConfirmEmailVerify pkt;
    if (res == CURLE_OK && httpCode == 200) {
        pkt.set_success(true);
        LOG_INFO("[AuthService] 이메일 인증 확인 성공: {}", email);

        // users 테이블 is_email_verified = 1 업데이트
        try {
            auto& db = DBManager::GetInstance();
            auto schema = db.GetSchema();
            schema.getTable("users")
                .update()
                .set("is_email_verified", 1)
                .where("user_id = :uid")
                .bind("uid", userId)
                .execute();
            LOG_INFO("[AuthService] is_email_verified 업데이트 완료: {}", userId);

            // 기존 유효기간 파일 → 영구 보관으로 전환
            FileRepository::UpdateUserFilesRetentionExpiry(userId, 0);
            LOG_INFO("[AuthService] 파일 영구 전환 완료: {}", userId);
        } catch (const mysqlx::Error& err) {
            LOG_ERROR("[AuthService] is_email_verified 업데이트 실패: {}", err.what());
        }
    } else {
        pkt.set_success(false);
        LOG_ERROR("[AuthService] 이메일 인증 확인 실패: CURL={}, HTTP={}", static_cast<int>(res), httpCode);
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_confirm_email_verify()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return pkt.success();
}


/*--------------------
    Change Email
---------------------*/
bool AuthService::HandleChangeEmail(sessionPtr& session, uint64 reqId, const string& newEmail)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();

    LOG_INFO("[AuthService] 이메일 변경 요청: userId={}, newEmail={}", userId, newEmail);

    Protocol::S_ChangeEmail pkt;

    // 이메일 중복 확인
    if (UserRepository::EmailExists(newEmail)) {
        pkt.set_success(false);
        pkt.set_message("이미 사용 중인 이메일입니다.");
    } else {
        // 이메일 업데이트
        bool success = UserRepository::UpdateEmail(userId, newEmail);
        pkt.set_success(success);
        pkt.set_message(success ? "이메일이 변경되었습니다." : "이메일 변경에 실패했습니다.");

        if (success) {
            // 변경된 사용자 정보 반환
            cUserInfo userInfo;
            if (UserRepository::GetUser(userId, userInfo)) {
                UserRepository::ConvertToProto(userInfo, pkt.mutable_updated_info());
            }
        }
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_change_email()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return pkt.success();
}


/*--------------------
    Change Password
---------------------*/
bool AuthService::HandleChangePassword(sessionPtr& session, uint64 reqId, const string& currentPassword, const string& newPassword)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();

    LOG_INFO("[AuthService] 비밀번호 변경 요청: userId={}", userId);

    Protocol::S_ChangePassword pkt;

    // 현재 비밀번호 확인
    cUserInfo userInfo;
    if (!UserRepository::GetUserWithPassword(userId, userInfo)) {
        pkt.set_success(false);
        pkt.set_message("사용자 정보를 찾을 수 없습니다.");
    } else if (!bcrypt::validatePassword(currentPassword, userInfo.passwordHash)) {
        pkt.set_success(false);
        pkt.set_message("현재 비밀번호가 일치하지 않습니다.");
    } else {
        // 새 비밀번호 해싱 및 저장
        string newPasswordHash = BcryptPassword(newPassword);
        bool success = UserRepository::UpdatePassword(userId, newPasswordHash);

        pkt.set_success(success);
        pkt.set_message(success ? "비밀번호가 변경되었습니다." : "비밀번호 변경에 실패했습니다.");
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_change_password()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return pkt.success();
}


/*--------------------
    Logout (로그아웃)
---------------------*/
bool AuthService::HandleLogout(sessionPtr& session, uint64 reqId, const string& fcmToken, const string& deviceId)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();

    LOG_INFO("[AuthService] 로그아웃 요청: userId={}", userId);

    Protocol::S_Logout pkt;

    if (userId.empty()) {
        pkt.set_success(false);
    } else {
        // FCM 토큰 삭제 (토큰값 우선, 없으면 deviceId 기준)
        if (!fcmToken.empty()) {
            FcmTokenRepository::DeleteToken(userId, fcmToken);
            LOG_INFO("[AuthService] FCM 토큰 삭제: {}...", fcmToken.substr(0, 20));
        }
        if (!deviceId.empty()) {
            FcmTokenRepository::DeleteTokenByDeviceId(userId, deviceId);
        }

        // 세션 정리
        _userManager.RemoveSession(userId, session);

        // LastSeen 업데이트
        UserRepository::UpdateLastSeen(userId);

        pkt.set_success(true);
        LOG_INFO("[AuthService] 로그아웃 완료: {}", userId);
    }

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_logout()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return pkt.success();
}


/*--------------------
    Withdraw (회원 탈퇴)
---------------------*/
bool AuthService::HandleWithdraw(sessionPtr& session, uint64 reqId, const string& password, const string& reason)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    string userId = serverSession->GetUserId();

    LOG_INFO("[AuthService] 회원 탈퇴 요청: userId={}, reason={}", userId, reason);

    Protocol::S_Withdraw pkt;

    // 1. 비밀번호 확인
    cUserInfo userInfo;
    if (!UserRepository::GetUserWithPassword(userId, userInfo)) {
        pkt.set_success(false);
        pkt.set_message("사용자 정보를 찾을 수 없습니다.");
        goto SEND_RESPONSE;
    }

    // 소셜 유저가 아닌 경우에만 비밀번호 검증
    if (userInfo.oauthProvider.empty()) {
        if (!bcrypt::validatePassword(password, userInfo.passwordHash)) {
            pkt.set_success(false);
            pkt.set_message("비밀번호가 일치하지 않습니다.");
            goto SEND_RESPONSE;
        }
    }

    {
        // 2. 모든 그룹에서 탈퇴
        auto groups = GroupRepository::GetUserGroups(userId);
        for (const auto& group : groups) {
            GroupRepository::RemoveMember(group.groupId, userId);
            LOG_INFO("[AuthService] 그룹 탈퇴 처리: {}", group.groupId);
        }


        // 3. FCM 토큰 삭제
        FcmTokenRepository::DeleteAllUserTokens(userId);
        LOG_INFO("[AuthService] FCM 토큰 삭제 완료");

        // 4. 회원 완전 삭제 (Hard Delete)
        //    - messages.sender_id 익명화 → 채팅 기록에 "[탈퇴한 사용자]" 표시
        //    - friends, group_members: FK ON DELETE CASCADE 자동 삭제
        //    - user_assets, subscriptions, payment_transactions, block_list 등 삭제
        if (!UserRepository::HardDeleteUser(userId)) {
            pkt.set_success(false);
            pkt.set_message("탈퇴 처리 중 오류가 발생했습니다.");
            goto SEND_RESPONSE;
        }

        // 5. 세션 매니저에서 제거
        _userManager.RemoveSession(userId, session);

        pkt.set_success(true);
        pkt.set_message("회원 탈퇴가 완료되었습니다.");
        LOG_INFO("[AuthService] 회원 탈퇴 완료: {}", userId);
    }

SEND_RESPONSE:
    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_withdraw()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    // 탈퇴 성공 시 세션 종료
    if (pkt.success()) {
        session->Disconnect();
    }

    return pkt.success();
}


/*--------------------
    LoginExistingUser (소셜/일반 로그인 공통)
---------------------*/
bool AuthService::LoginExistingUser(sessionPtr& session, uint64 reqId, cUserInfo& userInfo)
{
    if (userInfo.isDeleted) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND, "삭제 요청된 계정입니다.");
        return false;
    }

    string authToken = GenerateAuthToken(userInfo.userId);
    UserRepository::UpdateAuthToken(userInfo.userId, authToken);
    UserRepository::UpdateLastSeen(userInfo.userId);

    auto serverSession = static_pointer_cast<ServerSession>(session);
    serverSession->SetUserId(userInfo.userId);
    serverSession->SetAuthToken(authToken);

    // 기존 세션 확인 및 처리
    if (auto logined = GUserManager->FindSession(userInfo.userId)) {
        if (logined != session) {
            logined->Disconnect();
        }
    }
    GUserManager->UpsertSession(userInfo.userId, session);

    Protocol::S_Login pkt_s_login;
    pkt_s_login.set_success(true);
    pkt_s_login.set_auth_token(authToken);

    Protocol::UserInfo* myInfo = pkt_s_login.mutable_my_info();
    UserRepository::ConvertToProto(userInfo, myInfo);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_login()->CopyFrom(pkt_s_login);
    PacketDispatcher::SendEnvelope(session, env);

    LOG_INFO("[AuthService] 로그인 성공 (기존 유저): userId={}", userInfo.userId);
    return true;
}


/*--------------------
    OAuth 토큰 검증 (Java 서버 호출)
---------------------*/
struct OAuthVerifyResult {
    bool success = false;
    string email;
    string name;
    string providerId;
    string profileImageUrl;
};

static OAuthVerifyResult VerifyOAuthToken(const string& provider, const string& idToken)
{
    OAuthVerifyResult result;

    CURL* curl = curl_easy_init();
    if (!curl) return result;

    string url = "http://localhost:8080/api/internal/v1/auth/verify-oauth";
    nlohmann::json payload = {{"provider", provider}, {"idToken", idToken}};
    string jsonPayload = payload.dump();

    struct curl_slist* headers = nullptr;
    headers = curl_slist_append(headers, "Content-Type: application/json");

    string response;
    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, jsonPayload.c_str());
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 10L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response);

    CURLcode res = curl_easy_perform(curl);
    long httpCode = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &httpCode);

    curl_slist_free_all(headers);
    curl_easy_cleanup(curl);

    if (res != CURLE_OK || httpCode != 200) {
        LOG_ERROR("[AuthService] OAuth 검증 요청 실패: CURL={}, HTTP={}", static_cast<int>(res), httpCode);
        return result;
    }

    // JSON 파싱 (nlohmann::json)
    try {
        auto json = nlohmann::json::parse(response);
        if (json.contains("success") && json["success"].is_boolean() && json["success"].get<bool>()) {
            result.success = true;
            result.email = json.value("email", string(""));
            result.name = json.value("name", string(""));
            result.providerId = json.value("providerId", string(""));
            result.profileImageUrl = json.value("profileImageUrl", string(""));
        }
    } catch (const std::exception& e) {
        LOG_ERROR("[AuthService] OAuth JSON 파싱 실패: {}", e.what());
    }

    return result;
}


/*--------------------
    SocialLogin
---------------------*/
bool AuthService::SocialLogin(sessionPtr& session, uint64 reqId, const string& provider, const string& idToken)
{
    LOG_INFO("[AuthService] SocialLogin 요청: provider={}", provider);

    // 1. provider 유효성 검증
    if (provider != "google" && provider != "apple") {
        HandleErr(session, reqId, ERR_OAUTH_PROVIDER_INVALID, "Invalid provider: " + provider);
        return false;
    }

    // 2. Java 서버로 토큰 검증
    auto oauthResult = VerifyOAuthToken(provider, idToken);
    if (!oauthResult.success) {
        HandleErr(session, reqId, ERR_OAUTH_VERIFICATION_FAILED, "OAuth token verification failed");
        return false;
    }

    LOG_INFO("[AuthService] OAuth 검증 성공: email={}, providerId={}", oauthResult.email, oauthResult.providerId);

    // 3. provider+providerId로 기존 유저 조회
    cUserInfo userInfo;
    if (UserRepository::GetUserByOAuthProvider(provider, oauthResult.providerId, userInfo)) {
        LOG_INFO("[AuthService] 기존 OAuth 유저 발견: {}", userInfo.userId);
        return LoginExistingUser(session, reqId, userInfo);
    }

    // 4. 이메일로 기존 유저 조회 → 자동 연동
    if (!oauthResult.email.empty() && UserRepository::GetUserByEmail(oauthResult.email, userInfo)) {
        LOG_INFO("[AuthService] 이메일 매칭 유저 발견, OAuth 연동: {}", userInfo.userId);
        UserRepository::LinkOAuthProvider(userInfo.userId, provider, oauthResult.providerId);
        // 연동 후 다시 조회 (is_email_verified=1 반영)
        UserRepository::GetUser(userInfo.userId, userInfo);
        return LoginExistingUser(session, reqId, userInfo);
    }

    // 5. 신규 유저 → S_SocialLogin(needsRegistration=true) 응답
    LOG_INFO("[AuthService] 신규 소셜 유저, 아이디 설정 필요");

    Protocol::S_SocialLogin pkt;
    pkt.set_needs_registration(true);
    pkt.set_email(oauthResult.email);
    pkt.set_name(oauthResult.name);
    pkt.set_profile_image_url(oauthResult.profileImageUrl);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_social_login()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return true;
}


/*--------------------
    CompleteSocialSignup
---------------------*/
bool AuthService::CompleteSocialSignup(sessionPtr& session, uint64 reqId, const string& provider,
                                        const string& idToken, const string& userId, const string& name)
{
    LOG_INFO("[AuthService] CompleteSocialSignup 요청: provider={}, userId={}", provider, userId);

    // 1. 입력 검증
    if (userId.empty()) { HandleErr(session, reqId, ERR_USER_ID_REQUIRED); return false; }
    if (name.empty()) { HandleErr(session, reqId, ERR_NAME_REQUIRED); return false; }

    // 2. 토큰 재검증
    auto oauthResult = VerifyOAuthToken(provider, idToken);
    if (!oauthResult.success) {
        HandleErr(session, reqId, ERR_OAUTH_VERIFICATION_FAILED, "OAuth token re-verification failed");
        return false;
    }

    // 3. userId 중복 체크
    if (UserRepository::UserExists(userId)) {
        HandleErr(session, reqId, ERR_USER_ALREADY_EXISTS, "user_id already exists");
        return false;
    }

    // 4. 유저 생성
    if (!UserRepository::CreateOAuthUser(userId, name, oauthResult.email, provider,
                                          oauthResult.providerId, oauthResult.profileImageUrl)) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "Failed to create OAuth user");
        return false;
    }

    // 5. 로그인 처리
    cUserInfo userInfo;
    if (!UserRepository::GetUser(userId, userInfo)) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "Failed to fetch created user");
        return false;
    }

    return LoginExistingUser(session, reqId, userInfo);
}
