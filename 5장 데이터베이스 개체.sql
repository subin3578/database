#날짜 : 2024/07/05
#이름 : 황수빈
#내용 : 5장 데이터베이스 개체

#실습 5-1
show index from `user1`;
show index from `user2`;
show index from `user3`;




#실습 5-2 index
CREATE INDEX idx_user_uid ON USER1(uid);
ANALYZE TABLE USER1;

SELECT * FROM USER5;

INSERT INTO USER5 (`name`,`gender`,`age`,`addr`) select `name`,`gender`,`age`,`addr` from user5;

select count(*) from USER5;

UPDATE USER5 SET `name`='홍길동' where `seq`=3;
UPDATE USER5 SET `name`='정약용' where `seq`=2000000;

SELECT * FROM USER5 WHERE NAME = '홍길동';
SELECT * FROM USER5 WHERE NAME = '정약용';
SELECT * FROM USER5 WHERE seq = '2000000';

CREATE INDEX idx_user5_name ON USER5(NAME);
ANALYZE TABLE USER5;
# 인덱스를 만든 후 훨씬 빨라짐 !

DROP TABLE USER5;
DELETE FROM USER5 WHERE `SEQ`>4;
CREATE TABLE USER5;
SELECT * FROM USER5;

create table user5 (
`seq` int primary key auto_increment,
`name` varchar(10) not null,
`gender` char (1) check (`gender` in('M', 'F')),
`age` int default 1 check (`age` > 0 and `age` < 100),
`addr` varchar(20)
);
insert into user5 values(NULL,'김유신','M',25,'경남 김해시');
insert into user5 values(NULL,'김춘추','M',25,'경남 경주시');
insert into user5 values(NULL,'장보고','M',25,'전남 완도시');
insert into user5 values(NULL,'강감찬','M','25','서울시 관악구');
insert into user5 values(NULL,'이순신','A',25,'부산시');
insert into user5 values(NULL,'신사임당','F',-1,'강릉시');

#실습 5-4 View
SELECT * FROM USER1;
CREATE VIEW vw_user1 AS (SELECT NAME,HP,AGE FROM USER1);
CREATE VIEW vw_user4_age_under30 AS (SELECT * FROM USER4 WHERE age < 30);
CREATE VIEW vw_member_with_sales AS (
	SELECT
		a.uid AS '직원아이디',
        b.name AS '직원이름',
        b.pos AS '직급',
        c.name AS '부서명',
        a.year AS '매출년도',
        a.month AS '월' ,
        a.sale AS '매출액'
	FROM Sales As a
	JOIN Member AS b ON a.uid=b.uid
    JOIN DEPARTMENT AS c ON b.dep = c.depNo);
    
select * from user4;
#실습 5-5

SELECT * FROM vw_user1;
SELECT * FROM VW_USER4_AGE_UNDER30;
select * from vw_member_with_sales;
# 어떤 데이터의 보안을 위하여 관리 목적으로 한다.

#실습 5-6
DROP VIEW VW_USER1;
DROP VIEW VW_USER4_AGE_UNDER30;
#실습 5-7
DELIMITER $$
	CREATE PROCEDURE proc_test1()
	BEGIN
		select * from MEMBER;
        SELECT * FROM DEPARTMENT;
	END $$
DELIMITER ;

CALL PROC_TEST1();


#실습 5-8
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
	BEGIN
		SELECT * FROM MEMBER WHERE NAME = _userName;
	END $$
DELIMITER ;

CALL proc_test2('김유신');

DELIMITER $$
	CREATE PROCEDURE PROC_TEST4(IN _POS VARCHAR(10), OUT _COUNT INT)
    BEGIN
		SELECT COUNT(*) INTO _COUNT FROM MEMBER WHERE POS = _POS;
	END $$
	DELIMITER ;
    
    CALL PROC_TEST4('대리',@_COUNT);
    SELECT CONCAT('_COUNT : ',@_COUNT);
    
     DELIMITER $$
	CREATE PROCEDURE PROC_TEST4(IN _USE VARCHAR(10), OUT _COUNT INT)
    BEGIN
		SELECT COUNT(*) INTO _COUNT FROM MEMBER WHERE POS = _POS;
	END $$
	DELIMITER ;
    
    CALL PROC_TEST4('대리',@_COUNT);
    SELECT CONCAT('_COUNT : ',@_COUNT);
    
    #실습 5-9 프로시저 프로그래밍
    
   > DELIMITER $$
CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
	BEGIN
		DECLARE userId VARCHAR(10); #변수선언 UID를 넣어주려고 변수생성
		select `uid` into userId from `Member` where `name` = _name;
		select * from `Sales` where `uid`=userId;
	END $$
DELIMITER ;

CALL PROC_TEST5('김유신');

DELIMITER $$
CREATE PROCEDURE proC_test6()
BEGIN
	DECLARE num1 INT;
    DECLARE num2 INT;
    
    SET num1 =1;
    SET num2 =2;
    
IF(NUM1>NUM2) THEN
	SELECT 'NUM1이 NUM2보다 크다.' AS '결과2';
ELSE
    SELECT 'NUM1이 NUM2보다 작다.' AS '결과2';
END IF;
END $$
DELIMITER ;

CALL PROC_TEST6();

DELIMITER $$
	CREATE PROCEDURE PROC_TEST7()
    BEGIN 
		DECLARE SUM INT;
        DECLARE NUM INT;
        
        SET SUM = 0;
        SET NUM = 1;
        
        WHILE(NUM<=10) DO
			SET SUM = SUM + NUM;
            SET NUM = NUM + 1;
		END WHILE;
        
        SELECT sum AS '1부터 10까지의 합계';
	END $$ 

CALL PROC_TEST7();
    
#실습 5-10 커서 활용 프로시저

DELIMITER $$
	CREATE PROCEDURE PROC_TEST8()
    BEGIN
		#변수 선언
		DECLARE total INT DEFAULT 0; #total 변수 선언과 초기화
        DECLARE price INT;
        DECLARE end0fRow BOOLEAN default false; #상태변수
        
        #커서 선언
        DECLARE salesCursor CURSOR FOR
			SELECT SALE FROM SALES;
		
        #커서 반복
        DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET end0fRow = True;
		
        #커서 열기
	OPEN SALESCURSOR;
    
    cursor_loop : LOOP
		FETCH salesCursor INTO price;
		IF end0fRow THEN
			LEAVE CURSOR_LOOP;
		END IF;
        
        SET TOTAL = TOTAL + PRICE;
	END LOOP;
    
    SELECT total AS '전체 합계';
    
    CLOSE SALESCURSOR;
END $$

CALL PROC_TEST8();

#5-11 저장 함수
DELIMITER$$
CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
	BEGIN
		DECLARE total INT;
    
		SELECT SUM(SALE) INTO TOTAL FROM SALEs WHERE UID=_USERID;
    
		RETURN TOTAL;
	END $$
    

DROP FUNCTION FUNC_TEST1;

SELECT func_test1('a101');

show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1; //ON

