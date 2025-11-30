-- 파일 업로드 메타데이터 테이블
USE chat_server;

CREATE TABLE IF NOT EXISTS file_uploads (
    file_id VARCHAR(64) PRIMARY KEY COMMENT '파일 고유 ID',
    user_id VARCHAR(64) NOT NULL COMMENT '업로드한 사용자 ID',
    original_filename VARCHAR(255) NOT NULL COMMENT '원본 파일명',
    gcs_bucket VARCHAR(100) NOT NULL COMMENT 'GCS 버킷 이름',
    gcs_path VARCHAR(512) NOT NULL COMMENT 'GCS 경로 (images/{fileId}.jpg)',
    file_size BIGINT NOT NULL COMMENT '파일 크기 (bytes)',
    mime_type VARCHAR(100) COMMENT 'MIME 타입',
    is_image TINYINT(1) DEFAULT 0 COMMENT '이미지 여부',
    thumbnail_gcs_path VARCHAR(512) NULL COMMENT '썸네일 GCS 경로',
    upload_status ENUM('pending', 'uploading', 'completed', 'failed') DEFAULT 'pending' COMMENT '업로드 상태',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성 시간',
    uploaded_at TIMESTAMP NULL COMMENT '업로드 완료 시간',
    expires_at TIMESTAMP NULL COMMENT '파일 만료 시간',
    INDEX idx_user_id (user_id),
    INDEX idx_created_at (created_at),
    INDEX idx_upload_status (upload_status),
    INDEX idx_expires_at (expires_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='파일 업로드 메타데이터';

