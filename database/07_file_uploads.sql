-- ============================================
-- file_uploads 테이블
-- GCS 파일 업로드 메타데이터
-- ============================================

USE chat_server;

CREATE TABLE IF NOT EXISTS file_uploads (
    file_id             VARCHAR(64) PRIMARY KEY,
    user_id             VARCHAR(64) NOT NULL,
    original_filename   VARCHAR(255) NOT NULL,
    gcs_bucket          VARCHAR(100) NOT NULL,
    gcs_path            VARCHAR(512) NOT NULL,
    file_size           BIGINT NOT NULL,
    mime_type           VARCHAR(100),
    is_image            TINYINT(1) DEFAULT 0,
    thumbnail_gcs_path  VARCHAR(512) NULL,
    upload_status       ENUM('pending', 'uploading', 'completed', 'failed') DEFAULT 'pending',

    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    uploaded_at         TIMESTAMP NULL,
    expires_at          TIMESTAMP NULL,

    INDEX idx_user_id       (user_id),
    INDEX idx_created_at    (created_at),
    INDEX idx_upload_status (upload_status),
    INDEX idx_expires_at    (expires_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
