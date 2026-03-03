#pragma once

#include <spdlog/spdlog.h>
#include <spdlog/sinks/daily_file_sink.h>
#include <spdlog/sinks/stdout_color_sinks.h>

#include <memory>
#include <mutex>
#include <unordered_map>

class Logger {
public:
    static void Init();
    static void Shutdown();

    static std::shared_ptr<spdlog::logger>& GetServerLogger();
    static std::shared_ptr<spdlog::logger>& GetAuditLogger();

    // 대화방별 로거 (daily rotation, 365일 보관)
    static std::shared_ptr<spdlog::logger> GetConvLogger(const std::string& safeConvId);

private:
    static std::shared_ptr<spdlog::logger> s_serverLogger;
    static std::shared_ptr<spdlog::logger> s_auditLogger;

    static std::mutex s_convMutex;
    static std::unordered_map<std::string, std::shared_ptr<spdlog::logger>> s_convLoggers;
};

// Server operation log macros
#define LOG_TRACE(...)    Logger::GetServerLogger()->trace(__VA_ARGS__)
#define LOG_INFO(...)     Logger::GetServerLogger()->info(__VA_ARGS__)
#define LOG_WARN(...)     Logger::GetServerLogger()->warn(__VA_ARGS__)
#define LOG_ERROR(...)    Logger::GetServerLogger()->error(__VA_ARGS__)
#define LOG_CRITICAL(...) Logger::GetServerLogger()->critical(__VA_ARGS__)

// Message audit log macro
#define AUDIT_LOG(...)    Logger::GetAuditLogger()->info(__VA_ARGS__)
