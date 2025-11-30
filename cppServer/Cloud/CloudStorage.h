#pragma once

#include "pch.h"

// 클라우드 스토리지 추상화 인터페이스
// GCP Cloud Storage, AWS S3, Azure Blob 등 다양한 구현 가능
class CloudStorage {
public:
    virtual ~CloudStorage() = default;
    
    // 초기화
    virtual bool Initialize() = 0;
    
    // Signed Upload URL 생성 (클라이언트가 직접 업로드)
    // fileId: 파일 고유 ID
    // gcsPath: 클라우드 스토리지 경로 (예: "images/abc123.jpg")
    // mimeType: MIME 타입 (예: "image/jpeg")
    // expiresInSeconds: URL 만료 시간 (기본 1시간)
    virtual string GenerateUploadUrl(
        const string& fileId,
        const string& path,
        const string& mimeType,
        int64 expiresInSeconds = 3600
    ) = 0;
    
    // Signed Download URL 생성
    // gcsPath: 클라우드 스토리지 경로
    // expiresInSeconds: URL 만료 시간 (기본 1년)
    virtual string GenerateDownloadUrl(
        const string& path,
        int64 expiresInSeconds = 31536000
    ) = 0;
    
    // 서버에서 직접 업로드 (썸네일 생성 등)
    // gcsPath: 클라우드 스토리지 경로
    // data: 파일 바이너리 데이터
    // mimeType: MIME 타입
    virtual bool UploadFile(const string& path, const vector<uint8>& data, const string& mimeType) = 0;

    // 파일 삭제
    virtual bool RemoveFile(const string& path) = 0;
    
    // 파일 존재 확인
    virtual bool FileExists(const string& path) = 0;
};

