

USE chat_server;


CREATE TABLE `groups` (
    `group_id` VARCHAR(100) NOT NULL,
    `group_name` VARCHAR(100) NOT NULL,
    `group_code` VARCHAR(20) NOT NULL,
    `creator_id` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `group_image_url` VARCHAR(255) DEFAULT '', 
    `storage_limit` BIGINT DEFAULT 1073741824, -- 기본 1GB
    `storage_usage` BIGINT DEFAULT 0,
    `member_count` INT DEFAULT 0,              -- 멤버 수 캐싱
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`group_id`),
    UNIQUE KEY `uk_group_code` (`group_code`),
    INDEX `idx_creator` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `group_members` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `group_id` VARCHAR(100) NOT NULL,
    `user_id` VARCHAR(100) NOT NULL,
    `role` VARCHAR(20) DEFAULT 'member', -- owner, admin, member
    `joined_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_group_user` (`group_id`, `user_id`),
    CONSTRAINT `fk_group_members_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DELIMITER $$
-- (1) 멤버가 추가되면 +1
CREATE TRIGGER `trg_group_member_add` 
AFTER INSERT ON `group_members`
FOR EACH ROW 
BEGIN
    UPDATE `groups` 
    SET `member_count` = `member_count` + 1
    WHERE `group_id` = NEW.group_id;
END$$

-- (2) 멤버가 삭제되면 -1
CREATE TRIGGER `trg_group_member_remove` 
AFTER DELETE ON `group_members`
FOR EACH ROW 
BEGIN
    UPDATE `groups` 
    SET `member_count` = `member_count` - 1
    WHERE `group_id` = OLD.group_id;
END$$
DELIMITER ;




SHOW TABLES;
DESCRIBE `groups`;
DESCRIBE `group_members`;

