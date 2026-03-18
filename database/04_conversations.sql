-- ============================================
-- conversations / conversation_participants 테이블
-- 1:1 및 그룹 채팅 대화방 관리
-- ============================================

USE chat_server;


-- ─── conversations ───

CREATE TABLE IF NOT EXISTS conversations (
    conv_id     VARCHAR(100) PRIMARY KEY,
    type        VARCHAR(20) NOT NULL,               -- 'direct' or 'group'
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ─── conversation_participants ───

CREATE TABLE IF NOT EXISTS conversation_participants (
    conv_id     VARCHAR(100) NOT NULL,
    user_id     VARCHAR(50) NOT NULL,
    joined_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role        VARCHAR(20) DEFAULT 'member',

    PRIMARY KEY (conv_id, user_id),
    FOREIGN KEY (conv_id) REFERENCES conversations(conv_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
