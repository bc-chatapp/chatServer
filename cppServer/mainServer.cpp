#include "pch.h"

#include "Service.h"
#include "ServerSession.h"
#include "IocpCore.h"
#include "NetAddress.h"

#include "CoreGlobal.h"
#include "DB/DBManager.h"

int main()
{
	SetConsoleOutputCP(65001);

	cout << "[Server] MySQL 연결 시도 중... (localhost:33060)" << endl;
	if (!DBManager::GetInstance().Initialize("localhost", 33060, "chat_server", "hoje1095", "chat_server"))
	{
		cout << "error" << endl;
		cin.get();
		return 1;
	}
	wcout << L"[Server] Database connected successfully" << endl;



	// 1. Winsock 초기화
	WSADATA wsa;
	if (::WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		wcout << L"[Error] WSAStartup 실패" << endl;
		return 0;
	}

	// 2. IocpCore 생성
	auto iocpCore = make_shared<IocpCore>();

	// 3. Service 생성 (ServerSession을 만들도록 팩토리 지정)
	auto service = make_shared<Service>(
		ServiceType::Server,
		NetAddress(L"127.0.0.1", 3000), // 리스닝할 주소
		iocpCore,
		[]() { return make_shared<ServerSession>(); }
	);

	// 4. 리스닝 시작
	if (service->Start() == false)
	{
		wcout << L"[Error] Service 시작 실패" << endl;
		return 0;
	}

	wcout << L"[Server] Listening on 127.0.0.1:7777..." << endl;

	// 5. 워커 스레드 생성 (CPU 코어 수만큼)
	const int32 threadCount = thread::hardware_concurrency();
	vector<thread> threads;

	for (int32 i = 0; i < threadCount; ++i)
	{
		threads.emplace_back([iocpCore]()
			{
				// 각 스레드에서 무한루프로 Dispatch 실행
				while (true)
				{
					iocpCore->Dispatch();
				}
			});
	}

	// 6. 메인 스레드 대기
	for (thread& t : threads)
	{
		t.join();
	}

	::WSACleanup();
	return 0;
}