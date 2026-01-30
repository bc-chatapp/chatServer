USE chat_server;

-- FCM 토큰 테이블 (한 사용자가 여러 디바이스를 가질 수 있음)
CREATE TABLE IF NOT EXISTS fcm_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    fcm_token VARCHAR(512) NOT NULL UNIQUE,
    platform VARCHAR(20) DEFAULT 'android',  -- 'android' or 'ios'
    device_id VARCHAR(255),                   -- 디바이스 고유 ID (선택)

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_user_id (user_id),
    INDEX idx_fcm_token (fcm_token),

    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 테이블 확인
SHOW TABLES;
DESCRIBE fcm_tokens;
