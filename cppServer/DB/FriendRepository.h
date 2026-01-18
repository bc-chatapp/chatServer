#pragma once

#include "pch.h"
#include "../protocol.pb.h"
#include "DBManager.h"

struct cFriendInfo {
    string userId;
    string friendId;
    string name;
    string statusMessage;
    string profileImageUrl;
    int64 lastSeen;
    string status;  // "pending", "accepted", "blocked"
};

struct FriendRequestInfo {
    string userId;          // 요청과 관련된 유저 ID (보낸 사람 또는 받는 사람)
    string name;            // 이름
    string statusMessage;   // 상태 메시지
    string profileImageUrl; // 프로필 이미지 URL
    uint64 requestedAt = 0; // 요청 시간 (Timestamp)
};

class FriendRepository {
public:
    /** Actions */
    static bool AddFriendRequest(const string& userId, const string& friendId);
    static bool CancelFriendRequest(const string& userId, const string& friendId);
    static bool AcceptFriendRequest(const string& userId, const string& requesterId);
    static bool RejectFriendRequest(const string& userId, const string& requesterId);
    static bool RemoveFriend(const string& userId, const string& friendId);



    

    static vector<cFriendInfo> GetFriends(const string& userId);
    static vector<FriendRequestInfo> GetFriendRequests(const string& userId);
    static vector<FriendRequestInfo> GetSentFriendRequests(const string& userId);

    static vector<FriendRequestInfo> GetUnreadFriendRequests(const string& userId);
    static bool MarkFriendRequestAsRead(const string& userId, const string& requesterId);


    // 상태 확인
    static bool IsFriend(const string& userId, const string& friendId);
    static bool HasSentRequest(const string& userId, const string& requesterId);

    /** Helpers */
    static uint64 ParseTimestamp(const mysqlx::Value& value);

    static Protocol::UserInfo ToProtocolUserInfo(const cFriendInfo& info);
    static Protocol::FriendRequest ToProtocolFriendRequest(const FriendRequestInfo& info, bool isReceived);

};

