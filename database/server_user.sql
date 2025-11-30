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
   
   
   TRUNCATE TABLE read_status;
   

   