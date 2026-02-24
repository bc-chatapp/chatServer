#include "pch.h"
#include "FileService.h"
#include "ServerSession.h"
#include "Cloud/CloudStorage.h"
#include "PacketDispatcher.h"
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

        // ─── 파일 크기 체크 (용량 쿼터와 무관한 단순 크기 제한) ───
        // 정책: 사진/동영상/파일 메시지는 구독 상태와 무관하게 항상 전송 가능.
        //       클라우드 저장 용량 관리(ERR_STORAGE_EXCEEDED)는 추후 구독 기능에서 처리.
        if (pkt.upload_type() == Protocol::C_UploadFile_UploadType_DIRECT_CHAT ||
            pkt.upload_type() == Protocol::C_UploadFile_UploadType_GROUP_CHAT) {
            UserRepository::StorageInfo storageInfo;
            if (UserRepository::GetStorageInfo(userId, storageInfo)) {
                if (pkt.size() > storageInfo.maxFileSize) {
                    HandleErr(session, reqId, ERR_FILE_TOO_LARGE, "파일 크기가 제한을 초과했습니다.");
                    return false;
                }
            }
        }

        // 그룹 업로드 시 target_id 필수 검증
        if (pkt.upload_type() == Protocol::C_UploadFile_UploadType_GROUP_CHAT) {
            if (pkt.target_id().empty()) {
                HandleErr(session, reqId, ERR_INVALID_ARGUMENT, "Group ID (target_id) is required.");
                return false;
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

        // ─── 파일 보관 만료 정책 결정 ───
        // 채팅용 파일만 보관 정책 적용 (프로필/배경 이미지는 영구 보관)
        int64 fileRetentionExpiresAt = 0; // 0 = 영구 보관 (NULL)
        bool isChatFile = (pkt.upload_type() == Protocol::C_UploadFile_UploadType_DIRECT_CHAT ||
                           pkt.upload_type() == Protocol::C_UploadFile_UploadType_GROUP_CHAT);

        if (isChatFile) {
            UserRepository::StorageInfo storageInfo;
            if (UserRepository::GetStorageInfo(userId, storageInfo)) {
                if (storageInfo.subGrade <= 0) {
                    // 무료 플랜: 7일 후 삭제
                    const int64 FREE_RETENTION_MS = 7LL * 24 * 3600 * 1000;
                    fileRetentionExpiresAt = Nowts() + FREE_RETENTION_MS;
                    cout << "[FileService] 무료 플랜: 파일 보관 7일 설정 userId=" << userId << endl;
                }
                // else: 구독 중 → 영구 (fileRetentionExpiresAt = 0)
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
        cout << "[FileService] Upload URL generated: fileId=" << fileId << ", path=" << path
             << ", userId=" << userId << ", retentionExpires=" << fileRetentionExpiresAt << endl;

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
