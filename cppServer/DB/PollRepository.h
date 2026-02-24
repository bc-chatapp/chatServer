#pragma once

#include "pch.h"
#include "DBManager.h"

struct PollInfo {
    string pollId;
    string convId;
    int64 msgSeq;
    string creatorId;
    string question;
    string optionsJson;   // ["한식","중식","일식"]
    bool isMultiSelect;
    bool isAnonymous;
    int64 expiresAt;
    string status;        // "active" or "closed"
    int64 createdAt;
};

class PollRepository
{
public:
    // 투표 생성
    static bool CreatePoll(const string& pollId, const string& convId, int64 msgSeq,
                           const string& creatorId, const string& question,
                           const string& optionsJson, bool isMultiSelect,
                           bool isAnonymous, int64 expiresAt, int64 createdAt);

    // 투표 참여 (기존 투표 삭제 + 새 투표 INSERT)
    static bool Vote(const string& pollId, const string& userId,
                     const vector<int>& selectedOptions);

    // 투표 현황 JSON 반환: {"0":["uid1","uid2"],"1":["uid3"]}
    static string GetPollVotes(const string& pollId);

    // 투표 종료 (생성자 검증)
    static bool ClosePoll(const string& pollId, const string& creatorId);

    // 투표 정보 조회
    static PollInfo GetPollInfo(const string& pollId);

    // 대화방의 활성 투표 목록 (오프라인 동기화용)
    static vector<PollInfo> GetActivePollsForConv(const string& convId);
};
