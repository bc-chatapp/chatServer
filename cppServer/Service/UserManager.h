#pragma once

#include "Session.h"


using SessionPtr = shared_ptr<Session>;


class UserManager {
public:
    UserManager() = default;

    void UpsertSession(const string& userId, const shared_ptr<Session>& s) {
        WRITE_LOCK_IDX(0);
        _sessions[userId] = s;
    }

    void RemoveSession(const string& userId) {
        WRITE_LOCK_IDX(0);
        _sessions.erase(userId);
    }

    shared_ptr<Session> FindSession(const string& userId) {
        WRITE_LOCK_IDX(0); // 읽기에도 같은 락 사용(간단/보수적)
        auto it = _sessions.find(userId);
        return (it == _sessions.end() ? nullptr : it->second.lock());
    }



    /*  Group  */

    void SetGroupMembers(const string& groupId, unordered_set<string> members) {
        WRITE_LOCK_IDX(1);
        _groups[groupId] = std::move(members);
    }

    void AddMember(const string& groupId, const string& userId) {
        WRITE_LOCK_IDX(1);
        _groups[groupId].insert(userId);
    }

    void RemoveMember(const string& groupId, const string& userId) {
        WRITE_LOCK_IDX(1);
        auto it = _groups.find(groupId);
        if (it != _groups.end()) it->second.erase(userId);
    }

    unordered_set<string> Members(const string& groupId) {
        WRITE_LOCK_IDX(1);
        auto it = _groups.find(groupId);
        return (it == _groups.end() ? unordered_set<string>{} : it->second);
    }



    /*  HeartBeat  */
    void CheckDeadSessions();



private:
    USE_MANY_LOCKS(2); // 0: sessions, 1: groups

    unordered_map<string, weak_ptr<Session>> _sessions;
    unordered_map<string, unordered_set<string>> _groups;
};