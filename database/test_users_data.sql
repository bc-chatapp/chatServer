-- ============================================
-- Test Data for users table
-- ============================================
-- 테스트용 사용자 데이터 (선택사항)
-- ============================================

USE chat_server;

-- 테스트 사용자 추가
-- 주의: 실제 운영 환경에서는 password_hash를 bcrypt 등으로 해시해야 합니다
INSERT INTO users (user_id, password_hash, name, status_message) 
VALUES 
    ('user001', 'hashed_password_here', '테스트 사용자1', '안녕하세요!'),
    ('user002', 'hashed_password_here', '테스트 사용자2', '반갑습니다!')
ON DUPLICATE KEY UPDATE 
    name = VALUES(name),
    status_message = VALUES(status_message);

-- 확인
SELECT * FROM users;

