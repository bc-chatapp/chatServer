#include "pch.h"
#include "BlockService.h"
#include "../ServerSession.h"
#include "../PacketDispatcher.h"
#include "UserManager.h"
#include "../DB/BlockRepository.h"
#include "../CoreGlobal.h"

using namespace Protocol;


void BlockService::HandleErr(sessionPtr& session, uint64 reqId, ErrorCode errorCode, const string& msg)
{
    PacketDispatcher::DispatchError(session, reqId, errorCode, msg);
}


bool BlockService::HandleBlockUser(sessionPtr& session, uint64 reqId, const C_BlockUser& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) return false;

    const string& targetId = pkt.target_user_id();
    if (targetId.empty() || targetId == userId) {
        HandleErr(session, reqId, ERR_CANNOT_BLOCK_SELF);
        return false;
    }

    if (BlockRepository::IsBlocked(userId, targetId)) {
        HandleErr(session, reqId, ERR_ALREADY_BLOCKED);
        return false;
    }

    bool ok = BlockRepository::BlockUser(userId, targetId);

    S_BlockUser res;
    res.set_success(ok);
    res.set_message(ok ? "차단되었습니다." : "차단에 실패했습니다.");

    Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_block_user() = res;
    PacketDispatcher::SendEnvelope(session, env);

    LOG_INFO("[BlockService] {} blocked {} -> {}", userId, targetId, (ok ? "OK" : "FAIL"));
    return ok;
}


bool BlockService::HandleUnblockUser(sessionPtr& session, uint64 reqId, const C_UnblockUser& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) return false;

    const string& targetId = pkt.target_user_id();
    if (targetId.empty()) {
        HandleErr(session, reqId, ERR_INVALID_ARGUMENT);
        return false;
    }

    if (!BlockRepository::IsBlocked(userId, targetId)) {
        HandleErr(session, reqId, ERR_NOT_BLOCKED);
        return false;
    }

    bool ok = BlockRepository::UnblockUser(userId, targetId);

    S_UnblockUser res;
    res.set_success(ok);

    Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_unblock_user() = res;
    PacketDispatcher::SendEnvelope(session, env);

    LOG_INFO("[BlockService] {} unblocked {} -> {}", userId, targetId, (ok ? "OK" : "FAIL"));
    return ok;
}


bool BlockService::HandleGetBlockedList(sessionPtr& session, uint64 reqId, const C_GetBlockedList& /*pkt*/)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) return false;

    auto list = BlockRepository::GetBlockedUsers(userId);

    S_GetBlockedList res;
    for (const auto& entry : list) {
        auto* item = res.add_blocked_users();
        item->set_user_id(entry.userId);
        item->set_name(entry.name);
        item->set_profile_img(entry.profileImg);
        item->set_blocked_at(entry.blockedAt);
    }

    Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_get_blocked_list() = res;
    PacketDispatcher::SendEnvelope(session, env);

    LOG_INFO("[BlockService] GetBlockedList for {}: {} entries", userId, list.size());
    return true;
}


bool BlockService::HandleReportUser(sessionPtr& session, uint64 reqId, const C_ReportUser& pkt)
{
    auto serverSession = static_pointer_cast<ServerSession>(session);
    const string userId = serverSession->GetUserId();
    if (userId.empty()) return false;

    const string& targetId = pkt.target_user_id();
    if (targetId.empty() || targetId == userId) {
        HandleErr(session, reqId, ERR_INVALID_ARGUMENT);
        return false;
    }

    if (BlockRepository::HasReported(userId, targetId)) {
        HandleErr(session, reqId, ERR_REPORT_DUPLICATE);
        return false;
    }

    bool ok = BlockRepository::ReportUser(userId, targetId, pkt.reason(), pkt.detail());

    S_ReportUser res;
    res.set_success(ok);

    Envelope env;
    env.set_version(GProtoVersion);
    env.set_request_id(reqId);
    *env.mutable_s_report_user() = res;
    PacketDispatcher::SendEnvelope(session, env);

    LOG_INFO("[BlockService] {} reported {} reason={} -> {}", userId, targetId, pkt.reason(), (ok ? "OK" : "FAIL"));
    return ok;
}
