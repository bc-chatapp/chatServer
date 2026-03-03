-- 09_payment_transactions.sql
-- 인앱결제 트랜잭션 기록 테이블

CREATE TABLE IF NOT EXISTS payment_transactions (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    user_id         VARCHAR(64) NOT NULL,
    plan_id         INT NOT NULL,
    platform        ENUM('android','ios') NOT NULL,
    product_id      VARCHAR(100) NOT NULL,
    transaction_id  VARCHAR(255) NOT NULL,
    purchase_token  TEXT,
    status          ENUM('pending','verified','failed','refunded') DEFAULT 'pending',
    verified_at     TIMESTAMP NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_pt_user (user_id),
    INDEX idx_pt_txn (transaction_id),
    UNIQUE KEY uq_transaction (platform, transaction_id)
);
