-- ============================================
-- groups / group_members / group_assets 테이블
-- + member_count, storage_usage 트리거
-- ============================================

USE chat_server;


-- ─── groups ───

CREATE TABLE IF NOT EXISTS `groups` (
    group_id            VARCHAR(100) PRIMARY KEY,
    group_name          VARCHAR(100) NOT NULL,
    group_code          VARCHAR(20) NOT NULL UNIQUE,
    creator_id          VARCHAR(100) NOT NULL,
    description         TEXT,
    group_image_url     VARCHAR(255) DEFAULT '',
    group_thumbnail_url VARCHAR(255) DEFAULT '',

    -- 공유 스토리지 (기본 10GB)
    storage_capacity_bytes BIGINT DEFAULT 10737418240,
    storage_usage_bytes    BIGINT DEFAULT 0,

    member_count        INT DEFAULT 0,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_creator (creator_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ─── group_members ───

CREATE TABLE IF NOT EXISTS group_members (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    group_id    VARCHAR(100) NOT NULL,
    user_id     VARCHAR(100) NOT NULL,
    role        VARCHAR(20) DEFAULT 'member',       -- owner / admin / member
    joined_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE KEY uk_group_user (group_id, user_id),
    CONSTRAINT fk_gm_group FOREIGN KEY (group_id) REFERENCES `groups`(group_id) ON DELETE CASCADE,
    CONSTRAINT fk_gm_user  FOREIGN KEY (user_id)  REFERENCES users(user_id)     ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ─── group_assets (파일 용량 추적) ───

CREATE TABLE IF NOT EXISTS group_assets (
    asset_id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    group_id    VARCHAR(100) NOT NULL,
    user_id     VARCHAR(100) NOT NULL,
    msg_seq     BIGINT NOT NULL,
    file_size   BIGINT NOT NULL,
    file_type   VARCHAR(20),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_group_asset (group_id),
    CONSTRAINT fk_assets_group FOREIGN KEY (group_id) REFERENCES `groups`(group_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ─── 트리거: member_count 자동 관리 ───

DELIMITER $$

CREATE TRIGGER trg_group_member_add
AFTER INSERT ON group_members
FOR EACH ROW
BEGIN
    UPDATE `groups` SET member_count = member_count + 1 WHERE group_id = NEW.group_id;
END$$

CREATE TRIGGER trg_group_member_remove
AFTER DELETE ON group_members
FOR EACH ROW
BEGIN
    UPDATE `groups` SET member_count = member_count - 1 WHERE group_id = OLD.group_id;
END$$


-- ─── 트리거: storage_usage 자동 관리 ───

CREATE TRIGGER trg_group_storage_add
AFTER INSERT ON group_assets
FOR EACH ROW
BEGIN
    UPDATE `groups` SET storage_usage_bytes = storage_usage_bytes + NEW.file_size WHERE group_id = NEW.group_id;
END$$

CREATE TRIGGER trg_group_storage_remove
AFTER DELETE ON group_assets
FOR EACH ROW
BEGIN
    UPDATE `groups` SET storage_usage_bytes = storage_usage_bytes - OLD.file_size WHERE group_id = OLD.group_id;
END$$

DELIMITER ;
