-- 18_free_storage_limits.sql
-- 구독 제거 → 광고 기반 무료 모델 전환
-- 개인: 100MB, 그룹: 1GB, 최대 파일: 25MB
-- 유료 플랜 비활성화, 파일 영구 보관

-- safe mode 우회
SET SQL_SAFE_UPDATES = 0;

-- 1. 개인 무료 플랜: 1GB → 100MB (plan_id=1)
UPDATE subscription_plans
SET storage_bytes = 104857600,       -- 100MB
    max_file_size = 26214400,        -- 25MB
    features = '["100MB 저장공간","25MB 파일","파일 영구 보관"]'
WHERE plan_id = 1;

-- 2. 그룹 무료 플랜: 1GB 유지 (plan_id=4)
UPDATE subscription_plans
SET storage_bytes = 1073741824,      -- 1GB
    max_file_size = 26214400,        -- 25MB
    features = '["1GB 저장공간","25MB 파일"]'
WHERE plan_id = 4;

-- 3. 유료 플랜 비활성화 (plan_id 2,3,5)
UPDATE subscription_plans SET is_active = 0 WHERE plan_id IN (2, 3, 5);

-- 4. 기존 만료 예정 파일 영구화 (7일 만료 제거)
UPDATE messages
SET file_retention_expires_at = NULL, file_status = 'active'
WHERE file_retention_expires_at IS NOT NULL AND file_status != 'expired';

UPDATE file_uploads
SET file_retention_expires_at = NULL
WHERE file_retention_expires_at IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;
