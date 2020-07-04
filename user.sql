-- JSP 게시판 유저 테이블 생성
-- 1. database 생성
CREATE DATABASE BBS;

-- 2. USER 테이블 생성
CREATE TABLE USER (
	userID VARCHAR(20),
	userPassword VARCHAR(20),
	userName VARCHAR(20),
	userGender VARCHAR(20),
	userEmail VARCHAR(50),
        PRIMARY KEY(userID));

-- 3. table 확인
SHOW TABLES;

-- 4. DESC
DESC USER;

-- 5. ERROR 1366 (HY000): Incorrect string value: '\xED\x95\x9C\xEC\x9E\xAC...' for column 'userName' at row 1 다음과 같은 인코딩 에러가 발생 = > UTF-8로 수정해준다.
ALTER DATABASE dbname DEFAULT CHARACTER SET utf8;

ALTER TABLE tablename CONVERT TO CHARACTER SET utf8;
