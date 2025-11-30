#include "pch.h"
#include "FriendRepository.h"
#include "DBManager.h"
#include <iostream>
#include <ctime>

// ============================================
// 移쒓뎄 ?붿껌 愿??
// ============================================

bool FriendRepository::AddFriendRequest(const string& userId, const string& friendId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        // 받는 사람 기준으로 저장: user_id=friendId (받는 사람), friend_id=userId (보낸 사람)
        // 중복 체크: 이미 요청이 있는지 확인
        auto existing = friends.select("id")
                        .where("user_id = :fid AND friend_id = :uid AND status = 'pending'")
                        .bind("fid", friendId)  // 받는 사람
                        .bind("uid", userId)    // 보낸 사람
                        .execute();
        
        if (existing.count() > 0) {
            cerr << "[FriendRepository] 이미 존재하는 친구 요청: " << userId << " -> " << friendId << endl;
            return false;
        }
        
        // pending 상태로 추가 (받는 사람 기준)
        friends.insert("user_id", "friend_id", "status")
               .values(friendId, userId, "pending").execute();
        
        cout << "[FriendRepository] Add Friend Request: " << userId << " -> " << friendId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] Add Friend Request Failed : " << err.what() << endl;
        return false;
    }
}

bool FriendRepository::CancelFriendRequest(const string& userId, const string& friendId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");

        // 보낸 사람이 취소: user_id=friendId (받는 사람), friend_id=userId (보낸 사람)
        friends.remove()
               .where("user_id = :fid AND friend_id = :uid AND status = 'pending'")
               .bind("fid", friendId)  // 받는 사람
               .bind("uid", userId)    // 보낸 사람
               .execute();
        
        cout << "[FriendRepository] Cancel Friend Request: " << userId << " -> " << friendId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] Cancel Friend Request Failed: " << err.what() << endl;
        return false;
    }
}

vector<FriendRequestInfo> FriendRepository::GetFriendRequests(const string& userId) 
{
    vector<FriendRequestInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        auto users = schema.getTable("users");
        
        // 받은 pending 친구 요청 조회 (user_id가 받는 사람, friend_id가 보낸 사람)
        // 모든 pending 요청 조회 (읽음 여부와 관계없이)
        auto rows = friends.select("friend_id", "created_at")
                          .where("user_id = :uid AND status = 'pending'")
                          .bind("uid", userId)
                          .execute();
        
        for (auto row : rows) {
            string requesterId = row[0].get<string>();  // friend_id가 요청 보낸 사람
            
            FriendRequestInfo info;
            info.requesterUserId = requesterId;


            if (!row[1].isNull()) {
                try {
                    auto tsValue = row[1];
                    if (tsValue.getType() == mysqlx::Value::STRING) {
                        // 문자열 형식: "YYYY-MM-DD HH:MM:SS"를 파싱
                        string tsStr = tsValue.get<string>();
                        struct tm timeinfo = {};
                        int year, mon, day, hour, min, sec;
                        if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                                &year, &mon, &day, &hour, &min, &sec) == 6) {
                            timeinfo.tm_year = year - 1900;
                            timeinfo.tm_mon = mon - 1;
                            timeinfo.tm_mday = day;
                            timeinfo.tm_hour = hour;
                            timeinfo.tm_min = min;
                            timeinfo.tm_sec = sec;
                            info.requestedAt = mktime(&timeinfo) * 1000;  // 諛由ъ큹
                        } else {
                            info.requestedAt = 0;
                        }
                    } else {
                        info.requestedAt = 0;
                    }
                } catch (...) {
                    info.requestedAt = 0;
                }
            } else {
                info.requestedAt = 0;
            }
            
            // 사용자 정보 조회
            try {
                auto userRows = users.select("name", "status_message", "profile_image_url")
                                    .where("user_id = :uid")
                                    .bind("uid", requesterId)
                                    .execute();
                
                if (userRows.count() > 0) {
                    auto userRow = userRows.fetchOne();
                    info.requesterName = userRow[0].get<string>();
                    if (!userRow[1].isNull()) info.requesterStatusMessage = userRow[1].get<string>();
                    if (!userRow[2].isNull()) info.requesterProfileImageUrl = userRow[2].get<string>();
                } else {
                    info.requesterName = requesterId;  // 기본값
                }
            } catch (...) {
                info.requesterName = requesterId;  // 예외 시 기본값
            }
            
            result.push_back(info);
        }
        
        return result;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] Get Friend Requests Failed: " << err.what() << endl;
        return result;
    }
}

vector<FriendRequestInfo> FriendRepository::GetUnreadFriendRequests(const string& userId) 
{
    vector<FriendRequestInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        auto users = schema.getTable("users");
        
        // 받은 pending 친구 요청 조회 (user_id가 받는 사람, friend_id가 보낸 사람)
        // is_read가 false이거나 NULL인 것만 조회 (읽지 않은 요청만)
        auto rows = friends.select("friend_id", "created_at")
                          .where("user_id = :uid AND status = 'pending' AND (is_read IS NULL OR is_read = 0)")
                          .bind("uid", userId)
                          .execute();
        
        for (auto row : rows) {
            string requesterId = row[0].get<string>();  // friend_id가 요청 보낸 사람
            
            FriendRequestInfo info;
            info.requesterUserId = requesterId;
            
            // 요청 시간 처리
            if (!row[1].isNull()) {
                try {
                    auto tsValue = row[1];
                    if (tsValue.getType() == mysqlx::Value::STRING) {
                        string tsStr = tsValue.get<string>();
                        struct tm timeinfo = {};
                        int year, mon, day, hour, min, sec;
                        if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                                &year, &mon, &day, &hour, &min, &sec) == 6) {
                            timeinfo.tm_year = year - 1900;
                            timeinfo.tm_mon = mon - 1;
                            timeinfo.tm_mday = day;
                            timeinfo.tm_hour = hour;
                            timeinfo.tm_min = min;
                            timeinfo.tm_sec = sec;
                            info.requestedAt = mktime(&timeinfo) * 1000;
                        } else {
                            info.requestedAt = 0;
                        }
                    } else {
                        info.requestedAt = 0;
                    }
                } catch (...) {
                    info.requestedAt = 0;
                }
            } else {
                info.requestedAt = 0;
            }
            
            // 사용자 정보 조회
            try {
                auto userRows = users.select("name", "status_message", "profile_image_url")
                                    .where("user_id = :uid")
                                    .bind("uid", requesterId)
                                    .execute();
                
                if (userRows.count() > 0) {
                    auto userRow = userRows.fetchOne();
                    info.requesterName = userRow[0].get<string>();
                    if (!userRow[1].isNull()) info.requesterStatusMessage = userRow[1].get<string>();
                    if (!userRow[2].isNull()) info.requesterProfileImageUrl = userRow[2].get<string>();
                } else {
                    info.requesterName = requesterId;
                }
            } catch (...) {
                info.requesterName = requesterId;
            }
            
            result.push_back(info);
        }
        
        return result;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] 읽지 않은 친구 요청 목록 조회 실패: " << err.what() << endl;
        return result;
    }
}

vector<FriendRequestInfo> FriendRepository::GetSentFriendRequests(const string& userId) 
{
    vector<FriendRequestInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        auto users = schema.getTable("users");
        
        // 보낸 pending 친구 요청 조회 (friend_id가 보낸 사람, user_id가 받는 사람)
        auto rows = friends.select("user_id", "created_at")
                          .where("friend_id = :uid AND status = 'pending'")
                          .bind("uid", userId)
                          .execute();
        
        for (auto row : rows) {
            string receiverId = row[0].get<string>();  // user_id가 받는 사람
            
            FriendRequestInfo info;
            info.requesterUserId = receiverId;  // 받는 사람 정보를 표시
            
            // 요청 시간 처리
            if (!row[1].isNull()) {
                try {
                    auto tsValue = row[1];
                    if (tsValue.getType() == mysqlx::Value::STRING) {
                        string tsStr = tsValue.get<string>();
                        struct tm timeinfo = {};
                        int year, mon, day, hour, min, sec;
                        if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                                &year, &mon, &day, &hour, &min, &sec) == 6) {
                            timeinfo.tm_year = year - 1900;
                            timeinfo.tm_mon = mon - 1;
                            timeinfo.tm_mday = day;
                            timeinfo.tm_hour = hour;
                            timeinfo.tm_min = min;
                            timeinfo.tm_sec = sec;
                            info.requestedAt = mktime(&timeinfo) * 1000;
                        } else {
                            info.requestedAt = 0;
                        }
                    } else {
                        info.requestedAt = 0;
                    }
                } catch (...) {
                    info.requestedAt = 0;
                }
            } else {
                info.requestedAt = 0;
            }
            
            // 사용자 정보 조회
            try {
                auto userRows = users.select("name", "status_message", "profile_image_url")
                                    .where("user_id = :uid")
                                    .bind("uid", receiverId)
                                    .execute();
                
                if (userRows.count() > 0) {
                    auto userRow = userRows.fetchOne();
                    info.requesterName = userRow[0].get<string>();
                    if (!userRow[1].isNull()) info.requesterStatusMessage = userRow[1].get<string>();
                    if (!userRow[2].isNull()) info.requesterProfileImageUrl = userRow[2].get<string>();
                } else {
                    info.requesterName = receiverId;
                }
            } catch (...) {
                info.requesterName = receiverId;
            }
            
            result.push_back(info);
        }
        
        return result;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] 보낸 친구 요청 목록 조회 실패: " << err.what() << endl;
        return result;
    }
}

bool FriendRepository::MarkFriendRequestAsRead(const string& userId, const string& requesterId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        // 받은 요청을 읽음 처리 (user_id=받는 사람, friend_id=보낸 사람)
        friends.update()
               .set("is_read", 1)
               .where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
               .bind("uid", userId)
               .bind("rid", requesterId)
               .execute();
        
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] 친구 요청 읽음 처리 실패: " << err.what() << endl;
        return false;
    }
}

bool FriendRepository::AcceptFriendRequest(const string& userId, const string& requesterId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        // 1. 湲곗〈 pending ?붿껌??accepted濡?蹂寃?
        friends.update()
               .set("status", "accepted")
               .where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
               .bind("uid", userId)
               .bind("rid", requesterId)
               .execute();
        
        // 2. 반대 방향도 accepted로 추가 (양방향)
        auto existing = friends.select("id")
                        .where("user_id = :rid AND friend_id = :uid")
                        .bind("rid", requesterId)
                        .bind("uid", userId)
                        .execute();
        
        if (existing.count() == 0) {
            // 諛섎? 諛⑺뼢???놁쑝硫?異붽?
            friends.insert("user_id", "friend_id", "status")
                   .values(requesterId, userId, "accepted")
                   .execute();
        } else {
            // ?덉쑝硫?accepted濡??낅뜲?댄듃
            friends.update()
                   .set("status", "accepted")
                   .where("user_id = :rid AND friend_id = :uid")
                   .bind("rid", requesterId)
                   .bind("uid", userId)
                   .execute();
        }
        
        cout << "[FriendRepository] Accept Friend Request: " << userId << " <- " << requesterId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] Accept Friend Request Failed: " << err.what() << endl;
        return false;
    }
}

bool FriendRepository::RejectFriendRequest(const string& userId, const string& requesterId) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        // pending 요청 삭제
        friends.remove()
               .where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
               .bind("uid", userId)
               .bind("rid", requesterId)
               .execute();
        
        cout << "[FriendRepository] 친구 요청 거절: " << userId << " <- " << requesterId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] 친구 요청 거절 실패: " << err.what() << endl;
        return false;
    }
}

// ============================================
// Already Friends
// ============================================

bool FriendRepository::RemoveFriend(const string& userId, const string& friendId) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        // 양방향 삭제
        // 1. A -> B 삭제
        friends.remove()
               .where("user_id = :uid AND friend_id = :fid")
               .bind("uid", userId)
               .bind("fid", friendId)
               .execute();
        
        // 2. B -> A 삭제
        friends.remove()
               .where("user_id = :fid AND friend_id = :uid")
               .bind("fid", friendId)
               .bind("uid", userId)
               .execute();
        
        cout << "[FriendRepository] Remove Friend: " << userId << " <-> " << friendId << endl;
        return true;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] Remove Friend Failed: " << err.what() << endl;
        return false;
    }
}

vector<FriendInfo> FriendRepository::GetFriends(const string& userId) 
{
    vector<FriendInfo> result;
    
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        auto users = schema.getTable("users");
        

        auto rows = friends.select("friend_id", "status")
                          .where("user_id = :uid AND status = 'accepted'")
                          .bind("uid", userId)
                          .execute();
        
        for (auto row : rows) {
            string friendId = row[0].get<string>();
            string status = row[1].get<string>();
            
            // 사용자 정보 조회
            FriendInfo info;
            info.userId = friendId;  // 친구의 ID를 설정
            info.friendId = friendId;
            info.status = status;
            
            try {
                auto userRows = users.select("name", "status_message", "profile_image_url", "last_seen")
                                    .where("user_id = :uid")
                                    .bind("uid", friendId)
                                    .execute();
                
                if (userRows.count() > 0) {
                    auto userRow = userRows.fetchOne();
                    info.name = userRow[0].get<string>();
                    if (!userRow[1].isNull()) info.statusMessage = userRow[1].get<string>();
                    if (!userRow[2].isNull()) info.profileImageUrl = userRow[2].get<string>();
                    if (!userRow[3].isNull()) {
                        try {
                            auto tsValue = userRow[3];
                            if (tsValue.getType() == mysqlx::Value::STRING) {
                                // 문자열 형식: "YYYY-MM-DD HH:MM:SS"를 파싱
                                string tsStr = tsValue.get<string>();
                                struct tm timeinfo = {};
                                int year, mon, day, hour, min, sec;
                                if (sscanf_s(tsStr.c_str(), "%d-%d-%d %d:%d:%d",
                                        &year, &mon, &day, &hour, &min, &sec) == 6) {
                                    timeinfo.tm_year = year - 1900;
                                    timeinfo.tm_mon = mon - 1;
                                    timeinfo.tm_mday = day;
                                    timeinfo.tm_hour = hour;
                                    timeinfo.tm_min = min;
                                    timeinfo.tm_sec = sec;
                                    info.lastSeen = mktime(&timeinfo) * 1000;  
                                } else {
                                    info.lastSeen = 0;
                                }
                            } else {
                                info.lastSeen = 0;
                            }
                        } catch (...) {
                            info.lastSeen = 0;
                        }
                    }
                } else {
                    info.name = friendId;  // 기본값
                }
            } catch (...) {
                info.name = friendId;  // 예외 시 기본값
            }
            
            result.push_back(info);
        }
        
        return result;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] Get Friends List Failed: " << err.what() << endl;
        return result;
    }
}

bool FriendRepository::HasFriendRequest(const string& userId, const string& requesterId) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        auto rows = friends.select("id")
                          .where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
                          .bind("uid", userId)
                          .bind("rid", requesterId)
                          .execute();
        
        return rows.count() > 0;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] 친구 요청 확인 실패: " << err.what() << endl;
        return false;
    }
}

bool FriendRepository::IsFriend(const string& userId, const string& friendId) 
{
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto friends = schema.getTable("friends");
        
        auto rows = friends.select("id")
                          .where("user_id = :uid AND friend_id = :fid AND status = 'accepted'")
                          .bind("uid", userId)
                          .bind("fid", friendId)
                          .execute();
        
        return rows.count() > 0;
    } catch (const mysqlx::Error& err) {
        cerr << "[FriendRepository] 친구 확인 실패: " << err.what() << endl;
        return false;
    }
}

// ============================================
// Protocol
// ============================================

Protocol::FriendInfo FriendRepository::ToProtocolFriendInfo(const FriendInfo& info) {
    Protocol::FriendInfo friendInfo;
    friendInfo.set_user_id(info.friendId);
    friendInfo.set_name(info.name);
    friendInfo.set_status_message(info.statusMessage);
    friendInfo.set_profile_image_url(info.profileImageUrl);
    friendInfo.set_last_seen(info.lastSeen);
    friendInfo.set_status(info.status);
    return friendInfo;
}

Protocol::FriendRequest FriendRepository::ToProtocolFriendRequest(const FriendRequestInfo& info) {
    Protocol::FriendRequest request;
    request.set_requester_user_id(info.requesterUserId);
    request.set_requester_name(info.requesterName);
    request.set_requester_status_message(info.requesterStatusMessage);
    request.set_requester_profile_image_url(info.requesterProfileImageUrl);
    request.set_requested_at(info.requestedAt);
    return request;
}

