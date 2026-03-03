#include "pch.h"
#include "FcmTokenRepository.h"
#include "DBManager.h"
#include <iostream>




bool FcmTokenRepository::UpsertFcmToken(const string& userId, const string& fcmToken,
                                        const string& platform, const string& deviceId,
                                        const string& deviceName, const string& appVersion)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto tokens = schema.getTable("fcm_tokens");

        // 같은 device_id로 이미 등록된 토큰이 있는지 확인 (기기 기준)
        if (!deviceId.empty()) {
            auto existingByDevice = tokens.select("id", "fcm_token")
                .where("user_id = :uid AND device_id = :did")
                .bind("uid", userId)
                .bind("did", deviceId)
                .execute();

            if (existingByDevice.count() > 0) {
                // 같은 기기에서 토큰이 갱신된 경우 - 업데이트
                tokens.update()
                    .set("fcm_token", fcmToken)
                    .set("platform", platform)
                    .set("device_name", deviceName)
                    .set("app_version", appVersion)
                    .set("last_active", mysqlx::expr("NOW()"))
                    .where("user_id = :uid AND device_id = :did")
                    .bind("uid", userId)
                    .bind("did", deviceId)
                    .execute();

                LOG_INFO("[FcmTokenRepository] FCM 토큰 업데이트 (기기): {}, device={}", userId, deviceName);
                return true;
            }
        }

        // 같은 fcm_token이 이미 존재하는지 확인 (다른 계정에서 사용 중인 경우)
        auto existingByToken = tokens.select("id")
            .where("fcm_token = :token")
            .bind("token", fcmToken)
            .execute();

        if (existingByToken.count() > 0) {
            // 토큰이 이미 존재하면 user_id 및 기기 정보 업데이트
            tokens.update()
                .set("user_id", userId)
                .set("platform", platform)
                .set("device_id", deviceId)
                .set("device_name", deviceName)
                .set("app_version", appVersion)
                .set("last_active", mysqlx::expr("NOW()"))
                .where("fcm_token = :token")
                .bind("token", fcmToken)
                .execute();

            LOG_INFO("[FcmTokenRepository] FCM 토큰 업데이트 (계정 전환): {}", userId);
        }
        else {
            // 유저당 최대 토큰 수 초과 시 가장 오래된 토큰 삭제
            const int MAX_TOKENS_PER_USER = 5;
            auto& sess = db.GetSession();
            string countSql = "SELECT COUNT(*) FROM fcm_tokens WHERE user_id = ?";
            auto countRes = sess.sql(countSql).bind(userId).execute();
            auto countRow = countRes.fetchOne();
            int tokenCount = countRow[0].get<int>();

            if (tokenCount >= MAX_TOKENS_PER_USER) {
                string deleteSql =
                    "DELETE FROM fcm_tokens WHERE user_id = ? "
                    "ORDER BY last_active ASC LIMIT ?";
                int deleteCount = tokenCount - MAX_TOKENS_PER_USER + 1;
                sess.sql(deleteSql).bind(userId).bind(deleteCount).execute();
                LOG_INFO("[FcmTokenRepository] 오래된 FCM 토큰 {}개 삭제 (최대 {}개 제한): {}", deleteCount, MAX_TOKENS_PER_USER, userId);
            }

            // 새 토큰 삽입
            tokens.insert("user_id", "fcm_token", "platform", "device_id", "device_name", "app_version", "last_active")
                .values(userId, fcmToken, platform, deviceId, deviceName, appVersion, mysqlx::Value(mysqlx::expr("NOW()"))
                )
                .execute();

            LOG_INFO("[FcmTokenRepository] FCM 토큰 등록: {}, device={}", userId, deviceName);
        }

        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 저장 실패: {}", err.what());
        return false;
    }
}





vector<cFcmTokenInfo> FcmTokenRepository::GetUserTokens(const string& userId)
{
    vector<cFcmTokenInfo> tokens;

    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        auto result = table.select("user_id", "fcm_token", "platform", "device_id",
                                   "device_name", "app_version", "created_at", "last_active")
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        for (auto row : result) {
            cFcmTokenInfo info;
            info.userId = row[0].get<string>();
            info.fcmToken = row[1].get<string>();
            if (!row[2].isNull()) info.platform = row[2].get<string>();
            if (!row[3].isNull()) info.deviceId = row[3].get<string>();
            if (!row[4].isNull()) info.deviceName = row[4].get<string>();
            if (!row[5].isNull()) info.appVersion = row[5].get<string>();

            // created_at 파싱
            if (!row[6].isNull()) {
                // MySQL DateTime을 Unix timestamp로 변환 (간단한 방법)
                try {
                    auto rawVal = row[6].getRawBytes();
                    // rawBytes가 있으면 시간 파싱 시도
                    info.createdAt = Nowts(); // 기본값 (실제 파싱이 복잡하면 나중에 개선)
                } catch (...) {
                    info.createdAt = 0;
                }
            }

            // last_active 파싱
            if (!row[7].isNull()) {
                try {
                    info.lastActive = Nowts(); // 기본값
                } catch (...) {
                    info.lastActive = 0;
                }
            }

            tokens.push_back(info);
        }
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 조회 실패: {}", err.what());
    }

    return tokens;
}





bool FcmTokenRepository::GetTokenByDevice(const string& userId, const string& deviceId, cFcmTokenInfo& OUT tokenInfo)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        auto result = table.select("user_id", "fcm_token", "platform", "device_id", "device_name", "app_version")
            .where("user_id = :uid AND device_id = :did")
            .bind("uid", userId)
            .bind("did", deviceId)
            .execute();

        auto row = result.fetchOne();
        if (!row) return false;

        tokenInfo.userId = row[0].get<string>();
        tokenInfo.fcmToken = row[1].get<string>();
        if (!row[2].isNull()) tokenInfo.platform = row[2].get<string>();
        if (!row[3].isNull()) tokenInfo.deviceId = row[3].get<string>();
        if (!row[4].isNull()) tokenInfo.deviceName = row[4].get<string>();
        if (!row[5].isNull()) tokenInfo.appVersion = row[5].get<string>();

        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 조회 실패: {}", err.what());
        return false;
    }
}





bool FcmTokenRepository::DeleteToken(const string& userId, const string& fcmToken)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        table.remove()
            .where("user_id = :uid AND fcm_token = :token")
            .bind("uid", userId)
            .bind("token", fcmToken)
            .execute();

        LOG_INFO("[FcmTokenRepository] FCM 토큰 삭제: {}", userId);
        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 삭제 실패: {}", err.what());
        return false;
    }
}




bool FcmTokenRepository::DeleteTokenByDeviceId(const string& userId, const string& deviceId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        table.remove()
            .where("user_id = :uid AND device_id = :did")
            .bind("uid", userId)
            .bind("did", deviceId)
            .execute();

        LOG_INFO("[FcmTokenRepository] FCM 토큰 삭제 (device_id): {}, {}", userId, deviceId);
        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 삭제 실패: {}", err.what());
        return false;
    }
}




bool FcmTokenRepository::DeleteAllUserTokens(const string& userId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        table.remove()
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        LOG_INFO("[FcmTokenRepository] 사용자의 모든 FCM 토큰 삭제: {}", userId);
        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 전체 삭제 실패: {}", err.what());
        return false;
    }
}




bool FcmTokenRepository::UpdateLastActive(const string& userId, const string& deviceId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        table.update()
            .set("last_active", mysqlx::expr("NOW()"))
            .where("user_id = :uid AND device_id = :did")
            .bind("uid", userId)
            .bind("did", deviceId)
            .execute();

        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] last_active 업데이트 실패: {}", err.what());
        return false;
    }
}




bool FcmTokenRepository::TokenExists(const string& fcmToken)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        auto result = table.select("id")
            .where("fcm_token = :token")
            .bind("token", fcmToken)
            .execute();

        return result.count() > 0;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[FcmTokenRepository] FCM 토큰 존재 확인 실패: {}", err.what());
        return false;
    }
}
