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
    
    // 移쒓뎄 ?붿껌 紐⑸줉 議고쉶 (?섏뿉寃???pending ?붿껌留?
    static vector<FriendRequestInfo> GetFriendRequests(const string& userId);
    
    // 읽지 않은 친구 요청 목록 조회 (오프라인 푸시용)
    static vector<FriendRequestInfo> GetUnreadFriendRequests(const string& userId);
    
    // 보낸 친구 요청 목록 조회 (보낸 사람 기준)
    static vector<FriendRequestInfo> GetSentFriendRequests(const string& userId);
    
    // 친구 요청 읽음 처리
    static bool MarkFriendRequestAsRead(const string& userId, const string& requesterId);
    
    // 移쒓뎄 ?붿껌 ?섎씫 (?묐갑??accepted濡?蹂寃?
    static bool AcceptFriendRequest(const string& userId, const string& requesterId);
    
    // 移쒓뎄 ?붿껌 嫄곗젅 (pending ??젣)
    static bool RejectFriendRequest(const string& userId, const string& requesterId);
    
    // ============================================
    // 移쒓뎄 愿由?愿??
    // ============================================
    
    // 移쒓뎄 ??젣 (?묐갑????젣)
    static bool RemoveFriend(const string& userId, const string& friendId);
    
    // 移쒓뎄 紐⑸줉 議고쉶 (accepted ?곹깭留?
    static vector<FriendInfo> GetFriends(const string& userId);
    
    // 移쒓뎄 愿怨??뺤씤
    static bool IsFriend(const string& userId, const string& friendId);
    
    // 移쒓뎄 ?붿껌 議댁옱 ?뺤씤 (pending ?곹깭)
    static bool HasFriendRequest(const string& userId, const string& requesterId);
    

    
    // Protocol::FriendInfo濡?蹂??
    static Protocol::FriendInfo ToProtocolFriendInfo(const FriendInfo& info);
    
    // Protocol::FriendRequest濡?蹂??
    static Protocol::FriendRequest ToProtocolFriendRequest(const FriendRequestInfo& info);
};

