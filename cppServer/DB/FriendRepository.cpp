#include "pch.h"
#include "FriendRepository.h"




/*---------------------
        Parsing
----------------------*/

uint64 FriendRepository::ParseTimestamp(const mysqlx::Value& value)
{
	if (value.isNull()) return 0;

	try {
		string tsStr = value.get<string>(); // "YYYY-MM-DD HH:MM:SS"
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
			return mktime(&timeinfo) * 1000; // 밀리초 단위 변환
		}
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Parse Err: " << err.what() << endl;
	}
	return 0;
}



/*---------------------
        Actions
----------------------*/

bool FriendRepository::AddFriendRequest(const string& userId, const string& friendId) {
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		// 중복 체크: (A->B) 혹은 (B->A) 관계가 이미 있는지 확인
		auto existing = friends.select("id")
			.where("(user_id = :fid AND friend_id = :uid) OR (user_id = :uid AND friend_id = :fid)")
			.bind("fid", friendId)
			.bind("uid", userId)
			.execute();

		if (existing.count() > 0) {
			cout << "[FriendRepository] 이미 존재하는 친구 요청: " << userId << " -> " << friendId << endl;
			return false;
		}

		// pending 상태로 추가 (받는 사람 기준)
		friends.insert("user_id", "friend_id", "status")
			.values(friendId, userId, "pending").execute();

		cout << "[FriendRepository] Add Friend Request: " << userId << " -> " << friendId << endl;
		return true;

	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Add Friend Request Failed : " << err.what() << endl;
		return false;
	}
}

bool FriendRepository::CancelFriendRequest(const string& userId, const string& friendId) {
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		// 보낸 사람이 취소: user_id=friendId (받는 사람), friend_id=userId (보낸 사람)
		friends.remove()
			.where("user_id = :fid AND friend_id = :uid AND status = 'pending'")
			.bind("fid", friendId)
			.bind("uid", userId)
			.execute();

		cout << "[FriendRepository] Cancel Friend Request: " << userId << " -> " << friendId << endl;
		return true;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Cancel Friend Request Failed: " << err.what() << endl;
		return false;
	}
}



bool FriendRepository::AcceptFriendRequest(const string& userId, const string& requesterId) {
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");


		// 1. 받은 요청(pending) -> accepted
		friends.update()
			.set("status", "accepted")
			.where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
			.bind("uid", userId)
			.bind("rid", requesterId)
			.execute();

		// 2. 반대 방향 데이터 추가 (양방향 친구)
		friends.insert("user_id", "friend_id", "status")
			.values(requesterId, userId, "accepted")
			.execute();

		cout << "[FriendRepository] Accept: " << userId << " <-> " << requesterId << endl;
		return true;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Accept Friend Request Failed: " << err.what() << endl;
		return false;
	}
}

bool FriendRepository::RejectFriendRequest(const string& userId, const string& requesterId)
{
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		// pending 요청 삭제
		friends.remove()
			.where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
			.bind("uid", userId)
			.bind("rid", requesterId)
			.execute();

		cout << "[FriendRepository] 친구 요청 거절: " << userId << " <- " << requesterId << endl;
		return true;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] 친구 요청 거절 실패: " << err.what() << endl;
		return false;
	}
}


bool FriendRepository::RemoveFriend(const string& userId, const string& friendId) {
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		// 양방향 모두 삭제
		friends.remove()
			.where("(user_id = :uid AND friend_id = :fid) OR (user_id = :fid AND friend_id = :uid)")
			.bind("uid", userId)
			.bind("fid", friendId)
			.execute();

		cout << "[FriendRepository] Remove Friend: " << userId << " <-> " << friendId << endl;
		return true;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Remove Friend Failed: " << err.what() << endl;
		return false;
	}
}








vector<cFriendInfo> FriendRepository::GetFriends(const string& userId)
{
	vector<cFriendInfo> result; 

	try {
		auto& db = DBManager::GetInstance();
		auto& session = db.GetSession();

		// JOIN을 통해 친구 정보 한 번에 가져오기
		string query = "SELECT f.friend_id, u.name, u.status_message, u.profile_image_url "
			"FROM friends f "
			"JOIN users u ON f.friend_id = u.user_id "
			"WHERE f.user_id = ? AND f.status = 'accepted'";

		auto stmt = session.sql(query);
		stmt.bind(userId);
		auto res = stmt.execute();

		for (auto row : res) {
			cFriendInfo info;
			info.userId = userId;
			info.friendId = row[0].get<string>(); // 친구
			info.name = row[1].get<string>();

			if (!row[2].isNull()) info.statusMessage = row[2].get<string>();
			if (!row[3].isNull()) info.profileImageUrl = row[3].get<string>();
			info.lastSeen = 0;
			info.status = "accepted";

			result.push_back(info);
		}
		return result;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Get Friends List Failed: " << err.what() << endl;
		return result;
	}
}


vector<FriendRequestInfo> FriendRepository::GetFriendRequests(const string& userId)
{
	vector<FriendRequestInfo> result;

	try {
		auto& db = DBManager::GetInstance();
		auto& session = db.GetSession();

		string query = "SELECT f.friend_id, f.created_at, u.name, u.status_message, u.profile_image_url "
			"FROM friends f "
			"JOIN users u ON f.friend_id = u.user_id "
			"WHERE f.user_id = ? AND f.status = 'pending'";

		auto stmt = session.sql(query);
		stmt.bind(userId);
		auto rows = stmt.execute();


		for (auto row : rows) {
			FriendRequestInfo info;
			info.userId = row[0].get<string>();
			info.requestedAt = ParseTimestamp(row[1]);

			info.name = row[2].get<string>();
			if (!row[3].isNull()) info.statusMessage = row[3].get<string>();
			if (!row[4].isNull()) info.profileImageUrl = row[4].get<string>();
			result.push_back(info);
		}

		return result;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] Get Friend Requests Failed: " << err.what() << endl;
		return result;
	}
}





vector<FriendRequestInfo> FriendRepository::GetSentFriendRequests(const string& userId)
{
	vector<FriendRequestInfo> result;

	try {
		auto& db = DBManager::GetInstance();
		auto& session = db.GetSession();

		string query = "SELECT f.user_id, f.created_at, u.name, u.status_message, u.profile_image_url "
			"FROM friends f "
			"JOIN users u ON f.user_id = u.user_id " // 받는 사람(f.user_id)의 정보 조회
			"WHERE f.friend_id = ? AND f.status = 'pending'";

		auto stmt = session.sql(query);
		stmt.bind(userId); // userId = 나(보낸 사람, friend_id 컬럼)
		auto rows = stmt.execute();



		for (auto row : rows) {
			FriendRequestInfo info;
			info.userId = row[0].get<string>(); // 받는 사람 ID
			info.requestedAt = ParseTimestamp(row[1]);

			info.name = row[2].get<string>();
			if (!row[3].isNull()) info.statusMessage = row[3].get<string>();
			if (!row[4].isNull()) info.profileImageUrl = row[4].get<string>();

			result.push_back(info);
		}

		return result;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] 보낸 친구 요청 목록 조회 실패: " << err.what() << endl;
		return result;
	}
}














vector<FriendRequestInfo> FriendRepository::GetUnreadFriendRequests(const string& userId)
{
	return GetFriendRequests(userId);
}




bool FriendRepository::MarkFriendRequestAsRead(const string& userId, const string& requesterId) {
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		// 받은 요청을 읽음 처리 (user_id=받는 사람, friend_id=보낸 사람)
		friends.update()
			.set("is_read", 1)
			.where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
			.bind("uid", userId)
			.bind("rid", requesterId)
			.execute();

		return true;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] 친구 요청 읽음 처리 실패: " << err.what() << endl;
		return false;
	}
}







bool FriendRepository::IsFriend(const string& userId, const string& friendId)
{
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		auto rows = friends.select("id")
			.where("user_id = :uid AND friend_id = :fid AND status = 'accepted'")
			.bind("uid", userId)
			.bind("fid", friendId)
			.execute();

		return rows.count() > 0;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] 친구 확인 실패: " << err.what() << endl;
		return false;
	}
}

bool FriendRepository::HasSentRequest(const string& userId, const string& requesterId)
{
	try {
		auto& db = DBManager::GetInstance();
		auto friends = db.GetSchema().getTable("friends");

		auto rows = friends.select("id")
			.where("user_id = :uid AND friend_id = :rid AND status = 'pending'")
			.bind("uid", userId)
			.bind("rid", requesterId)
			.execute();

		return rows.count() > 0;
	}
	catch (const mysqlx::Error& err) {
		cerr << "[FriendRepository] 친구 요청 확인 실패: " << err.what() << endl;
		return false;
	}
}



// ============================================
// Protocol
// ============================================



Protocol::UserInfo FriendRepository::ToProtocolUserInfo(const cFriendInfo& info) {
	Protocol::UserInfo userInfo;
	userInfo.set_user_id(info.friendId);
	userInfo.set_name(info.name);
	userInfo.set_status_message(info.statusMessage);
	userInfo.set_profile_image_url(info.profileImageUrl);
	userInfo.set_last_seen(info.lastSeen);
	userInfo.set_status(info.status);

	return userInfo;
}



Protocol::FriendRequest FriendRepository::ToProtocolFriendRequest(const FriendRequestInfo& info, bool isReceived) 
{
	Protocol::FriendRequest req;

	Protocol::UserInfo* requester = req.mutable_requester();
	requester->set_user_id(info.userId);
	requester->set_name(info.name);
	requester->set_status_message(info.statusMessage);
	requester->set_profile_image_url(info.profileImageUrl);

	req.set_requested_at(info.requestedAt);
	req.set_is_received(isReceived);

	return req;
}