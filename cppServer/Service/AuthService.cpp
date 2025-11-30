#include "pch.h"
#include "AuthService.h"
#include "../DB/UserRepository.h"
#include "UserManager.h"
#include "../ServerSession.h"
#include "../PacketDispatcher.h"
#include "../CoreGlobal.h"
#include <sstream>
#include <iomanip>
#include <functional>  // hash 사용

using namespace Protocol;

// ============================================
// 회원가입
// ============================================

bool AuthService::SignUp(sessionPtr& session, uint64 reqId, const string& userId,
                         const string& password, const string& name,
                         const string& statusMessage) {
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
    
    // 이미 존재하는 사용자인지 확인
    if (UserRepository::UserExists(userId)) {
        HandleErr(session, reqId, ERR_USER_ALREADY_EXISTS, "user_id already exists");
        return false;
    }
    
    // 비밀번호 해싱
    string passwordHash = HashPassword(password);
    
    // 사용자 생성
    bool success = UserRepository::CreateUser(userId, passwordHash, name, statusMessage);
    
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

// ============================================
// 로그인
// ============================================

bool AuthService::Login(sessionPtr& session, uint64 reqId, const string& userId,
                        const string& password) {
    cout << "[AuthService] Login 요청: userId=" << userId << endl;
    
    // 입력 검증
    if (userId.empty()) {
        HandleErr(session, reqId, ERR_USER_ID_REQUIRED);
        return false;
    }
    
    if (password.empty()) {
        HandleErr(session, reqId, ERR_PASSWORD_REQUIRED);
        return false;
    }
    
    // 사용자 정보 조회 (비밀번호 포함)
    UserInfo userInfo;
    if (!UserRepository::GetUserWithPassword(userId, userInfo)) {
        HandleErr(session, reqId, ERR_USER_NOT_FOUND);
        cout << "[AuthService] 로그인 실패: 사용자를 찾을 수 없음 userId=" << userId << endl;
        return false;
    }
    
    // 비밀번호 확인
    string passwordHash = HashPassword(password);
    if (userInfo.passwordHash != passwordHash) {
        HandleErr(session, reqId, ERR_INVALID_PASSWORD);
        cout << "[AuthService] 로그인 실패: 비밀번호 불일치 userId=" << userId << endl;
        return false;
    }
    
    // 로그인 성공
    string authToken = GenerateAuthToken(userId);
    
    // Auth Token 업데이트
    UserRepository::UpdateAuthToken(userId, authToken);
    
    // Last Seen 업데이트
    UserRepository::UpdateLastSeen(userId);
    
    // ServerSession 설정
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
    
    // 응답 전송
    Protocol::S_Login pkt_s_login;
    pkt_s_login.set_user_id(userId);
    pkt_s_login.set_auth_token(authToken);
    
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
    // 간단한 토큰 생성 (추후 JWT로 개선 가능)
    return "AUTH_TOKEN_" + userId + "_" + to_string(Nowts());
}

void AuthService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    cerr << "[AuthService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
