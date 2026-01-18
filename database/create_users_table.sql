

CREATE DATABASE IF NOT EXISTS chat_server 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE chat_server;

CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(100) PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    auth_token VARCHAR(512),
    
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    
    profile_image_url VARCHAR(500),
    background_image_url VARCHAR(500), -- 프로필 배경 이미지
    status_message VARCHAR(255) DEFAULT '',
    
    push_token VARCHAR(255),           -- FCM 토큰
    sub_grade INT DEFAULT 0,           -- 구독 등급 (0: 일반, 1: 프로 등)
    
    -- 개인 스토리지 (기본 1GB = 1073741824 Bytes)
    storage_capacity_bytes BIGINT DEFAULT 1073741824, 
    storage_usage_bytes BIGINT DEFAULT 0,
    
    last_seen TIMESTAMP NULL,          -- 마지막 활동 시간
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_auth_token (auth_token),
    INDEX idx_last_seen (last_seen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




SHOW TABLES;
DESCRIBE users;

DROP TABLE users;