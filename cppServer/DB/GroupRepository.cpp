#include "pch.h"
#include "GroupRepository.h"


#include <random>
#include <sstream>
#include <iomanip>



string GroupRepository::GenerateUUID() {
    static random_device rd;
    static mt19937 gen(rd());
    static uniform_int_distribution<> dis(0, 15);
    stringstream ss;
    for (int i = 0; i < 32; i++) ss << hex << dis(gen);
    return ss.str();
}

string GroupRepository::GenerateGroupCode() {
    const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    const int codeLength = 6;
    
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(0, chars.length() - 1);
    
    string code;
    int attempts = 0;
    const int maxAttempts = 100;
    
    do {
        code.clear();
        for (int i = 0; i < codeLength; ++i) {
            code += chars[dis(gen)];
        }
        attempts++;
    } while (IsGroupCodeExists(code) && attempts < maxAttempts);
    
    if (attempts >= maxAttempts) {
        // 간단한 폴백 로직
        auto now = ::time(nullptr);
        stringstream ss;
        ss << hex << now;
        code = ss.str().substr(0, 6);
    }
    
    return code;
}



/*---------------------
        Actions
------------------------*/

bool GroupRepository::CreateGroup(const string& groupName, const string& creatorId, cGroupInfo& OUT groupInfo)
{
    try
    {
        string groupId = GenerateUUID();
        string groupCode = GenerateGroupCode();

        int64_t defaultLimit = 1024LL * 1024 * 1024;

        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();

        auto groups = db.GetSchema().getTable("groups");
        groups.insert("group_id", "group_name", "group_code", "creator_id", "description", "group_image_url", "storage_capacity_bytes", "storage_usage_bytes", "member_count")
            .values(groupId, groupName, groupCode, creatorId, "", "", defaultLimit, 0, 0)
            .execute();

        auto members = db.GetSchema().getTable("group_members");
        members.insert("group_id", "user_id", "role")
            .values(groupId, creatorId, "owner")
            .execute();

        session.commit();

        /**/

        groupInfo.groupId = groupId;
        groupInfo.groupName = groupName;
        groupInfo.groupCode = groupCode;
        groupInfo.creatorId = creatorId;
        groupInfo.description = "";
        groupInfo.groupImageUrl = "";
        groupInfo.storageLimit = defaultLimit;
        groupInfo.storageUsage = 0;
        groupInfo.createdAt = ::time(nullptr) * 1000;

        groupInfo.memberCount = 1;

        cout << "[GroupRepo] Created: " << groupName << " (" << groupCode << ")" << endl;
        return true;
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] Create Failed: " << err.what() << endl;
        return false;
    }
}


bool GroupRepository::AddMember(const string& groupId, const string& userId, const string& role)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();

        // 1. 멤버 테이블에 추가
        auto members = db.GetSchema().getTable("group_members");
        members.insert("group_id", "user_id", "role")
            .values(groupId, userId, role)
            .execute();

        // 2. 그룹 테이블 카운트 증가
        session.sql("UPDATE `groups` SET member_count = member_count + 1 WHERE group_id = ?")
            .bind(groupId)
            .execute();

        session.commit();
        return true;
    }
    catch (const mysqlx::Error& err) 
    { 
        cerr << "[GroupRepo] AddMember Failed: " << err.what() << endl;
        return false; 
    }
}



bool GroupRepository::RemoveMember(const string& groupId, const string& userId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();

        // 1. 멤버 테이블에서 삭제
        auto members = db.GetSchema().getTable("group_members");
        members.remove()
            .where("group_id = :gid AND user_id = :uid")
            .bind("gid", groupId)
            .bind("uid", userId)
            .execute();

        // 2. 그룹 테이블 카운트 감소
        session.sql("UPDATE `groups` SET member_count = member_count - 1 WHERE group_id = ? AND member_count > 0")
            .bind(groupId)
            .execute();

        session.commit();
        return true;
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] RemoveMember Failed: " << err.what() << endl;
        return false;
    }
}





bool GroupRepository::SaveGroupAsset(const string& groupId, const string& userId, int64 msgSeq, int64 fileSize, const string& fileType)
{
    if (fileSize <= 0) return false;

    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        // group_assets에 INSERT (자동으로 트리거가 작동하여 groups.storage_usage 업데이트)
        session.sql("INSERT INTO group_assets (group_id, user_id, msg_seq, file_size, file_type) VALUES (?, ?, ?, ?, ?)")
            .bind(groupId, userId, msgSeq, fileSize, fileType)
            .execute();

        cout << "[DB] Group Asset 저장 완료: Group=" << groupId << ", Size=" << fileSize << " bytes" << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] 에셋 기록 실패: " << err.what() << endl;
        return false;
    }
}



bool GroupRepository::UpdateGroupInfo(const string& groupId, const string& newName, const string& newImageUrl)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        auto result = session.sql("UPDATE `groups` SET group_name = ?, group_image_url = ? WHERE group_id = ?")
            .bind(newName, newImageUrl, groupId)
            .execute();


        if (result.getAffectedItemsCount() > 0) {
            cout << "[DB] 그룹 정보 업데이트 성공: " << groupId << endl;
            return true;
        }
        else {
            cout << "[DB] 그룹 정보 업데이트: 변경사항 없음 또는 대상 없음 (ID: " << groupId << ")" << endl;
            return false;
        }
    }
    catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] Update Error: " << err.what() << endl;
        return false;
    }
    catch (const std::exception& e) {
        cerr << "[GroupRepository] Std Exception: " << e.what() << endl;
        return false;
    }
}


bool GroupRepository::DeleteGroup(const string& groupId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        session.startTransaction();

        const string convId = "group:" + groupId;

        // 1. 메시지 삭제
        session.sql("DELETE FROM `messages` WHERE conv_id = ?")
            .bind(convId)
            .execute();

        // 2. read_status 삭제
        session.sql("DELETE FROM `read_status` WHERE conv_id = ?")
            .bind(convId)
            .execute();

        // 3. group_assets 삭제
        session.sql("DELETE FROM `group_assets` WHERE group_id = ?")
            .bind(groupId)
            .execute();

        // 4. group_members 삭제
        session.sql("DELETE FROM `group_members` WHERE group_id = ?")
            .bind(groupId)
            .execute();

        // 5. groups 삭제
        session.sql("DELETE FROM `groups` WHERE group_id = ?")
            .bind(groupId)
            .execute();

        session.commit();
        cout << "[DB] 그룹 영구 삭제 완료: " << groupId << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] DeleteGroup Error: " << err.what() << endl;
        return false;
    }
    catch (const std::exception& e) {
        cerr << "[GroupRepository] DeleteGroup Exception: " << e.what() << endl;
        return false;
    }
}






/*---------------------
        Queries
----------------------*/

vector<cGroupInfo> GroupRepository::GetUserGroups(const string& userId)
{
    vector<cGroupInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();


        string query = "SELECT g.group_id, g.group_name, g.group_code, g.creator_id, "
            "g.description, g.group_image_url, "
            "g.storage_usage_bytes, g.storage_capacity_bytes, g.member_count, g.created_at "
            "FROM `groups` g "
            "JOIN group_members m ON g.group_id = m.group_id "
            "WHERE m.user_id = ?";



        auto rows = session.sql(query).bind(userId).execute();

        for (auto row : rows) {
            cGroupInfo info;
            info.groupId = row[0].get<string>();
            info.groupName = row[1].get<string>();
            info.groupCode = row[2].get<string>();
            info.creatorId = row[3].get<string>();

            if (!row[4].isNull()) info.description = row[4].get<string>();
            if (!row[5].isNull()) info.groupImageUrl = row[5].get<string>();

            info.storageUsage = row[6].get<int64_t>();
            info.storageLimit = row[7].get<int64_t>();
            info.memberCount = row[8].get<int>();
            info.createdAt = ParseTimestamp(row[9]);
            result.push_back(info);
        }
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] GetUserGroups Error: " << err.what() << endl;
    }

    return result;
}



bool GroupRepository::GetGroupInfoById(const string& groupId, cGroupInfo& OUT info)
{
    try {
        auto& db = DBManager::GetInstance();
        auto groups = db.GetSchema().getTable("groups");


        auto rows = groups.select("group_id", "group_name", "group_code", "creator_id",
            "description", "group_image_url",
            "storage_usage_bytes", "storage_capacity_bytes", "member_count", "created_at")
            .where("group_id = :id")
            .bind("id", groupId)
            .execute();



        if (rows.count() == 0) return false;

        auto row = rows.fetchOne();
        info.groupId = row[0].get<string>();
        info.groupName = row[1].get<string>();
        info.groupCode = row[2].get<string>();
        info.creatorId = row[3].get<string>();
        if (!row[4].isNull()) info.description = row[4].get<string>();
        if (!row[5].isNull()) info.groupImageUrl = row[5].get<string>();

        info.storageUsage = row[6].get<int64_t>();
        info.storageLimit = row[7].get<int64_t>();
        info.memberCount = row[8].get<int>();
        info.createdAt = ParseTimestamp(row[9]);

        return true;
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] GetUserGroups Error: " << err.what() << endl;
    }
    return false;
}



bool GroupRepository::GetGroupInfoByCode(const string& groupCode, cGroupInfo& OUT info)
{
    try {
        auto& db = DBManager::GetInstance();
        auto groups = db.GetSchema().getTable("groups");


        auto rows = groups.select(
            "group_id", "group_name", "group_code", "creator_id",
            "description", "group_image_url",
            "storage_usage_bytes", "storage_capacity_bytes", "member_count", "created_at"
        )
            .where("group_code = :code") 
            .bind("code", groupCode)     
            .execute();


        if (rows.count() == 0) return false;


        auto row = rows.fetchOne();

        // 3. 인덱스 번호에 맞춰 정확하게 매핑 (row[0]은 group_id입니다)
        info.groupId = row[0].get<string>();
        info.groupName = row[1].get<string>();
        info.groupCode = row[2].get<string>();
        info.creatorId = row[3].get<string>();

        if (!row[4].isNull()) info.description = row[4].get<string>();
        if (!row[5].isNull()) info.groupImageUrl = row[5].get<string>();

        // 4. 숫자형 데이터 안전하게 파싱 (Null 체크 권장)
        info.storageUsage = !row[6].isNull() ? row[6].get<int64_t>() : 0;
        info.storageLimit = !row[7].isNull() ? row[7].get<int64_t>() : 0;
        info.memberCount = !row[8].isNull() ? (int)row[8].get<int64_t>() : 0;

        if (!row[9].isNull()) {
            info.createdAt = ParseTimestamp(row[9]);
        }

        return true;
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] GetUserGroups Error: " << err.what() << endl;
    }
    return false;
}





bool GroupRepository::IsMember(const string& groupId, const string& userId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto members = db.GetSchema().getTable("group_members");

        auto res = members.select("id")
            .where("group_id = :gid AND user_id = :uid")
            .bind("gid", groupId)
            .bind("uid", userId)
            .execute();

        return res.count() > 0;
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] GetUserGroups Error: " << err.what() << endl;
    }
    return false;
}


string GroupRepository::GetMemberRole(const string& groupId, const string& userId)
{
    try {
        auto& db = DBManager::GetInstance();
        auto members = db.GetSchema().getTable("group_members");

        auto rows = members.select("role")
            .where("group_id = :gid AND user_id = :uid")
            .bind("gid", groupId)
            .bind("uid", userId)
            .execute();

        if (rows.count() > 0) 
            return rows.fetchOne()[0].get<string>();
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] GetUserGroups Error: " << err.what() << endl;
    }
    return "";
}



vector<cGroupMemberInfo> GroupRepository::GetGroupMembers(const string& groupId)
{
    vector<cGroupMemberInfo> result;
    try {
        auto& db = DBManager::GetInstance();
        auto& session = db.GetSession();

        string query = "SELECT m.user_id, m.role, m.joined_at, u.name, u.status_message, u.profile_image_url "
            "FROM group_members m "
            "JOIN users u ON m.user_id = u.user_id "
            "WHERE m.group_id = ?";

        auto rows = session.sql(query).bind(groupId).execute();

        for (auto row : rows) {
            cGroupMemberInfo info;
            info.userId = row[0].get<string>();
            info.role = row[1].get<string>();

            info.joinedAt = ParseTimestamp(row[2]);

            info.name = row[3].get<string>();
            if (!row[4].isNull()) info.statusMessage = row[4].get<string>();
            if (!row[5].isNull()) info.profileImageUrl = row[5].get<string>();
            result.push_back(info);
        }
    }
    catch (const mysqlx::Error& err)
    {
        cerr << "[GroupRepo] GetUserGroups Error: " << err.what() << endl;
    }
    return result;
}







bool GroupRepository::IsGroupCodeExists(const string& groupCode) {
    try {
        auto& db = DBManager::GetInstance();
        auto schema = db.GetSchema();
        auto groups = schema.getTable("groups");
        
        auto rows = groups.select("group_id")
                          .where("group_code = :code")
                          .bind("code", groupCode)
                          .execute();
        
        return rows.count() > 0;

    } catch (const mysqlx::Error& err) {
        cerr << "[GroupRepository] IsGroupCodeExists Failed: " << err.what() << endl;
        return false;
    }
}


uint64 GroupRepository::ParseTimestamp(const mysqlx::Value& value)
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