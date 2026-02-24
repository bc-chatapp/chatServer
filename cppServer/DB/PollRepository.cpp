#include "pch.h"
#include "PollRepository.h"

#include <iostream>
#include <sstream>

/*======================
    CreatePoll
========================*/
bool PollRepository::CreatePoll(const string& pollId, const string& convId, int64 msgSeq,
                                const string& creatorId, const string& question,
                                const string& optionsJson, bool isMultiSelect,
                                bool isAnonymous, int64 expiresAt, int64 createdAt)
{
    try {
        auto& session = DBManager::GetInstance().GetSession();
        string sql = "INSERT INTO polls (poll_id, conv_id, msg_seq, creator_id, question, "
                     "options_json, is_multi_select, is_anonymous, expires_at, status, created_at) "
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'active', ?)";
        session.sql(sql)
            .bind(pollId, convId, msgSeq, creatorId, question,
                  optionsJson, isMultiSelect ? 1 : 0, isAnonymous ? 1 : 0,
                  expiresAt, createdAt)
            .execute();
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[PollRepository] CreatePoll error: " << e.what() << std::endl;
        return false;
    }
}

/*======================
    Vote
========================*/
bool PollRepository::Vote(const string& pollId, const string& userId,
                          const vector<int>& selectedOptions)
{
    try {
        auto& session = DBManager::GetInstance().GetSession();

        // 기존 투표 삭제
        session.sql("DELETE FROM poll_votes WHERE poll_id = ? AND user_id = ?")
            .bind(pollId, userId)
            .execute();

        // 새 투표 INSERT
        int64 now = std::chrono::duration_cast<std::chrono::milliseconds>(
            std::chrono::system_clock::now().time_since_epoch()).count();

        for (int optIdx : selectedOptions) {
            session.sql("INSERT INTO poll_votes (poll_id, user_id, option_index, created_at) "
                        "VALUES (?, ?, ?, ?)")
                .bind(pollId, userId, optIdx, now)
                .execute();
        }
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[PollRepository] Vote error: " << e.what() << std::endl;
        return false;
    }
}

/*======================
    GetPollVotes
========================*/
string PollRepository::GetPollVotes(const string& pollId)
{
    try {
        auto& session = DBManager::GetInstance().GetSession();
        auto result = session.sql(
            "SELECT option_index, user_id FROM poll_votes WHERE poll_id = ? ORDER BY option_index")
            .bind(pollId)
            .execute();

        // Build JSON: {"0":["uid1","uid2"],"1":["uid3"]}
        std::map<int, vector<string>> votesMap;
        for (auto row : result) {
            int optIdx = row[0].get<int>();
            string uid = row[1].get<string>();
            votesMap[optIdx].push_back(uid);
        }

        // Get option count from poll info
        auto pollResult = session.sql("SELECT options_json FROM polls WHERE poll_id = ?")
            .bind(pollId)
            .execute();
        int optionCount = 0;
        auto pollRow = pollResult.fetchOne();
        if (pollRow) {
            string optJson = pollRow[0].get<string>();
            // Count commas + 1 for rough option count, or parse JSON
            // Simple approach: count array elements
            optionCount = 1;
            for (char c : optJson) {
                if (c == ',') optionCount++;
            }
        }

        std::ostringstream oss;
        oss << "{";
        bool first = true;
        for (int i = 0; i < optionCount; i++) {
            if (!first) oss << ",";
            first = false;
            oss << "\"" << i << "\":[";
            auto it = votesMap.find(i);
            if (it != votesMap.end()) {
                bool firstUid = true;
                for (const auto& uid : it->second) {
                    if (!firstUid) oss << ",";
                    firstUid = false;
                    oss << "\"" << uid << "\"";
                }
            }
            oss << "]";
        }
        oss << "}";
        return oss.str();
    }
    catch (const std::exception& e) {
        std::cerr << "[PollRepository] GetPollVotes error: " << e.what() << std::endl;
        return "{}";
    }
}

/*======================
    ClosePoll
========================*/
bool PollRepository::ClosePoll(const string& pollId, const string& creatorId)
{
    try {
        auto& session = DBManager::GetInstance().GetSession();
        auto result = session.sql(
            "UPDATE polls SET status = 'closed' WHERE poll_id = ? AND creator_id = ? AND status = 'active'")
            .bind(pollId, creatorId)
            .execute();
        return result.getAffectedItemsCount() > 0;
    }
    catch (const std::exception& e) {
        std::cerr << "[PollRepository] ClosePoll error: " << e.what() << std::endl;
        return false;
    }
}

/*======================
    GetPollInfo
========================*/
PollInfo PollRepository::GetPollInfo(const string& pollId)
{
    PollInfo info;
    try {
        auto& session = DBManager::GetInstance().GetSession();
        auto result = session.sql(
            "SELECT poll_id, conv_id, msg_seq, creator_id, question, options_json, "
            "is_multi_select, is_anonymous, expires_at, status, created_at "
            "FROM polls WHERE poll_id = ?")
            .bind(pollId)
            .execute();

        auto row = result.fetchOne();
        if (!row) return info;

        info.pollId = row[0].get<string>();
        info.convId = row[1].get<string>();
        info.msgSeq = row[2].get<int64_t>();
        info.creatorId = row[3].get<string>();
        info.question = row[4].get<string>();
        info.optionsJson = row[5].get<string>();
        info.isMultiSelect = row[6].get<int>() != 0;
        info.isAnonymous = row[7].get<int>() != 0;
        info.expiresAt = row[8].get<int64_t>();
        info.status = row[9].get<string>();
        info.createdAt = row[10].get<int64_t>();
    }
    catch (const std::exception& e) {
        std::cerr << "[PollRepository] GetPollInfo error: " << e.what() << std::endl;
    }
    return info;
}

/*======================
    GetActivePollsForConv
========================*/
vector<PollInfo> PollRepository::GetActivePollsForConv(const string& convId)
{
    vector<PollInfo> polls;
    try {
        auto& session = DBManager::GetInstance().GetSession();
        auto result = session.sql(
            "SELECT poll_id, conv_id, msg_seq, creator_id, question, options_json, "
            "is_multi_select, is_anonymous, expires_at, status, created_at "
            "FROM polls WHERE conv_id = ? AND status = 'active'")
            .bind(convId)
            .execute();

        for (auto row : result) {
            PollInfo info;
            info.pollId = row[0].get<string>();
            info.convId = row[1].get<string>();
            info.msgSeq = row[2].get<int64_t>();
            info.creatorId = row[3].get<string>();
            info.question = row[4].get<string>();
            info.optionsJson = row[5].get<string>();
            info.isMultiSelect = row[6].get<int>() != 0;
            info.isAnonymous = row[7].get<int>() != 0;
            info.expiresAt = row[8].get<int64_t>();
            info.status = row[9].get<string>();
            info.createdAt = row[10].get<int64_t>();
            polls.push_back(std::move(info));
        }
    }
    catch (const std::exception& e) {
        std::cerr << "[PollRepository] GetActivePollsForConv error: " << e.what() << std::endl;
    }
    return polls;
}
