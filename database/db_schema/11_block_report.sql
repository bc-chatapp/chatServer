-- ============================================================
-- 11_block_report.sql
-- 차단 목록 + 신고 테이블
-- ============================================================

-- 차단 목록
CREATE TABLE IF NOT EXISTS block_list (
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id     VARCHAR(50) NOT NULL,           -- 차단한 사람
    blocked_id  VARCHAR(50) NOT NULL,           -- 차단당한 사람
    created_at  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_block (user_id, blocked_id),
    INDEX idx_bl_user (user_id),
    INDEX idx_bl_blocked (blocked_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 신고
CREATE TABLE IF NOT EXISTS reports (
    id              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    reporter_id     VARCHAR(50) NOT NULL,       -- 신고한 사람
    reported_id     VARCHAR(50) NOT NULL,       -- 신고당한 사람
    reason          VARCHAR(50) NOT NULL,       -- "spam" | "abuse" | "other"
    detail          TEXT,                       -- 추가 설명
    status          VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending | reviewed | dismissed
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reviewed_at     DATETIME,
    INDEX idx_rpt_reporter (reporter_id),
    INDEX idx_rpt_reported (reported_id),
    INDEX idx_rpt_status   (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
