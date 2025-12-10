-- ============================================
-- Chat Server Database Schema
-- ============================================
-- groups 및 group_members 테이블 생성 스크립트
-- ============================================
-- 주의: users 테이블이 먼저 생성되어 있어야 합니다.
-- ============================================

-- 1. 데이터베이스 선택
USE chat_server;

-- 2. groups 테이블 생성 (외래 키 없이 먼저 생성)
-- 주의: 'groups'는 MySQL 예약어이므로 백틱(`)으로 감싸야 합니다.
CREATE TABLE IF NOT EXISTS `groups` (
    group_id VARCHAR(100) PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL,
    group_code VARCHAR(20) UNIQUE NOT NULL,  -- 초대 코드 (랜덤 생성)
    creator_id VARCHAR(100) NOT NULL,          -- 그룹 생성자
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_group_code (group_code),
    INDEX idx_creator_id (creator_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. groups 테이블 외래 키 추가 (이미 존재하면 무시)
-- MySQL 8.0 이상에서는 IGNORE를 사용할 수 없으므로, 직접 확인 후 추가
-- 외래 키가 이미 존재하는지 확인하고 없으면 추가
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM information_schema.table_constraints 
     WHERE constraint_schema = DATABASE() 
     AND table_name = 'groups' 
     AND constraint_name = 'fk_groups_creator_id') = 0,
    'ALTER TABLE `groups` ADD CONSTRAINT fk_groups_creator_id FOREIGN KEY (creator_id) REFERENCES users(user_id) ON DELETE CASCADE',
    'SELECT "Foreign key fk_groups_creator_id already exists" AS message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 4. group_members 테이블 생성 (외래 키 없이 먼저 생성)
CREATE TABLE IF NOT EXISTS `group_members` (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    group_id VARCHAR(100) NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    role ENUM('owner', 'admin', 'member') DEFAULT 'member',  -- 역할
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE KEY unique_group_member (group_id, user_id),
    INDEX idx_group_id (group_id),
    INDEX idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. group_members 테이블 외래 키 추가

-- group_id 외래 키
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM information_schema.table_constraints 
     WHERE constraint_schema = DATABASE() 
     AND table_name = 'group_members' 
     AND constraint_name = 'fk_group_members_group_id') = 0,
    'ALTER TABLE `group_members` ADD CONSTRAINT fk_group_members_group_id FOREIGN KEY (group_id) REFERENCES `groups`(group_id) ON DELETE CASCADE',
    'SELECT "Foreign key fk_group_members_group_id already exists" AS message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- user_id 외래 키
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM information_schema.table_constraints 
     WHERE constraint_schema = DATABASE() 
     AND table_name = 'group_members' 
     AND constraint_name = 'fk_group_members_user_id') = 0,
    'ALTER TABLE `group_members` ADD CONSTRAINT fk_group_members_user_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE',
    'SELECT "Foreign key fk_group_members_user_id already exists" AS message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 6. 테이블 확인
SHOW TABLES;
DESCRIBE `groups`;
DESCRIBE `group_members`;

