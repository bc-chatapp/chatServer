-- messages 테이블: 답장/삭제/수정 기능 컬럼 추가
-- 실행 전 백업 권장

ALTER TABLE messages ADD COLUMN reply_to_seq BIGINT DEFAULT 0 AFTER file_size;
ALTER TABLE messages ADD COLUMN is_deleted TINYINT(1) DEFAULT 0 AFTER reply_to_seq;
ALTER TABLE messages ADD COLUMN is_edited TINYINT(1) DEFAULT 0 AFTER is_deleted;
ALTER TABLE messages ADD COLUMN edited_at BIGINT DEFAULT 0 AFTER is_edited;
