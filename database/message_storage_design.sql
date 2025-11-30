-- ============================================
-- 메시지 저장 정책 설계
-- ============================================
-- 실행 순서: 이 파일을 순서대로 실행하세요
-- ============================================

USE chat_server;

-- 1. 대화방 테이블 (conversations)
-- 대화방 식별자와 참여자 정보 저장
CREATE TABLE IF NOT EXISTS conversations (
    conv_id VARCHAR(255) PRIMARY KEY COMMENT '대화방 ID (예: direct:user01_dummy001 또는 group:group001)',
    conv_type ENUM('direct', 'group') NOT NULL COMMENT '대화방 타입',
    participant1 VARCHAR(255) COMMENT '1:1 채팅의 경우 첫 번째 참여자',
    participant2 VARCHAR(255) COMMENT '1:1 채팅의 경우 두 번째 참여자',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_participant1 (participant1),
    INDEX idx_participant2 (participant2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. 메시지 테이블 (messages)
-- 모든 메시지를 순차 번호와 함께 저장
CREATE TABLE IF NOT EXISTS messages (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    conv_id VARCHAR(255) NOT NULL COMMENT '대화방 ID',
    msg_seq BIGINT NOT NULL COMMENT '대화방 내 메시지 순차 번호 (1, 2, 3...)',
    sender_id VARCHAR(255) NOT NULL COMMENT '보낸 사람 ID',
    receiver_id VARCHAR(255) NOT NULL COMMENT '받는 사람 ID (1:1 채팅의 경우)',
    message_data TEXT NOT NULL COMMENT '메시지 데이터 (JSON 또는 Protobuf 직렬화)',
    client_msg_id BIGINT COMMENT '클라이언트 메시지 ID',
    server_msg_id BIGINT COMMENT '서버 메시지 ID',
    timestamp BIGINT NOT NULL COMMENT '메시지 타임스탬프 (밀리초)',
    is_delivered TINYINT(1) DEFAULT 0 COMMENT '전송 완료 여부 (0: 미전송, 1: 전송완료)',
    delivered_at TIMESTAMP NULL COMMENT '전송 완료 시간',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_conv_seq (conv_id, msg_seq),
    INDEX idx_receiver_delivered (receiver_id, is_delivered),
    INDEX idx_timestamp (timestamp),
    INDEX idx_conv_id (conv_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. 읽음 상태 테이블 (read_status)
-- 각 사용자가 각 대화방에서 몇 번까지 읽었는지 저장
CREATE TABLE IF NOT EXISTS read_status (
    user_id VARCHAR(255) NOT NULL,
    conv_id VARCHAR(255) NOT NULL,
    last_read_seq BIGINT DEFAULT 0 COMMENT '마지막으로 읽은 메시지 번호',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, conv_id),
    INDEX idx_conv_id (conv_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. 친구 테이블에 대화방 ID 추가 (기존 테이블 수정)
-- 주의: friends 테이블이 이미 존재하는 경우에만 실행하세요
-- ALTER TABLE friends ADD COLUMN conv_id VARCHAR(255) NULL COMMENT '대화방 ID';
-- ALTER TABLE friends ADD INDEX idx_conv_id (conv_id);

-- 친구 수락 시 대화방 ID 자동 생성 (선택사항)
-- UPDATE friends 
-- SET conv_id = CONCAT('direct:', 
--     LEAST(user_id, friend_id), '_', 
--     GREATEST(user_id, friend_id))
-- WHERE status = 'accepted' AND conv_id IS NULL;

-- ============================================
-- 대화방 ID 생성 규칙
-- ============================================
-- 1:1 채팅: 알파벳 순서로 정렬하여 "direct:user01_dummy001" 형식
-- 그룹 채팅: "group:group001" 형식

-- ============================================
-- 메시지 처리 플로우
-- ============================================
-- 1. 메시지 수신 시:
--    - conversations 테이블에 대화방이 없으면 생성
--    - messages 테이블에 저장 (msg_seq는 AUTO_INCREMENT 또는 별도 카운터)
--    - is_delivered = FALSE
--
-- 2. 수신자가 온라인인 경우:
--    - S_Chat 전송
--    - is_delivered = TRUE, delivered_at = NOW()
--    - read_status 테이블 업데이트 (last_read_seq)
--    - 메시지를 txt 파일로 저장 (선택사항)
--    - messages 테이블에서 삭제 (또는 보관)
--
-- 3. 수신자가 오프라인인 경우:
--    - messages 테이블에 그대로 보관
--    - 로그인 시 read_status의 last_read_seq 이후 메시지 푸시
--    - 푸시 후 is_delivered = TRUE로 업데이트
--    - 메시지를 txt 파일로 저장
--    - messages 테이블에서 삭제 (또는 보관)

