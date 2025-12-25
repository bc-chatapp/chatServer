#pragma once



class UserManager;
class ChatService;
class FriendService;
class GroupService;
class VerificationManager;

class AuthService;
class FileService;
class CloudStorage;


extern const int32 GProtoVersion;
extern const int64 TIMEOUT_MS;

int64 Nowts();

extern UserManager* GUserManager;
extern ChatService* GChatService;
extern FriendService* GFriendService;
extern GroupService* GGroupService;
extern VerificationManager* GVerificationManager;

extern AuthService* GAuthService;
extern FileService* GFileService;


class CoreGlobal
{
public:
    CoreGlobal();
    ~CoreGlobal();

    void Reset();

private:
    unique_ptr<UserManager> _userManager;
    unique_ptr<ChatService> _chatService;
    unique_ptr<FriendService> _friendService;
    unique_ptr<GroupService> _groupService;
    unique_ptr<VerificationManager> _verificationManager;

    unique_ptr<AuthService> _authService;
    unique_ptr<CloudStorage> _cloudStorage;
    unique_ptr<FileService> _fileService;
};


extern CoreGlobal GCoreGlobal;