-- ============================================
-- 파일 보관 만료 정책 (File Retention Expiration)
-- 개인 구독 정책:
--   무료: 업로드 후 7일
--   구독 중: NULL (영구 보관)
--   구독 해지 후: 해지 시각 + 14일 (유예기간)
-- ============================================

USE chat_server;

-- ─── messages 테이블: GCS 경로 + 파일 만료 컬럼 추가 ───
ALTER TABLE messages
    ADD COLUMN gcs_path              VARCHAR(512) NULL         AFTER file_name,
    ADD COLUMN file_retention_expires_at BIGINT NULL           AFTER gcs_path,
    ADD COLUMN file_status           VARCHAR(20) NOT NULL DEFAULT 'active' AFTER file_retention_expires_at;

-- 파일 만료 조회용 인덱스 (MySQL은 Partial Index 미지원 — WHERE 절 제거)
CREATE INDEX idx_msg_file_expires ON messages (file_retention_expires_at);

-- ─── file_uploads 테이블: 파일 보관 만료 컬럼 추가 ───
-- (기존 expires_at 은 Signed URL 만료 시간; 새 컬럼은 실제 GCS 파일 삭제 시각)
ALTER TABLE file_uploads
    ADD COLUMN file_retention_expires_at BIGINT NULL AFTER expires_at;

-- 만료 배치 잡용 인덱스
CREATE INDEX idx_fu_retention ON file_uploads (file_retention_expires_at);


SELECT * FROM messages;
