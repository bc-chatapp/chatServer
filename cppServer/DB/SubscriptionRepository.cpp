#include "pch.h"
#include "SubscriptionRepository.h"



/*---------------------
	Parsing
------------------------*/

uint64 SubscriptionRepository::ParseTimestamp(const mysqlx::Value& value)
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
	catch (...) {}
	return 0;
}


vector<string> SubscriptionRepository::ParseFeaturesJson(const string& json)
{
	vector<string> features;
	size_t pos = 0;

	while ((pos = json.find('"', pos)) != string::npos) {
		size_t end = json.find('"', pos + 1);
		if (end == string::npos) break;
		string feature = json.substr(pos + 1, end - pos - 1);
		if (!feature.empty() && feature != "[" && feature != "]") {
			features.push_back(feature);
		}
		pos = end + 1;
	}

	return features;
}



/*---------------------
	Query
------------------------*/

bool SubscriptionRepository::GetActiveSubscription(const string& userId, cSubscriptionInfo& OUT info)
{
	try {
		auto& db = DBManager::GetInstance();
		auto schema = db.GetSchema();

		auto subs = schema.getTable("subscriptions");
		auto subResult = subs.select("plan_id", "expires_at", "auto_renew")
			.where("user_id = :uid AND status = 'active'")
			.orderBy("id DESC")
			.limit(1)
			.bind("uid", userId)
			.execute();

		auto row = subResult.fetchOne();
		if (!row) return false;

		info.planId = row[0].get<int>();
		info.expiresAt = ParseTimestamp(row[1]);
		info.autoRenew = row[2].isNull() ? true : (row[2].get<int>() == 1);

		return true;
	}
	catch (const exception& e) {
		cerr << "[SubscriptionRepository] GetActiveSubscription 실패: " << e.what() << endl;
		return false;
	}
}


vector<cPlanInfo> SubscriptionRepository::GetAvailablePlans(const string& planType)
{
	vector<cPlanInfo> plans;

	try {
		auto& db = DBManager::GetInstance();
		auto schema = db.GetSchema();

		auto table = schema.getTable("subscription_plans");
		auto result = table.select("plan_id", "plan_type", "name", "grade",
				"storage_bytes", "max_file_size", "monthly_price", "features")
			.where("plan_type = :pt AND is_active = 1")
			.orderBy("grade ASC")
			.bind("pt", planType)
			.execute();

		for (auto row = result.fetchOne(); row; row = result.fetchOne()) {
			cPlanInfo plan;
			plan.planId = row[0].get<int>();
			plan.planType = row[1].get<string>();
			plan.name = row[2].get<string>();
			plan.grade = row[3].get<int>();
			plan.storageBytes = row[4].get<int64>();
			plan.maxFileSize = row[5].get<int64>();

			// DECIMAL -> double
			string priceStr = row[6].isNull() ? "0" : row[6].get<string>();
			plan.monthlyPrice = stod(priceStr);

			// JSON features
			if (!row[7].isNull()) {
				plan.features = ParseFeaturesJson(row[7].get<string>());
			}

			plans.push_back(plan);
		}
	}
	catch (const exception& e) {
		cerr << "[SubscriptionRepository] GetAvailablePlans 실패: " << e.what() << endl;
	}

	return plans;
}
