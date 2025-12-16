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
#include <functional>  // hash 사용

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





bool AuthService::RequestEmailVerification(sessionPtr& session, uint64 reqId, const string& email)
{
    if (UserRepository::EmailExists(email)) {
        Protocol::S_RequestEmailVerify pkt;
        pkt.set_success(false);
        pkt.set_message("이미 가입된 이메일입니다.");

        // 전송 로직... (SendEnvelope)
        return false;
    }

    string code = VerificationManager::CreateVerificationCode(email);
    cout << "[Email 발송] To: " << email << " | Code: [" << code << "]" << endl;

    Protocol::S_RequestEmailVerify pkt;
    pkt.set_success(true);
    pkt.set_message("인증번호가 발송되었습니다.");

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_req_email_verify()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return true;
}

bool AuthService::ConfirmEmailVerification(sessionPtr& session, uint64 reqId, const string& email, const string& code)
{
    bool valid = VerificationManager::CheckVerificationCode(email, code);

    Protocol::S_ConfirmEmailVerify pkt;
    pkt.set_success(valid);

    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_confirm_email_verify()->CopyFrom(pkt);
    PacketDispatcher::SendEnvelope(session, env);

    return valid;
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
    
    string passwordHash = HashPassword(password);
    
    bool success = UserRepository::CreateUser(userId, passwordHash, name, email);
    
    Protocol::S_SignUp pkt_s_signup;
    if (success) {
        pkt_s_signup.set_success(true);
        pkt_s_signup.set_message("Sign up successful");
        pkt_s_signup.set_user_id(userId);
        
        cout << "[AuthService] 회원가입 성공: userId=" << userId << endl;
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



// ============================================
// 비밀번호 해싱 (간단한 해시, 추후 bcrypt로 개선 가능)
// ============================================
string AuthService::HashPassword(const string& password) {
    // 간단한 해싱 (추후 bcrypt나 SHA256으로 개선 필요)
    hash<string> hasher;
    size_t hashValue = hasher(password);
    
    stringstream ss;
    ss << hex << hashValue;
    return ss.str();
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
    
    UserInfo userInfo;
    if (!UserRepository::GetUserWithPassword(userId, userInfo)) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND);
        return false;
    }
    
    string passwordHash = HashPassword(password);
    if (userInfo.passwordHash != passwordHash) {
        HandleErr(session, reqId, ERR_INVALID_PASSWORD);
        return false;
    }
    
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
    pkt_s_login.set_user_id(userId);
    pkt_s_login.set_auth_token(authToken);

    pkt_s_login.set_name(userInfo.name);
    pkt_s_login.set_email(userInfo.email);
    
    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    env.mutable_s_login()->CopyFrom(pkt_s_login);
    PacketDispatcher::SendEnvelope(session, env);
    
    cout << "[AuthService] 로그인 성공: userId=" << userId << endl;
    
    // 로그인 성공 후 오프라인 정보 푸시
    PacketDispatcher::PushOfflineData(session, userId);
    serverSession->SetHasPushedOfflineData(true);
    
    return true;
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
