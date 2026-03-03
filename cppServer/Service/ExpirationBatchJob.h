#pragma once

#include "pch.h"
#include <thread>
#include <atomic>

class CloudStorage;

/**
 * 파일 보관 만료 배치 잡
 * - 주기적으로 DB의 file_retention_expires_at < NOW 파일을 조회
 * - GCS에서 실제 파일 삭제 → DB file_uploads.upload_status = 'deleted'
 * - messages.file_status = 'expired' (media_url 무효화)
 */
class ExpirationBatchJob
{
public:
    // checkIntervalSec: 배치 실행 간격 (기본 6시간)
    explicit ExpirationBatchJob(CloudStorage* cloudStorage, int checkIntervalSec = 6 * 3600);
    ~ExpirationBatchJob();

    void Start();
    void Stop();

    // 즉시 한 번 실행 (테스트용)
    void RunOnce();

private:
    void RunLoop();
    void ProcessExpiredFiles();

    CloudStorage*    _cloudStorage;
    int              _intervalSec;
    thread           _thread;
    atomic<bool>     _running{ false };
};

extern ExpirationBatchJob* GExpirationBatchJob;
