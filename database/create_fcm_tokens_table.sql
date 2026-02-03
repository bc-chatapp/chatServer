USE chat_server;

-- FCM 토큰 테이블 (한 사용자가 여러 디바이스를 가질 수 있음)
CREATE TABLE IF NOT EXISTS fcm_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    fcm_token VARCHAR(512) NOT NULL UNIQUE,
    platform VARCHAR(20) DEFAULT 'android',  -- 'android' or 'ios'
    device_id VARCHAR(255),                   -- 디바이스 고유 ID
    device_name VARCHAR(100),                 -- 기기 이름 (예: "Galaxy S24", "iPad Pro")
    app_version VARCHAR(20),                  -- 앱 버전

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_active TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_user_id (user_id),
    INDEX idx_fcm_token (fcm_token),
    INDEX idx_device_id (device_id),

    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 기존 테이블에 컬럼 추가 (마이그레이션용)
-- ALTER TABLE fcm_tokens ADD COLUMN device_name VARCHAR(100) AFTER device_id;
-- ALTER TABLE fcm_tokens ADD COLUMN app_version VARCHAR(20) AFTER device_name;
-- ALTER TABLE fcm_tokens CHANGE COLUMN updated_at last_active TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
-- ALTER TABLE fcm_tokens ADD INDEX idx_device_id (device_id);


-- 테이블 확인
SHOW TABLES;
DESCRIBE fcm_tokens;
