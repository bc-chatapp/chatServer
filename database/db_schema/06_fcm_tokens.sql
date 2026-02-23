-- ============================================
-- fcm_tokens 테이블
-- 다중 기기 FCM 푸시 토큰 관리
-- ============================================

USE chat_server;

CREATE TABLE IF NOT EXISTS fcm_tokens (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id     VARCHAR(100) NOT NULL,
    fcm_token   VARCHAR(512) NOT NULL UNIQUE,
    platform    VARCHAR(20) DEFAULT 'android',      -- 'android' or 'ios'
    device_id   VARCHAR(255),                       -- 디바이스 고유 ID
    device_name VARCHAR(100),                       -- 기기 이름 (예: "Galaxy S24")
    app_version VARCHAR(20),                        -- 앱 버전

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_active TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_user_id   (user_id),
    INDEX idx_fcm_token (fcm_token),
    INDEX idx_device_id (device_id),

    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
