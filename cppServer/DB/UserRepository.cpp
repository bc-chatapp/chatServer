#include "pch.h"
#include "UserRepository.h"
#include "DBManager.h"
#include <iostream>
#include <ctime>



bool UserRepository::CreateUser(const string& userId, const string& passwordHash,
                                const string& name, const string& email) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        

        auto existing = users.select("user_id")
                        .where("user_id = :uid")
                        .bind("uid", userId)
                        .execute();
        
        if (existing.count() > 0) {
            cerr << "[UserRepository] 이미 존재하는 사용자 ID: " << userId << endl;
            return false;
        }
        
        // 사용자 생성
        users.insert("user_id", "password_hash", "name", "email")
             .values(userId, passwordHash, name, email)
             .execute();
        
        cout << "[UserRepository] 사용자 생성 성공: " << userId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 사용자 생성 실패: " << err.what() << endl;
        return false;
    }
}

bool UserRepository::UserExists(const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        auto result = users.select("user_id")
                     .where("user_id = :uid")
                     .bind("uid", userId)
                     .execute();
        
        return result.count() > 0;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 사용자 존재 확인 실패: " << err.what() << endl;
        return false;
    }
}

bool UserRepository::EmailExists(const string& email)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto result = users.select("email")
            .where("email = :email")
            .bind("email", email)
            .execute();

        return result.count() > 0;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 이메일 확인 실패: " << err.what() << endl;
        return true; 
    }
}



bool UserRepository::GetUser(const string& userId, UserInfo& OUT userInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        auto result = users.select("user_id", "auth_token", "name", "email",
                                    "status_message", "profile_image_url", "last_seen")
                     .where("user_id = :uid")
                     .bind("uid", userId)
                     .execute();
        
        auto row = result.fetchOne();
        if (!row) return false;
        
        userInfo.userId = row[0].get<string>();
        if (!row[1].isNull()) userInfo.authToken = row[1].get<string>();
        if (!row[2].isNull()) userInfo.name = row[2].get<string>();
        if (!row[3].isNull()) userInfo.email = row[3].get<string>(); 

        if (!row[4].isNull()) userInfo.status_message = row[4].get<string>();
        if (!row[5].isNull()) userInfo.profileImageUrl = row[5].get<string>();
        
        
        // last_seen 파싱
        if (!row[5].isNull()) {
            try {
                auto tsValue = row[5];
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
                        userInfo.lastSeen = mktime(&timeinfo) * 1000;  // Milliseconds
                    } else {
                        userInfo.lastSeen = 0;
                    }
                } else {
                    userInfo.lastSeen = 0;
                }
            } catch (...) {
                userInfo.lastSeen = 0;
            }
        } else {
            userInfo.lastSeen = 0;
        }
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 사용자 정보 조회 실패: " << err.what() << endl;
        return false;
    }
}

bool UserRepository::GetUserWithPassword(const string& userId, UserInfo& OUT userInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        auto result = users.select("user_id", "password_hash", "auth_token", "name", 
                                   "status_message", "profile_image_url", "last_seen")
                     .where("user_id = :uid")
                     .bind("uid", userId)
                     .execute();
        
        auto row = result.fetchOne();
        if (!row) {
            return false;
        }
        
        userInfo.userId = row[0].get<string>();
        userInfo.passwordHash = row[1].get<string>();
        if (!row[2].isNull()) userInfo.authToken = row[2].get<string>();
        if (!row[3].isNull()) userInfo.name = row[3].get<string>();
        if (!row[4].isNull()) userInfo.email = row[4].get<string>(); 
        if (!row[5].isNull()) userInfo.profileImageUrl = row[5].get<string>();
        
        
        // last_seen 파싱
        if (!row[6].isNull()) {
            try {
                auto tsValue = row[6];
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
                        userInfo.lastSeen = mktime(&timeinfo) * 1000;  // Milliseconds
                    } else {
                        userInfo.lastSeen = 0;
                    }
                } else {
                    userInfo.lastSeen = 0;
                }
            } catch (...) {
                userInfo.lastSeen = 0;
            }
        } else {
            userInfo.lastSeen = 0;
        }
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 사용자 정보 조회 실패: " << err.what() << endl;
        return false;
    }
}

bool UserRepository::GetUserNameWithId(const string& userId, string& OUT userName)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        // 이름만 조회 (최적화)
        auto result = users.select("name")
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        auto row = result.fetchOne();
        if (!row) return false;

        if (!row[0].isNull()) {
            userName = row[0].get<string>();
            return true;
        }
    }
    catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 사용자 이름 조회 실패: " << err.what() << endl;
        return false;
    }
    return false;
}














bool UserRepository::UpdateAuthToken(const string& userId, const string& authToken) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        users.update()
             .set("auth_token", authToken)
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] Auth Token 업데이트 실패: " << err.what() << endl;
        return false;
    }
}



bool UserRepository::UpdateLastSeen(const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        // 현재 시간을 TIMESTAMP로 업데이트
        users.update()
             .set("last_seen", mysqlx::expr("NOW()"))
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] Last Seen 업데이트 실패: " << err.what() << endl;
        return false;
    }
}



bool UserRepository::GetUserIdByToken(const string& authToken, string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        auto result = users.select("user_id")
                     .where("auth_token = :token")
                     .bind("token", authToken)
                     .execute();
        
        auto row = result.fetchOne();
        if (!row) {
            return false;
        }
        
        userId = row[0].get<string>();
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 토큰으로 사용자 ID 조회 실패: " << err.what() << endl;
        return false;
    }
}

