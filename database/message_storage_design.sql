
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
    
    -- 메시지 타입 (0: Text, 1: Image, 2: Video, 3: File 등)
    msg_type TINYINT DEFAULT 0,
    
    message TEXT,                   
    -- 첨부파일 정보 (고정 다운로드 URL 저장)
    media_url TEXT,                 -- 원본 이미지/비디오/파일 URL
    thumbnail_url TEXT,             -- 썸네일 URL (이미지/비디오용)
    -- 원본 파일명이나 파일 크기 등 추가 정보가 필요하면 활용
    file_name VARCHAR(255),
    file_size BIGINT DEFAULT 0,

    timestamp BIGINT,               
    INDEX idx_conv_seq (conv_id, msg_seq),
    INDEX idx_msg_type (msg_type) -- 나중에 사진만 모아보기 할 때 매우 빠름
);

-- 5. 읽음 상태
CREATE TABLE read_status (
    user_id VARCHAR(50) NOT NULL,
    conv_id VARCHAR(100) NOT NULL,
    last_read_seq BIGINT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, conv_id)
);

