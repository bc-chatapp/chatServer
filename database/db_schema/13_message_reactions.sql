-- 이모지 반응 테이블
CREATE TABLE IF NOT EXISTS message_reactions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    conv_id VARCHAR(255) NOT NULL,
    msg_seq BIGINT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    emoji VARCHAR(10) NOT NULL,
    created_at BIGINT NOT NULL,
    UNIQUE KEY uq_reaction (conv_id, msg_seq, user_id, emoji)
);
CREATE INDEX idx_mr_conv_seq ON message_reactions (conv_id, msg_seq);


    SELECT * FROM message_reactions;