-- ============================================
-- Chat Server Database Schema
-- ============================================
-- users 테이블 생성 스크립트
-- ============================================

-- 1. 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS chat_server 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

-- 2. 데이터베이스 선택
USE chat_server;

-- 3. users 테이블 생성
CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(100) PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,  -- 비밀번호 해시 (bcrypt 등)
    auth_token VARCHAR(255),               -- JWT 또는 세션 토큰
    name VARCHAR(100),                     -- 사용자 이름
    status_message VARCHAR(255),           -- 상태 메시지
    profile_image_url VARCHAR(500),        -- 프로필 이미지 URL
    last_seen TIMESTAMP NULL,              -- 마지막 접속 시간
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_auth_token (auth_token),
    INDEX idx_last_seen (last_seen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. 테이블 확인
SHOW TABLES;
DESCRIBE users;

