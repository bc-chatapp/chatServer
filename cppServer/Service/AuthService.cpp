#include "pch.h"
#include "AuthService.h"
#include "../DB/UserRepository.h"
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
