#include "pch.h"
#include "FcmTokenRepository.h"
#include "DBManager.h"
#include <iostream>





bool FcmTokenRepository::UpsertFcmToken(const string& userId, const string& fcmToken,
                                        const string& platform, const string& deviceId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto tokens = schema.getTable("fcm_tokens");

        // 이미 같은 토큰이 존재하는지 확인
        auto existing = tokens.select("id")
            .where("fcm_token = :token")
            .bind("token", fcmToken)
            .execute();

        if (existing.count() > 0) {
            // 토큰이 이미 존재하면 user_id 업데이트 (updated_at은 DB에서 자동 갱신)
            tokens.update()
                .set("user_id", userId)
                .set("platform", platform)
                .set("device_id", deviceId)
                .where("fcm_token = :token")
                .bind("token", fcmToken)
                .execute();

            cout << "[FcmTokenRepository] FCM 토큰 업데이트: " << userId << endl;
        }
        else {
            // 새 토큰 삽입 (created_at, updated_at은 DB DEFAULT 사용)
            tokens.insert("user_id", "fcm_token", "platform", "device_id")
                .values(userId, fcmToken, platform, deviceId)
                .execute();

            cout << "[FcmTokenRepository] FCM 토큰 등록: " << userId << endl;
        }

        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[FcmTokenRepository] FCM 토큰 저장 실패: " << err.what() << endl;
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

        auto result = table.select("user_id", "fcm_token", "platform", "device_id")
            .where("user_id = :uid")
            .bind("uid", userId)
            .execute();

        for (auto row : result) {
            cFcmTokenInfo info;
            info.userId = row[0].get<string>();
            info.fcmToken = row[1].get<string>();
            if (!row[2].isNull()) info.platform = row[2].get<string>();
            if (!row[3].isNull()) info.deviceId = row[3].get<string>();
            tokens.push_back(info);
        }
    }
    catch (const mysqlx::Error& err) {
        cerr << "[FcmTokenRepository] FCM 토큰 조회 실패: " << err.what() << endl;
    }

    return tokens;
}





bool FcmTokenRepository::GetTokenByDevice(const string& userId, const string& deviceId, cFcmTokenInfo& OUT tokenInfo)
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto table = schema.getTable("fcm_tokens");

        auto result = table.select("user_id", "fcm_token", "platform", "device_id")
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

        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[FcmTokenRepository] FCM 토큰 조회 실패: " << err.what() << endl;
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

        cout << "[FcmTokenRepository] FCM 토큰 삭제: " << userId << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[FcmTokenRepository] FCM 토큰 삭제 실패: " << err.what() << endl;
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

        cout << "[FcmTokenRepository] 사용자의 모든 FCM 토큰 삭제: " << userId << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[FcmTokenRepository] FCM 토큰 전체 삭제 실패: " << err.what() << endl;
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
        cerr << "[FcmTokenRepository] FCM 토큰 존재 확인 실패: " << err.what() << endl;
        return false;
    }
}
