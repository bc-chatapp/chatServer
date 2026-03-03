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

    bool isDeleted = false;    // 탈퇴 여부
    bool isEmailVerified = false; // 이메일 인증 여부

    string oauthProvider;       // "google" | "apple" (빈 문자열이면 이메일/비밀번호 유저)
    string oauthProviderId;     // OAuth provider sub/id
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
    static bool UpdateMyInfo(const string& userId, const Protocol::C_EditMyInfo& pkt);

    static bool UpdateLastSeen(const string& userId);
    static bool GetUserIdByToken(const string& authToken, string& userId);

    // 이메일/비밀번호 변경
    static bool UpdateEmail(const string& userId, const string& newEmail);
    static bool UpdatePassword(const string& userId, const string& newPasswordHash);

    // 회원 탈퇴
    static bool SoftDeleteUser(const string& userId);  // 논리적 삭제 (is_deleted=1, 개인정보 익명화)
    static bool HardDeleteUser(const string& userId);  // 물리적 삭제 (DB에서 완전 삭제)

    // 스토리지 정보 조회
    struct StorageInfo {
        int64 storageCapacity = 0;
        int64 storageUsage = 0;
        int64 maxFileSize = 26214400; // 기본 25MB
        int64 subGrade = 0;           // 구독 등급 (0=무료, 1=Pro, 2=Premium)
    };
    static bool GetStorageInfo(const string& userId, StorageInfo& OUT info);
    static bool SaveUserAsset(const string& userId, int64 msgSeq, int64 fileSize, const string& fileType);

    // OAuth 관련
    static bool GetUserByOAuthProvider(const string& provider, const string& providerId, cUserInfo& OUT userInfo);
    static bool GetUserByEmail(const string& email, cUserInfo& OUT userInfo);
    static bool CreateOAuthUser(const string& userId, const string& name, const string& email,
                                const string& provider, const string& providerId, const string& profileImageUrl);
    static bool LinkOAuthProvider(const string& userId, const string& provider, const string& providerId);

    // cUserInfo -> Protocol::UserInfo 변환 헬퍼
    static void ConvertToProto(const cUserInfo& dbUser, Protocol::UserInfo* outProto);
};

