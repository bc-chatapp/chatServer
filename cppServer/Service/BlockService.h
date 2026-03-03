#pragma once

#include "Session.h"
#include "../protocol.pb.h"

using sessionPtr = shared_ptr<Session>;
class UserManager;

class BlockService
{
public:
    explicit BlockService(UserManager& userManager) : _userManager(userManager) {}
    ~BlockService() = default;

    bool HandleBlockUser      (sessionPtr& session, uint64 reqId, const Protocol::C_BlockUser&      pkt);
    bool HandleUnblockUser    (sessionPtr& session, uint64 reqId, const Protocol::C_UnblockUser&    pkt);
    bool HandleGetBlockedList (sessionPtr& session, uint64 reqId, const Protocol::C_GetBlockedList& pkt);
    bool HandleReportUser     (sessionPtr& session, uint64 reqId, const Protocol::C_ReportUser&     pkt);

private:
    UserManager& _userManager;
    void HandleErr(sessionPtr& session, uint64 reqId, Protocol::ErrorCode errorCode, const string& msg = "");
};
