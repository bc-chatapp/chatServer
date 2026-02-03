#include "pch.h"
#include "UserRepository.h"
#include "FriendRepository.h"
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



bool UserRepository::GetUser(const string& userId, cUserInfo& OUT userInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto result = users.select("user_id", "auth_token", "name", "email", "phone",
            "status_message", "profile_image_url", "background_image_url",
            "sub_grade", "storage_capacity_bytes", "storage_usage_bytes", "last_seen", "is_deleted")
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        auto row = result.fetchOne();
        if (!row) return false;

        userInfo.userId = row[0].get<string>();
        if (!row[1].isNull()) userInfo.authToken = row[1].get<string>();
        if (!row[2].isNull()) userInfo.name = row[2].get<string>();
        if (!row[3].isNull()) userInfo.email = row[3].get<string>();
        if (!row[4].isNull()) userInfo.phone = row[4].get<string>();
        if (!row[5].isNull()) userInfo.status_message = row[5].get<string>();
        if (!row[6].isNull()) userInfo.profileImageUrl = row[6].get<string>();
        if (!row[7].isNull()) userInfo.backgroundImageUrl = row[7].get<string>();

        userInfo.subGrade = row[8].get<int64>();
        userInfo.storageCapacity = row[9].get<int64>();
        userInfo.storageUsage = row[10].get<int64>();
        userInfo.lastSeen = row[11].isNull() ? 0 : FriendRepository::ParseTimestamp(row[11]);
        userInfo.isDeleted = row[12].isNull() ? false : (row[12].get<int>() == 1);

        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 사용자 정보 조회 실패: " << err.what() << endl;
        return false;
    }
}





bool UserRepository::GetUserWithPassword(const string& userId, cUserInfo& OUT userInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto result = users.select("user_id", "password_hash", "auth_token", "name", "email", "phone",
            "status_message", "profile_image_url", "background_image_url",
            "sub_grade", "storage_capacity_bytes", "storage_usage_bytes", "last_seen", "is_deleted")
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
        if (!row[5].isNull()) userInfo.phone = row[5].get<string>();
        if (!row[6].isNull()) userInfo.status_message = row[6].get<string>();
        if (!row[7].isNull()) userInfo.profileImageUrl = row[7].get<string>();
        if (!row[8].isNull()) userInfo.backgroundImageUrl = row[8].get<string>();

        userInfo.subGrade = row[9].get<int64>();
        userInfo.storageCapacity = row[10].get<int64>();
        userInfo.storageUsage = row[11].get<int64>();
        userInfo.lastSeen = row[12].isNull() ? 0 : FriendRepository::ParseTimestamp(row[12]);
        userInfo.isDeleted = row[13].isNull() ? false : (row[13].get<int>() == 1);

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




bool UserRepository::UpdateMyInfo(const string& userId, const Protocol::C_EditMyInfo& pkt)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        // 업데이트 쿼리 준비
        auto query = users.update();

        bool hasChanges = false;

        // 2. set() 메서드들을 먼저 호출합니다. (순서 중요!)
        if (!pkt.name().empty()) {
            query.set("name", pkt.name());
            hasChanges = true;
        }
        if (!pkt.status_message().empty()) {
            query.set("status_message", pkt.status_message());
            hasChanges = true;
        }
        if (!pkt.profile_image_url().empty()) {
            query.set("profile_image_url", pkt.profile_image_url());
            hasChanges = true;
        }
        if (!pkt.background_image_url().empty()) {
            query.set("background_image_url", pkt.background_image_url());
            hasChanges = true;
        }
        if (!pkt.phone().empty()) {
            query.set("phone", pkt.phone());
            hasChanges = true;
        }

        if (!hasChanges) return true;


        query.where("user_id = :uid")
            .bind("uid", userId)
            .execute();


        cout << "[UserRepository] 사용자 정보 업데이트 성공: " << userId << endl;
        return true;

    }
    catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 정보 업데이트 실패: " << err.what() << endl;
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


bool UserRepository::UpdateEmail(const string& userId, const string& newEmail) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        users.update()
             .set("email", newEmail)
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();

        cout << "[UserRepository] 이메일 업데이트 성공: " << userId << " -> " << newEmail << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 이메일 업데이트 실패: " << err.what() << endl;
        return false;
    }
}


bool UserRepository::UpdatePassword(const string& userId, const string& newPasswordHash) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        users.update()
             .set("password_hash", newPasswordHash)
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();

        cout << "[UserRepository] 비밀번호 업데이트 성공: " << userId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 비밀번호 업데이트 실패: " << err.what() << endl;
        return false;
    }
}


bool UserRepository::SoftDeleteUser(const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        // Soft Delete: is_deleted=1, deleted_at 설정, auth_token 무효화, 개인정보 익명화
        users.update()
             .set("is_deleted", 1)
             .set("deleted_at", mysqlx::expr("NOW()"))
             .set("auth_token", "")
             .set("name", "탈퇴한 사용자")
             .set("email", "")
             .set("phone", "")
             .set("status_message", "")
             .set("profile_image_url", "")
             .set("background_image_url", "")
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();

        cout << "[UserRepository] 회원 탈퇴 처리 완료 (Soft Delete): " << userId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 회원 탈퇴 처리 실패: " << err.what() << endl;
        return false;
    }
}


bool UserRepository::HardDeleteUser(const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        // Hard Delete: DB에서 완전히 삭제
        // 주의: 외래키로 연결된 데이터(messages, friends 등)도 함께 처리 필요
        users.remove()
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();

        cout << "[UserRepository] 회원 완전 삭제 완료 (Hard Delete): " << userId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[UserRepository] 회원 완전 삭제 실패: " << err.what() << endl;
        return false;
    }
}




void UserRepository::ConvertToProto(const cUserInfo& dbUser, Protocol::UserInfo* outProto)
{
    if (!outProto) return;

    outProto->set_user_id(dbUser.userId);
    outProto->set_name(dbUser.name);
    outProto->set_email(dbUser.email); // 필요 시에만 세팅하거나, 호출하는 쪽에서 제어
    outProto->set_phone(dbUser.phone);
    outProto->set_status_message(dbUser.status_message);
    outProto->set_profile_image_url(dbUser.profileImageUrl);
    outProto->set_background_image_url(dbUser.backgroundImageUrl);

    outProto->set_sub_grade(dbUser.subGrade);
    outProto->set_storage_capacity_bytes(dbUser.storageCapacity);
    outProto->set_storage_usage_bytes(dbUser.storageUsage);

    // passwordHash나 authToken은 절대 넣지 않음!
}

