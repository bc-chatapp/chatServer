#pragma once

#include <mysqlx/xdevapi.h>
#include <string>
#include <memory>

class DBManager {
public:
    static DBManager& GetInstance();

    bool Initialize(const string& host, int port,
                    const string& user, const string& password,
                    const string& database);

    mysqlx::Session& GetSession();
    mysqlx::Schema GetSchema();

    bool IsConnected() const { return _initialized; }

private:
    DBManager() = default;
    ~DBManager() = default;

    // 연결 설정 (Initialize에서 저장, 스레드별 세션 생성 시 사용)
    string _host;
    int    _port = 0;
    string _user;
    string _password;
    string _database;
    bool   _initialized = false;
};
