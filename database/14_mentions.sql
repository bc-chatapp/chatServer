-- 14_mentions.sql
-- @멘션 기능: messages 테이블에 mentioned_user_ids 컬럼 추가
-- JSON 배열 형식: '["userId1","userId2"]' 또는 NULL

ALTER TABLE messages ADD COLUMN mentioned_user_ids TEXT DEFAULT NULL;
