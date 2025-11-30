-- ============================================
-- messages 테이블의 message_data를 BLOB로 변경
-- ============================================
-- Protobuf 직렬화된 바이너리 데이터를 저장하기 위해 BLOB 타입으로 변경

USE chat_server;

-- message_data 컬럼을 BLOB로 변경
ALTER TABLE messages MODIFY COLUMN message_data BLOB NOT NULL COMMENT '메시지 데이터 (Protobuf 직렬화 바이너리)';

-- 변경 확인
DESCRIBE messages;

