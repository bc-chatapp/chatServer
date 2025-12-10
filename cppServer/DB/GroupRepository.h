#pragma once

#include "pch.h"
#include "../protocol.pb.h"

struct GroupInfo {
    string groupId;
    string groupName;
    string groupCode;
    string creatorId;
    int64 createdAt;
};

struct GroupMemberInfo {
    string groupId;
    string userId;
    string role;  // "owner", "admin", "member"
    int64 joinedAt;
};

class GroupRepository {
public:
    // ============================================
    // 그룹 관리
    // ============================================
    
    // 그룹 생성
    static bool CreateGroup(const string& groupId, const string& groupName, 
                           const string& groupCode, const string& creatorId);
    
    // 그룹 정보 조회
    static bool GetGroupInfo(const string& groupId, GroupInfo& groupInfo);
    
    // 그룹 코드로 그룹 조회
    static bool GetGroupByCode(const string& groupCode, GroupInfo& groupInfo);
    
    // 그룹 삭제
    static bool DeleteGroup(const string& groupId);
    
    // ============================================
    // 그룹 멤버 관리
    // ============================================
    
    // 그룹 멤버 추가
    static bool AddMember(const string& groupId, const string& userId, const string& role = "member");
    
    // 그룹 멤버 제거
    static bool RemoveMember(const string& groupId, const string& userId);
    
    // 그룹 멤버 목록 조회
    static vector<GroupMemberInfo> GetMembers(const string& groupId);
    
    // 사용자가 속한 그룹 목록 조회
    static vector<GroupInfo> GetUserGroups(const string& userId);
    
    // 사용자가 그룹 멤버인지 확인
    static bool IsMember(const string& groupId, const string& userId);
    
    // 사용자의 그룹 내 역할 조회
    static string GetMemberRole(const string& groupId, const string& userId);
    
    // ============================================
    // 유틸리티
    // ============================================
    
    // 랜덤 그룹 코드 생성 (6자리 알파벳+숫자)
    static string GenerateGroupCode();
    
    // 그룹 코드 중복 확인
    static bool IsGroupCodeExists(const string& groupCode);
};

