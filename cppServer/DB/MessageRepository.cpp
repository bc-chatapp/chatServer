#include "pch.h"
#include "MessageRepository.h"

#include <iostream>
#include <algorithm>
#include <sstream>
#include <set>
#include <vector>
#include <fstream>
#include <iomanip>
#include <ctime>
#include <mutex>
#include <google/protobuf/util/json_util.h>

#ifdef _WIN32
    #include <direct.h>
    #include <io.h>
    #include <fcntl.h>
    #include <windows.h>
    #define mkdir _mkdir
#else
    #include <sys/stat.h>
    #include <sys/types.h>
    #include <fcntl.h>
    #include <unistd.h>
#endif


/*======================
        Conv 생성
=======================*/

string MessageRepository::CreateConversationId(const string& user1, const string& user2) {
    vector<string> participants = {user1, user2};
    sort(participants.begin(), participants.end());
    
    return "direct:" + participants[0] + "_" + participants[1];
}

string MessageRepository::CreateOrGetConversation(const string& convId, const string& convType,
                                                  const string& participant1, const string& participant2) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();

        string query = "SELECT conv_id FROM conversations WHERE conv_id = ?";
        auto existing = session.sql(query).bind(convId).execute();

        if (existing.count() == 0) {
            // 방 생성 (conversations)
            string queryInsert = "INSERT INTO conversations (conv_id, type) VALUES (?, ?)";
            session.sql(queryInsert).bind(convId, convType).execute();

            // 참여자 추가 (participants)
            // 1:1 채팅인 경우에만 초기 멤버를 넣음
            if (convType == "direct" && !participant1.empty() && !participant2.empty()) {
                string queryPart = "INSERT IGNORE INTO conversation_participants (conv_id, user_id) VALUES (?, ?), (?, ?)";
                session.sql(queryPart).bind(convId, participant1, convId, participant2).execute();
            }

            cout << "[MessageRepository] 대화방 생성 완료: " << convId << endl;
        }
        session.commit();

        return convId;

    } catch (const mysqlx::Error& err) {
        try {
            auto& db = DBManager::GetInstance();
            db.GetSession().rollback();
        } catch (...) { /* 롤백 실패는 무시 */ }

        cerr << "[MessageRepository] 대화방 생성 실패: " << err.what() << endl;
        return convId;  
    }
}



bool MessageRepository::AddParticipant(const string& convId, const string& userId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        // IGNORE: 이미 있으면 무시
        string query = "INSERT IGNORE INTO conversation_participants (conv_id, user_id) VALUES (?, ?)";
        session.sql(query).bind(convId, userId).execute();
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] AddParticipant 실패: " << err.what() << endl;
        return false;
    }
}

bool MessageRepository::AddParticipants(const string& convId, const vector<string>& userIds)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();
        string query = "INSERT IGNORE INTO conversation_participants (conv_id, user_id) VALUES (?, ?)";
        auto stmt = session.sql(query);

        for (const auto& uid : userIds) {
            stmt.bind(convId, uid).execute();
        }
        session.commit();
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] AddParticipants 실패: " << err.what() << endl;
        return false;
    }
}



/*======================
       Message 저장
=======================*/

int64 MessageRepository::SaveMessage(const string& convId, const string& senderId, const Protocol::S_Chat& pkt,
                                      const string& gcsPath, int64 fileRetentionExpiresAt,
                                      const string& mentionedUserIds, int8_t msgTypeOverride)
{
    int8_t msg_type = 0; // 0:Text, 1:Image, 2:Video, 3:File, 4:System, 5:Poll
    string content = "";
    string media_url = "";
    string thumbnail_url = "";
    string file_name = "";

    if (pkt.has_payload()) {
        const auto& payload = pkt.payload();
        if (payload.has_text()) {
            msg_type = 0;
            content = payload.text().message();
        }
        else if (payload.has_image()) {
            msg_type = 1;
            content = "[사진]";
            media_url = payload.image().url();
            thumbnail_url = payload.image().thumbnail();
        }
        else if (payload.has_video()) {
            msg_type = 2;
            content = "[동영상]";
            media_url = payload.video().url();
            thumbnail_url = payload.video().thumbnail();
        }
        else if (payload.has_file()) {
            msg_type = 3;
            content = payload.file().filename(); // 파일은 이름을 내용으로 사용
            media_url = payload.file().url();
            file_name = payload.file().filename();
        }
        else if (payload.has_system()) {
            msg_type = 4;
            content = payload.system().message();
        }
    }

    // msg_type 오버라이드 (투표 등 특수 타입)
    if (msgTypeOverride >= 0) {
        msg_type = msgTypeOverride;
    }

    // 파일 상태 결정
    string fileStatus = "active";
    // (만료 시각이 있고 이미 지났으면 expired — 일반적으로 발생하지 않음)

    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();

        auto result = session.sql("SELECT COALESCE(MAX(msg_seq), 0) + 1 FROM messages WHERE conv_id = ? FOR UPDATE")
            .bind(convId).execute();
        int64 nextSeq = result.fetchOne()[0].get<int64>();

        int64 replyToSeq = pkt.reply_to_seq();

        // gcs_path, file_retention_expires_at, file_status, mentioned_user_ids 포함 INSERT
        string mentionVal = mentionedUserIds.empty() ? "" : mentionedUserIds;
        if (fileRetentionExpiresAt > 0) {
            session.sql(
                "INSERT INTO messages (conv_id, msg_seq, sender_id, msg_type, message, media_url, thumbnail_url, "
                "file_name, timestamp, reply_to_seq, gcs_path, file_retention_expires_at, file_status, mentioned_user_ids) "
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                .bind(convId, nextSeq, senderId, msg_type, content, media_url, thumbnail_url, file_name,
                      pkt.ts_server(), replyToSeq, gcsPath, fileRetentionExpiresAt, fileStatus,
                      mentionVal.empty() ? mysqlx::Value() : mysqlx::Value(mentionVal))
                .execute();
        } else {
            // file_retention_expires_at = NULL (영구)
            session.sql(
                "INSERT INTO messages (conv_id, msg_seq, sender_id, msg_type, message, media_url, thumbnail_url, "
                "file_name, timestamp, reply_to_seq, gcs_path, file_retention_expires_at, file_status, mentioned_user_ids) "
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?, ?)")
                .bind(convId, nextSeq, senderId, msg_type, content, media_url, thumbnail_url, file_name,
                      pkt.ts_server(), replyToSeq, gcsPath, fileStatus,
                      mentionVal.empty() ? mysqlx::Value() : mysqlx::Value(mentionVal))
                .execute();
        }

        session.commit();

        AppendMessageToLog(convId, senderId, pkt);

        return nextSeq;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 저장 실패: " << err.what() << endl;
        return -1;
    }
}


bool MessageRepository::UpdateFileStatusByGcsPath(const string& gcsPath, const string& fileStatus)
{
    if (gcsPath.empty()) return false;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 파일 status 업데이트 (만료된 경우 URL도 비움)
        if (fileStatus == "expired") {
            session.sql(
                "UPDATE messages SET file_status = ?, media_url = '', thumbnail_url = '' "
                "WHERE gcs_path = ? AND is_deleted = 0")
                .bind(fileStatus, gcsPath).execute();
        } else {
            session.sql(
                "UPDATE messages SET file_status = ? WHERE gcs_path = ?")
                .bind(fileStatus, gcsPath).execute();
        }
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] UpdateFileStatusByGcsPath 실패: " << err.what() << endl;
        return false;
    }
}











int64 MessageRepository::GetNextMessageSeq(const string& convId) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        
        string query = "SELECT MAX(msg_seq) FROM messages WHERE conv_id = ?";
        auto result = session.sql(query).bind(convId).execute();

        auto row = result.fetchOne();
        if (!row[0].isNull()) {
            return row[0].get<int64>() + 1;
        }

        return 1; 

    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 순차 번호 조회 실패: " << err.what() << endl;
        return 1;  // 기본값
    }
}






/*======================
       Message 조회
=======================*/



vector<string> MessageRepository::GetUserConversations(const string& userId) 
{
    vector<string> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        
        string query = "SELECT conv_id FROM conversation_participants WHERE user_id = ?";
        auto rows = session.sql(query).bind(userId).execute();

        for (auto row : rows) {
            result.push_back(row[0].get<string>());
        }
        
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 대화방 목록 조회 실패: " << err.what() << endl;
    }
    
    return result;
}

void MessageRepository::ParseChatPacket(Protocol::S_Chat& sChat, const mysqlx::Row& row)
{
    // SELECT 순서:
    // 0:conv_id, 1:msg_seq, 2:sender_id, 3:msg_type, 4:message, 5:media_url, 6:thumbnail_url, 7:timestamp, 8:name(option)
    // 9:reply_to_seq, 10:is_deleted, 11:is_edited, 12:edited_at
    // 13:file_retention_expires_at (optional), 14:file_status (optional)
    // 15:mentioned_user_ids (optional)

    sChat.set_conv_id(row[0].get<string>());
    sChat.set_msg_seq(row[1].get<int64>());
    sChat.set_sender_id(row[2].get<string>());
    sChat.set_ts_server(row[7].get<int64>());

    // 삭제/수정 상태
    bool isDeleted = (!row[10].isNull() && row[10].get<int>() == 1);
    bool isEdited = (!row[11].isNull() && row[11].get<int>() == 1);
    sChat.set_is_deleted(isDeleted);
    sChat.set_is_edited(isEdited);

    // 답장 정보
    int64 replyToSeq = (!row[9].isNull()) ? row[9].get<int64>() : 0;
    if (replyToSeq > 0) {
        sChat.set_reply_to_seq(replyToSeq);
        // 원본 메시지의 sender_name, text 조회
        auto replyInfo = GetMessageBySeq(row[0].get<string>(), replyToSeq);
        if (replyInfo.found) {
            sChat.set_reply_to_sender_name(replyInfo.senderName);
            sChat.set_reply_to_text(replyInfo.text);
        }
    }

    // 파일 만료 정보 (13번, 14번 컬럼이 있는 경우)
    try {
        int64 fileRetentionExpiresAt = (!row[13].isNull()) ? row[13].get<int64>() : 0;
        string fileStatus = (!row[14].isNull()) ? row[14].get<string>() : "active";
        sChat.set_file_expires_at(fileRetentionExpiresAt);
        sChat.set_file_status(fileStatus);
    } catch (...) {
        // 컬럼이 없는 경우 (구버전 쿼리) 무시
    }

    // 멘션 정보 (15번 컬럼)
    try {
        if (!row[15].isNull()) {
            string mentionJson = row[15].get<string>();
            // JSON 배열 파싱: '["userId1","userId2"]'
            // 간단한 파싱: 따옴표 사이의 문자열 추출
            size_t pos = 0;
            while ((pos = mentionJson.find('"', pos)) != string::npos) {
                size_t end = mentionJson.find('"', pos + 1);
                if (end == string::npos) break;
                string uid = mentionJson.substr(pos + 1, end - pos - 1);
                if (!uid.empty() && uid != "," && uid != "[" && uid != "]") {
                    sChat.add_mentioned_user_ids(uid);
                }
                pos = end + 1;
            }
        }
    } catch (...) {
        // 컬럼이 없는 경우 무시
    }

    int8_t msgType = static_cast<int8_t>(row[3].get<int>());
    auto* payload = sChat.mutable_payload();

    // 삭제된 메시지는 payload를 '[삭제된 메시지입니다]'로 대체
    if (isDeleted) {
        payload->mutable_text()->set_message("[삭제된 메시지입니다]");
        return;
    }

    switch (msgType) {
    case 0: // TEXT
        payload->mutable_text()->set_message(row[4].get<string>());
        break;
    case 1: // IMAGE
        payload->mutable_image()->set_url(row[5].isNull() ? "" : row[5].get<string>());
        payload->mutable_image()->set_thumbnail(row[6].isNull() ? "" : row[6].get<string>());
        break;
    case 2: // VIDEO
        payload->mutable_video()->set_url(row[5].isNull() ? "" : row[5].get<string>());
        payload->mutable_video()->set_thumbnail(row[6].isNull() ? "" : row[6].get<string>());
        break;
    case 3: // FILE
        payload->mutable_file()->set_url(row[5].isNull() ? "" : row[5].get<string>());
        payload->mutable_file()->set_filename(row[4].get<string>());
        break;
    case 4: // SYSTEM
        payload->mutable_system()->set_message(row[4].get<string>());
        break;
    case 5: // POLL — message 컬럼에 poll JSON 저장, text payload로 전달
        payload->mutable_text()->set_message(row[4].get<string>());
        break;
    }
}





vector<MessageInfo> MessageRepository::GetRecentMessages(const string& convId, int limit)
{
    vector<MessageInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 핵심: msg_seq 역순(DESC)으로 최신 거 limit개 가져옴
        string query =
            "SELECT m.conv_id, m.msg_seq, m.sender_id, m.msg_type, m.message, m.media_url, m.thumbnail_url, m.timestamp, u.name, m.reply_to_seq, m.is_deleted, m.is_edited, m.edited_at, m.file_retention_expires_at, m.file_status, m.mentioned_user_ids "
            "FROM messages m "
            "LEFT JOIN users u ON m.sender_id = u.user_id "
            "WHERE m.conv_id = ? "
            "ORDER BY m.msg_seq DESC LIMIT ?";

        auto stmt = session.sql(query);
        stmt.bind(convId, limit);
        auto rows = stmt.execute();

        for (auto row : rows) {
            MessageInfo info;
            info.convId = row[0].get<string>();
            info.msgSeq = row[1].get<int64>();
            info.senderId = row[2].get<string>();
            info.timestamp = row[7].get<int64>();

            string senderName = "Unknown";
            if (!row[8].isNull()) senderName = row[8].get<string>();

            Protocol::S_Chat sChat;
            ParseChatPacket(sChat, row);

            if (info.senderId != "SYSTEM") {
                sChat.set_sender_name(senderName);
            }

            // SerializeMessage 대신 직접 직렬화
            sChat.SerializeToString(&info.messageData);

            result.push_back(info);
        }
        ::reverse(result.begin(), result.end());

    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 오프라인 메시지 조회 실패: " << err.what() << endl;
    }
    return result;
}


vector<MessageInfo> MessageRepository::GetMessagesAfter(const string& convId, int64_t timestamp, int limit)
{
    vector<MessageInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        string query =
            "SELECT m.conv_id, m.msg_seq, m.sender_id, m.msg_type, m.message, m.media_url, m.thumbnail_url, m.timestamp, u.name, m.reply_to_seq, m.is_deleted, m.is_edited, m.edited_at, m.file_retention_expires_at, m.file_status, m.mentioned_user_ids "
            "FROM messages m "
            "LEFT JOIN users u ON m.sender_id = u.user_id "
            "WHERE m.conv_id = ? AND m.timestamp > ? "
            "ORDER BY m.timestamp ASC "
            "LIMIT ?";

        auto stmt = session.sql(query);
        stmt.bind(convId, timestamp, limit); 
        auto rows = stmt.execute();

        for (auto row : rows) {
            MessageInfo info;
            info.convId = row[0].get<string>();
            info.msgSeq = row[1].get<int64>();
            info.senderId = row[2].get<string>();
            info.timestamp = row[7].get<int64>();

            string senderName = "Unknown";
            if (!row[8].isNull()) senderName = row[8].get<string>();

            Protocol::S_Chat sChat;
            ParseChatPacket(sChat, row);

            if (info.senderId != "SYSTEM") {
                sChat.set_sender_name(senderName);
            }

            sChat.SerializeToString(&info.messageData);
            result.push_back(info);
        }

    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 조회 실패(After): " << err.what() << endl;
    }
    return result;
}




vector<MessageInfo> MessageRepository::GetHistoryMessages(string convId, int64 lastMsgSeq, int limit)
{
    vector<MessageInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        string query =
            "SELECT m.conv_id, m.msg_seq, m.sender_id, m.msg_type, m.message, m.media_url, m.thumbnail_url, m.timestamp, u.name, m.reply_to_seq, m.is_deleted, m.is_edited, m.edited_at, m.file_retention_expires_at, m.file_status, m.mentioned_user_ids "
            "FROM messages m "
            "LEFT JOIN users u ON m.sender_id = u.user_id "
            "WHERE m.conv_id = ? AND m.msg_seq < ? "
            "ORDER BY m.msg_seq DESC LIMIT ?";

        auto stmt = session.sql(query);
        stmt.bind(convId, lastMsgSeq, limit);
        auto rows = stmt.execute();

        for (auto row : rows) {
            MessageInfo info;
            info.convId = row[0].get<string>();
            info.msgSeq = row[1].get<int64>();
            info.senderId = row[2].get<string>();
            info.timestamp = row[7].get<int64>();

            string senderName = "";
            if (!row[8].isNull()) senderName = row[8].get<string>();

            Protocol::S_Chat sChat;
            ParseChatPacket(sChat, row);

            if (info.senderId != "SYSTEM") {
                sChat.set_sender_name(senderName);
            }

            sChat.SerializeToString(&info.messageData);
            result.push_back(info);
        }

        ::reverse(result.begin(), result.end());

    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 오프라인 메시지 조회 실패: " << err.what() << endl;
    }

    return result;
}







bool MessageRepository::DeleteMessage(const string& convId, int64 msgSeq) {
    try {
        auto& db = DBManager::GetInstance();
        auto messages = db.GetSchema().getTable("messages");
        messages.remove().where("conv_id = :cid AND msg_seq = :seq")
            .bind("cid", convId).bind("seq", msgSeq).execute();

        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 삭제 실패: " << err.what() << endl;
        return false;
    }
}


bool MessageRepository::SoftDeleteMessage(const string& convId, int64 msgSeq, const string& senderId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 본인 메시지인지 확인
        string checkSender = GetMessageSenderId(convId, msgSeq);
        if (checkSender.empty()) {
            cerr << "[MessageRepository] SoftDelete: 메시지를 찾을 수 없음 (conv=" << convId << ", seq=" << msgSeq << ")" << endl;
            return false;
        }
        if (checkSender != senderId) {
            cerr << "[MessageRepository] SoftDelete: 본인 메시지가 아님 (sender=" << senderId << ", actual=" << checkSender << ")" << endl;
            return false;
        }

        session.sql("UPDATE messages SET is_deleted = 1, message = '[삭제된 메시지입니다]' WHERE conv_id = ? AND msg_seq = ?")
            .bind(convId, msgSeq)
            .execute();

        cout << "[MessageRepository] SoftDelete 완료: conv=" << convId << " seq=" << msgSeq << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] SoftDelete 실패: " << err.what() << endl;
        return false;
    }
}


bool MessageRepository::EditMessage(const string& convId, int64 msgSeq, const string& senderId, const string& newText, int64 editedAt)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 본인 메시지인지 확인
        string checkSender = GetMessageSenderId(convId, msgSeq);
        if (checkSender.empty()) {
            cerr << "[MessageRepository] EditMessage: 메시지를 찾을 수 없음" << endl;
            return false;
        }
        if (checkSender != senderId) {
            cerr << "[MessageRepository] EditMessage: 본인 메시지가 아님" << endl;
            return false;
        }

        session.sql("UPDATE messages SET message = ?, is_edited = 1, edited_at = ? WHERE conv_id = ? AND msg_seq = ?")
            .bind(newText, editedAt, convId, msgSeq)
            .execute();

        cout << "[MessageRepository] EditMessage 완료: conv=" << convId << " seq=" << msgSeq << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] EditMessage 실패: " << err.what() << endl;
        return false;
    }
}


MessageRepository::ReplyInfo MessageRepository::GetMessageBySeq(const string& convId, int64 msgSeq)
{
    ReplyInfo info;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        auto result = session.sql(
            "SELECT m.message, m.sender_id, u.name, m.is_deleted "
            "FROM messages m "
            "LEFT JOIN users u ON m.sender_id = u.user_id "
            "WHERE m.conv_id = ? AND m.msg_seq = ? LIMIT 1")
            .bind(convId, msgSeq)
            .execute();

        auto row = result.fetchOne();
        if (row) {
            info.found = true;
            bool deleted = (!row[3].isNull() && row[3].get<int>() == 1);
            info.text = deleted ? "[삭제된 메시지입니다]" : row[0].get<string>();
            info.senderName = (!row[2].isNull()) ? row[2].get<string>() : row[1].get<string>();
        }
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] GetMessageBySeq 실패: " << err.what() << endl;
    }
    return info;
}


string MessageRepository::GetMessageSenderId(const string& convId, int64 msgSeq)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        auto result = session.sql("SELECT sender_id FROM messages WHERE conv_id = ? AND msg_seq = ? LIMIT 1")
            .bind(convId, msgSeq)
            .execute();

        auto row = result.fetchOne();
        if (row) {
            return row[0].get<string>();
        }
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] GetMessageSenderId 실패: " << err.what() << endl;
    }
    return "";
}








/*======================
       상태 관리
=======================*/


int64 MessageRepository::GetLastReadSeq(const string& userId, const string& convId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto readStatus = schema.getTable("read_status");
        
        auto result = readStatus.select("last_read_seq")
                      .where("user_id = :uid AND conv_id = :cid")
                      .bind("uid", userId)
                      .bind("cid", convId)
                      .execute();
        
        if (result.count() > 0) {
            auto row = result.fetchOne();
            return row[0].get<int64>();
        }
        
        return 0;  // 기본값 (읽지 않음)
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 읽음 상태 조회 실패: " << err.what() << endl;
        return 0;
    }
}

bool MessageRepository::UpdateReadStatus(const string& userId, const string& convId, int64 msgSeq) {
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        
        string query =
            "INSERT INTO read_status (user_id, conv_id, last_read_seq) VALUES (?, ?, ?) "
            "ON DUPLICATE KEY UPDATE last_read_seq = GREATEST(last_read_seq, VALUES(last_read_seq))";

        session.sql(query).bind(userId, convId, msgSeq).execute();
        return true;

    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 읽음 상태 업데이트 실패: " << err.what() << endl;
        return false;
    }
}


int MessageRepository::GetUnreadCount(const string& userId, const string& convId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        int64 lastReadSeq = GetLastReadSeq(userId, convId);

        string query = "SELECT COUNT(*) FROM messages WHERE conv_id = ? AND msg_seq > ?";

        auto result = session.sql(query).bind(convId, lastReadSeq).execute();
        auto row = result.fetchOne();

        if (!row[0].isNull()) {
            return row[0].get<int>();
        }
        return 0;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 안 읽은 메세지 카운트 실패: " << err.what() << endl;
        return 0;
    }
}

// 특정 메시지의 읽지 않은 참여자 수
// = 해당 conv 참여자 수 - (read_status에서 last_read_seq >= msgSeq인 사람 수)
int MessageRepository::GetMsgUnreadCount(const string& convId, int64 msgSeq)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 참여자 수
        string totalQuery = "SELECT COUNT(*) FROM conversation_participants WHERE conv_id = ?";
        auto totalResult = session.sql(totalQuery).bind(convId).execute();
        auto totalRow = totalResult.fetchOne();
        int totalCount = totalRow[0].isNull() ? 0 : totalRow[0].get<int>();

        // 이 메시지 이상까지 읽은 사람 수
        string readQuery =
            "SELECT COUNT(*) FROM read_status WHERE conv_id = ? AND last_read_seq >= ?";
        auto readResult = session.sql(readQuery).bind(convId, msgSeq).execute();
        auto readRow = readResult.fetchOne();
        int readCount = readRow[0].isNull() ? 0 : readRow[0].get<int>();

        int unread = totalCount - readCount;
        return unread > 0 ? unread : 0;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] GetMsgUnreadCount 실패: " << err.what() << endl;
        return 0;
    }
}










/*---------------------
* Utility
---------------------*/

// 직렬화 관련 함수들 제거됨 (더 이상 사용 안함)

// 타임스탬프를 날짜/시간 문자열로 변환
static string TimestampToDateTimeString(int64 timestamp) {
    if (timestamp <= 0) {
        return "N/A";
    }

    time_t timeValue = (timestamp > 10000000000) ? timestamp / 1000 : timestamp;

    struct tm timeInfo;

#ifdef _WIN32
    localtime_s(&timeInfo, &timeValue);
#else
    localtime_r(&timeValue, &timeInfo);
#endif
    ostringstream oss;
    oss << setfill('0')
        << setw(4) << (timeInfo.tm_year + 1900) << "-"
        << setw(2) << (timeInfo.tm_mon + 1) << "-"
        << setw(2) << timeInfo.tm_mday << " "
        << setw(2) << timeInfo.tm_hour << ":"
        << setw(2) << timeInfo.tm_min << ":"
        << setw(2) << timeInfo.tm_sec;

    return oss.str();
}





// ============================================
// 메시지를 메모장에 즉시 추가 (간단한 방식)
// ============================================

bool MessageRepository::AppendMessageToLog(const string& convId, const string& senderId, const Protocol::S_Chat& sChat)
{
    // 파일 잠금을 위한 전역 뮤텍스 (convId별로 잠금)
    static mutex archiveMutex;
    lock_guard<mutex> lock(archiveMutex);

    try {
        string messageText = "";

        if (sChat.has_payload()) {
            const auto& payload = sChat.payload();
            if (payload.has_text()) {
                messageText = payload.text().message();
            }
            else if (payload.has_image()) {
                messageText = "[사진] " + payload.image().url();
            }
            else if (payload.has_video()) {
                messageText = "[영상] " + payload.video().url();
            }
            else if (payload.has_file()) {
                messageText = "[파일] " + payload.file().url();
            }
            else if (payload.has_system()) {
                messageText = "[시스템] " + payload.system().message();
            }
            else {
                messageText = "UNKNOWN";
            }
        }


        int64 timestamp = sChat.ts_server();
        string timestampStr = TimestampToDateTimeString(timestamp);


        // convId를 파일명으로 사용 (특수 문자 제거)
        string safeConvId = convId;
        replace(safeConvId.begin(), safeConvId.end(), ':', '_');
        replace(safeConvId.begin(), safeConvId.end(), '/', '_');
        replace(safeConvId.begin(), safeConvId.end(), '\\', '_');
        replace(safeConvId.begin(), safeConvId.end(), '<', '_');
        replace(safeConvId.begin(), safeConvId.end(), '>', '_');
        replace(safeConvId.begin(), safeConvId.end(), '"', '_');
        replace(safeConvId.begin(), safeConvId.end(), '|', '_');
        replace(safeConvId.begin(), safeConvId.end(), '?', '_');
        replace(safeConvId.begin(), safeConvId.end(), '*', '_');


        string logDir = "../database/msg_logs";
#ifdef _WIN32
        string parentDir = "../database";
        _mkdir(parentDir.c_str());
        _mkdir(logDir.c_str());
#else
        string cmd = "mkdir -p " + logDir;
        system(cmd.c_str());
#endif

        string filename = logDir + "/" + safeConvId + ".txt";

        // 파일 열기 및 잠금 (플랫폼별)
#ifdef _WIN32
        HANDLE hFile = CreateFileA(filename.c_str(),
            GENERIC_WRITE,
            FILE_SHARE_READ,
            NULL,
            OPEN_ALWAYS,
            FILE_ATTRIBUTE_NORMAL,
            NULL);
        if (hFile == INVALID_HANDLE_VALUE) return false;

        // UTF-8 BOM 체크
        DWORD fileSize = GetFileSize(hFile, NULL);
        if (fileSize == 0) {
            const unsigned char utf8Bom[] = { 0xEF, 0xBB, 0xBF };
            DWORD bytesWritten = 0;
            WriteFile(hFile, utf8Bom, 3, &bytesWritten, NULL);
        }

        SetFilePointer(hFile, 0, NULL, FILE_END);

        string line = "[" + timestampStr + "] " + senderId + " : " + messageText + "\n";

        DWORD bytesWritten = 0;
        WriteFile(hFile, line.c_str(), static_cast<DWORD>(line.length()), &bytesWritten, NULL);
        CloseHandle(hFile);
#else
        int fd = open(filename.c_str(), O_WRONLY | O_CREAT | O_APPEND, 0644);
        if (fd == -1) return false;

        if (flock(fd, LOCK_EX) != 0) {
            close(fd);
            return false;
        }

        FILE* filePtr = fdopen(fd, "a");
        if (!filePtr) {
            flock(fd, LOCK_UN);
            close(fd);
            return false;
        }

        string line = "[" + timestampStr + "] " + senderId + " : " + messageText + "\n";
        fwrite(line.c_str(), 1, line.length(), filePtr);

        fflush(filePtr);
        fclose(filePtr);
#endif

        return true;
    }
    catch (...) {
        return false;
    }
}


bool MessageRepository::ToggleReaction(const string& convId, int64 msgSeq,
                                       const string& userId, const string& emoji,
                                       bool& outRemoved)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 이미 반응이 있는지 확인
        auto existing = session.sql(
            "SELECT id FROM message_reactions WHERE conv_id=? AND msg_seq=? AND user_id=? AND emoji=? LIMIT 1"
        ).bind(convId).bind(msgSeq).bind(userId).bind(emoji).execute();

        if (existing.count() > 0) {
            // 이미 있으면 삭제 (토글 off)
            session.sql(
                "DELETE FROM message_reactions WHERE conv_id=? AND msg_seq=? AND user_id=? AND emoji=?"
            ).bind(convId).bind(msgSeq).bind(userId).bind(emoji).execute();
            outRemoved = true;
        } else {
            // 없으면 추가 (토글 on)
            int64_t now = std::chrono::duration_cast<std::chrono::milliseconds>(
                std::chrono::system_clock::now().time_since_epoch()
            ).count();
            session.sql(
                "INSERT INTO message_reactions (conv_id, msg_seq, user_id, emoji, created_at) VALUES (?,?,?,?,?)"
            ).bind(convId).bind(msgSeq).bind(userId).bind(emoji).bind(now).execute();
            outRemoved = false;
        }
        return true;
    } catch (const std::exception& e) {
        cerr << "[MessageRepository] ToggleReaction 실패: " << e.what() << endl;
        return false;
    }
}


vector<MessageRepository::ReactionInfo> MessageRepository::GetAllReactionsForUser(const string& userId)
{
    vector<ReactionInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // 유저가 참여하는 1:1 및 그룹 대화의 모든 현재 반응 조회
        auto rows = session.sql(
            "SELECT mr.conv_id, mr.msg_seq, mr.user_id, mr.emoji "
            "FROM message_reactions mr "
            "WHERE mr.conv_id IN ("
            "  SELECT conv_id FROM conversation_participants WHERE user_id = ? "
            "  UNION "
            "  SELECT CONCAT('group:', group_id) FROM group_members WHERE user_id = ? "
            ") "
            "ORDER BY mr.conv_id, mr.msg_seq"
        ).bind(userId).bind(userId).execute();

        for (auto row : rows) {
            ReactionInfo ri;
            ri.convId  = row[0].get<string>();
            ri.msgSeq  = row[1].get<int64_t>();
            ri.userId  = row[2].get<string>();
            ri.emoji   = row[3].get<string>();
            result.push_back(ri);
        }
    } catch (const std::exception& e) {
        cerr << "[MessageRepository] GetAllReactionsForUser 실패: " << e.what() << endl;
    }
    return result;
}


/*======================
    공지 (Announcement)
========================*/

bool MessageRepository::SetAnnouncement(const string& convId, int64 msgSeq, const string& text, const string& senderName, const string& setterId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        int64 now = std::chrono::duration_cast<std::chrono::milliseconds>(
            std::chrono::system_clock::now().time_since_epoch()).count();

        session.sql(
            "INSERT INTO announcements (conv_id, msg_seq, text, sender_name, setter_id, set_at) "
            "VALUES (?, ?, ?, ?, ?, ?) "
            "ON DUPLICATE KEY UPDATE msg_seq = ?, text = ?, sender_name = ?, setter_id = ?, set_at = ?"
        ).bind(convId).bind(msgSeq).bind(text).bind(senderName).bind(setterId).bind(now)
         .bind(msgSeq).bind(text).bind(senderName).bind(setterId).bind(now)
         .execute();

        return true;
    } catch (const std::exception& e) {
        cerr << "[MessageRepository] SetAnnouncement 실패: " << e.what() << endl;
        return false;
    }
}

bool MessageRepository::ClearAnnouncement(const string& convId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        session.sql("DELETE FROM announcements WHERE conv_id = ?").bind(convId).execute();
        return true;
    } catch (const std::exception& e) {
        cerr << "[MessageRepository] ClearAnnouncement 실패: " << e.what() << endl;
        return false;
    }
}

MessageRepository::AnnouncementInfo MessageRepository::GetAnnouncement(const string& convId)
{
    AnnouncementInfo info;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        auto rows = session.sql(
            "SELECT conv_id, msg_seq, text, sender_name, setter_id, set_at "
            "FROM announcements WHERE conv_id = ?"
        ).bind(convId).execute();

        if (auto row = rows.fetchOne()) {
            info.convId     = row[0].get<string>();
            info.msgSeq     = row[1].get<int64_t>();
            info.text       = row[2].get<string>();
            info.senderName = row[3].get<string>();
            info.setterId   = row[4].get<string>();
            info.setAt      = row[5].get<int64_t>();
            info.found      = true;
        }
    } catch (const std::exception& e) {
        cerr << "[MessageRepository] GetAnnouncement 실패: " << e.what() << endl;
    }
    return info;
}

vector<MessageRepository::AnnouncementInfo> MessageRepository::GetAnnouncementsForUser(const string& userId)
{
    vector<AnnouncementInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();
        auto rows = session.sql(
            "SELECT a.conv_id, a.msg_seq, a.text, a.sender_name, a.setter_id, a.set_at "
            "FROM announcements a "
            "WHERE a.conv_id IN ("
            "  SELECT conv_id FROM conversation_participants WHERE user_id = ? "
            "  UNION "
            "  SELECT CONCAT('group:', group_id) FROM group_members WHERE user_id = ? "
            ")"
        ).bind(userId).bind(userId).execute();

        for (auto row : rows) {
            AnnouncementInfo info;
            info.convId     = row[0].get<string>();
            info.msgSeq     = row[1].get<int64_t>();
            info.text       = row[2].get<string>();
            info.senderName = row[3].get<string>();
            info.setterId   = row[4].get<string>();
            info.setAt      = row[5].get<int64_t>();
            info.found      = true;
            result.push_back(info);
        }
    } catch (const std::exception& e) {
        cerr << "[MessageRepository] GetAnnouncementsForUser 실패: " << e.what() << endl;
    }
    return result;
}