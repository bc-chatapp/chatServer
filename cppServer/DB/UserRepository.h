#pragma once

#include "pch.h"
#include "../protocol.pb.h"

struct UserInfo {
    string userId;
    string passwordHash;
    string authToken;
    string name;
    string email;
    string profileImageUrl;
    int64 lastSeen;
};

class UserRepository {
public:


    static bool CreateUser(const string& userId, const string& passwordHash,
                          const string& name, const string& email = "");
    

    static bool UserExists(const string& userId);

    static bool EmailExists(const string& email);
    
    static bool GetUser(const string& userId, UserInfo& userInfo);
    
    static bool GetUserWithPassword(const string& userId, UserInfo& userInfo);

    static bool UpdateAuthToken(const string& userId, const string& authToken);
    
    static bool UpdateLastSeen(const string& userId);

    static bool GetUserIdByToken(const string& authToken, string& userId);
};

