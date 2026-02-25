-- 공지 테이블 (conv_id 당 1개)
CREATE TABLE IF NOT EXISTS announcements (
    conv_id      VARCHAR(255) PRIMARY KEY,
    msg_seq      BIGINT       NOT NULL,
    text         TEXT         NOT NULL,
    sender_name  VARCHAR(100) DEFAULT '',
    setter_id    VARCHAR(100) DEFAULT '',
    set_at       BIGINT       DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
