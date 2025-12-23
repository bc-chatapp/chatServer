
USE chat_server;


DROP TABLE IF EXISTS conversations;
DROP TABLE IF EXISTS conversation_participants;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS read_status;


-- 1. 대화방 테이블 (참여자 컬럼 제거)
CREATE TABLE conversations (
    conv_id VARCHAR(100) PRIMARY KEY,
    type VARCHAR(20) NOT NULL, -- 'direct' or 'group'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 대화방 참여자 테이블 (1:1, 그룹 통합 관리)
CREATE TABLE conversation_participants (
    conv_id VARCHAR(100) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role VARCHAR(20) DEFAULT 'member', -- 'admin', 'member'
    PRIMARY KEY (conv_id, user_id),
    FOREIGN KEY (conv_id) REFERENCES conversations(conv_id) ON DELETE CASCADE
    -- FOREIGN KEY (user_id) REFERENCES users(user_id) -- users 테이블 있으면 추가
);

-- 3. 메시지 테이블 (receiver 제거)
CREATE TABLE messages (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    conv_id VARCHAR(100) NOT NULL,
    msg_seq BIGINT NOT NULL,       -- ★ 이 컬럼이 없어서 에러가 난 것임
    sender_id VARCHAR(50) NOT NULL,
    message_data LONGTEXT,         -- Protobuf 직렬화 데이터 (Hex String)
    timestamp BIGINT,              -- 서버 시간 (milliseconds)
    
    -- 조회 속도 향상을 위한 인덱스
    INDEX idx_conv_seq (conv_id, msg_seq)
);

-- 5. 읽음 상태
CREATE TABLE read_status (
    user_id VARCHAR(50) NOT NULL,
    conv_id VARCHAR(100) NOT NULL,
    last_read_seq BIGINT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, conv_id)
);

