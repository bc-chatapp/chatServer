#pragma once

#include "pch.h"
#include "Session.h"
#include "../protocol.pb.h"


using sessionPtr = shared_ptr<Session>;

class CloudStorage;



class FileService {
public:
    FileService(CloudStorage* cloudStorage = nullptr);
    ~FileService();


    bool HandleUploadFileRequest(sessionPtr& session, uint64 reqId, const Protocol::C_UploadFile& pkt);
    
private:
    string GenerateFileId(const string& filename);
    void PushEnvelope(sessionPtr& session, uint64 reqId, const Protocol::S_UploadFile& pkt_s_upload);
    void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& errMessage = "");

private:
    CloudStorage* _cloudStorage;  // 소유권은 CoreGlobal이 가짐
};

