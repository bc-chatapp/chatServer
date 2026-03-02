#include "pch.h"
#include "TokenManager.h"
#include <fstream>
#include <sstream>
#include <chrono>



string TokenManager::SECRET_KEY = "";
const string TokenManager::Issuer = "cppChatServer";

bool TokenManager::LoadSecret(const string& filePath)
{
	if (!SECRET_KEY.empty())
		return true; 

	ifstream file(filePath);
	if (!file.is_open())
	{
		LOG_INFO("[TokenManager] Error: 키 파일을 찾을 수 없습니다: {}", filePath);
		return false;
	}

	stringstream buffer;
	buffer << file.rdbuf();
	SECRET_KEY = buffer.str();

	// 혹시 모를 공백/엔터 제거 (Trim)
	auto pos = SECRET_KEY.find_last_not_of(" \n\r\t");
	if (pos != string::npos)
		SECRET_KEY.erase(pos + 1);

	if (SECRET_KEY.empty())
	{
		LOG_INFO("[TokenManager] Error: key empty");
		return false;
	}

	LOG_INFO("[TokenManager] JWT secret loaded from {}", filePath);
	return true;
}

string TokenManager::GenerateToken(const string& userId)
{
	// 필요 시 lazy-load
	if (SECRET_KEY.empty())
	{
		LoadSecret("config/jwt_key.txt");
	}

	if (SECRET_KEY.empty())
	{
		LOG_INFO("[TokenManager] Error: SECRET_KEY is empty, cannot generate token");
		return "";
	}

	auto now = chrono::system_clock::now();

	auto token = jwt::create()
		.set_issuer(Issuer)
		.set_type("JWS")
		.set_payload_claim("user_id", jwt::claim(userId))   // 유저 ID 저장
		.set_issued_at(now)                                 // 발급 시간
		.set_expires_at(now + chrono::hours(24 * 7))        // 만료 시간 (7일)
		.sign(jwt::algorithm::hs256{ SECRET_KEY });         // 서명 (HMAC SHA256)

	return token;
}

bool TokenManager::ValidateToken(const string& token, string& outUserId)
{
	// 필요 시 lazy-load
	if (SECRET_KEY.empty())
	{
		LoadSecret("config/jwt_key.txt");
	}

	if (SECRET_KEY.empty())
		return false;

	try
	{
		auto decoded = jwt::decode(token);

		auto verifier = jwt::verify()
			.allow_algorithm(jwt::algorithm::hs256{ SECRET_KEY })
			.with_issuer(Issuer);

		verifier.verify(decoded);

		outUserId = decoded.get_payload_claim("user_id").as_string();
		return true;

	}
	catch (const std::exception&)
	{
		return false;
	}
}

