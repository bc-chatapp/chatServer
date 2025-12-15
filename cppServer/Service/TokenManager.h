#pragma once

#include <jwt-cpp/jwt.h>

class TokenManager
{
public:
    static string GenerateToken(const string& userId);

    static bool ValidateToken(const string& token, string& outUserId);

private:
    static bool LoadSecret(const string& filePath);

    static string SECRET_KEY;
    static const string Issuer;
};

