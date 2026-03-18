-- ============================================
-- messages / read_status 테이블
-- 답장(reply), 삭제(soft delete), 수정(edit) 포함
-- ============================================

USE chat_server;


-- ─── messages ───

CREATE TABLE IF NOT EXISTS messages (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    conv_id         VARCHAR(100) NOT NULL,
    msg_seq         BIGINT NOT NULL,
    sender_id       VARCHAR(50) NOT NULL,

    msg_type        TINYINT DEFAULT 0,              -- 0:Text, 1:Image, 2:Video, 3:File, 4:System
    message         TEXT,
    media_url       TEXT,
    thumbnail_url   TEXT,
    file_name       VARCHAR(255),
    file_size       BIGINT DEFAULT 0,

    -- 답장
    reply_to_seq    BIGINT DEFAULT 0,               -- 답장 대상 msg_seq (0이면 답장 아님)

    -- 삭제 / 수정
    is_deleted      TINYINT(1) DEFAULT 0,           -- 1이면 소프트 삭제됨
    is_edited       TINYINT(1) DEFAULT 0,           -- 1이면 수정됨
    edited_at       BIGINT DEFAULT 0,               -- 수정 시각 (Unix ms)

    timestamp       BIGINT,                         -- 서버 수신 시각 (Unix ms)

    INDEX idx_conv_seq  (conv_id, msg_seq),
    INDEX idx_msg_type  (msg_type),
    INDEX idx_timestamp (conv_id, timestamp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ─── read_status ───

CREATE TABLE IF NOT EXISTS read_status (
    user_id         VARCHAR(50) NOT NULL,
    conv_id         VARCHAR(100) NOT NULL,
    last_read_seq   BIGINT DEFAULT 0,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, conv_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


    SELECT * FROM messages;