#pragma once



struct VerifyInfo {
    string code;
    time_t expiresAt;
};


class VerificationManager
{
public:
    static string CreateVerificationCode(const string& email);

    // 인증번호 확인
    static bool CheckVerificationCode(const string& email, const string& code);

private:
    // email -> {code, expiry}
    static map<string, VerifyInfo> verify_codes;
};