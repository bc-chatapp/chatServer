#include "pch.h"
#include "CoreGlobal.h"

#include "Service/UserManager.h"
#include "Service/ChatService.h"
#include "Service/FriendService.h"
#include "Service/AuthService.h"
#include "Service/FileService.h"
#include "Cloud/CloudStorageGCS.h"

#include <chrono>

// ===== 전역 변수/상수 선언 =====
const int32 GProtoVersion = 1;

UserManager* GUserManager = nullptr;
ChatService* GChatService = nullptr;
FriendService* GFriendService = nullptr;
AuthService* GAuthService = nullptr;
FileService* GFileService = nullptr;

CoreGlobal GCoreGlobal;


// ===== 현재 시간 =====
int64 Nowts()
{
    using namespace std::chrono;
    return duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
}



CoreGlobal::CoreGlobal()
{
    _userManager = make_unique<UserManager>();
    _chatService = make_unique<ChatService>(*_userManager);
    _friendService = make_unique<FriendService>(*_userManager);
    _authService = make_unique<AuthService>(*_userManager);
    
    // CloudStorage 초기화
    // TODO: 실제 프로젝트 ID, 버킷 이름, 서비스 계정 키 경로로 변경 필요
    _cloudStorage = make_unique<CloudStorageGCS>(
        "your-project-id",           // GCP 프로젝트 ID
        "your-bucket-name",          // GCS 버킷 이름
        "path/to/service-account.json"  // 서비스 계정 키 파일 경로
    );
    
    if (!_cloudStorage->Initialize()) {
        cerr << "[CoreGlobal] CloudStorage 초기화 실패" << endl;
    }
    
    // FileService에 CloudStorage 전달
    _fileService = make_unique<FileService>(_cloudStorage.get());

    GUserManager = _userManager.get();
    GChatService = _chatService.get();
    GFriendService = _friendService.get();
    GAuthService = _authService.get();
    GFileService = _fileService.get();
}

CoreGlobal::~CoreGlobal()
{
    // 전역 포인터 초기화
    GFileService = nullptr;
    GAuthService = nullptr;
    GFriendService = nullptr;
    GChatService = nullptr;
    GUserManager = nullptr;

    // 순서 중요
    _fileService.reset();
    _cloudStorage.reset();
    _authService.reset();
    _friendService.reset();
    _chatService.reset();
    _userManager.reset();
}

void CoreGlobal::Reset()
{
    _fileService.reset();
    _cloudStorage.reset();
    _authService.reset();
    _friendService.reset();
    _chatService.reset();
    _userManager.reset();

    GFileService = nullptr;
    GAuthService = nullptr;
    GFriendService = nullptr;
    GChatService = nullptr;
    GUserManager = nullptr;

    _userManager = make_unique<UserManager>();
    _chatService = make_unique<ChatService>(*_userManager);
    _friendService = make_unique<FriendService>(*_userManager);
    _authService = make_unique<AuthService>(*_userManager);
    
    // CloudStorage 초기화
    // TODO: 실제 프로젝트 ID, 버킷 이름, 서비스 계정 키 경로로 변경 필요
    _cloudStorage = make_unique<CloudStorageGCS>(
        "your-project-id",           // GCP 프로젝트 ID
        "your-bucket-name",          // GCS 버킷 이름
        "path/to/service-account.json"  // 서비스 계정 키 파일 경로
    );
    
    if (!_cloudStorage->Initialize()) {
        cerr << "[CoreGlobal] CloudStorage 초기화 실패" << endl;
    }
    
    // FileService에 CloudStorage 전달
    _fileService = make_unique<FileService>(_cloudStorage.get());

    GUserManager = _userManager.get();
    GChatService = _chatService.get();
    GFriendService = _friendService.get();
    GAuthService = _authService.get();
    GFileService = _fileService.get();
}


