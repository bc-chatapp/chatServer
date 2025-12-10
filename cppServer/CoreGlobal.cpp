#include "pch.h"
#include "CoreGlobal.h"

#include "Service/UserManager.h"
#include "Service/ChatService.h"
#include "Service/FriendService.h"
#include "Service/AuthService.h"
#include "Service/FileService.h"
#include "Cloud/CloudStorageGCS.h"

#include <chrono>
#include <fstream>
#include <sstream>
#include <filesystem>

// ===== 전역 변수/상수 선언 =====
const int32 GProtoVersion = 1;

const int64 TIMEOUT_MS = 120 * 1000;

UserManager* GUserManager = nullptr;
ChatService* GChatService = nullptr;
FriendService* GFriendService = nullptr;
AuthService* GAuthService = nullptr;
FileService* GFileService = nullptr;

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
        // config 폴더 경로 (cppServer/cppServer/config/)
        ::filesystem::path configDir = "config";
        ::filesystem::path adminFile = configDir / "googleCloud_admin.txt";
        
        // googleCloud_admin.txt 
        ifstream file(adminFile);
        if (!file.is_open()) {
            cerr << "[CoreGlobal] Failed to open: " << adminFile << endl;
            return false;
        }
        
        // project ID
        if (!getline(file, projectId)) {
            cerr << "[CoreGlobal] Failed to read project ID from " << adminFile << endl;
            file.close();
            return false;
        }
        
        // bucket name
        if (!getline(file, bucketName)) {
            cerr << "[CoreGlobal] Failed to read bucket name from " << adminFile << endl;
            file.close();
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
        string jsonPath;
        try {
            for (const auto& entry : ::filesystem::directory_iterator(configDir)) {
                if (entry.is_regular_file() && entry.path().extension() == ".json") {
                    jsonPath = entry.path().string();
                    break;
                }
            }
        }
        catch (const exception& e) {
            cerr << "[CoreGlobal] Failed to search JSON file: " << e.what() << endl;
            return false;
        }
        
        if (jsonPath.empty()) {
            cerr << "[CoreGlobal] No JSON credentials file found " << endl;
            return false;
        }
        
        credentialsPath = jsonPath;
        
        cout << "[CoreGlobal] GCP Config loaded: projectId=" << projectId 
             << ", bucketName=" << bucketName 
             << ", credentialsPath=" << credentialsPath << endl;
        
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
    _authService = make_unique<AuthService>(*_userManager);
    
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
    }

    GUserManager = _userManager.get();
    GChatService = _chatService.get();
    GFriendService = _friendService.get();
    GAuthService = _authService.get();
    GFileService = _fileService.get();
}

CoreGlobal::~CoreGlobal()
{
    GFileService = nullptr;
    GAuthService = nullptr;
    GFriendService = nullptr;
    GChatService = nullptr;
    GUserManager = nullptr;

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
    }

    GUserManager = _userManager.get();
    GChatService = _chatService.get();
    GFriendService = _friendService.get();
    GAuthService = _authService.get();
    GFileService = _fileService.get();
}


