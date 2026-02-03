-- ============================================
-- Users 테이블 생성 스크립트
-- ============================================

CREATE DATABASE IF NOT EXISTS chat_server
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE chat_server;

-- ============================================
CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(100) PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    auth_token VARCHAR(512),

    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),

    profile_image_url VARCHAR(500),
    background_image_url VARCHAR(500),    -- 프로필 배경 이미지
    status_message VARCHAR(255) DEFAULT '',

    push_token VARCHAR(255),              -- FCM 토큰 (deprecated, fcm_tokens 테이블 사용)
    sub_grade INT DEFAULT 0,              -- 구독 등급 (0: 일반, 1: 프로 등)

    -- 개인 스토리지 (기본 1GB = 1073741824 Bytes)
    storage_capacity_bytes BIGINT DEFAULT 1073741824,
    storage_usage_bytes BIGINT DEFAULT 0,

    -- 회원 탈퇴 관련 (Soft Delete)
    is_deleted TINYINT(1) DEFAULT 0,      -- 탈퇴 여부 (0: 활성, 1: 탈퇴)
    deleted_at TIMESTAMP NULL,            -- 탈퇴 시점

    last_seen TIMESTAMP NULL,             -- 마지막 활동 시간
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_auth_token (auth_token),
    INDEX idx_last_seen (last_seen),
    INDEX idx_is_deleted (is_deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================
-- 기존 테이블 마이그레이션용 ALTER 문
-- (이미 users 테이블이 존재하는 경우 실행)
-- ============================================



-- 회원 탈퇴 컬럼 추가
ALTER TABLE users
ADD COLUMN is_deleted TINYINT(1) DEFAULT 0 COMMENT '탈퇴 여부 (0: 활성, 1: 탈퇴)',
ADD COLUMN deleted_at TIMESTAMP NULL COMMENT '탈퇴 시점',
ADD INDEX idx_is_deleted (is_deleted);






-- 테이블 구조 확인
SHOW TABLES;
DESCRIBE users;

-- 테이블 삭제 (주의!)
-- DROP TABLE users;