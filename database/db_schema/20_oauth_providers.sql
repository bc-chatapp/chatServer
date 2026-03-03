-- 20_oauth_providers.sql
-- 소셜 로그인(Google/Apple) 지원을 위한 OAuth 컬럼 추가

ALTER TABLE users ADD COLUMN oauth_provider VARCHAR(20) DEFAULT NULL AFTER is_email_verified;
ALTER TABLE users ADD COLUMN oauth_provider_id VARCHAR(255) DEFAULT NULL AFTER oauth_provider;

CREATE INDEX idx_oauth_provider ON users (oauth_provider, oauth_provider_id);

-- 소셜 로그인 유저는 비밀번호 없음
ALTER TABLE users MODIFY COLUMN password_hash VARCHAR(255) NULL;
