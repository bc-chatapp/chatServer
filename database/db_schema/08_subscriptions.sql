-- ============================================
-- 구독 시스템 테이블
-- ============================================

USE chat_server;

-- subscription_plans: 구독 플랜 정의
CREATE TABLE IF NOT EXISTS subscription_plans (
    plan_id       INT PRIMARY KEY AUTO_INCREMENT,
    plan_type     ENUM('personal','group') NOT NULL,
    name          VARCHAR(50) NOT NULL,
    grade         INT NOT NULL DEFAULT 0,
    storage_bytes BIGINT NOT NULL,
    max_file_size BIGINT NOT NULL,
    monthly_price DECIMAL(10,2) NOT NULL DEFAULT 0,
    features      JSON,
    is_active     TINYINT(1) DEFAULT 1,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 기본 플랜 삽입
INSERT INTO subscription_plans (plan_type, name, grade, storage_bytes, max_file_size, monthly_price, features) VALUES
('personal', '무료',    0, 1073741824,   26214400,  0,    '["1GB 저장공간","25MB 파일"]'),
('personal', 'Pro',     1, 10737418240,  104857600, 4900, '["10GB 저장공간","100MB 파일","파일 보관 무제한"]'),
('personal', 'Premium', 2, 53687091200,  524288000, 9900, '["50GB 저장공간","500MB 파일","파일 보관 무제한"]'),
('group',    '무료',    0, 1073741824,   26214400,  0,    '["1GB 저장공간"]'),
('group',    'Pro',     1, 10737418240,  104857600, 4900, '["10GB 저장공간"]');

-- subscriptions: 사용자 구독 정보
CREATE TABLE IF NOT EXISTS subscriptions (
    id             INT PRIMARY KEY AUTO_INCREMENT,
    user_id        VARCHAR(64) NOT NULL,
    plan_id        INT NOT NULL,
    started_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at     TIMESTAMP NULL,
    auto_renew     TINYINT(1) DEFAULT 1,
    status         ENUM('active','cancelled','expired') DEFAULT 'active',
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id),
    INDEX idx_sub_user (user_id),
    INDEX idx_sub_expires (expires_at)
);

-- user_assets: 개인 파일 용량 추적 (그룹은 group_assets 이미 존재)
CREATE TABLE IF NOT EXISTS user_assets (
    id        INT PRIMARY KEY AUTO_INCREMENT,
    user_id   VARCHAR(64) NOT NULL,
    msg_seq   BIGINT NOT NULL DEFAULT 0,
    file_size BIGINT NOT NULL,
    file_type VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_ua_user (user_id)
);


