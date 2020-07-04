-- board 테이블 생성
CREATE TABLE board (
	bbsID INT,
	bbsTitle VARCHAR(50),
	userID VARCHAR(20),
	bbsDate DATETIME,
	bbsContent VARCHAR(2048),
	bbsAvailable INT,
	PRIMARY KEY(bbsID));
