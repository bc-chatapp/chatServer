#pragma once
#include "Session.h"


class ServerSession : public Session
{
public:

	~ServerSession()
	{
		LOG_INFO("~ServerSession()");
	}
	
public:
	void SetUserId(const string& uid) { _userId = uid; }
	const string& GetUserId() const { return _userId; }

	void SetAuthToken(const string& token) { _authToken = token; }
	bool IsAuthenticated(const string& token) const { return _authToken == token; }
	
	void SetLastActiveTime() { _lastActiveTime = Nowts(); }
	int64 GetLastActiveTime() { return _lastActiveTime; }


	bool HasPushedOfflineData() const { return _hasPushedOfflineData; }
	void SetHasPushedOfflineData(bool value) { _hasPushedOfflineData = value; }

	// Rate Limiting (세션별 패킷 속도 제한)
	bool CheckRateLimit() {
		int64 now = Nowts();
		if (now - _rateLimitWindowStart > 1000) {
			// 1초 윈도우 리셋
			_rateLimitWindowStart = now;
			_rateLimitCount = 1;
			return true;
		}
		_rateLimitCount++;
		return _rateLimitCount <= 50; // 초당 최대 50패킷
	}

protected:
	virtual void OnConnected() override;
	virtual void OnDisconnected() override;
	virtual void OnRecv(BYTE* buffer, int32 len) override;
	virtual void OnSend(int32 len) override;


private:
	string _userId;
	string _authToken;
	bool _hasPushedOfflineData = false;

	int64 _lastActiveTime = 0;

	// Rate Limiting
	int64 _rateLimitWindowStart = 0;
	int32 _rateLimitCount = 0;
};

