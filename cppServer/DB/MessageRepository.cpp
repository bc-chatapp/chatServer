#include "pch.h"
#include "MessageRepository.h"
#include "DBManager.h"
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
            // 2. 방 생성 (conversations)
            string queryInsert = "INSERT INTO conversations (conv_id, type) VALUES (?, ?)";
            session.sql(queryInsert).bind(convId, convType).execute();

            // 3. 참여자 추가 (participants)
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

int64 MessageRepository::SaveMessage(const string& convId, const string& senderId, const Protocol::S_Chat& pkt) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession(); 

        string messageData = SerializeMessage(pkt);
        if (messageData.empty()) return -1;

        string query =
            "INSERT INTO messages (conv_id, msg_seq, sender_id, message_data, timestamp) "
            "SELECT ?, COALESCE(MAX(msg_seq), 0) + 1, ?, ?, ? "
            "FROM messages WHERE conv_id = ?";

        session.startTransaction();

        auto result = session.sql("SELECT COALESCE(MAX(msg_seq), 0) + 1 FROM messages WHERE conv_id = ? FOR UPDATE")
            .bind(convId).execute();
        int64 nextSeq = result.fetchOne()[0].get<int64>();

        session.sql("INSERT INTO messages (conv_id, msg_seq, sender_id, message_data, timestamp) VALUES (?, ?, ?, ?, ?)")
            .bind(convId, nextSeq, senderId, messageData, pkt.ts_server())
            .execute();

        session.commit();

        AppendMessageToLog(convId, senderId, pkt);

        return nextSeq;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 저장 실패: " << err.what() << endl;
        return -1;
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

vector<MessageInfo> MessageRepository::GetRecentMessages(const string& convId, int limit)
{
    vector<MessageInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // ★ 핵심: msg_seq 역순(DESC)으로 최신 거 limit개 가져옴
        string query =
            "SELECT m.conv_id, m.msg_seq, m.sender_id, m.message_data, m.timestamp, u.name "
            "FROM messages m "
            "LEFT JOIN users u ON m.sender_id = u.user_id "
            "WHERE m.conv_id = ? "
            "ORDER BY m.msg_seq DESC LIMIT ?"; // 최신순

        auto stmt = session.sql(query);
        stmt.bind(convId, limit);
        auto rows = stmt.execute();

        for (auto row : rows) {
            MessageInfo info;
            info.convId = row[0].get<string>();
            info.msgSeq = row[1].get<int64>();
            info.senderId = row[2].get<string>();
            info.messageData = row[3].get<string>();
            info.timestamp = row[4].get<int64>();

            string senderName = "Unknown";
            if (!row[5].isNull()) senderName = row[5].get<string>();

            // Deserialize
            Protocol::S_Chat sChat;
            if (DeserializeMessage(info.messageData, sChat)) {
                if (info.senderId != "SYSTEM") sChat.set_sender_name(senderName);
                info.messageData = SerializeMessage(sChat);
            }
            result.push_back(info);
        }
        ::reverse(result.begin(), result.end());

    }
    catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 오프라인 메시지 조회 실패: " << err.what() << endl;
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
            "SELECT m.conv_id, m.msg_seq, m.sender_id, m.message_data, m.timestamp, u.name "
            "FROM messages m "
            "LEFT JOIN users u ON m.sender_id = u.user_id "
            "WHERE m.conv_id = ? AND m.msg_seq < ? "
            "ORDER BY m.msg_seq DESC LIMIT ?";

        auto stmt = session.sql(query);
        stmt.bind(convId, lastMsgSeq, limit);
        auto rows = stmt.execute();

        for (auto row : rows) {
            // (위와 동일한 파싱 로직)
            MessageInfo info;
            info.msgSeq = row[1].get<int64>();
            info.senderId = row[2].get<string>();
            info.messageData = row[3].get<string>();
            info.timestamp = row[4].get<int64>();

            string senderName = "";
            if (!row[5].isNull()) senderName = row[5].get<string>();

            Protocol::S_Chat sChat;
            if (DeserializeMessage(info.messageData, sChat)) {
                if (info.senderId != "SYSTEM") sChat.set_sender_name(senderName);
                info.messageData = SerializeMessage(sChat);
            }
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
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 삭제 실패: " << err.what() << endl;
        return false;
    }
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






/*---------------------
*       Utility
---------------------*/

string MessageRepository::ToHex(const string& input) {
    static const char* kHexChars = "0123456789ABCDEF";
    string out;
    out.reserve(input.size() * 2);
    for (unsigned char c : input) {
        out.push_back(kHexChars[(c >> 4) & 0x0F]);
        out.push_back(kHexChars[c & 0x0F]);
    }
    return out;
}

string MessageRepository::FromHex(const string& hex) {
    string out;
    if (hex.size() % 2 != 0) return out;
    out.reserve(hex.size() / 2);

    auto hexVal = [](char ch) -> int {
        if ('0' <= ch && ch <= '9') return ch - '0';
        if ('A' <= ch && ch <= 'F') return ch - 'A' + 10;
        if ('a' <= ch && ch <= 'f') return ch - 'a' + 10;
        return -1;
        };

    for (size_t i = 0; i < hex.size(); i += 2) {
        int hi = hexVal(hex[i]);
        int lo = hexVal(hex[i + 1]);
        if (hi < 0 || lo < 0) return string(); // 잘못된 형식
        unsigned char c = static_cast<unsigned char>((hi << 4) | lo);
        out.push_back(static_cast<char>(c));
    }
    return out;
}


string MessageRepository::SerializeMessage(const Protocol::S_Chat& sChat) {
    string binary;
    if (!sChat.SerializeToString(&binary)) {
        return "";
    }
    // TEXT 컬럼에 안전하게 저장하기 위해 Hex 문자열로 인코딩
    return ToHex(binary);
}

bool MessageRepository::DeserializeMessage(const string& data, Protocol::S_Chat& sChat) {
    // DB에는 Hex 문자열이 저장되어 있으므로 먼저 디코딩
    string binary = FromHex(data);
    if (binary.empty()) return false;
    return sChat.ParseFromString(binary);
}













// ============================================
// 메시지 아카이브 (읽은 메시지를 txt 파일로 저장 후 DB에서 삭제)
// ============================================

// 파일 잠금을 위한 전역 뮤텍스 (convId별로 잠금)
static mutex archiveMutex;



// 타임스탬프를 날짜/시간 문자열로 변환
static string TimestampToDateTimeString(int64 timestamp) {
    if (timestamp <= 0) {
        return "N/A";
    }
    
    // timestamp가 밀리초인지 초인지 확인 (일반적으로 밀리초)
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



// MySQL DATETIME을 문자열로 변환
static string DateTimeToString(const mysqlx::Value& value) {
    if (value.isNull()) {
        return "N/A";
    }

    try {
        // MySQL X DevAPI에서 DATETIME은 문자열로 반환됨
        if (value.getType() == mysqlx::Value::Type::STRING) {
            return value.get<string>();
        }
        // 또는 정수 타입일 수 있음 (타임스탬프)
        if (value.getType() == mysqlx::Value::Type::INT64 || value.getType() == mysqlx::Value::Type::UINT64) {
            int64 ts = value.get<int64>();
            return TimestampToDateTimeString(ts);
        }
        // 기타 타입은 문자열로 변환 시도
        return value.get<string>();
    }
    catch (...) {
        // 변환 실패 시 N/A 반환
        return "N/A";
    }


}





// ============================================
// 메시지를 메모장에 즉시 추가 (간단한 방식)
// ============================================

bool MessageRepository::AppendMessageToLog(const string& convId, const string& senderId, const Protocol::S_Chat& sChat) 
{
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
            else if (payload.has_file())
            {
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
        // Windows: 중첩 폴더 생성
        string parentDir = "../database";
        _mkdir(parentDir.c_str());
        _mkdir(logDir.c_str());
#else
        // Linux: -p 옵션으로 중첩 폴더 생성
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
        if (hFile == INVALID_HANDLE_VALUE) {
            cerr << "[MessageRepository] 파일 열기 실패: " << filename << endl;
            return false;
        }
        
        // 파일 크기 확인 (BOM 추가 여부 확인)
        DWORD fileSize = GetFileSize(hFile, NULL);
        
        // 파일이 비어있으면 UTF-8 BOM 추가 (메모장에서 UTF-8로 인식하도록)
        if (fileSize == 0) {
            const unsigned char utf8Bom[] = { 0xEF, 0xBB, 0xBF };
            DWORD bytesWritten = 0;
            WriteFile(hFile, utf8Bom, 3, &bytesWritten, NULL);
        }
        
        // 파일 끝으로 이동
        SetFilePointer(hFile, 0, NULL, FILE_END);
        
        // Windows: UTF-8로 직접 쓰기 위해 FILE* 대신 HANDLE 사용
        // (나중에 WriteFile로 직접 쓰기)
#else
        int fd = open(filename.c_str(), O_WRONLY | O_CREAT | O_APPEND, 0644);
        if (fd == -1) {
            cerr << "[MessageRepository] 파일 열기 실패: " << filename << endl;
            return false;
        }
        
        // 파일 잠금
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
#endif
        
        // 형식: [ timestamp ] sender : message content
        string line = "[" + timestampStr + "] " + senderId + " : " + messageText + "\n";
        
#ifdef _WIN32
        // Windows: UTF-8로 직접 쓰기 (WriteFile 사용)
        DWORD bytesWritten = 0;
        WriteFile(hFile, line.c_str(), static_cast<DWORD>(line.length()), &bytesWritten, NULL);
        
        if (bytesWritten != line.length()) {
            cerr << "[MessageRepository] 파일 쓰기 실패 (written=" 
                 << bytesWritten << ", expected=" << line.length() << ")" << endl;
        }
        
        CloseHandle(hFile);
#else
        size_t written = fwrite(line.c_str(), 1, line.length(), filePtr);
        if (written != line.length()) {
            cerr << "[MessageRepository] 파일 쓰기 실패 (written=" 
                 << written << ", expected=" << line.length() << ")" << endl;
        }
        
        // 파일 버퍼 플러시
        fflush(filePtr);
        
        // 파일 잠금 해제 및 닫기
        fclose(filePtr);
        // fdopen이 닫으면 fd도 닫힘, flock도 자동 해제
#endif
        
        return true;
    } catch (const exception& e) {
        cerr << "[MessageRepository] AppendMessageToLog 실패: " << e.what() << endl;
        return false;
    }
}



//
//
//
//bool MessageRepository::ArchiveReadMessages(const string& convId, const string& userId, int64 lastReadSeq) {
//    // 파일 잠금 (동시 접근 방지)
//    lock_guard<mutex> lock(archiveMutex);
//    
//    try {
//        auto& db = DBManager::GetInstance();
//        auto schema = db.GetSchema();
//        auto messages = schema.getTable("messages");
//        
//        // 읽은 메시지 조회 (is_delivered = 1이고 msg_seq <= lastReadSeq)
//        // 온라인일 때: 즉시 전송된 메시지 (is_delivered = 1)
//        // 오프라인일 때: 로그인 후 전송된 메시지 (is_delivered = 1)
//        auto rows = messages.select("msg_seq", "sender_id", "message_data", "timestamp", "delivered_at")
//                           .where("conv_id = :cid AND receiver_id = :uid AND msg_seq <= :seq AND is_delivered = 1")
//                           .bind("cid", convId)
//                           .bind("uid", userId)
//                           .bind("seq", lastReadSeq)
//                           .execute();
//        
//        if (rows.count() == 0) {
//            return true;  // 아카이브할 메시지 없음
//        }
//        
//        // msg_seq 기준으로 정렬 (메모리에서)
//        vector<tuple<int64, string, string, int64, string>> messageList;
//        for (auto row : rows) {
//            int64 msgSeq = row[0].get<int64>();
//            string senderId = row[1].get<string>();
//            string messageData = row[2].get<string>();
//            int64 timestamp = row[3].get<int64>();
//            string deliveredAtStr = DateTimeToString(row[4]);
//            
//            messageList.push_back(make_tuple(msgSeq, senderId, messageData, timestamp, deliveredAtStr));
//        }
//        
//        // msg_seq 기준으로 정렬
//        sort(messageList.begin(), messageList.end(),
//             [](const auto& a, const auto& b) {
//                 return get<0>(a) < get<0>(b);
//             });
//        
//        // msg_logs 폴더 생성 (상위 폴더의 database/msg_logs)
//        string logDir = "../database/msg_logs";
//#ifdef _WIN32
//        // Windows: 중첩 폴더 생성
//        string parentDir = "../database";
//        _mkdir(parentDir.c_str());
//        _mkdir(logDir.c_str());
//#else
//        // Linux: -p 옵션으로 중첩 폴더 생성
//        string cmd = "mkdir -p " + logDir;
//        system(cmd.c_str());
//#endif
//        
//        // 파일명: conv_id.txt (예: direct:dummy001_user01.txt)
//        // 파일명에 사용할 수 없는 문자 제거 (Windows: < > : " / \ | ? *)
//        string safeConvId = convId;
//        replace(safeConvId.begin(), safeConvId.end(), ':', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '/', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '\\', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '<', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '>', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '"', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '|', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '?', '_');
//        replace(safeConvId.begin(), safeConvId.end(), '*', '_');
//        
//        string filename = logDir + "/" + safeConvId + ".txt";
//        
//        // 파일 열기 및 잠금 (플랫폼별)
//        // 파일 잠금을 위해 플랫폼별 API 사용
//#ifdef _WIN32
//        HANDLE hFile = CreateFileA(filename.c_str(), 
//                                   GENERIC_WRITE, 
//                                   0,  // 공유 모드 없음
//                                   NULL, 
//                                   OPEN_ALWAYS, 
//                                   FILE_ATTRIBUTE_NORMAL, 
//                                   NULL);
//        
//        if (hFile == INVALID_HANDLE_VALUE) {
//            cerr << "[MessageRepository] 파일 열기 실패: " << filename << endl;
//            return false;
//        }
//        
//        // 파일 잠금
//        OVERLAPPED overlapped = {0};
//        if (!LockFileEx(hFile, LOCKFILE_EXCLUSIVE_LOCK, 0, 0, 0, &overlapped)) {
//            cerr << "[MessageRepository] 파일 잠금 실패: " << filename << endl;
//            CloseHandle(hFile);
//            return false;
//        }
//        
//        // 파일 포인터를 끝으로 이동 (append 모드)
//        SetFilePointer(hFile, 0, NULL, FILE_END);
//        
//        // 파일 핸들을 FILE*로 변환
//        FILE* filePtr = nullptr;
//        int fd = _open_osfhandle((intptr_t)hFile, _O_WRONLY);
//        if (fd < 0) {
//            cerr << "[MessageRepository] 파일 디스크립터 변환 실패: " << filename << endl;
//            UnlockFileEx(hFile, 0, 0, 0, &overlapped);
//            CloseHandle(hFile);
//            return false;
//        }
//        filePtr = _fdopen(fd, "a");
//        if (!filePtr) {
//            cerr << "[MessageRepository] 파일 스트림 생성 실패: " << filename << endl;
//            _close(fd);
//            UnlockFileEx(hFile, 0, 0, 0, &overlapped);
//            CloseHandle(hFile);
//            return false;
//        }
//#else
//        int fd = open(filename.c_str(), O_WRONLY | O_CREAT | O_APPEND, 0644);
//        if (fd < 0) {
//            cerr << "[MessageRepository] 파일 열기 실패: " << filename << endl;
//            return false;
//        }
//        
//        // 파일 잠금
//        if (flock(fd, LOCK_EX) != 0) {
//            cerr << "[MessageRepository] 파일 잠금 실패: " << filename << endl;
//            close(fd);
//            return false;
//        }
//        
//        FILE* filePtr = fdopen(fd, "a");
//        if (!filePtr) {
//            cerr << "[MessageRepository] 파일 스트림 생성 실패: " << filename << endl;
//            flock(fd, LOCK_UN);
//            close(fd);
//            return false;
//        }
//#endif
//        
//        // 메시지들을 순서대로 파일에 저장
//        vector<int64> msgSeqsToDelete;
//        for (const auto& msgTuple : messageList) {
//            int64 msgSeq = get<0>(msgTuple);
//            string senderId = get<1>(msgTuple);
//            string messageData = get<2>(msgTuple);
//            int64 timestamp = get<3>(msgTuple);
//            string deliveredAtStr = get<4>(msgTuple);
//            
//            // Protobuf 메시지 역직렬화
//            Protocol::S_Chat sChat;
//            if (DeserializeMessage(messageData, sChat)) {
//                // 메시지 내용 추출
//                string messageText = "[첨부]";
//                if (sChat.payload().has_text()) {
//                    messageText = sChat.payload().text().message();
//                }
//                
//                // 타임스탬프를 날짜/시간 문자열로 변환
//                string timestampStr = TimestampToDateTimeString(timestamp);
//                
//                // 형식: [ timestamp ] sender : [ delivered timestamp ] : 메세지 내용
//                string line = "[" + timestampStr + "] " + senderId 
//                             + " : [" + deliveredAtStr + "] : " 
//                             + messageText + "\n";
//                
//                size_t written = fwrite(line.c_str(), 1, line.length(), filePtr);
//                if (written != line.length()) {
//                    cerr << "[MessageRepository] ArchiveReadMessages: 파일 쓰기 실패 (written=" 
//                         << written << ", expected=" << line.length() << ")" << endl;
//                }
//                
//                msgSeqsToDelete.push_back(msgSeq);
//            } else {
//                cerr << "[MessageRepository] ArchiveReadMessages: 메시지 역직렬화 실패: msgSeq=" 
//                     << msgSeq << endl;
//            }
//        }
//        
//        // 파일 버퍼 플러시
//        fflush(filePtr);
//        
//        // 파일 잠금 해제 및 닫기
//#ifdef _WIN32
//        fclose(filePtr);  // _fdopen으로 열었으므로 fclose로 닫기 (핸들도 자동으로 닫힘)
//        // 파일 잠금은 fclose 시 자동으로 해제됨
//#else
//        fclose(filePtr);  // fdopen으로 열었으므로 fclose로 닫기 (fd도 자동으로 닫힘)
//        // 파일 잠금은 fclose 시 자동으로 해제됨
//#endif
//        
//        // 파일에 저장한 메시지들을 DB에서 삭제
//        for (int64 msgSeq : msgSeqsToDelete) {
//            DeleteMessage(convId, msgSeq);
//        }
//        
//        cout << "[MessageRepository] ArchiveReadMessages 완료: convId=" << convId 
//             << ", 파일=" << filename 
//             << ", count=" << msgSeqsToDelete.size() << endl;
//        
//        return true;
//    } catch (const mysqlx::Error& err) {
//        cerr << "[MessageRepository] 메시지 아카이브 실패: " << err.what() << endl;
//        return false;
//    } catch (const exception& e) {
//        cerr << "[MessageRepository] 메시지 아카이브 실패: " << e.what() << endl;
//        return false;
//    }
//}
//
