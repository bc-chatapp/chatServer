#pragma once

#include "Session.h"
#include "../protocol.pb.h"

#include "UserManager.h"
#include "../DB/UserRepository.h"

using sessionPtr = shared_ptr<Session>;

class AuthService
{
public:
	explicit AuthService(UserManager& userManager) : _userManager(userManager) { }
	~AuthService() = default;

	bool CheckIdAvailable(sessionPtr& session, uint64 reqId, const string& userId);
	bool CheckEmailAvailable(sessionPtr& session, uint64 reqId, const string& email);
	
	// 회원가입
	bool SignUp(sessionPtr& session, uint64 reqId, const string& userId,
	            const string& password, const string& name,
	            const string& email);

	// 로그인 (비밀번호 확인 포함)
	bool Login(sessionPtr& session, uint64 reqId, const string& userId, const string& password);
	
	static bool TriggerEmailVerification(const string& userId, const string& email);
	bool LoginByToken(sessionPtr& session, uint64 reqId, const string& token, const string& userId);


	bool HandleEditMyInfo(sessionPtr& session, uint64 reqId, const Protocol::C_EditMyInfo& pkt);

	// 이메일 인증 요청/확인
	bool HandleReqEmailVerify(sessionPtr& session, uint64 reqId, const string& email);
	bool HandleConfirmEmailVerify(sessionPtr& session, uint64 reqId, const string& email, const string& code);

	// 계정 관리 (이메일/비밀번호 변경)
	bool HandleChangeEmail(sessionPtr& session, uint64 reqId, const string& newEmail);
	bool HandleChangePassword(sessionPtr& session, uint64 reqId, const string& currentPassword, const string& newPassword);

	// 회원 탈퇴
	bool HandleWithdraw(sessionPtr& session, uint64 reqId, const string& password, const string& reason);

	// 로그아웃
	bool HandleLogout(sessionPtr& session, uint64 reqId, const string& fcmToken, const string& deviceId);

	// 소셜 로그인
	bool SocialLogin(sessionPtr& session, uint64 reqId, const string& provider, const string& idToken);
	bool CompleteSocialSignup(sessionPtr& session, uint64 reqId, const string& provider,
	                          const string& idToken, const string& userId, const string& name);

private:
	// 기존 유저 로그인 공통 로직
	bool LoginExistingUser(sessionPtr& session, uint64 reqId, cUserInfo& userInfo);
	UserManager& _userManager;
	
	// 비밀번호 해싱 (간단한 해시, 추후 bcrypt로 개선 가능)
	static string BcryptPassword(const string& password);
	
	// Auth Token 생성 (JWT)
	static string GenerateAuthToken(const string& userId);
	
	// 에러 처리
	void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");
};
