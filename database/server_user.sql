

CREATE USER 'chat_server'@'localhost' IDENTIFIED WITH mysql_native_password BY 'hoje1095';
GRANT ALL PRIVILEGES ON chat_server.* TO 'chat_server'@'localhost';
FLUSH PRIVILEGES;



   USE chat_server;
   -- users 테이블 확인
   SELECT * FROM users;
   -- friends 테이블 확인
   SELECT * FROM friends;
   
   SELECT * FROM conversations;
   SELECT * FROM conversation_participants;
   SELECT * FROM messages;
   SELECT * FROM read_status;
   SELECT * FROM fcm_tokens;
   
	SELECT * FROM `groups`;
	SELECT * FROM `group_members`;
	SELECT * FROM `group_assets`;
    
    SELECT * FROM block_list;
    
   
INSERT INTO group_members (group_id, user_id, role, joined_at)
VALUES ('1db53609e9b56272e11487c83a13d879', 'dummy001', 'member', now());
   
   
   
SET FOREIGN_KEY_CHECKS = 0; -- 검사 끄기
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1; -- 다시 켜기


DELETE FROM friends 
WHERE (user_id = 'user01' AND friend_id = 'dummy001') 
   OR (user_id = 'dummy001' AND friend_id = 'user01');
   
   



