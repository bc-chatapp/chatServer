#pragma once

#include "pch.h"

// 파일 메타데이터 정보
struct FileInfo {
    string fileId;
    string userId;
    string originalFilename;
    string gcsBucket;
    string gcsPath;
    int64 fileSize;
    string mimeType;
    bool isImage;
    string thumbnailGcsPath;  // 썸네일 경로 (이미지인 경우)
    string uploadStatus;       // "pending", "uploading", "completed", "failed"
    int64 createdAt;
    int64 uploadedAt;
    int64 expiresAt;              // 파일 만료 시간 (선택)
};

// 파일 메타데이터 DB 관리
class FileRepository {
public:
    // 파일 메타데이터 저장
    static bool SaveFileMetadata(const FileInfo& fileInfo);
    
    // 파일 ID로 메타데이터 조회
    static bool GetFileMetadata(const string& fileId, FileInfo& fileInfo);
    
    // 사용자 ID로 파일 목록 조회
    static vector<FileInfo> GetUserFiles(const string& userId, int limit = 100);
    
    // 파일 업로드 상태 업데이트
    static bool UpdateUploadStatus(const string& fileId, const string& status);
    
    // 파일 삭제 (메타데이터만 삭제, 실제 파일은 별도 처리)
    static bool DeleteFileMetadata(const string& fileId);
    
    // 만료된 파일 목록 조회
    static vector<FileInfo> GetExpiredFiles(int64 currentTime);
};

