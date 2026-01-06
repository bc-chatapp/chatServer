#include "pch.h"
#include "FileService.h"
#include "ServerSession.h"
#include "Cloud/CloudStorage.h"
#include "PacketDispatcher.h"

#include <random>
#include <sstream>
#include <iomanip>

using namespace Protocol;


FileService::FileService(CloudStorage* cloudStorage)
    : _cloudStorage(cloudStorage)
{
}

FileService::~FileService() {
}

bool FileService::HandleUploadFileRequest(sessionPtr& session, uint64 reqId, const Protocol::C_UploadFile& pkt)
{
    if (!_cloudStorage) {
        HandleErr(session, reqId, ERR_CLOUD_STORAGE_NOT_INITIALIZED);
        return false;
    }

    if (pkt.filename().empty()) {
        HandleErr(session, reqId, ERR_FILENAME_REQUIRED);
        return false;
    }

    if (pkt.size() <= 0) {
        HandleErr(session, reqId, ERR_INVALID_FILE_SIZE);
        return false;
    }

    if (pkt.mime_type().empty()) {
        HandleErr(session, reqId, ERR_MIME_TYPE_REQUIRED);
        return false;
    }

    try {
        string fileId = GenerateFileId(pkt.filename());
        auto serverSession = static_pointer_cast<ServerSession>(session);
        string userId = serverSession->GetUserId();


        string extension = "";
        size_t dotPos = pkt.filename().find_last_of(".");
        if (dotPos != string::npos)
            extension = pkt.filename().substr(dotPos);

        string path = "files/" + userId + "/" + fileId + extension;
        /* signed Url */
        const int64 expiresTime = 3600;

        string uploadUrl = _cloudStorage->GenerateUploadUrl(fileId, path, pkt.mime_type(), expiresTime);
        string downloadUrl = _cloudStorage->GenerateDownloadUrl(path, expiresTime);

        if (uploadUrl.empty() || downloadUrl.empty()) {
            HandleErr(session, reqId, ERR_FAILED_TO_GENERATE_URL);
            return false;
        }

        int64 expiresAt = Nowts() + (expiresTime * 1000);

        Protocol::S_UploadFile pkt_s_upload;
        pkt_s_upload.set_success(true);
        pkt_s_upload.set_message(" ");
        pkt_s_upload.set_file_id(fileId);
        pkt_s_upload.set_upload_url(uploadUrl);
        pkt_s_upload.set_download_url(downloadUrl);
        pkt_s_upload.set_expires_at(expiresAt);
        pkt_s_upload.set_path(path);

        if (pkt.is_image()) {
            string thumbPath = "files/" + userId + "/" + fileId + "_thumb.jpg";
            string thumbUploadUrl = _cloudStorage->GenerateUploadUrl(fileId + "_thumb", thumbPath, "image/jpeg", expiresTime);
            string thumbDownloadUrl = _cloudStorage->GenerateDownloadUrl(thumbPath, expiresTime);

            pkt_s_upload.set_thumb_upload_url(thumbUploadUrl);
            pkt_s_upload.set_thumbnail_url(thumbDownloadUrl);
        }

        PushEnvelope(session, reqId, pkt_s_upload);
        cout << "[FileService] Upload URL generated: fileId=" << fileId << ", path=" << path << ", userId=" << userId << endl;

        return true;
    }
    catch (const exception& e) {
        HandleErr(session, reqId, ERR_SERVER_INTERNAL, "Internal server error: " + string(e.what()));
        return false;
    }
}

string FileService::GenerateFileId(const string& filename)
{
    int64 timestamp = Nowts();

    // [check] static -> thread_local로 변경 (멀티스레드 안전)
    static const char alphanum[] = "0123456789abcdefghijklmnopqrstuvwxyz";
    static random_device rd;
    static mt19937 gen(rd());
    static uniform_int_distribution<> dis(0, sizeof(alphanum) - 2);

    string randomStr;
    for (int i = 0; i < 6; ++i) {
        randomStr += alphanum[dis(gen)];
    }

    stringstream ss;
    ss << "file_" << timestamp << "_" << randomStr;
    return ss.str();
}

void FileService::PushEnvelope(sessionPtr& session, uint64 reqId, const Protocol::S_UploadFile& pkt_s_upload)
{
    Protocol::Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_upload_file() = pkt_s_upload;

    PacketDispatcher::SendEnvelope(session, env);
}

void FileService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& errMessage)
{
    cerr << "[FileService] Error: " << errMessage << " (code: " << static_cast<int>(errorCode) << ")" << endl;
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
