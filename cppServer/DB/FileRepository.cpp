#include "pch.h"
#include "FileRepository.h"
#include "DBManager.h"

#include "../CoreGlobal.h"

bool FileRepository::SaveFileMetadata(const FileInfo& fileInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto files = schema.getTable("file_uploads");
        
        // 파일 메타데이터 저장
        files.insert("file_id", "user_id", "original_filename", "gcs_bucket", "gcs_path",
                    "file_size", "mime_type", "is_image", "thumbnail_gcs_path",
                    "upload_status", "created_at", "uploaded_at", "expires_at")
            .values(fileInfo.fileId, fileInfo.userId, fileInfo.originalFilename, 
                    fileInfo.gcsBucket, fileInfo.gcsPath, fileInfo.fileSize, 
                    fileInfo.mimeType, fileInfo.isImage, fileInfo.thumbnailGcsPath,
                    fileInfo.uploadStatus, fileInfo.createdAt, fileInfo.uploadedAt, 
                    fileInfo.expiresAt)
            .execute();
        
        cout << "[FileRepository] 파일 메타데이터 저장 완료: fileId=" << fileInfo.fileId 
             << ", userId=" << fileInfo.userId << endl;
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FileRepository] 파일 메타데이터 저장 실패: " << err.what() << endl;
        return false;
    }
}

bool FileRepository::GetFileMetadata(const string& fileId, FileInfo& fileInfo) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto files = schema.getTable("file_uploads");
        
        // 파일 ID로 메타데이터 조회
        auto result = files.select("file_id", "user_id", "original_filename", "gcs_bucket", 
                                   "gcs_path", "file_size", "mime_type", "is_image",
                                   "thumbnail_gcs_path", "upload_status", "created_at",
                                   "uploaded_at", "expires_at")
                           .where("file_id = :fid")
                           .bind("fid", fileId)
                           .execute();
        
        auto row = result.fetchOne();
        if (!row) {
            return false;
        }
        
        // 결과를 FileInfo에 채우기
        fileInfo.fileId = row[0].get<string>();
        fileInfo.userId = row[1].get<string>();
        fileInfo.originalFilename = row[2].get<string>();
        fileInfo.gcsBucket = row[3].get<string>();
        fileInfo.gcsPath = row[4].get<string>();
        fileInfo.fileSize = row[5].get<int64>();
        if (!row[6].isNull()) fileInfo.mimeType = row[6].get<string>();
        fileInfo.isImage = row[7].get<int>() != 0;
        if (!row[8].isNull()) fileInfo.thumbnailGcsPath = row[8].get<string>();
        if (!row[9].isNull()) fileInfo.uploadStatus = row[9].get<string>();
        if (!row[10].isNull()) {
            // created_at을 타임스탬프로 변환
            auto tsValue = row[10];
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
                    time_t t = mktime(&timeinfo);
                    fileInfo.createdAt = t * 1000;  // 밀리초로 변환
                }
            } else {
                fileInfo.createdAt = tsValue.get<int64>();
            }
        }
        if (!row[11].isNull()) {
            auto tsValue = row[11];
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
                    time_t t = mktime(&timeinfo);
                    fileInfo.uploadedAt = t * 1000;
                }
            } else {
                fileInfo.uploadedAt = tsValue.get<int64>();
            }
        }
        if (!row[12].isNull()) {
            auto tsValue = row[12];
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
                    time_t t = mktime(&timeinfo);
                    fileInfo.expiresAt = t * 1000;
                }
            } else {
                fileInfo.expiresAt = tsValue.get<int64>();
            }
        }
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FileRepository] 파일 메타데이터 조회 실패: " << err.what() << endl;
        return false;
    }
}

vector<FileInfo> FileRepository::GetUserFiles(const string& userId, int limit) {
    vector<FileInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto files = schema.getTable("file_uploads");
        
        // TODO: 사용자 파일 목록 조회
        // 현재는 뼈대만 구현
        
        cout << "[FileRepository] 사용자 파일 목록 조회: userId=" << userId << endl;
        
        return result;
    } catch (const exception& e) {
        cerr << "[FileRepository] 사용자 파일 목록 조회 실패: " << e.what() << endl;
        return result;
    }
}

bool FileRepository::UpdateUploadStatus(const string& fileId, const string& status) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto files = schema.getTable("file_uploads");
        
        // 업로드 상태 업데이트
        int64 uploadedAt = 0;
        if (status == "completed") {
            uploadedAt = Nowts();
        }
        
        files.update()
            .set("upload_status", status)
            .set("uploaded_at", uploadedAt)
            .where("file_id = :fid")
            .bind("fid", fileId)
            .execute();
        
        cout << "[FileRepository] 업로드 상태 업데이트 완료: fileId=" << fileId 
             << ", status=" << status << endl;
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FileRepository] 업로드 상태 업데이트 실패: " << err.what() << endl;
        return false;
    }
}

bool FileRepository::DeleteFileMetadata(const string& fileId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto files = schema.getTable("file_uploads");
        
        // 파일 메타데이터 삭제
        files.remove()
            .where("file_id = :fid")
            .bind("fid", fileId)
            .execute();
        
        cout << "[FileRepository] 파일 메타데이터 삭제 완료: fileId=" << fileId << endl;
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FileRepository] 파일 메타데이터 삭제 실패: " << err.what() << endl;
        return false;
    }
}

vector<FileInfo> FileRepository::GetExpiredFiles(int64 currentTime) {
    vector<FileInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto files = schema.getTable("file_uploads");
        
        // TODO: 만료된 파일 목록 조회
        // 현재는 뼈대만 구현
        
        cout << "[FileRepository] 만료된 파일 목록 조회" << endl;
        
        return result;
    } catch (const exception& e) {
        cerr << "[FileRepository] 만료된 파일 목록 조회 실패: " << e.what() << endl;
        return result;
    }
}

