-- 15_polls.sql: 투표 기능 테이블

CREATE TABLE polls (
    poll_id VARCHAR(64) PRIMARY KEY,
    conv_id VARCHAR(128) NOT NULL,
    msg_seq BIGINT NOT NULL,
    creator_id VARCHAR(64) NOT NULL,
    question TEXT NOT NULL,
    options_json TEXT NOT NULL,
    is_multi_select TINYINT DEFAULT 0,
    is_anonymous TINYINT DEFAULT 0,
    expires_at BIGINT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'active',
    created_at BIGINT NOT NULL,
    INDEX idx_poll_conv (conv_id)
);

CREATE TABLE poll_votes (
    poll_id VARCHAR(64) NOT NULL,
    user_id VARCHAR(64) NOT NULL,
    option_index INT NOT NULL,
    created_at BIGINT NOT NULL,
    PRIMARY KEY (poll_id, user_id, option_index),
    INDEX idx_pv_poll (poll_id)
);


SELECT * FROM polls;
SELECT * FROM poll_votes;
