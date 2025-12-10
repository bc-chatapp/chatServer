#include "pch.h"
#include "UserManager.h"

#include "ServerSession.h"



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
		cout << "[Reaper] 유저(" << serverSession->GetUserId() << ") 타임아웃! 강제 종료." << endl;


		s->Disconnect();
	}

}
