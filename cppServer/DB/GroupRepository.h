#pragma once

#include "pch.h"
#include "../protocol.pb.h"
#include "DBManager.h"


struct cGroupInfo {
    string groupId;
    string groupName;
    string groupCode;
    string creatorId;
    int32 memberCount = 0;

    string description;
    string groupImageUrl;
    //string groupThumbUrl;

    int64 storageUsage = 0;
    int64 storageLimit = 0;

    int64 createdAt = 0;
};

struct cGroupMemberInfo {
    string userId;
    string name;
    string profileImageUrl;
    string statusMessage;
    string role;  // "owner", "admin", "member"

    int64 joinedAt;
};

class GroupRepository {
public:
    /* Helpers */
    static string GenerateUUID();
    static string GenerateGroupCode();

    /* Actions */
    static bool CreateGroup(const string& groupName, const string& creatorId, cGroupInfo& OUT groupInfo);
    static bool AddMember(const string& groupId, const string& userId, const string& role);
    static bool RemoveMember(const string& groupId, const string& userId);
    static bool SaveGroupAsset(const string& groupId, const string& userId, int64 msgSeq, int64 fileSize, const string& fileType);
    static bool UpdateGroupInfo(const string& groupId, const string& newName, const string& newImageUrl);
    static bool DeleteGroup(const string& groupId);

    /* Query */
    static vector<cGroupInfo> GetUserGroups(const string& userId);
    static bool GetGroupInfoById(const string& groupId, cGroupInfo& OUT info);
    static bool GetGroupInfoByCode(const string& groupCode, cGroupInfo& OUT info);

    static bool IsMember(const string& groupId, const string& userId);
    static string GetMemberRole(const string& groupId, const string& userId);
    static vector<cGroupMemberInfo> GetGroupMembers(const string& groupId);


private:
    static bool IsGroupCodeExists(const string& groupCode);
    static uint64 ParseTimestamp(const mysqlx::Value& value);
};

