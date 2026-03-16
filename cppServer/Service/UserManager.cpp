#include "pch.h"
#include "UserManager.h"

#include "ServerSession.h"



void UserManager::UpsertSession(const string& userId, const shared_ptr<Session>& newSession)
{
	WRITE_LOCK_IDX(0);

	// 이미 접속 중인 세션이 있는지 확인
	auto it = _sessions.find(userId);
	if (it != _sessions.end())
	{
		SessionPtr oldSession = it->second.lock();

		if (oldSession && oldSession != newSession)
		{
			LOG_INFO("[UserManager] 중복 로그인 감지! 기존 세션 종료: {}", userId);
			oldSession->Disconnect();
		}
		else if (oldSession == newSession)
		{
			// 이미 등록되어 있음. 패싱
			return;
		}
	}
	_sessions[userId] = newSession;
}



void UserManager::RemoveSession(const string& userId, SessionPtr session)
{
	WRITE_LOCK_IDX(0);

	auto it = _sessions.find(userId);
	if (it != _sessions.end()) {
		// 맵에 있는 세션이, 삭제를 요청한 세션과 '같은 놈'일 때만 지운다!
		SessionPtr currentSession = it->second.lock();
		if (currentSession == session) {
			_sessions.erase(it);
			LOG_INFO("[UserManager] 세션 정상 제거 완료: {}", userId);
		}
		else {
			LOG_INFO("[UserManager] 제거 요청 무시됨 (이미 다른 세션으로 교체됨): {}", userId);
		}
	}
}







void UserManager::CheckDeadSessions()
{
	int64 now = Nowts();
	vector<SessionPtr> deadList;

	{
		WRITE_LOCK;

		for (auto it = _sessions.begin(); it != _sessions.end(); ) {
			SessionPtr session = it->second.lock();

			if (session == nullptr) {
				it = _sessions.erase(it);
				continue;
			}

			auto serverSession = static_pointer_cast<ServerSession>(session);

			int64 lastActive = serverSession->GetLastActiveTime();

			if (lastActive > 0 && (now - lastActive > TIMEOUT_MS)) {
				deadList.push_back(session);
			}

			++it;
		}
	}


	for (auto& s : deadList) {
		auto serverSession = static_pointer_cast<ServerSession>(s);
		LOG_INFO("[UserManager] 유저 ({}) 타임아웃! 강제 종료.", serverSession->GetUserId());


		s->Disconnect();
	}

}
