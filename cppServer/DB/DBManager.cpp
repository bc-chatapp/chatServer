#include "pch.h"
#include "DBManager.h"
#include <iostream>
#include <sstream>

DBManager& DBManager::GetInstance() {
    static DBManager instance;
    return instance;
}

bool DBManager::Initialize(const string& host, int port,
    const string& user, const string& password,
    const string& database) {
    try {
        mysqlx::SessionSettings settings(
            mysqlx::SessionOption::HOST, host,
            mysqlx::SessionOption::PORT, port,
            mysqlx::SessionOption::USER, user,
            mysqlx::SessionOption::PWD, password,

            mysqlx::SessionOption::DB, database
        );


        _session = make_unique<mysqlx::Session>(settings);
        _database = database;

        cout << "[DBManager] MySQL 연결 성공: " << host << ":" << port << endl;
        return true;
    }
    catch (const mysqlx::Error& err) {
        cerr << "[DBManager] 연결 실패: " << err.what() << endl;
        return false;
    }
}

DBManager::~DBManager() {

    try {
        if (_session) {
            _session->close();
        }
    } catch (...) {

    }
}

