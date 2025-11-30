#pragma once

#include "pch.h"
#include "../protocol.pb.h"

struct UserInfo {
    string userId;
    string passwordHash;
    string authToken;
    string name;
    string statusMessage;
    string profileImageUrl;
    int64 lastSeen;
};

class UserRepository {
public:
    // ============================================
    // ?ъ슜??愿由?愿??
    // ============================================
    
    // ?ъ슜???앹꽦 (?뚯썝媛??
    static bool CreateUser(const string& userId, const string& passwordHash,
                          const string& name, const string& statusMessage = "");
    
    // ?ъ슜??議댁옱 ?뺤씤
    static bool UserExists(const string& userId);
    
    // ?ъ슜???뺣낫 議고쉶 (濡쒓렇?몄슜)
    static bool GetUser(const string& userId, UserInfo& userInfo);
    
    // ?ъ슜???뺣낫 議고쉶 (鍮꾨?踰덊샇 ?댁떆 ?ы븿)
    static bool GetUserWithPassword(const string& userId, UserInfo& userInfo);
    
    // Auth Token ?낅뜲?댄듃
    static bool UpdateAuthToken(const string& userId, const string& authToken);
    
    // Last Seen ?낅뜲?댄듃
    static bool UpdateLastSeen(const string& userId);
    
    // 토큰으로 사용자 ID 조회
    static bool GetUserIdByToken(const string& authToken, string& userId);
};

