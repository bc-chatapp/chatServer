#include "pch.h"
#include "FileService.h"
#include "ServerSession.h"
#include "Cloud/CloudStorage.h"
#include "PacketDispatcher.h"
#include "../CoreGlobal.h"
#include "../DB/UserRepository.h"
#include "../DB/GroupRepository.h"
#include "../DB/FileRepository.h"

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
        auto serverSession = static_pointer_cast<ServerSession>(session);
        string userId = serverSession->GetUserId();

        // ─── 공통: 파일 크기 제한 (CoreGlobal 상수 fallback) ───
        int64 maxFileSize = DEFAULT_MAX_FILE_SIZE;
        {
            UserRepository::StorageInfo storageInfo;
            if (UserRepository::GetStorageInfo(userId, storageInfo) && storageInfo.maxFileSize > 0) {
                maxFileSize = storageInfo.maxFileSize;
            }
        }

        if (pkt.size() > maxFileSize) {
            HandleErr(session, reqId, ERR_FILE_TOO_LARGE, "파일 크기가 제한을 초과했습니다.");
            return false;
        }

        // ─── 개인 채팅 파일: 누적 용량 체크 ───
        if (pkt.upload_type() == Protocol::C_UploadFile_UploadType_DIRECT_CHAT) {
            UserRepository::StorageInfo storageInfo;
            if (UserRepository::GetStorageInfo(userId, storageInfo)) {
                int64 capacity = storageInfo.storageCapacity > 0 ? storageInfo.storageCapacity : DEFAULT_PERSONAL_STORAGE;
                if (storageInfo.storageUsage + pkt.size() > capacity) {
                    HandleErr(session, reqId, ERR_STORAGE_EXCEEDED, "저장 용량이 부족합니다.");
                    return false;
                }
            }
        }

        // ─── 그룹 채팅 파일: 그룹 누적 용량 체크 ───
        if (pkt.upload_type() == Protocol::C_UploadFile_UploadType_GROUP_CHAT) {
            if (pkt.target_id().empty()) {
                HandleErr(session, reqId, ERR_INVALID_ARGUMENT, "Group ID (target_id) is required.");
                return false;
            }

            cGroupInfo groupInfo;
            if (GroupRepository::GetGroupInfoById(pkt.target_id(), groupInfo)) {
                int64 groupLimit = groupInfo.storageLimit > 0 ? groupInfo.storageLimit : DEFAULT_GROUP_STORAGE;
                if (groupInfo.storageUsage + pkt.size() > groupLimit) {
                    HandleErr(session, reqId, ERR_STORAGE_EXCEEDED, "그룹 저장 용량이 부족합니다.");
                    return false;
                }
            }
        }

        string fileId = GenerateFileId(pkt.filename());

        string extension = "";
        size_t dotPos = pkt.filename().find_last_of(".");
        if (dotPos != string::npos)
            extension = pkt.filename().substr(dotPos);

        string ts = to_string(Nowts());
        string path;
        string thumbPath;

        switch (pkt.upload_type()) {
        case Protocol::C_UploadFile_UploadType_DIRECT_CHAT:
            // 1:1 채팅: files/user/{userId}/{fileId}.ext
            path = "files/user/" + userId + "/" + fileId + extension;
            if (pkt.is_image()) {
                thumbPath = "files/user/" + userId + "/" + fileId + "_thumb.jpg";
            }
            break;

        case Protocol::C_UploadFile_UploadType_GROUP_CHAT:
            // 그룹 채팅: files/group/{groupId}/{userId}/{fileId}.ext
            if (pkt.target_id().empty()) {
                HandleErr(session, reqId, ERR_INVALID_ARGUMENT, "Group ID (target_id) is required for GROUP_CHAT.");
                return false;
            }
            path = "files/group/" + pkt.target_id() + "/" + userId + "/" + fileId + extension;
            if (pkt.is_image()) {
                thumbPath = "files/group/" + pkt.target_id() + "/" + userId + "/" + fileId + "_thumb.jpg";
            }
            break;

        case Protocol::C_UploadFile_UploadType_PROFILE_IMG:
            // 유저 프로필: profiles/user/{userId}_{timestamp}.ext
            path = "profiles/user/" + userId + "_" + ts + extension;
            if (pkt.is_image()) {
                thumbPath = "profiles/user/" + userId + "_" + ts + "_thumb.jpg";
            }
            break;

        case Protocol::C_UploadFile_UploadType_GROUP_PROFILE_IMG:
            // 그룹 프로필: profiles/group/{groupId}_{timestamp}.ext
            if (pkt.target_id().empty()) {
                HandleErr(session, reqId, ERR_INVALID_ARGUMENT, "Group ID (target_id) is required for GROUP_PROFILE_Img.");
                return false;
            }
            path = "profiles/group/" + pkt.target_id() + "_" + ts + extension;
            if (pkt.is_image()) {
                thumbPath = "profiles/group/" + pkt.target_id() + "_" + ts + "_thumb.jpg";
            }
            break;

        case Protocol::C_UploadFile_UploadType_BACKGROUND_IMG:
            // 유저 배경 이미지: backgrounds/user/{userId}_{timestamp}.ext
            path = "backgrounds/user/" + userId + "_" + ts + extension;
            if (pkt.is_image()) {
                thumbPath = "backgrounds/user/" + userId + "_" + ts + "_thumb.jpg";
            }
            break;

        default:
            HandleErr(session, reqId, ERR_INVALID_ARGUMENT, "Invalid UploadType");
            return false;
        }


        /* signed Url */
        const int64 expiresTime = 3600;
        string uploadUrl = _cloudStorage->GenerateUploadUrl(fileId, path, pkt.mime_type(), expiresTime);
        string downloadUrl = _cloudStorage->GenerateDownloadUrl(path, expiresTime);

        string thumbUploadUrl = "";
        string thumbDownloadUrl = "";

        if (pkt.is_image()) {
            thumbUploadUrl = _cloudStorage->GenerateUploadUrl(fileId + "_thumb", thumbPath, "image/jpeg", expiresTime);
            thumbDownloadUrl = _cloudStorage->GenerateDownloadUrl(thumbPath, expiresTime);
        }

        if (uploadUrl.empty() || downloadUrl.empty()) {
            HandleErr(session, reqId, ERR_FAILED_TO_GENERATE_URL);
            return false;
        }

        int64 urlExpiresAt = Nowts() + (expiresTime * 1000);

        // ─── 파일 보관 정책 ───
        // 이메일 미인증 유저: 7일 후 만료 / 인증 유저: 영구 보관
        int64 fileRetentionExpiresAt = 0; // 0 = 영구 보관
        if (pkt.upload_type() == Protocol::C_UploadFile_UploadType_DIRECT_CHAT ||
            pkt.upload_type() == Protocol::C_UploadFile_UploadType_GROUP_CHAT) {
            cUserInfo userInfo;
            if (UserRepository::GetUser(userId, userInfo) && !userInfo.isEmailVerified) {
                fileRetentionExpiresAt = Nowts() + (7LL * 24 * 60 * 60 * 1000); // 7일
            }
        }

        // file_uploads DB에 파일 메타데이터 저장
        FileInfo fi;
        fi.fileId                 = fileId;
        fi.userId                 = userId;
        fi.originalFilename       = pkt.filename();
        fi.gcsBucket              = "";  // CoreGlobal이 설정한 버킷
        fi.gcsPath                = path;
        fi.fileSize               = pkt.size();
        fi.mimeType               = pkt.mime_type();
        fi.isImage                = pkt.is_image();
        fi.thumbnailGcsPath       = thumbPath;
        fi.uploadStatus           = "pending";
        fi.createdAt              = Nowts();
        fi.uploadedAt             = 0;
        fi.expiresAt              = urlExpiresAt;
        fi.fileRetentionExpiresAt = fileRetentionExpiresAt;
        FileRepository::SaveFileMetadata(fi);

        Protocol::S_UploadFile pkt_s_upload;
        pkt_s_upload.set_success(true);
        pkt_s_upload.set_message(" ");
        pkt_s_upload.set_file_id(fileId);
        pkt_s_upload.set_upload_url(uploadUrl);
        pkt_s_upload.set_download_url(downloadUrl);
        pkt_s_upload.set_thumb_upload_url(thumbUploadUrl);
        pkt_s_upload.set_thumbnail_url(thumbDownloadUrl);
        pkt_s_upload.set_expires_at(urlExpiresAt);
        pkt_s_upload.set_path(path);
        pkt_s_upload.set_file_retention_expires_at(fileRetentionExpiresAt);

        PushEnvelope(session, reqId, pkt_s_upload);
        LOG_INFO("[FileService] Upload URL generated: fileId={}, path={}, userId={}, retentionExpires={}", fileId, path, userId, fileRetentionExpiresAt);

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
    LOG_ERROR("[FileService] Error: {} (code: {})", errMessage, static_cast<int>(errorCode));
    PacketDispatcher::DispatchError(session, reqId, errorCode, errMessage);
}
