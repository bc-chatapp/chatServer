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
        
        LOG_INFO("[FileRepository] 파일 메타데이터 저장 완료: fileId={}, userId={}", fileInfo.fileId, fileInfo.userId);
        
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[FileRepository] 파일 메타데이터 저장 실패: {}", err.what());
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
        LOG_ERROR("[FileRepository] 파일 메타데이터 조회 실패: {}", err.what());
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
        
        LOG_INFO("[FileRepository] 사용자 파일 목록 조회: userId={}", userId);
        
        return result;
    } catch (const exception& e) {
        LOG_ERROR("[FileRepository] 사용자 파일 목록 조회 실패: {}", e.what());
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
        
        LOG_INFO("[FileRepository] 업로드 상태 업데이트 완료: fileId={}, status={}", fileId, status);
        
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[FileRepository] 업로드 상태 업데이트 실패: {}", err.what());
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
        
        LOG_INFO("[FileRepository] 파일 메타데이터 삭제 완료: fileId={}", fileId);
        
        return true;
    } catch (const mysqlx::Error& err) {
        LOG_ERROR("[FileRepository] 파일 메타데이터 삭제 실패: {}", err.what());
        return false;
    }
}

vector<FileInfo> FileRepository::GetExpiredFiles(int64 currentTime) {
    vector<FileInfo> result;

    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // file_retention_expires_at < currentTime AND upload_status != 'deleted'
        string sql =
            "SELECT file_id, user_id, original_filename, gcs_bucket, gcs_path, "
            "       file_size, mime_type, is_image, thumbnail_gcs_path, upload_status, "
            "       UNIX_TIMESTAMP(created_at)*1000, UNIX_TIMESTAMP(uploaded_at)*1000, "
            "       UNIX_TIMESTAMP(expires_at)*1000, file_retention_expires_at "
            "FROM file_uploads "
            "WHERE file_retention_expires_at IS NOT NULL "
            "  AND file_retention_expires_at < ? "
            "  AND upload_status != 'deleted' "
            "LIMIT 500";

        auto res = session.sql(sql).bind(currentTime).execute();

        for (auto row : res) {
            FileInfo fi;
            fi.fileId              = row[0].isNull() ? "" : row[0].get<string>();
            fi.userId              = row[1].isNull() ? "" : row[1].get<string>();
            fi.originalFilename    = row[2].isNull() ? "" : row[2].get<string>();
            fi.gcsBucket           = row[3].isNull() ? "" : row[3].get<string>();
            fi.gcsPath             = row[4].isNull() ? "" : row[4].get<string>();
            fi.fileSize            = row[5].isNull() ? 0  : row[5].get<int64>();
            fi.mimeType            = row[6].isNull() ? "" : row[6].get<string>();
            fi.isImage             = row[7].isNull() ? false : (row[7].get<int>() != 0);
            fi.thumbnailGcsPath    = row[8].isNull() ? "" : row[8].get<string>();
            fi.uploadStatus        = row[9].isNull() ? "" : row[9].get<string>();
            fi.createdAt           = row[10].isNull() ? 0 : row[10].get<int64>();
            fi.uploadedAt          = row[11].isNull() ? 0 : row[11].get<int64>();
            fi.expiresAt           = row[12].isNull() ? 0 : row[12].get<int64>();
            fi.fileRetentionExpiresAt = row[13].isNull() ? 0 : row[13].get<int64>();
            result.push_back(fi);
        }

        LOG_INFO("[FileRepository] 만료된 파일 {}개 조회 완료", result.size());
        return result;
    } catch (const exception& e) {
        LOG_ERROR("[FileRepository] 만료된 파일 목록 조회 실패: {}", e.what());
        return result;
    }
}


bool FileRepository::UpdateFileRetentionExpiry(const string& fileId, int64 expiresAt) {
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        if (expiresAt <= 0) {
            // NULL로 설정 (영구 보관)
            session.sql("UPDATE file_uploads SET file_retention_expires_at = NULL WHERE file_id = ?")
                .bind(fileId).execute();
        } else {
            session.sql("UPDATE file_uploads SET file_retention_expires_at = ? WHERE file_id = ?")
                .bind(expiresAt, fileId).execute();
        }
        return true;
    } catch (const exception& e) {
        LOG_ERROR("[FileRepository] UpdateFileRetentionExpiry 실패: {}", e.what());
        return false;
    }
}


bool FileRepository::UpdateUserFilesRetentionExpiry(const string& userId, int64 expiresAt) {
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        if (expiresAt <= 0) {
            // NULL → 영구 보관 (구독 시작 시)
            session.sql(
                "UPDATE file_uploads SET file_retention_expires_at = NULL "
                "WHERE user_id = ? AND upload_status != 'deleted'")
                .bind(userId).execute();
        } else {
            // 해지 유예: 아직 만료되지 않은 파일에만 적용
            session.sql(
                "UPDATE file_uploads SET file_retention_expires_at = ? "
                "WHERE user_id = ? AND upload_status != 'deleted' "
                "  AND (file_retention_expires_at IS NULL OR file_retention_expires_at > ?)")
                .bind(expiresAt, userId, expiresAt).execute();
        }

        LOG_INFO("[FileRepository] UpdateUserFilesRetentionExpiry: userId={}, expiresAt={}", userId, expiresAt);
        return true;
    } catch (const exception& e) {
        LOG_ERROR("[FileRepository] UpdateUserFilesRetentionExpiry 실패: {}", e.what());
        return false;
    }
}

