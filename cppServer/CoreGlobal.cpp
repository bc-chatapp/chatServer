#include "pch.h"
#include "CoreGlobal.h"

#include "Service/UserManager.h"
#include "Service/ChatService.h"
#include "Service/FriendService.h"
#include "Service/GroupService.h"

#include "Service/VerificationManager.h"

#include "Service/AuthService.h"
#include "Service/FileService.h"
#include "Service/NotificationService.h"
#include "Cloud/CloudStorageGCS.h"
#include "Cloud/FcmClient.h"
#include "Service/PaymentService.h"
#include "Service/BlockService.h"
#include "Service/ExpirationBatchJob.h"

#include <chrono>
#include <fstream>
#include <sstream>
#include <filesystem>

// ===== 전역 변수/상수 선언 =====
const int32 GProtoVersion = 1;

const int64 TIMEOUT_MS = 120 * 1000;
const int32 MAX_GROUP_MEMBERS = 100;  // 그룹 최대 인원 수

UserManager* GUserManager = nullptr;
ChatService* GChatService = nullptr;
FriendService* GFriendService = nullptr;
GroupService* GGroupService = nullptr;
VerificationManager* GVerificationManager = nullptr;

AuthService* GAuthService = nullptr;
FileService* GFileService = nullptr;
CloudStorage* GCloudStorage = nullptr;
NotificationService* GNotificationService = nullptr;
BlockService* GBlockService = nullptr;
ExpirationBatchJob* GExpirationBatchJob = nullptr;

CoreGlobal GCoreGlobal;


// ===== 현재 시간 =====
int64 Nowts()
{
    using namespace ::chrono;
    return duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
}

// ===== GCP 설정 파일 읽기 =====
static bool LoadGCPConfig(string& projectId, string& bucketName, string& credentialsPath)
{
    try {
        ::filesystem::path configDir = "config";


        ::filesystem::path adminFile = configDir / "googleCloud_admin.txt";
        ifstream file(adminFile);
        if (!file.is_open()) {
            cerr << "[CoreGlobal] Failed to open: " << adminFile << endl;
            return false;
        }

        if (!getline(file, projectId) || !getline(file, bucketName)) {
            cerr << "[CoreGlobal] file is lacking" << endl;
            return false;
        }
        file.close();

        // 공백 제거
        projectId.erase(0, projectId.find_first_not_of(" \t\r\n"));
        projectId.erase(projectId.find_last_not_of(" \t\r\n") + 1);
        bucketName.erase(0, bucketName.find_first_not_of(" \t\r\n"));
        bucketName.erase(bucketName.find_last_not_of(" \t\r\n") + 1);

        if (projectId.empty() || bucketName.empty()) {
            cerr << "[CoreGlobal] Project ID or bucket name is empty" << endl;
            return false;
        }

        // config 폴더에서 .json 파일 찾기
        ::filesystem::path keyFile = configDir / "gcp_key.json";

        if (!::filesystem::exists(keyFile)) {
            cerr << "[CoreGlobal] GCP 인증 키 파일을 찾을 수 없습니다: " << keyFile << endl;
            return false;
        }

        credentialsPath = keyFile.string();


        cout << "[CoreGlobal] GCP Config loaded:" << endl;
        cout << "  - Project ID: " << projectId << endl;
        cout << "  - Bucket:     " << bucketName << endl;
        cout << "  - Key File:   " << credentialsPath << endl;

        return true;
    }
    catch (const exception& e) {
        cerr << "[CoreGlobal] LoadGCPConfig error: " << e.what() << endl;
        return false;
    }
}




CoreGlobal::CoreGlobal()
{
    _userManager = make_unique<UserManager>();
    _chatService = make_unique<ChatService>(*_userManager);
    _friendService = make_unique<FriendService>(*_userManager);
    _groupService = make_unique<GroupService>(*_userManager);
    _verificationManager = make_unique<VerificationManager>(*_userManager);


    _authService = make_unique<AuthService>(*_userManager);
    _notificationService = make_unique<NotificationService>(*_userManager);
    _blockService = make_unique<BlockService>(*_userManager);

    // CloudStorage 초기화 (파일에서 설정 읽기)
    string projectId, bucketName, credentialsPath;
    if (!LoadGCPConfig(projectId, bucketName, credentialsPath)) {
        cerr << "[CoreGlobal] Failed to load GCP config." << endl;
        _cloudStorage = nullptr;
        _fileService = nullptr;
    }
    else {
        _cloudStorage = make_unique<CloudStorageGCS>(projectId, bucketName, credentialsPath);

        if (!_cloudStorage->Initialize()) {
            cerr << "[CoreGlobal] CloudStorage Initialize Failed" << endl;
        }

        _fileService = make_unique<FileService>(_cloudStorage.get());

        // FCM Client 초기화 (같은 credentials 사용)
        _fcmClient = make_unique<FcmClient>(projectId, credentialsPath);
        if (!_fcmClient->Initialize()) {
            cerr << "[CoreGlobal] FcmClient Initialize Failed" << endl;
            _fcmClient = nullptr;
        }

        // PaymentService 초기화 (같은 credentials 사용)
        _paymentService = make_unique<PaymentService>(*_userManager);
        if (!_paymentService->Initialize(credentialsPath)) {
            cerr << "[CoreGlobal] PaymentService Initialize Failed" << endl;
            _paymentService = nullptr;
        }

        // 파일 만료 배치 잡 초기화
        _expirationBatchJob = make_unique<ExpirationBatchJob>(_cloudStorage.get());
        _expirationBatchJob->Start();
    }

    GUserManager = _userManager.get();
    GChatService = _chatService.get();
    GFriendService = _friendService.get();
    GGroupService = _groupService.get();
    GVerificationManager = _verificationManager.get();

    GAuthService = _authService.get();
    GFileService = _fileService.get();
    GCloudStorage = _cloudStorage.get();
    GNotificationService = _notificationService.get();
    GPaymentService = _paymentService.get();
    GBlockService = _blockService.get();
    GFcmClient = _fcmClient.get();
    GExpirationBatchJob = _expirationBatchJob.get();
}

CoreGlobal::~CoreGlobal()
{
    GExpirationBatchJob = nullptr;
    GFcmClient = nullptr;
    GPaymentService = nullptr;
    GBlockService = nullptr;
    GNotificationService = nullptr;
    GCloudStorage = nullptr;
    GFileService = nullptr;
    GAuthService = nullptr;

    GVerificationManager = nullptr;
    GGroupService = nullptr;
    GFriendService = nullptr;
    GChatService = nullptr;
    GUserManager = nullptr;

    _fcmClient.reset();
    _paymentService.reset();
    _blockService.reset();
    _notificationService.reset();
    _fileService.reset();
    _cloudStorage.reset();
    _authService.reset();

    _verificationManager.reset();

    _groupService.reset();
    _friendService.reset();
    _chatService.reset();
    _userManager.reset();
}

void CoreGlobal::Reset()
{
    if (_expirationBatchJob) _expirationBatchJob->Stop();
    _expirationBatchJob.reset();
    _fcmClient.reset();
    _paymentService.reset();
    _blockService.reset();
    _notificationService.reset();
    _fileService.reset();
    _cloudStorage.reset();
    _authService.reset();
    _friendService.reset();
    _groupService.reset();
    _verificationManager.reset();

    _chatService.reset();
    _userManager.reset();

    GExpirationBatchJob = nullptr;
    GFcmClient = nullptr;
    GPaymentService = nullptr;
    GBlockService = nullptr;
    GNotificationService = nullptr;
    GCloudStorage = nullptr;
    GFileService = nullptr;
    GAuthService = nullptr;
    GFriendService = nullptr;
    GGroupService = nullptr;
    GVerificationManager = nullptr;

    GChatService = nullptr;
    GUserManager = nullptr;

    _userManager = make_unique<UserManager>();
    _chatService = make_unique<ChatService>(*_userManager);
    _friendService = make_unique<FriendService>(*_userManager);
    _groupService = make_unique<GroupService>(*_userManager);
    _verificationManager = make_unique<VerificationManager>(*_userManager);

    _authService = make_unique<AuthService>(*_userManager);
    _notificationService = make_unique<NotificationService>(*_userManager);
    _blockService = make_unique<BlockService>(*_userManager);

    // CloudStorage 초기화 (파일에서 설정 읽기)
    string projectId, bucketName, credentialsPath;
    if (!LoadGCPConfig(projectId, bucketName, credentialsPath)) {
        cerr << "[CoreGlobal] Failed to load GCP config." << endl;
        _cloudStorage = nullptr;
        _fileService = nullptr;
    }
    else {
        _cloudStorage = make_unique<CloudStorageGCS>(projectId, bucketName, credentialsPath);

        if (!_cloudStorage->Initialize()) {
            cerr << "[CoreGlobal] CloudStorage Initialize Failed" << endl;
        }

        _fileService = make_unique<FileService>(_cloudStorage.get());

        // FCM Client 초기화 (같은 credentials 사용)
        _fcmClient = make_unique<FcmClient>(projectId, credentialsPath);
        if (!_fcmClient->Initialize()) {
            cerr << "[CoreGlobal] FcmClient Initialize Failed" << endl;
            _fcmClient = nullptr;
        }

        // PaymentService 초기화 (같은 credentials 사용)
        _paymentService = make_unique<PaymentService>(*_userManager);
        if (!_paymentService->Initialize(credentialsPath)) {
            cerr << "[CoreGlobal] PaymentService Initialize Failed" << endl;
            _paymentService = nullptr;
        }

        // 파일 만료 배치 잡 재초기화
        _expirationBatchJob = make_unique<ExpirationBatchJob>(_cloudStorage.get());
        _expirationBatchJob->Start();
    }

    GUserManager = _userManager.get();
    GChatService = _chatService.get();
    GFriendService = _friendService.get();
    GGroupService = _groupService.get();
    GVerificationManager = _verificationManager.get();

    GAuthService = _authService.get();
    GFileService = _fileService.get();
    GCloudStorage = _cloudStorage.get();
    GNotificationService = _notificationService.get();
    GPaymentService = _paymentService.get();
    GBlockService = _blockService.get();
    GFcmClient = _fcmClient.get();
    GExpirationBatchJob = _expirationBatchJob.get();
}


