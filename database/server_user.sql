

CREATE USER 'chat_server'@'localhost' IDENTIFIED WITH mysql_native_password BY 'hoje1095';
GRANT ALL PRIVILEGES ON chat_server.* TO 'chat_server'@'localhost';
FLUSH PRIVILEGES;



   USE chat_server;
   -- users 테이블 확인
   SELECT * FROM users;
   -- friends 테이블 확인
   SELECT * FROM friends;
   
   
   SELECT * FROM conversations;
   SELECT * FROM messages;
   SELECT * FROM read_status;
   
	SELECT * FROM `groups`;
	SELECT * FROM `group_members`;
   
   
   TRUNCATE TABLE read_status;
   
   
SET FOREIGN_KEY_CHECKS = 0; -- 검사 끄기
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1; -- 다시 켜기


DELETE FROM friends 
WHERE (user_id = 'user01' AND friend_id = 'dummy001') 
   OR (user_id = 'dummy001' AND friend_id = 'user01');
   