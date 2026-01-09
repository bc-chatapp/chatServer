#pragma once
#include "Session.h"


class ServerSession : public Session
{
public:

	~ServerSession()
	{
		wcout << "~ServerSession()" << endl;
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
};

