#include "pch.h"
#include "DBManager.h"

DBManager& DBManager::GetInstance() {
    static DBManager instance;
    return instance;
}

bool DBManager::Initialize(const string& host, int port,
    const string& user, const string& password,
    const string& database) {
    try {
        // 메인 스레드에서 연결 테스트
        mysqlx::SessionSettings settings(
            mysqlx::SessionOption::HOST, host,
            mysqlx::SessionOption::PORT, port,
            mysqlx::SessionOption::USER, user,
            mysqlx::SessionOption::PWD, password,
            mysqlx::SessionOption::DB, database
        );

        auto testSession = mysqlx::Session(settings);
        testSession.close();

        // 설정 저장 (스레드별 세션 생성용)
        _host = host;
        _port = port;
        _user = user;
        _password = password;
        _database = database;
        _initialized = true;

        LOG_INFO("[DBManager] MySQL 연결 성공: {}:{}", host, port);
        return true;
    }
    catch (const mysqlx::Error& err) {
        LOG_ERROR("[DBManager] 연결 실패: {}", err.what());
        return false;
    }
}

mysqlx::Session& DBManager::GetSession() {
    if (!_initialized) {
        throw std::runtime_error("[DBManager] Database not initialized");
    }

    // 스레드별 독립 세션 (IOCP 워커 스레드 간 경쟁 방지)
    thread_local std::unique_ptr<mysqlx::Session> tls_session;

    if (!tls_session) {
        mysqlx::SessionSettings settings(
            mysqlx::SessionOption::HOST, _host,
            mysqlx::SessionOption::PORT, _port,
            mysqlx::SessionOption::USER, _user,
            mysqlx::SessionOption::PWD, _password,
            mysqlx::SessionOption::DB, _database
        );
        tls_session = std::make_unique<mysqlx::Session>(settings);
        LOG_INFO("[DBManager] 스레드별 DB 세션 생성 (thread_id={})",
                 std::hash<std::thread::id>{}(std::this_thread::get_id()));
    }

    return *tls_session;
}

mysqlx::Schema DBManager::GetSchema() {
    return GetSession().getSchema(_database);
}
