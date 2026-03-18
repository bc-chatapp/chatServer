-- ============================================
-- users 테이블
-- ============================================

USE chat_server;

CREATE TABLE IF NOT EXISTS users (
    user_id             VARCHAR(100) PRIMARY KEY,
    password_hash       VARCHAR(255) NOT NULL,
    auth_token          VARCHAR(512),

    name                VARCHAR(100) NOT NULL,
    email               VARCHAR(255) UNIQUE,
    phone               VARCHAR(20),

    profile_image_url   VARCHAR(500),
    background_image_url VARCHAR(500),
    status_message      VARCHAR(255) DEFAULT '',

    sub_grade           INT DEFAULT 0,                      -- 구독 등급 (0: 일반, 1: 프로)

    -- 개인 스토리지 (기본 1GB)
    storage_capacity_bytes BIGINT DEFAULT 1073741824,
    storage_usage_bytes    BIGINT DEFAULT 0,

    -- Soft Delete
    is_deleted          TINYINT(1) DEFAULT 0,
    deleted_at          TIMESTAMP NULL,

    last_seen           TIMESTAMP NULL,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_auth_token (auth_token),
    INDEX idx_last_seen  (last_seen),
    INDEX idx_is_deleted (is_deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
