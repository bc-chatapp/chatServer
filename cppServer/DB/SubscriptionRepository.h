#pragma once

#include "pch.h"
#include "../protocol.pb.h"
#include "DBManager.h"


struct cSubscriptionInfo {
	int32 planId = 0;
	int64 expiresAt = 0;	// Unix timestamp (ms)
	bool autoRenew = true;
};

struct cPlanInfo {
	int32 planId = 0;
	string planType;		// "personal" or "group"
	string name;
	int32 grade = 0;
	int64 storageBytes = 0;
	int64 maxFileSize = 0;
	double monthlyPrice = 0.0;
	vector<string> features;
};


class SubscriptionRepository {
public:
	// 현재 구독 정보 조회
	static bool GetActiveSubscription(const string& userId, cSubscriptionInfo& OUT info);

	// 이용 가능한 플랜 목록 조회
	static vector<cPlanInfo> GetAvailablePlans(const string& planType = "personal");

private:
	static uint64 ParseTimestamp(const mysqlx::Value& value);
	static vector<string> ParseFeaturesJson(const string& json);
};
