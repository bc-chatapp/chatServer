#pragma once

#include "Session.h"
#include "../protocol.pb.h"

#include "UserManager.h"

using sessionPtr = shared_ptr<Session>;

class AuthService
{
public:
	explicit AuthService(UserManager& userManager) : _userManager(userManager) { }
	~AuthService() = default;

	// ?뚯썝媛???
	bool SignUp(sessionPtr& session, uint64 reqId, const string& userId, 
	            const string& password, const string& name, 
	            const string& statusMessage = "");

	// 로그인 (비밀번호 확인 포함)
	bool Login(sessionPtr& session, uint64 reqId, const string& userId, const string& password);

private:
	UserManager& _userManager;
	
	// 비밀번호 해싱 (간단한 해시, 추후 bcrypt로 개선 가능)
	static string HashPassword(const string& password);
	
	// Auth Token 생성
	static string GenerateAuthToken(const string& userId);
	
	// 에러 처리
	void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};
