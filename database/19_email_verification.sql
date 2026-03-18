-- 19_email_verification.sql
-- 이메일 인증 컬럼 + 인증 토큰 테이블

-- users 테이블에 이메일 인증 컬럼 추가
ALTER TABLE users ADD COLUMN is_email_verified TINYINT(1) DEFAULT 0 AFTER phone;
CREATE INDEX idx_email_verified ON users (is_email_verified);

-- 인증 토큰 테이블 (Java JPA가 사용)
CREATE TABLE IF NOT EXISTS user_verifications (
    user_id VARCHAR(100) PRIMARY KEY,
    verification_token VARCHAR(255) NOT NULL,
    expires_at TIMESTAMP NOT NULL,
    verified_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_verification_token (verification_token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
