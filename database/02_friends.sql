-- ============================================
-- friends 테이블
-- ============================================

USE chat_server;

CREATE TABLE IF NOT EXISTS friends (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id     VARCHAR(100) NOT NULL,
    friend_id   VARCHAR(100) NOT NULL,
    status      ENUM('pending', 'accepted', 'blocked') DEFAULT 'pending',
    is_read     TINYINT(1) DEFAULT 0,

    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    UNIQUE KEY unique_friendship (user_id, friend_id),
    INDEX idx_user_id   (user_id),
    INDEX idx_friend_id (friend_id),
    INDEX idx_status    (status),

    FOREIGN KEY (user_id)   REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (friend_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
