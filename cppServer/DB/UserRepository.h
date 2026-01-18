#pragma once

#include "pch.h"
#include "../protocol.pb.h"

struct cUserInfo {
    string userId;
    string passwordHash;
    string authToken;    

    string name;
    string email;
    string phone;        
    string status_message;
    string profileImageUrl;
    string backgroundImageUrl; 

    int64 subGrade = 0;        // 추가됨 (0: 일반, 1: 프로...)
    int64 storageCapacity = 0; 
    int64 storageUsage = 0;    

    int64 lastSeen;
};

class UserRepository {
public:


    static bool CreateUser(const string& userId, const string& passwordHash,
                          const string& name, const string& email = "");
    

    static bool UserExists(const string& userId);
    static bool EmailExists(const string& email);
    
    static bool GetUser(const string& userId, cUserInfo& OUT userInfo);
    static bool GetUserWithPassword(const string& userId, cUserInfo& OUT userInfo);


    static bool GetUserNameWithId(const string& userId, string& OUT userName);
    static bool UpdateAuthToken(const string& userId, const string& authToken);
    static bool UpdateLastSeen(const string& userId);
    static bool GetUserIdByToken(const string& authToken, string& userId);

    // cUserInfo -> Protocol::UserInfo 변환 헬퍼
    static void ConvertToProto(const cUserInfo& dbUser, Protocol::UserInfo* outProto);
};

