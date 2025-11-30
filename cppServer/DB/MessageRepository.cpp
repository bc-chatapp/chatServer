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

// ============================================
// 대화방 관리
// ============================================

string MessageRepository::CreateConversationId(const string& user1, const string& user2) {
    // 알파벳 순서로 정렬하여 일관된 대화방 ID 생성
    vector<string> participants = {user1, user2};
    sort(participants.begin(), participants.end());
    
    return "direct:" + participants[0] + "_" + participants[1];
}

string MessageRepository::CreateOrGetConversation(const string& convId, const string& convType,
                                                  const string& participant1, 
                                                  const string& participant2) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto conversations = schema.getTable("conversations");
        
        // 기존 대화방 조회
        auto existing = conversations.select("conv_id")
                       .where("conv_id = :cid")
                       .bind("cid", convId)
                       .execute();
        
        if (existing.count() > 0) {
            return convId;  // 이미 존재
        }
        
        // 새 대화방 생성
        conversations.insert("conv_id", "conv_type", "participant1", "participant2")
                     .values(convId, convType, participant1, participant2)
                     .execute();
        
        cout << "[MessageRepository] 대화방 생성: " << convId << endl;
        return convId;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 대화방 생성 실패: " << err.what() << endl;
        return convId;  // 실패해도 convId 반환 (계속 진행)
    }
}

// ============================================
// 메시지 저장
// ============================================

int64 MessageRepository::GetNextMessageSeq(const string& convId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        // 해당 대화방의 모든 msg_seq 조회 후 메모리에서 최대값 찾기
        auto result = messages.select("msg_seq")
                      .where("conv_id = :cid")
                      .bind("cid", convId)
                      .execute();
        
        int64 maxSeq = 0;
        for (auto row : result) {
            int64 seq = row[0].get<int64>();
            if (seq > maxSeq) {
                maxSeq = seq;
            }
        }
        
        return maxSeq + 1;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 순차 번호 조회 실패: " << err.what() << endl;
        return 1;  // 기본값
    }
}

// ============================================
// Hex 인코딩 유틸
// ============================================

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

// ============================================
// Protobuf 메시지 직렬화/역직렬화
// ============================================

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

int64 MessageRepository::SaveMessage(const string& convId, const string& senderId, 
                                     const string& receiverId, const Protocol::S_Chat& pkt) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        // 다음 순차 번호 가져오기
        int64 msgSeq = GetNextMessageSeq(convId);
        
        // Protobuf 메시지 직렬화
        string messageData = SerializeMessage(pkt);
        if (messageData.empty()) {
            cerr << "[MessageRepository] 메시지 직렬화 실패" << endl;
            return -1;
        }
        
        // NULL 값 처리 (proto3 스칼라 필드는 has_xxx()가 없으므로 0이면 미설정으로 취급)
        int64 clientMsgId = pkt.client_msg_id();
        int64 serverMsgId = pkt.server_msg_id();
        
        // 현재는 message_data 를 TEXT 컬럼에 그대로 저장한다.
        // (추후 필요 시 base64 인코딩으로 변경 가능)
        messages.insert("conv_id", "msg_seq", "sender_id", "receiver_id",
                        "message_data", "client_msg_id", "server_msg_id",
                        "timestamp", "is_delivered")
                .values(convId, msgSeq, senderId, receiverId,
                        messageData, clientMsgId, serverMsgId,
                        pkt.ts_server(), 0)
                .execute();
        
        // 메시지를 메모장에 즉시 추가
        AppendMessageToLog(convId, senderId, pkt);
        
        return msgSeq;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 저장 실패: " << err.what() << endl;
        return -1;
    }
}

// ============================================
// 메시지 조회
// ============================================

vector<MessageInfo> MessageRepository::GetUnreadMessages(const string& userId, 
                                                          const string& convId, 
                                                          int64 lastReadSeq) {
    vector<MessageInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        // 오프라인 메시지 조회 (is_delivered = 0인 메시지만)
        // lastReadSeq는 이제 사용하지 않음 (단순화)
        auto rows = messages.select("id", "msg_seq", "sender_id", "receiver_id", 
                                   "message_data", "client_msg_id", "server_msg_id",
                                   "timestamp", "is_delivered")
                           .where("conv_id = :cid AND receiver_id = :uid AND is_delivered = 0")
                           .bind("cid", convId)
                           .bind("uid", userId)
                           .execute();
        
        // 메모리에서 msg_seq 기준으로 정렬
        vector<MessageInfo> tempResult;
        for (auto row : rows) {
            MessageInfo info;
            info.id = row[0].get<int64>();
            info.msgSeq = row[1].get<int64>();
            info.senderId = row[2].get<string>();
            info.receiverId = row[3].get<string>();
            
            // 바이너리 / 텍스트 데이터 읽기
            if (!row[4].isNull()) {
                // BLOB 이든 TEXT 이든 드라이버가 string 으로 변환해준다.
                info.messageData = row[4].get<string>();
            }
            
            if (!row[5].isNull()) info.clientMsgId = row[5].get<int64>();
            if (!row[6].isNull()) info.serverMsgId = row[6].get<int64>();
            info.timestamp = row[7].get<int64>();
            info.isDelivered = row[8].get<int>() != 0;
            
            tempResult.push_back(info);
        }
        
        // msg_seq 기준으로 오름차순 정렬
        sort(tempResult.begin(), tempResult.end(), 
             [](const MessageInfo& a, const MessageInfo& b) {
                 return a.msgSeq < b.msgSeq;
             });
        
        result = tempResult;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 오프라인 메시지 조회 실패: " << err.what() << endl;
    }
    
    return result;
}

vector<string> MessageRepository::GetUserConversations(const string& userId) {
    vector<string> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        // 사용자가 참여한 모든 대화방 조회 (DISTINCT)
        auto rows = messages.select("conv_id")
                         .where("sender_id = :uid OR receiver_id = :uid")
                         .bind("uid", userId)
                         .execute();
        
        set<string> convSet;
        for (auto row : rows) {
            string convId = row[0].get<string>();
            convSet.insert(convId);
        }
        
        result.assign(convSet.begin(), convSet.end());
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 대화방 목록 조회 실패: " << err.what() << endl;
    }
    
    return result;
}

// ============================================
// 메시지 상태 업데이트
// ============================================

bool MessageRepository::MarkMessageAsDelivered(const string& convId, int64 msgSeq, const string& receiverId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        messages.update()
               .set("is_delivered", 1)
               .set("delivered_at", mysqlx::expr("NOW()"))
               .where("conv_id = :cid AND msg_seq = :seq AND receiver_id = :uid")
               .bind("cid", convId)
               .bind("seq", msgSeq)
               .bind("uid", receiverId)
               .execute();
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 전송 완료 처리 실패: " << err.what() << endl;
        return false;
    }
}

bool MessageRepository::DeleteMessage(const string& convId, int64 msgSeq) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        messages.remove()
               .where("conv_id = :cid AND msg_seq = :seq")
               .bind("cid", convId)
               .bind("seq", msgSeq)
               .execute();
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 삭제 실패: " << err.what() << endl;
        return false;
    }
}

// ============================================
// 읽음 상태 관리
// ============================================

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
        auto schema = db.GetSchema();
        auto readStatus = schema.getTable("read_status");
        
        // 기존 last_read_seq 조회
        int64 oldLastReadSeq = GetLastReadSeq(userId, convId);
        
        // 기존 레코드 확인
        auto existing = readStatus.select("user_id")
                       .where("user_id = :uid AND conv_id = :cid")
                       .bind("uid", userId)
                       .bind("cid", convId)
                       .execute();
        
        if (existing.count() > 0) {
            // 업데이트
            readStatus.update()
                     .set("last_read_seq", msgSeq)
                     .where("user_id = :uid AND conv_id = :cid")
                     .bind("uid", userId)
                     .bind("cid", convId)
                     .execute();
        } else {
            // 새로 생성
            readStatus.insert("user_id", "conv_id", "last_read_seq")
                     .values(userId, convId, msgSeq)
                     .execute();
        }
        
        // 새로 읽은 메시지가 있으면 아카이브
        if (msgSeq > oldLastReadSeq) {
            ArchiveReadMessages(convId, userId, msgSeq);
        }
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 읽음 상태 업데이트 실패: " << err.what() << endl;
        return false;
    }
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
    } catch (...) {
        // 변환 실패 시 N/A 반환
        return "N/A";
    }
}

// ============================================
// 메시지를 메모장에 즉시 추가 (간단한 방식)
// ============================================

bool MessageRepository::AppendMessageToLog(const string& convId, const string& senderId, 
                                            const Protocol::S_Chat& sChat) {
    // 파일 잠금 (동시 접근 방지)
    lock_guard<mutex> lock(archiveMutex);
    
    try {
        // 메시지 내용 추출
        string messageText = "[첨부]";
        if (sChat.payload().has_text()) {
            messageText = sChat.payload().text().message();
        }
        
        // 타임스탬프를 날짜/시간 문자열로 변환
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
        
        // msg_logs 폴더 생성 (상위 폴더의 database/msg_logs)
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

bool MessageRepository::ArchiveReadMessages(const string& convId, const string& userId, int64 lastReadSeq) {
    // 파일 잠금 (동시 접근 방지)
    lock_guard<mutex> lock(archiveMutex);
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto messages = schema.getTable("messages");
        
        // 읽은 메시지 조회 (is_delivered = 1이고 msg_seq <= lastReadSeq)
        // 온라인일 때: 즉시 전송된 메시지 (is_delivered = 1)
        // 오프라인일 때: 로그인 후 전송된 메시지 (is_delivered = 1)
        auto rows = messages.select("msg_seq", "sender_id", "message_data", "timestamp", "delivered_at")
                           .where("conv_id = :cid AND receiver_id = :uid AND msg_seq <= :seq AND is_delivered = 1")
                           .bind("cid", convId)
                           .bind("uid", userId)
                           .bind("seq", lastReadSeq)
                           .execute();
        
        if (rows.count() == 0) {
            return true;  // 아카이브할 메시지 없음
        }
        
        // msg_seq 기준으로 정렬 (메모리에서)
        vector<tuple<int64, string, string, int64, string>> messageList;
        for (auto row : rows) {
            int64 msgSeq = row[0].get<int64>();
            string senderId = row[1].get<string>();
            string messageData = row[2].get<string>();
            int64 timestamp = row[3].get<int64>();
            string deliveredAtStr = DateTimeToString(row[4]);
            
            messageList.push_back(make_tuple(msgSeq, senderId, messageData, timestamp, deliveredAtStr));
        }
        
        // msg_seq 기준으로 정렬
        sort(messageList.begin(), messageList.end(),
             [](const auto& a, const auto& b) {
                 return get<0>(a) < get<0>(b);
             });
        
        // msg_logs 폴더 생성 (상위 폴더의 database/msg_logs)
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
        
        // 파일명: conv_id.txt (예: direct:dummy001_user01.txt)
        // 파일명에 사용할 수 없는 문자 제거 (Windows: < > : " / \ | ? *)
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
        
        string filename = logDir + "/" + safeConvId + ".txt";
        
        // 파일 열기 및 잠금 (플랫폼별)
        // 파일 잠금을 위해 플랫폼별 API 사용
#ifdef _WIN32
        HANDLE hFile = CreateFileA(filename.c_str(), 
                                   GENERIC_WRITE, 
                                   0,  // 공유 모드 없음
                                   NULL, 
                                   OPEN_ALWAYS, 
                                   FILE_ATTRIBUTE_NORMAL, 
                                   NULL);
        
        if (hFile == INVALID_HANDLE_VALUE) {
            cerr << "[MessageRepository] 파일 열기 실패: " << filename << endl;
            return false;
        }
        
        // 파일 잠금
        OVERLAPPED overlapped = {0};
        if (!LockFileEx(hFile, LOCKFILE_EXCLUSIVE_LOCK, 0, 0, 0, &overlapped)) {
            cerr << "[MessageRepository] 파일 잠금 실패: " << filename << endl;
            CloseHandle(hFile);
            return false;
        }
        
        // 파일 포인터를 끝으로 이동 (append 모드)
        SetFilePointer(hFile, 0, NULL, FILE_END);
        
        // 파일 핸들을 FILE*로 변환
        FILE* filePtr = nullptr;
        int fd = _open_osfhandle((intptr_t)hFile, _O_WRONLY);
        if (fd < 0) {
            cerr << "[MessageRepository] 파일 디스크립터 변환 실패: " << filename << endl;
            UnlockFileEx(hFile, 0, 0, 0, &overlapped);
            CloseHandle(hFile);
            return false;
        }
        filePtr = _fdopen(fd, "a");
        if (!filePtr) {
            cerr << "[MessageRepository] 파일 스트림 생성 실패: " << filename << endl;
            _close(fd);
            UnlockFileEx(hFile, 0, 0, 0, &overlapped);
            CloseHandle(hFile);
            return false;
        }
#else
        int fd = open(filename.c_str(), O_WRONLY | O_CREAT | O_APPEND, 0644);
        if (fd < 0) {
            cerr << "[MessageRepository] 파일 열기 실패: " << filename << endl;
            return false;
        }
        
        // 파일 잠금
        if (flock(fd, LOCK_EX) != 0) {
            cerr << "[MessageRepository] 파일 잠금 실패: " << filename << endl;
            close(fd);
            return false;
        }
        
        FILE* filePtr = fdopen(fd, "a");
        if (!filePtr) {
            cerr << "[MessageRepository] 파일 스트림 생성 실패: " << filename << endl;
            flock(fd, LOCK_UN);
            close(fd);
            return false;
        }
#endif
        
        // 메시지들을 순서대로 파일에 저장
        vector<int64> msgSeqsToDelete;
        for (const auto& msgTuple : messageList) {
            int64 msgSeq = get<0>(msgTuple);
            string senderId = get<1>(msgTuple);
            string messageData = get<2>(msgTuple);
            int64 timestamp = get<3>(msgTuple);
            string deliveredAtStr = get<4>(msgTuple);
            
            // Protobuf 메시지 역직렬화
            Protocol::S_Chat sChat;
            if (DeserializeMessage(messageData, sChat)) {
                // 메시지 내용 추출
                string messageText = "[첨부]";
                if (sChat.payload().has_text()) {
                    messageText = sChat.payload().text().message();
                }
                
                // 타임스탬프를 날짜/시간 문자열로 변환
                string timestampStr = TimestampToDateTimeString(timestamp);
                
                // 형식: [ timestamp ] sender : [ delivered timestamp ] : 메세지 내용
                string line = "[" + timestampStr + "] " + senderId 
                             + " : [" + deliveredAtStr + "] : " 
                             + messageText + "\n";
                
                size_t written = fwrite(line.c_str(), 1, line.length(), filePtr);
                if (written != line.length()) {
                    cerr << "[MessageRepository] ArchiveReadMessages: 파일 쓰기 실패 (written=" 
                         << written << ", expected=" << line.length() << ")" << endl;
                }
                
                msgSeqsToDelete.push_back(msgSeq);
            } else {
                cerr << "[MessageRepository] ArchiveReadMessages: 메시지 역직렬화 실패: msgSeq=" 
                     << msgSeq << endl;
            }
        }
        
        // 파일 버퍼 플러시
        fflush(filePtr);
        
        // 파일 잠금 해제 및 닫기
#ifdef _WIN32
        fclose(filePtr);  // _fdopen으로 열었으므로 fclose로 닫기 (핸들도 자동으로 닫힘)
        // 파일 잠금은 fclose 시 자동으로 해제됨
#else
        fclose(filePtr);  // fdopen으로 열었으므로 fclose로 닫기 (fd도 자동으로 닫힘)
        // 파일 잠금은 fclose 시 자동으로 해제됨
#endif
        
        // 파일에 저장한 메시지들을 DB에서 삭제
        for (int64 msgSeq : msgSeqsToDelete) {
            DeleteMessage(convId, msgSeq);
        }
        
        cout << "[MessageRepository] ArchiveReadMessages 완료: convId=" << convId 
             << ", 파일=" << filename 
             << ", count=" << msgSeqsToDelete.size() << endl;
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[MessageRepository] 메시지 아카이브 실패: " << err.what() << endl;
        return false;
    } catch (const exception& e) {
        cerr << "[MessageRepository] 메시지 아카이브 실패: " << e.what() << endl;
        return false;
    }
}

