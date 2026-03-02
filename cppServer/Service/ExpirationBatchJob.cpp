#include "pch.h"
#include "ExpirationBatchJob.h"
#include "Cloud/CloudStorage.h"
#include "../DB/FileRepository.h"
#include "../DB/MessageRepository.h"
#include "../CoreGlobal.h"

#include <iostream>
#include <chrono>

using namespace std;

ExpirationBatchJob::ExpirationBatchJob(CloudStorage* cloudStorage, int checkIntervalSec)
    : _cloudStorage(cloudStorage), _intervalSec(checkIntervalSec)
{
}

ExpirationBatchJob::~ExpirationBatchJob()
{
    Stop();
}

void ExpirationBatchJob::Start()
{
    if (_running.exchange(true)) return;

    _thread = thread([this]() { RunLoop(); });
    LOG_INFO("[ExpirationBatchJob] Started (interval: {}s)", _intervalSec);
}

void ExpirationBatchJob::Stop()
{
    if (!_running.exchange(false)) return;
    if (_thread.joinable())
        _thread.join();
    LOG_INFO("[ExpirationBatchJob] Stopped");
}

void ExpirationBatchJob::RunOnce()
{
    ProcessExpiredFiles();
}

void ExpirationBatchJob::RunLoop()
{
    // Wait 60s after server start before first run
    this_thread::sleep_for(chrono::seconds(60));

    while (_running.load()) {
        ProcessExpiredFiles();

        // Sleep in 1s chunks so Stop() signal is detected quickly
        for (int i = 0; i < _intervalSec && _running.load(); ++i) {
            this_thread::sleep_for(chrono::seconds(1));
        }
    }
}

void ExpirationBatchJob::ProcessExpiredFiles()
{
    if (!_cloudStorage) {
        LOG_ERROR("[ExpirationBatchJob] CloudStorage not initialized - skip");
        return;
    }

    int64 now = Nowts();
    LOG_INFO("[ExpirationBatchJob] Processing expired files (now={})", now);

    auto expiredFiles = FileRepository::GetExpiredFiles(now);
    if (expiredFiles.empty()) {
        LOG_INFO("[ExpirationBatchJob] No expired files");
        return;
    }

    LOG_INFO("[ExpirationBatchJob] Found {} expired file(s)", expiredFiles.size());

    int deleted = 0, failed = 0;
    for (const auto& fi : expiredFiles) {
        bool gcsOk = true;

        // 1) Delete original GCS file
        if (!fi.gcsPath.empty()) {
            gcsOk = _cloudStorage->RemoveFile(fi.gcsPath);
            if (!gcsOk) {
                LOG_ERROR("[ExpirationBatchJob] GCS delete failed: {}", fi.gcsPath);
            }
        }

        // 2) Delete thumbnail (if exists)
        if (!fi.thumbnailGcsPath.empty()) {
            _cloudStorage->RemoveFile(fi.thumbnailGcsPath);
        }

        // 3) Update file_uploads status
        FileRepository::UpdateUploadStatus(fi.fileId, "deleted");

        // 4) Update messages: file_status = 'expired', invalidate URLs
        if (!fi.gcsPath.empty()) {
            MessageRepository::UpdateFileStatusByGcsPath(fi.gcsPath, "expired");
        }

        if (gcsOk) {
            ++deleted;
            LOG_INFO("[ExpirationBatchJob] Deleted: {}", fi.gcsPath);
        } else {
            ++failed;
        }
    }

    LOG_INFO("[ExpirationBatchJob] Done: deleted={} failed={}", deleted, failed);
}
