-- ============================================
-- 데이터베이스 및 서버 유저 초기 설정
-- 최초 1회만 실행
-- ============================================

CREATE DATABASE IF NOT EXISTS chat_server
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'chat_server'@'localhost'
    IDENTIFIED WITH mysql_native_password BY 'hoje1095';

GRANT ALL PRIVILEGES ON chat_server.* TO 'chat_server'@'localhost';
FLUSH PRIVILEGES;

USE chat_server;
