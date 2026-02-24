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
    cout << "[ExpirationBatchJob] Started (interval: " << _intervalSec << "s)" << endl;
}

void ExpirationBatchJob::Stop()
{
    if (!_running.exchange(false)) return;
    if (_thread.joinable())
        _thread.join();
    cout << "[ExpirationBatchJob] Stopped" << endl;
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
        cerr << "[ExpirationBatchJob] CloudStorage not initialized - skip" << endl;
        return;
    }

    int64 now = Nowts();
    cout << "[ExpirationBatchJob] Processing expired files (now=" << now << ")" << endl;

    auto expiredFiles = FileRepository::GetExpiredFiles(now);
    if (expiredFiles.empty()) {
        cout << "[ExpirationBatchJob] No expired files" << endl;
        return;
    }

    cout << "[ExpirationBatchJob] Found " << expiredFiles.size() << " expired file(s)" << endl;

    int deleted = 0, failed = 0;
    for (const auto& fi : expiredFiles) {
        bool gcsOk = true;

        // 1) Delete original GCS file
        if (!fi.gcsPath.empty()) {
            gcsOk = _cloudStorage->RemoveFile(fi.gcsPath);
            if (!gcsOk) {
                cerr << "[ExpirationBatchJob] GCS delete failed: " << fi.gcsPath << endl;
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
            cout << "[ExpirationBatchJob] Deleted: " << fi.gcsPath << endl;
        } else {
            ++failed;
        }
    }

    cout << "[ExpirationBatchJob] Done: deleted=" << deleted << " failed=" << failed << endl;
}
