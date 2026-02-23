#pragma once

#include "pch.h"
#include "DBManager.h"

struct BlockedUserEntry {
    string userId;      // 차단당한 사람
    string name;
    string profileImg;
    int64  blockedAt = 0;
};

class BlockRepository {
public:
    /** 차단 */
    static bool BlockUser(const string& userId, const string& targetId);
    static bool UnblockUser(const string& userId, const string& targetId);
    static bool IsBlocked(const string& userId, const string& targetId);   // userId가 targetId를 차단했는지
    static bool IsBlockedEither(const string& a, const string& b);         // 어느 쪽이든 차단 여부
    static vector<BlockedUserEntry> GetBlockedUsers(const string& userId);

    /** 신고 */
    static bool ReportUser(const string& reporterId, const string& reportedId,
                           const string& reason, const string& detail);
    static bool HasReported(const string& reporterId, const string& reportedId);
};
