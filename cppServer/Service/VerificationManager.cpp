#include "pch.h"
#include "VerificationManager.h"
#include <random>


map<string, VerifyInfo> VerificationManager::verify_codes;

string VerificationManager::CreateVerificationCode(const std::string& email)
{
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<int> dis(100000, 999999);

    string code = to_string(dis(gen));

    // 유효기간 5분
    VerifyInfo info;
    info.code = code;
    info.expiresAt = time(nullptr) + (5 * 60);

    verify_codes[email] = info; // 덮어쓰기 (재요청 시 갱신)

    return code;
}


bool VerificationManager::CheckVerificationCode(const string& email, const string& code)
{
    auto it = verify_codes.find(email);
    if (it == verify_codes.end()) return false; 

    time_t now = time(nullptr);
    if (it->second.expiresAt < now) {
        verify_codes.erase(it); // 만료됨
        return false;
    }

    if (it->second.code == code) {
        verify_codes.erase(it); // 인증 성공 시 삭제 (1회용)
        return true;
    }

    return false;
}