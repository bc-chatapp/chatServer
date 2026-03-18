-- 초대 코드 만료 기능
-- groups 테이블에 invite_code_expires_at 컬럼 추가

ALTER TABLE `groups` ADD COLUMN invite_code_expires_at BIGINT DEFAULT NULL;

-- 인덱스 추가 (만료 시간 조회용)
CREATE INDEX idx_groups_invite_expires ON `groups` (invite_code_expires_at);
