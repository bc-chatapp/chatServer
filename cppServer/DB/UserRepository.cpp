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
            LOG_ERROR("[UserRepository] 이미 존재하는 사용자 ID: {}", userId);
            return false;
        }
        
        // 사용자 생성
        users.insert("user_id", "password_hash", "name", "email")
             .values(userId, passwordHash, name, email)
             .execute();
        
        LOG_INFO("[UserRepository] 사용자 생성 성공: {}", userId);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 사용자 생성 실패: {}", err.what());
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
        LOG_ERROR("[UserRepository] 사용자 존재 확인 실패: {}", err.what());
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
        LOG_ERROR("[UserRepository] 이메일 확인 실패: {}", err.what());
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
            "sub_grade", "storage_capacity_bytes", "storage_usage_bytes", "last_seen", "is_deleted",
            "is_email_verified", "oauth_provider", "oauth_provider_id")
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
        userInfo.isEmailVerified = row[13].isNull() ? false : (row[13].get<int>() == 1);
        if (!row[14].isNull()) userInfo.oauthProvider = row[14].get<string>();
        if (!row[15].isNull()) userInfo.oauthProviderId = row[15].get<string>();

        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 사용자 정보 조회 실패: {}", err.what());
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
            "sub_grade", "storage_capacity_bytes", "storage_usage_bytes", "last_seen", "is_deleted",
            "is_email_verified", "oauth_provider", "oauth_provider_id")
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        auto row = result.fetchOne();
        if (!row) {
            return false;
        }

        userInfo.userId = row[0].get<string>();
        if (!row[1].isNull()) userInfo.passwordHash = row[1].get<string>();
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
        userInfo.isEmailVerified = row[14].isNull() ? false : (row[14].get<int>() == 1);
        if (!row[15].isNull()) userInfo.oauthProvider = row[15].get<string>();
        if (!row[16].isNull()) userInfo.oauthProviderId = row[16].get<string>();

        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 사용자 정보 조회 실패: {}", err.what());
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
        LOG_ERROR("[UserRepository] 사용자 이름 조회 실패: {}", err.what());
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
        LOG_ERROR("[UserRepository] Auth Token 업데이트 실패: {}", err.what());
        return false;
    }
}




bool UserRepository::UpdateMyInfo(const string& userId, const Protocol::C_EditMyInfo& pkt)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto query = users.update();
        bool hasChanges = false;
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


        LOG_INFO("[UserRepository] 사용자 정보 업데이트 성공: {}", userId);
        return true;

    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 정보 업데이트 실패: {}", err.what());
        return false;
    }
}





bool UserRepository::UpdateLastSeen(const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");
        
        users.update()
             .set("last_seen", mysqlx::expr("NOW()"))
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();
        
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] Last Seen 업데이트 실패: {}", err.what());
        return false;
    }
}



bool UserRepository::GetUserIdByToken(const string& authToken, string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto result = users.select("user_id")
                     .where("auth_token = :token AND is_deleted = 0")
                     .bind("token", authToken)
                     .execute();

        auto row = result.fetchOne();
        if (!row) {
            return false;
        }

        userId = row[0].get<string>();
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 토큰으로 사용자 ID 조회 실패: {}", err.what());
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

        LOG_INFO("[UserRepository] 이메일 업데이트 성공: {} -> {}", userId, newEmail);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 이메일 업데이트 실패: {}", err.what());
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

        LOG_INFO("[UserRepository] 비밀번호 업데이트 성공: {}", userId);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 비밀번호 업데이트 실패: {}", err.what());
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

        LOG_INFO("[UserRepository] 회원 탈퇴 처리 완료 (Soft Delete): {}", userId);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] 회원 탈퇴 처리 실패: {}", err.what());
        return false;
    }
}


bool UserRepository::HardDeleteUser(const string& userId) {
    try {
        auto& db = DBManager::GetInstance();
        auto& sess = db.GetSession();

        LOG_INFO("[UserRepository] Hard Delete 시작: {}", userId);

        // 1. 메시지 발신자 익명화 (대화 맥락은 상대방에게 남기되, 발신자 식별 정보 제거)
        //    채팅 히스토리에는 "[탈퇴한 사용자]"로 표시됨
        sess.sql("UPDATE messages SET sender_id = '[withdrawn]' WHERE sender_id = ?")
            .bind(userId).execute();

        // 2. 읽음 상태 삭제
        sess.sql("DELETE FROM read_status WHERE user_id = ?")
            .bind(userId).execute();

        // 3. 개인 파일 용량 기록 삭제
        sess.sql("DELETE FROM user_assets WHERE user_id = ?")
            .bind(userId).execute();

        // 4. 구독 정보 삭제
        sess.sql("DELETE FROM subscriptions WHERE user_id = ?")
            .bind(userId).execute();

        // 5. 결제 기록 삭제
        sess.sql("DELETE FROM payment_transactions WHERE user_id = ?")
            .bind(userId).execute();

        // 6. 차단 목록 삭제 (양방향 — 내가 차단한 것 + 나를 차단한 것)
        sess.sql("DELETE FROM block_list WHERE user_id = ? OR blocked_id = ?")
            .bind(userId).bind(userId).execute();

        // 7. 신고 기록: reporter_id 익명화 (신고 내용은 운영 목적으로 보존)
        sess.sql("UPDATE reports SET reporter_id = '[withdrawn]' WHERE reporter_id = ?")
            .bind(userId).execute();

        // 8. 대화방 참여 정보 삭제 (FK 없으므로 수동 삭제)
        sess.sql("DELETE FROM conversation_participants WHERE user_id = ?")
            .bind(userId).execute();

        // 9. FCM 토큰 삭제 (HandleWithdraw에서 이미 처리되지만 보장용)
        sess.sql("DELETE FROM fcm_tokens WHERE user_id = ?")
            .bind(userId).execute();

        // 10. users 테이블 삭제
        //     FK ON DELETE CASCADE → friends, group_members 자동 삭제
        auto schema = db.GetSchema();
        schema.getTable("users")
              .remove()
              .where("user_id = :uid")
              .bind("uid", userId)
              .execute();

        LOG_INFO("[UserRepository] Hard Delete 완료: {}", userId);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] Hard Delete 실패: {}", err.what());
        return false;
    }
}




bool UserRepository::GetStorageInfo(const string& userId, StorageInfo& OUT info) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();

        auto users = schema.getTable("users");
        auto result = users.select("storage_capacity_bytes", "storage_usage_bytes", "sub_grade")
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        auto row = result.fetchOne();
        if (!row) return false;

        info.storageCapacity = row[0].get<int64>();
        info.storageUsage = row[1].get<int64>();
        int grade = static_cast<int>(row[2].get<int64>());
        info.subGrade = grade;

        // max_file_size 조회
        auto plans = schema.getTable("subscription_plans");
        auto planResult = plans.select("max_file_size")
            .where("plan_type = 'personal' AND grade = :grade AND is_active = 1")
            .bind("grade", grade)
            .execute();

        auto planRow = planResult.fetchOne();
        if (planRow) {
            info.maxFileSize = planRow[0].get<int64>();
        }

        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] GetStorageInfo 실패: {}", err.what());
        return false;
    }
}


bool UserRepository::SaveUserAsset(const string& userId, int64 msgSeq, int64 fileSize, const string& fileType) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();

        auto assets = schema.getTable("user_assets");
        assets.insert("user_id", "msg_seq", "file_size", "file_type")
            .values(userId, msgSeq, fileSize, fileType)
            .execute();

        // storage_usage_bytes 증가
        auto users = schema.getTable("users");
        users.update()
            .set("storage_usage_bytes", mysqlx::expr("storage_usage_bytes + " + to_string(fileSize)))
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        LOG_INFO("[UserRepository] SaveUserAsset: userId={}, size={}", userId, fileSize);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] SaveUserAsset 실패: {}", err.what());
        return false;
    }
}


bool UserRepository::GetUserByOAuthProvider(const string& provider, const string& providerId, cUserInfo& OUT userInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto result = users.select("user_id", "auth_token", "name", "email", "phone",
            "status_message", "profile_image_url", "background_image_url",
            "sub_grade", "storage_capacity_bytes", "storage_usage_bytes", "last_seen", "is_deleted",
            "is_email_verified", "oauth_provider", "oauth_provider_id")
            .where("oauth_provider = :prov AND oauth_provider_id = :pid AND is_deleted = 0")
            .bind("prov", provider)
            .bind("pid", providerId)
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
        userInfo.isEmailVerified = row[13].isNull() ? false : (row[13].get<int>() == 1);
        if (!row[14].isNull()) userInfo.oauthProvider = row[14].get<string>();
        if (!row[15].isNull()) userInfo.oauthProviderId = row[15].get<string>();

        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] GetUserByOAuthProvider 실패: {}", err.what());
        return false;
    }
}


bool UserRepository::GetUserByEmail(const string& email, cUserInfo& OUT userInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        auto result = users.select("user_id", "auth_token", "name", "email", "phone",
            "status_message", "profile_image_url", "background_image_url",
            "sub_grade", "storage_capacity_bytes", "storage_usage_bytes", "last_seen", "is_deleted",
            "is_email_verified", "oauth_provider", "oauth_provider_id")
            .where("email = :email AND is_deleted = 0")
            .bind("email", email)
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
        userInfo.isEmailVerified = row[13].isNull() ? false : (row[13].get<int>() == 1);
        if (!row[14].isNull()) userInfo.oauthProvider = row[14].get<string>();
        if (!row[15].isNull()) userInfo.oauthProviderId = row[15].get<string>();

        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] GetUserByEmail 실패: {}", err.what());
        return false;
    }
}


bool UserRepository::CreateOAuthUser(const string& userId, const string& name, const string& email,
                                      const string& provider, const string& providerId, const string& profileImageUrl) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        // 소셜 유저는 password_hash=NULL, is_email_verified=1
        users.insert("user_id", "name", "email", "oauth_provider", "oauth_provider_id",
                      "profile_image_url", "is_email_verified")
             .values(userId, name, email, provider, providerId, profileImageUrl, 1)
             .execute();

        LOG_INFO("[UserRepository] OAuth 사용자 생성 성공: {} ({})", userId, provider);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] OAuth 사용자 생성 실패: {}", err.what());
        return false;
    }
}


bool UserRepository::LinkOAuthProvider(const string& userId, const string& provider, const string& providerId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto users = schema.getTable("users");

        users.update()
             .set("oauth_provider", provider)
             .set("oauth_provider_id", providerId)
             .set("is_email_verified", 1)
             .where("user_id = :uid")
             .bind("uid", userId)
             .execute();

        LOG_INFO("[UserRepository] OAuth 연동 성공: {} ← {}", userId, provider);
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[UserRepository] OAuth 연동 실패: {}", err.what());
        return false;
    }
}


void UserRepository::ConvertToProto(const cUserInfo& dbUser, Protocol::UserInfo* outProto)
{
    if (!outProto) return;

    outProto->set_user_id(dbUser.userId);
    outProto->set_name(dbUser.name);
    outProto->set_email(dbUser.email);
    outProto->set_phone(dbUser.phone);
    outProto->set_status_message(dbUser.status_message);
    outProto->set_profile_image_url(dbUser.profileImageUrl);
    outProto->set_background_image_url(dbUser.backgroundImageUrl);

    outProto->set_sub_grade(dbUser.subGrade);
    outProto->set_storage_capacity_bytes(dbUser.storageCapacity);
    outProto->set_storage_usage_bytes(dbUser.storageUsage);
    outProto->set_is_email_verified(dbUser.isEmailVerified);
    if (!dbUser.oauthProvider.empty())
        outProto->set_oauth_provider(dbUser.oauthProvider);

    // passwordHash, authToken은 포함 금지
}

