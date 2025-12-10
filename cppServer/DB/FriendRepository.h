#pragma once

#include "pch.h"
#include "../protocol.pb.h"

struct FriendInfo {
    string userId;
    string friendId;
    string name;
    string statusMessage;
    string profileImageUrl;
    int64 lastSeen;
    string status;  // "pending", "accepted", "blocked"
};

struct FriendRequestInfo {
    string requesterUserId;
    string requesterName;
    string requesterStatusMessage;
    string requesterProfileImageUrl;
    int64 requestedAt;
};

class FriendRepository {
public:
    static bool AddFriendRequest(const string& userId, const string& friendId);

    static bool CancelFriendRequest(const string& userId, const string& friendId);
    

    static vector<FriendRequestInfo> GetFriendRequests(const string& userId);
    
    // 읽지 않은 친구 요청 목록 조회 (오프라인 푸시용)
    static vector<FriendRequestInfo> GetUnreadFriendRequests(const string& userId);
    
    // 보낸 친구 요청 목록 조회 (보낸 사람 기준)
    static vector<FriendRequestInfo> GetSentFriendRequests(const string& userId);
    
    // 친구 요청 읽음 처리
    static bool MarkFriendRequestAsRead(const string& userId, const string& requesterId);

    static bool AcceptFriendRequest(const string& userId, const string& requesterId);
    

    static bool RejectFriendRequest(const string& userId, const string& requesterId);
    
    // ============================================

    // ============================================

    static bool RemoveFriend(const string& userId, const string& friendId);
    

    static vector<FriendInfo> GetFriends(const string& userId);
    
    static bool IsFriend(const string& userId, const string& friendId);
    
    static bool HasFriendRequest(const string& userId, const string& requesterId);
    

    static Protocol::FriendInfo ToProtocolFriendInfo(const FriendInfo& info);

    static Protocol::FriendRequest ToProtocolFriendRequest(const FriendRequestInfo& info);
};

