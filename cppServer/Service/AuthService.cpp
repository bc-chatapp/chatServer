#include "pch.h"
#include "AuthService.h"
#include "../DB/UserRepository.h"
#include "UserManager.h"
#include "../ServerSession.h"
#include "../PacketDispatcher.h"
#include "../CoreGlobal.h"
#include "TokenManager.h"
#include <sstream>
#include <iomanip>
#include <functional>  // hash 사용

using namespace Protocol;

/*--------------------
        SignUp
---------------------*/
bool AuthService::SignUp(sessionPtr& session, uint64 reqId, const string& userId,
                         const string& password, const string& name,
                         const string& email) {

    cout << "[AuthService] SignUp 요청: userId=" << userId << ", name=" << name << endl;
    
    // 입력 검증
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_USER_ID_REQUIRED);
        return false;
    }
    
    if (password.empty()) {
        HandleErr(session, reqId, ERR_PASSWORD_REQUIRED);
        return false;
    }
    
    if (name.empty()) {
        HandleErr(session, reqId, ERR_NAME_REQUIRED);
        return false;
    }
    
    if (UserRepository::UserExists(userId)) {
        HandleErr(session, reqId, ERR_USER_ALREADY_EXISTS, "user_id already exists");
        return false;
    }
    
    string passwordHash = HashPassword(password);
    
    bool success = UserRepository::CreateUser(userId, passwordHash, name, ""/*TODO: email추가*/);
    
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
