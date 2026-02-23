#include "pch.h"
#include "BlockRepository.h"


bool BlockRepository::BlockUser(const string& userId, const string& targetId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto tbl = db.GetSchema().getTable("block_list");
        tbl.insert("user_id", "blocked_id")
            .values(userId, targetId)
            .execute();
        return true;
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] BlockUser error: " << e.what() << endl;
        return false;
    }
}

bool BlockRepository::UnblockUser(const string& userId, const string& targetId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto tbl = db.GetSchema().getTable("block_list");
        tbl.remove()
            .where("user_id = :uid AND blocked_id = :tid")
            .bind("uid", userId)
            .bind("tid", targetId)
            .execute();
        return true;
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] UnblockUser error: " << e.what() << endl;
        return false;
    }
}

bool BlockRepository::IsBlocked(const string& userId, const string& targetId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto tbl = db.GetSchema().getTable("block_list");
        auto res = tbl.select("id")
            .where("user_id = :uid AND blocked_id = :tid")
            .bind("uid", userId)
            .bind("tid", targetId)
            .execute();
        return (res.count() > 0);
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] IsBlocked error: " << e.what() << endl;
        return false;
    }
}

bool BlockRepository::IsBlockedEither(const string& a, const string& b)
{
    try {
        auto& db = DBManager::GetInstance();
        auto tbl = db.GetSchema().getTable("block_list");
        auto res = tbl.select("id")
            .where("(user_id = :a AND blocked_id = :b) OR (user_id = :b AND blocked_id = :a)")
            .bind("a", a)
            .bind("b", b)
            .execute();
        return (res.count() > 0);
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] IsBlockedEither error: " << e.what() << endl;
        return false;
    }
}

vector<BlockedUserEntry> BlockRepository::GetBlockedUsers(const string& userId)
{
    vector<BlockedUserEntry> result;
    try {
        auto& db = DBManager::GetInstance();
        // block_list JOIN users
        auto sess = db.GetSession();
        string sql =
            "SELECT b.blocked_id, u.name, u.profile_image_url, "
            "UNIX_TIMESTAMP(b.created_at) * 1000 AS blocked_at "
            "FROM block_list b "
            "LEFT JOIN users u ON u.user_id = b.blocked_id "
            "WHERE b.user_id = ? "
            "ORDER BY b.created_at DESC";

        auto res = sess->sql(sql).bind(userId).execute();
        for (auto row : res.fetchAll()) {
            BlockedUserEntry entry;
            entry.userId    = row[0].isNull() ? "" : row[0].get<string>();
            entry.name      = row[1].isNull() ? "" : row[1].get<string>();
            entry.profileImg = row[2].isNull() ? "" : row[2].get<string>();
            entry.blockedAt = row[3].isNull() ? 0 : static_cast<int64>(row[3].get<double>());
            result.push_back(entry);
        }
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] GetBlockedUsers error: " << e.what() << endl;
    }
    return result;
}

bool BlockRepository::ReportUser(const string& reporterId, const string& reportedId,
                                  const string& reason, const string& detail)
{
    try {
        auto& db = DBManager::GetInstance();
        auto tbl = db.GetSchema().getTable("reports");
        tbl.insert("reporter_id", "reported_id", "reason", "detail")
            .values(reporterId, reportedId, reason, detail)
            .execute();
        return true;
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] ReportUser error: " << e.what() << endl;
        return false;
    }
}

bool BlockRepository::HasReported(const string& reporterId, const string& reportedId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto tbl = db.GetSchema().getTable("reports");
        auto res = tbl.select("id")
            .where("reporter_id = :rid AND reported_id = :tid")
            .bind("rid", reporterId)
            .bind("tid", reportedId)
            .execute();
        return (res.count() > 0);
    }
    catch (const mysqlx::Error& e) {
        cerr << "[BlockRepository] HasReported error: " << e.what() << endl;
        return false;
    }
}
