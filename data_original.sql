SHOW DATABASES;
-- DROP DATABASE memberdata; 刪除資料庫，要非常非常謹慎
CREATE DATABASE website;
USE website;
SHOW TABLES;
CREATE TABLE member(
	id bigint PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    follower_count int unsigned NOT NULL DEFAULT 0,
    time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM member;
DROP TABLE member;
INSERT INTO member(name, username, password) VALUES('Shino', 'test', 'test');
INSERT INTO member(name, username, password, follower_count) VALUES('Wen', '北投文', 'test', 100);
INSERT INTO member(name, username, password, follower_count) VALUES('Abby', '顏超越', 'test', 1000);
INSERT INTO member(name, username, password) VALUES('Eddie', '欸迪', '1028');
INSERT INTO member(name, username, password) VALUES('Ian', 'test', 'haha');

SELECT * FROM member ORDER BY time DESC limit 1, 3;
SELECT * FROM member WHERE username='test';
SELECT * FROM member WHERE username='test' and password='test';

SELECT count(id) as 總共有幾筆資料, sum(follower_count) as 欄位的總和, avg(follower_count) as 欄位的平均數 FROM member;

SET SQL_SAFE_UPDATES=0;
UPDATE member SET name='test' WHERE username='test2';

-- ------------------------------------------------

SELECT * FROM message;
DROP TABLE message; 

CREATE TABLE message(
	id bigint PRIMARY KEY AUTO_INCREMENT,
    member_id bigint NOT NULL,
    content varchar(255) NOT NULL,
    like_count int unsigned NOT NULL DEFAULT 0,
    time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
	FOREIGN KEY(member_id)REFERENCES member(id)
    );
-- ALTER TABLE message ADD 

INSERT INTO message(member_id, content, like_count) VALUES(1, '哈囉哈囉', 500);
INSERT INTO message(member_id, content, like_count) VALUES(2, '你好我是花木蘭', 20);
INSERT INTO message(member_id, content, like_count) VALUES(3, '一直畫一直爽', 20);
INSERT INTO message(member_id, content, like_count) VALUES(4, 'e生e世', 769);
INSERT INTO message(member_id, content, like_count) VALUES(5, '馬先生', 231);

SELECT * FROM member INNER JOIN message ON member.id = message.member_id;

SELECT member.name, message.content FROM member INNER JOIN message ON member.id = message.member_id;

SELECT member.name, message.content FROM member INNER JOIN message ON member.id = message.member_id and member.username='test';

SELECT avg(like_count) as username是test的所有留言平均按讚數 FROM member INNER JOIN message ON member.id = message.member_id and member.username='test';