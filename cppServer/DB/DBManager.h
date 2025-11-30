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
    
    mysqlx::Session& GetSession() {
        if (!_session) {
            throw std::runtime_error("Database not initialized");
        }
        return *_session;
    }
    
    mysqlx::Schema GetSchema() {
        if (_database.empty()) {
            throw runtime_error("Database name not set");
        }
        return GetSession().getSchema(_database);
    }
    
    bool IsConnected() const { return _session != nullptr; }
    
private:
    DBManager() = default;
    ~DBManager();
    
    unique_ptr<mysqlx::Session> _session;
    string _database;
};

