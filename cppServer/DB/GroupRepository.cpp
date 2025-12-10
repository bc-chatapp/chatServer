#include "pch.h"
#include "GroupRepository.h"
#include "DBManager.h"
#include <iostream>
#include <ctime>
#include <random>
#include <sstream>
#include <iomanip>

// ============================================
// 그룹 관리
// ============================================

bool GroupRepository::CreateGroup(const string& groupId, const string& groupName, 
                                 const string& groupCode, const string& creatorId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groups = schema.getTable("groups");
        
        // 그룹 생성
        groups.insert("group_id", "group_name", "group_code", "creator_id")
               .values(groupId, groupName, groupCode, creatorId).execute();
        
        // 생성자를 owner로 멤버에 추가
        if (!AddMember(groupId, creatorId, "owner")) {
            cerr << "[GroupRepository] 그룹 생성자는 멤버 추가 실패" << endl;
            // 그룹은 생성되었지만 멤버 추가 실패는 경고만
        }
        
        cout << "[GroupRepository] Create Group: groupId=" << groupId 
             << ", groupName=" << groupName 
             << ", groupCode=" << groupCode 
             << ", creatorId=" << creatorId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] Create Group Failed: " << err.what() << endl;
        return false;
    }
}

bool GroupRepository::GetGroupInfo(const string& groupId, GroupInfo& groupInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groups = schema.getTable("groups");
        
        auto rows = groups.select("group_id", "group_name", "group_code", "creator_id", "created_at")
                         .where("group_id = :gid")
                         .bind("gid", groupId)
                         .execute();
        
        if (rows.count() == 0) {
            return false;
        }
        
        auto row = rows.fetchOne();
        groupInfo.groupId = row[0].get<string>();
        groupInfo.groupName = row[1].get<string>();
        groupInfo.groupCode = row[2].get<string>();
        groupInfo.creatorId = row[3].get<string>();
        
        // created_at 파싱
        if (!row[4].isNull()) {
            try {
                auto tsValue = row[4];
                if (tsValue.getType() == mysqlx::Value::STRING) {
                    string tsStr = tsValue.get<string>();
                    struct tm timeinfo = {};
                    int year, mon, day, hour, min, sec;
                    if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                            &year, &mon, &day, &hour, &min, &sec) == 6) {
                        timeinfo.tm_year = year - 1900;
                        timeinfo.tm_mon = mon - 1;
                        timeinfo.tm_mday = day;
                        timeinfo.tm_hour = hour;
                        timeinfo.tm_min = min;
                        timeinfo.tm_sec = sec;
                        groupInfo.createdAt = mktime(&timeinfo) * 1000;  // 밀리초
                    }
                }
            } catch (...) {
                groupInfo.createdAt = 0;
            }
        }
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] GetGroupInfo Failed: " << err.what() << endl;
        return false;
    }
}

bool GroupRepository::GetGroupByCode(const string& groupCode, GroupInfo& groupInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groups = schema.getTable("groups");
        
        auto rows = groups.select("group_id", "group_name", "group_code", "creator_id", "created_at")
                         .where("group_code = :code")
                         .bind("code", groupCode)
                         .execute();
        
        if (rows.count() == 0) {
            return false;
        }
        
        auto row = rows.fetchOne();
        groupInfo.groupId = row[0].get<string>();
        groupInfo.groupName = row[1].get<string>();
        groupInfo.groupCode = row[2].get<string>();
        groupInfo.creatorId = row[3].get<string>();
        
        // created_at 파싱
        if (!row[4].isNull()) {
            try {
                auto tsValue = row[4];
                if (tsValue.getType() == mysqlx::Value::STRING) {
                    string tsStr = tsValue.get<string>();
                    struct tm timeinfo = {};
                    int year, mon, day, hour, min, sec;
                    if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                            &year, &mon, &day, &hour, &min, &sec) == 6) {
                        timeinfo.tm_year = year - 1900;
                        timeinfo.tm_mon = mon - 1;
                        timeinfo.tm_mday = day;
                        timeinfo.tm_hour = hour;
                        timeinfo.tm_min = min;
                        timeinfo.tm_sec = sec;
                        groupInfo.createdAt = mktime(&timeinfo) * 1000;  // 밀리초
                    }
                }
            } catch (...) {
                groupInfo.createdAt = 0;
            }
        }
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] GetGroupByCode Failed: " << err.what() << endl;
        return false;
    }
}

bool GroupRepository::DeleteGroup(const string& groupId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groups = schema.getTable("groups");
        
        // CASCADE로 group_members도 자동 삭제됨
        groups.remove()
               .where("group_id = :gid")
               .bind("gid", groupId)
               .execute();
        
        cout << "[GroupRepository] Delete Group: groupId=" << groupId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] Delete Group Failed: " << err.what() << endl;
        return false;
    }
}

// ============================================
// 그룹 멤버 관리
// ============================================

bool GroupRepository::AddMember(const string& groupId, const string& userId, const string& role) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groupMembers = schema.getTable("group_members");
        
        // 중복 체크
        auto existing = groupMembers.select("id")
                        .where("group_id = :gid AND user_id = :uid")
                        .bind("gid", groupId)
                        .bind("uid", userId)
                        .execute();
        
        if (existing.count() > 0) {
            cerr << "[GroupRepository] 이미 그룹 멤버입니다: groupId=" << groupId << ", userId=" << userId << endl;
            return false;
        }
        
        // 멤버 추가
        groupMembers.insert("group_id", "user_id", "role")
                    .values(groupId, userId, role).execute();
        
        cout << "[GroupRepository] Add Member: groupId=" << groupId 
             << ", userId=" << userId 
             << ", role=" << role << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] Add Member Failed: " << err.what() << endl;
        return false;
    }
}

bool GroupRepository::RemoveMember(const string& groupId, const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groupMembers = schema.getTable("group_members");
        
        groupMembers.remove()
                    .where("group_id = :gid AND user_id = :uid")
                    .bind("gid", groupId)
                    .bind("uid", userId)
                    .execute();
        
        cout << "[GroupRepository] Remove Member: groupId=" << groupId << ", userId=" << userId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] Remove Member Failed: " << err.what() << endl;
        return false;
    }
}

vector<GroupMemberInfo> GroupRepository::GetMembers(const string& groupId) {
    vector<GroupMemberInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groupMembers = schema.getTable("group_members");
        
        auto rows = groupMembers.select("group_id", "user_id", "role", "joined_at")
                                 .where("group_id = :gid")
                                 .bind("gid", groupId)
                                 .execute();
        
        for (auto row : rows) {
            GroupMemberInfo info;
            info.groupId = row[0].get<string>();
            info.userId = row[1].get<string>();
            info.role = row[2].get<string>();
            
            // joined_at 파싱
            if (!row[3].isNull()) {
                try {
                    auto tsValue = row[3];
                    if (tsValue.getType() == mysqlx::Value::STRING) {
                        string tsStr = tsValue.get<string>();
                        struct tm timeinfo = {};
                        int year, mon, day, hour, min, sec;
                        if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                                &year, &mon, &day, &hour, &min, &sec) == 6) {
                            timeinfo.tm_year = year - 1900;
                            timeinfo.tm_mon = mon - 1;
                            timeinfo.tm_mday = day;
                            timeinfo.tm_hour = hour;
                            timeinfo.tm_min = min;
                            timeinfo.tm_sec = sec;
                            info.joinedAt = mktime(&timeinfo) * 1000;  // 밀리초
                        }
                    }
                } catch (...) {
                    info.joinedAt = 0;
                }
            }
            
            result.push_back(info);
        }
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] GetMembers Failed: " << err.what() << endl;
    }
    
    return result;
}

vector<GroupInfo> GroupRepository::GetUserGroups(const string& userId) {
    vector<GroupInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groupMembers = schema.getTable("group_members");
        auto groups = schema.getTable("groups");
        
        // 사용자가 속한 그룹 ID 목록 조회
        auto memberRows = groupMembers.select("group_id")
                                   .where("user_id = :uid")
                                   .bind("uid", userId)
                                   .execute();
        
        for (auto memberRow : memberRows) {
            string groupId = memberRow[0].get<string>();
            
            GroupInfo groupInfo;
            if (GetGroupInfo(groupId, groupInfo)) {
                result.push_back(groupInfo);
            }
        }
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] GetUserGroups Failed: " << err.what() << endl;
    }
    
    return result;
}

bool GroupRepository::IsMember(const string& groupId, const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groupMembers = schema.getTable("group_members");
        
        auto rows = groupMembers.select("id")
                                 .where("group_id = :gid AND user_id = :uid")
                                 .bind("gid", groupId)
                                 .bind("uid", userId)
                                 .execute();
        
        return rows.count() > 0;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] IsMember Failed: " << err.what() << endl;
        return false;
    }
}

string GroupRepository::GetMemberRole(const string& groupId, const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groupMembers = schema.getTable("group_members");
        
        auto rows = groupMembers.select("role")
                                 .where("group_id = :gid AND user_id = :uid")
                                 .bind("gid", groupId)
                                 .bind("uid", userId)
                                 .execute();
        
        if (rows.count() > 0) {
            auto row = rows.fetchOne();
            return row[0].get<string>();
        }
        
        return "";
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] GetMemberRole Failed: " << err.what() << endl;
        return "";
    }
}

// ============================================
// 유틸리티
// ============================================

string GroupRepository::GenerateGroupCode() {
    const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    const int codeLength = 6;
    
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(0, chars.length() - 1);
    
    string code;
    int attempts = 0;
    const int maxAttempts = 100;
    
    do {
        code.clear();
        for (int i = 0; i < codeLength; ++i) {
            code += chars[dis(gen)];
        }
        attempts++;
    } while (IsGroupCodeExists(code) && attempts < maxAttempts);
    
    if (attempts >= maxAttempts) {
        cerr << "[GroupRepository] 그룹 코드 생성 실패: 최대 시도 횟수 초과" << endl;
        // 타임스탬프 기반으로 폴백
        int64_t timestamp = Nowts();
        code = "G" + to_string(timestamp).substr(to_string(timestamp).length() - 5);
    }
    
    return code;
}

bool GroupRepository::IsGroupCodeExists(const string& groupCode) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groups = schema.getTable("groups");
        
        auto rows = groups.select("group_id")
                          .where("group_code = :code")
                          .bind("code", groupCode)
                          .execute();
        
        return rows.count() > 0;
    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] IsGroupCodeExists Failed: " << err.what() << endl;
        return false;
    }
}

