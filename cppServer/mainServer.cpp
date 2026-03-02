#include "pch.h"

#include "Service.h"
#include "ServerSession.h"
#include "IocpCore.h"
#include "NetAddress.h"

#include "CoreGlobal.h"
#include "Service/UserManager.h"
#include "DB/DBManager.h"

#include <curl/curl.h> // 전역 초기화용



bool GKeepRunning = true;


int main()
{
	SetConsoleOutputCP(65001);

	Logger::Init();

	LOG_INFO("[Server] MySQL 연결 시도 중... (localhost:33060)");
	if (!DBManager::GetInstance().Initialize("localhost", 33060, "chat_server", "hoje1095", "chat_server"))
	{
		LOG_ERROR("[Server] Database connection failed!");
		return 1;
	}
	LOG_INFO("[Server] Database connected successfully");

	// libCurl
	curl_global_init(CURL_GLOBAL_ALL);

	WSADATA wsa;
	if (::WSAStartup(MAKEWORD(2, 2), &wsa) != 0) return 0;



	auto iocpCore = make_shared<IocpCore>();
	auto service = make_shared<Service>(
		ServiceType::Server,
		NetAddress(L"127.0.0.1", 3000), // 리스닝할 주소
		iocpCore,
		[]() { return make_shared<ServerSession>(); }
	);


	// 리스닝 시작
	if (service->Start() == false)
	{
		LOG_ERROR("[Server] Service 시작 실패");
		return 0;
	}
	LOG_INFO("[Server] Listening on 127.0.0.1:3000...");


	// 워커 스레드 생성 (CPU 코어 수만큼)
	vector<thread> workerThreads;
	const int32 threadCount = thread::hardware_concurrency();

	for (int32 i = 0; i < threadCount; ++i)
	{
		workerThreads.emplace_back([iocpCore]() {
			while (GKeepRunning)
			{
				iocpCore->Dispatch();
			}
			});
	}

	// 하트비트 스레드 (세션 관리)
	thread heartbeatThread([&]() {
		while (GKeepRunning)
		{
			this_thread::sleep_for(chrono::seconds(10));
			if (GUserManager) 
				GUserManager->CheckDeadSessions();
		}
		});



	while (true)
	{
		string command;
		getline(cin, command);

		if (command == "exit")
		{
			GKeepRunning = false;

			iocpCore->PostQuitStatus(threadCount);
			break;
		}
		else if (command == "status")
		{
			// TODO

		}
	}



	for (thread& t : workerThreads)
	{
		if (t.joinable()) t.join();
	}

	if (heartbeatThread.joinable()) heartbeatThread.join();

	curl_global_cleanup(); // libcurl 정리
	::WSACleanup();

	LOG_INFO("[Server] Successfully shut down.");
	Logger::Shutdown();
	return 0;

}