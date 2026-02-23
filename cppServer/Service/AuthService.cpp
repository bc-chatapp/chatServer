#include "pch.h"
#include "AuthService.h"
#include "../DB/UserRepository.h"
#include "../DB/GroupRepository.h"
#include "../DB/FcmTokenRepository.h"
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


using namespace Protocol;




bool AuthService::CheckIdAvailable(sessionPtr& session, uint64 reqId, const string& userId)
{
    bool exists = UserRepository::UserExists(userId);


    if (exists) cout << "[AuthService] : " << userId << " is exists." << endl;
    else cout << "[AuthService] : " << userId << " can use." << endl;

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

    if (exists) cout << "[AuthService] : " << email << " is exists." << endl;
    else cout << "[AuthService] : " << email << " can use." << endl;

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

    cout << "[AuthService] SignUp 요청: userId=" << userId << ", name=" << name << endl;
    
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
        
        cout << "[AuthService] 회원가입 성공: userId=" << userId << endl;

        std::thread([userId, email]() {
            AuthService::TriggerEmailVerification(userId, email);
            }).detach();

    } else {
        pkt_s_signup.set_success(false);
        pkt_s_signup.set_message("Failed to create user");
        
        cout << "[AuthService] 회원가입 실패: userId=" << userId << endl;
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
    cout << "[AuthService] Login 요청: userId=" << userId << endl;
    
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

    // 이메일 인증 확인
    /*if (!userInfo.isEmailVerified) {
        HandleErr(session, reqId, ERR_EMAIL_NOT_VERIFIED, "Please verify your email before logging in.");
        return false;
    }*/


    
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
    
    cout << "[AuthService] 로그인 성공: userId=" << userId << endl;
    return true;
}








bool AuthService::TriggerEmailVerification(const string& userId, const string& email)
{
    CURL* curl = curl_easy_init();
    if (!curl) return false;

    string url = "http://localhost:8080/api/internal/v1/auth/send-verification";
    string jsonPayload = "{\"userId\":\"" + userId + "\", \"email\":\"" + email + "\"}";

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
        cout << "[AuthService] Java 서버 이메일 발송 요청 성공: " << email << endl;
        return true;
    }

    cerr << "[AuthService] Java 서버 요청 실패! CURL: " << res << ", HTTP: " << http_code << endl;
    return false;
}








bool AuthService::LoginByToken(sessionPtr& session, uint64 reqId, const string& token, const string& userId)
{
    cout << "[AuthService] Token Login 요청: ID=" << userId << endl;

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

    cout << "[AuthService] 로그인 성공: userId=" << userId << endl;

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
    cerr << "[AuthService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
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

    cout << "[AuthService] 이메일 인증 요청: userId=" << userId << ", email=" << email << endl;

    // Java 서버에 인증 요청
    CURL* curl = curl_easy_init();
    if (!curl) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "CURL init failed");
        return false;
    }

    string url = "http://localhost:8080/api/internal/v1/auth/send-verification";
    string jsonPayload = "{\"userId\":\"" + userId + "\", \"email\":\"" + email + "\"}";

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
        cout << "[AuthService] 이메일 인증 요청 성공: " << email << endl;
    } else {
        pkt.set_success(false);
        pkt.set_message("인증 메일 발송에 실패했습니다.");
        cerr << "[AuthService] 이메일 인증 요청 실패: CURL=" << res << ", HTTP=" << httpCode << endl;
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

    cout << "[AuthService] 이메일 인증 확인: userId=" << userId << ", email=" << email << ", code=" << code << endl;

    // Java 서버에 인증 코드 확인 요청
    CURL* curl = curl_easy_init();
    if (!curl) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "CURL init failed");
        return false;
    }

    string url = "http://localhost:8080/api/internal/v1/auth/verify-code";
    string jsonPayload = "{\"userId\":\"" + userId + "\", \"email\":\"" + email + "\", \"code\":\"" + code + "\"}";

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
        cout << "[AuthService] 이메일 인증 확인 성공: " << email << endl;
    } else {
        pkt.set_success(false);
        cerr << "[AuthService] 이메일 인증 확인 실패: CURL=" << res << ", HTTP=" << httpCode << endl;
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

    cout << "[AuthService] 이메일 변경 요청: userId=" << userId << ", newEmail=" << newEmail << endl;

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

    cout << "[AuthService] 비밀번호 변경 요청: userId=" << userId << endl;

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

    cout << "[AuthService] 로그아웃 요청: userId=" << userId << endl;

    Protocol::S_Logout pkt;

    if (userId.empty()) {
        pkt.set_success(false);
    } else {
        // FCM 토큰 삭제 (토큰값 우선, 없으면 deviceId 기준)
        if (!fcmToken.empty()) {
            FcmTokenRepository::DeleteToken(userId, fcmToken);
            cout << "[AuthService] FCM 토큰 삭제: " << fcmToken.substr(0, 20) << "..." << endl;
        }
        if (!deviceId.empty()) {
            FcmTokenRepository::DeleteTokenByDeviceId(userId, deviceId);
        }

        // 세션 정리
        _userManager.RemoveSession(userId, session);

        // LastSeen 업데이트
        UserRepository::UpdateLastSeen(userId);

        pkt.set_success(true);
        cout << "[AuthService] 로그아웃 완료: " << userId << endl;
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

    cout << "[AuthService] 회원 탈퇴 요청: userId=" << userId << ", reason=" << reason << endl;

    Protocol::S_Withdraw pkt;

    // 1. 비밀번호 확인
    cUserInfo userInfo;
    if (!UserRepository::GetUserWithPassword(userId, userInfo)) {
        pkt.set_success(false);
        pkt.set_message("사용자 정보를 찾을 수 없습니다.");
        goto SEND_RESPONSE;
    }

    if (!bcrypt::validatePassword(password, userInfo.passwordHash)) {
        pkt.set_success(false);
        pkt.set_message("비밀번호가 일치하지 않습니다.");
        goto SEND_RESPONSE;
    }

    {
        // 2. 모든 그룹에서 탈퇴
        auto groups = GroupRepository::GetUserGroups(userId);
        for (const auto& group : groups) {
            GroupRepository::RemoveMember(group.groupId, userId);
            cout << "[AuthService] 그룹 탈퇴 처리: " << group.groupId << endl;
        }


        // 3. FCM 토큰 삭제
        FcmTokenRepository::DeleteAllUserTokens(userId);
        cout << "[AuthService] FCM 토큰 삭제 완료" << endl;

        // 4. 회원 삭제 처리
        // 현재: Soft Delete (논리적 삭제) - 데이터 보존, 복구 가능, 채팅 기록에 "탈퇴한 사용자" 표시
        // TODO: Hard Delete (물리적 삭제) 필요 시 아래 주석 해제
        //       - 연관 데이터(messages, friends, group_members 등) 먼저 삭제 필요
        //       - GDPR 등 완전 삭제 요구 시 사용
        // if (!UserRepository::HardDeleteUser(userId)) { ... }

        if (!UserRepository::SoftDeleteUser(userId)) {
            pkt.set_success(false);
            pkt.set_message("탈퇴 처리 중 오류가 발생했습니다.");
            goto SEND_RESPONSE;
        }

        // 5. 세션 매니저에서 제거
        _userManager.RemoveSession(userId, session);

        pkt.set_success(true);
        pkt.set_message("회원 탈퇴가 완료되었습니다.");
        cout << "[AuthService] 회원 탈퇴 완료: " << userId << endl;
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
