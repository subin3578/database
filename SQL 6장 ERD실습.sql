# 날짜 : 2024/07/15
# 이름 : 황수빈
# 내용 : ERD실습

INSERT INTO PRODUCT VALUE (1,"새우깡",5000,1500,"농심");
INSERT INTO PRODUCT VALUE (2,"초코파이",2500,2500,"오리온");
INSERT INTO PRODUCT VALUE (3,"포카칩",1700,1700,"오리온");
INSERT INTO PRODUCT VALUE (4,"양파링",1800,1800,"농심");
INSERT INTO PRODUCT (PRODNO,PRODNAME,STOCK,COMPANY) VALUE (5,"죠리퐁",2200,"크라운");
SELECT * FROM PRODUCT;

INSERT INTO `ORDER`(ORDERID,ORDERPRODUCT,ORDERCOUNT,ORDERDATE) VALUE ("C102",3,2,NOW());
INSERT INTO `ORDER`(ORDERID,ORDERPRODUCT,ORDERCOUNT,ORDERDATE) VALUE ("C101",4,1,NOW());
INSERT INTO `ORDER`(ORDERID,ORDERPRODUCT,ORDERCOUNT,ORDERDATE) VALUE ("C102",1,1,NOW());
#INSERT INTO `ORDER`(ORDERID,ORDERPRODUCT,ORDERCOUNT,ORDERDATE) VALUE ("C103",6,5,NOW());
INSERT INTO `ORDER`(ORDERID,ORDERPRODUCT,ORDERCOUNT,ORDERDATE) VALUE ("C105",2,1,NOW());
SELECT * FROM `ORDER`;

#6-3
SELECT O.ORDERNO,C.NAME,P.PRODNAME,O.ORDERCOUNT,O.ORDERDATE 
FROM `ORDER` O
JOIN PRODUCT P
ON O.ORDERPRODUCT = P.PRODNO
JOIN CUSTOMER C
ON C.CUSTID = O.ORDERID
ORDER BY ORDERNO ;

SELECT C.NAME, O.ORDERNO, P.PRODNAME,O.ORDERCOUNT,O.ORDERDATE 
FROM `ORDER` O
JOIN PRODUCT P
ON O.ORDERPRODUCT = P.PRODNO
JOIN CUSTOMER C
ON C.CUSTID = O.ORDERID
WHERE C.NAME = '김유신';

#주문한 상품의 총 주문 금액을 조회하시오
SELECT SUM(P.PRICE*O.ORDERCOUNT) AS '총 주문금액'
FROM PRODUCT P
JOIN `ORDER` O
ON P.PRODNO = O.ORDERPRODUCT;



#6-4
#6-5
INSERT INTO bank_customer VALUE('730423-1000001','김유신',1,'010-1234-1001','경남 김해시');
INSERT INTO bank_customer VALUE('730423-1000002','김춘추',1,'010-1234-1002','경남 경주시');
INSERT INTO bank_customer VALUE('730423-1000003','장보고',1,'010-1234-1003','전남 완도군');
INSERT INTO bank_customer VALUE('102-12-51094','(주)정보산업',2,'051-500-1004','부산시 부산진구');
INSERT INTO bank_customer VALUE('930423-1000005','이순신',1,'010-1234-1001','서울 종로구');

INSERT INTO bank_account VALUE ('101-11-1001','S1','자유저축예금','730423-1000001',1550000,'2011-04-11');
INSERT INTO bank_account VALUE ('101-11-1002','S1','자유저축예금','930423-1000005',260000,'2011-05-12');
INSERT INTO bank_account VALUE ('101-11-1003','S1','자유저축예금','730423-1000003',75000,'2011-06-13');
INSERT INTO bank_account VALUE ('101-12-1001','S2','기업전용예금','102-12-51094',15000000,'2011-07-14');
INSERT INTO bank_account VALUE ('101-13-1001','S3','정기저축예금','730423-1000002',1200000,'2011-08-15');

SELECT * FROM BANK_ACCOUNT;
insert into `bank_transaction` set `t_a_no`='101-11-1001', `t_dist`=1, `t_amount`=50000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-12-1001', `t_dist`=2, `t_amount`=1000000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t_dist`=3, `t_amount`=260000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t_dist`=2, `t_amount`=100000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1003', `t_dist`=3, `t_amount`=750000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1001', `t_dist`=1, `t_amount`=150000, `t_datetime`=NOW();
SELECT * FROM BANK_TRANSACTION;

#6-6 
SELECT C_NO,C_NAME,A_NO,A_ITEM_NAME,A_BALANCE
FROM BANK_CUSTOMER C
JOIN BANK_ACCOUNT A
ON C.C_NO = A.A_C_NO;

SELECT C_NAME, T_DIST,T_AMOUNT,T_DATETIME
FROM BANK_CUSTOMER C
JOIN BANK_ACCOUNT A
ON C.C_NO = A.A_C_NO
JOIN BANK_TRANSACTION T
ON T.T_A_NO = A.A_NO
WHERE C_NAME = '이순신';

SELECT C_NO,C_NAME,A_NO,A_BALANCE,A_OPEN_DATE
FROM BANK_CUSTOMER C
JOIN BANK_ACCOUNT A
ON C.C_NO = A.A_C_NO
ORDER BY A_BALANCE LIMIT 1;


#6-8
INSERT INTO Student (stdNo, stdName, stdHp, stdYear, stdAddress) VALUES 
('20201011', '김유신', '010-1234-1001', 3, '경남 김해시'),
('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시'),
('20201213', '장보고', '010-1234-1003', 2, '전남 완도군'),
('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구'),
('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES 
('101', '컴퓨터과학 개론', 2, 40, '본301'),
('102', '프로그래밍 언어', 3, 52, '본302'),
('103', '데이터베이스', 3, 56, '본303'),
('104', '자료구조', 3, 60, '본304'),
('105', '운영체제', 3, 52, '본305');

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO Register (regStdNo, regLecNo, regMidScore, regFinalScore) VALUES 
('20220415', '101', 60, 30),
('20210324', '103', 54, 36),
('20201011', '105', 52, 28),
('20220415', '102', 38, 40),
('20210324', '104', 56, 32),
('20210213', '103', 48, 40);

#6-9 이번 학기에 수강신청 하지 않은 학생의 학번, 이름, 연락처, 학년을 조회하시오.
SELECT STDNO,STDNAME,STDHP,STDYEAR
FROM STUDENT S
LEFT JOIN REGISTER R
ON S.STDNO = R.REGSTDNO
WHERE REGSTDNO IS NULL;

#6-9 중간고사 점수와 기말고사 점수의 총합을 구하고 등급을 구하시오.


select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;

UPDATE `REGISTER`
SET 
    `regTotalScore` = `regMidScore` + `regFinalScore`,
    `regGrade` = CASE
        WHEN (`regMidScore` + `regFinalScore` >= 90) THEN 'A'
        WHEN (`regMidScore` + `regFinalScore` >= 80) THEN 'B'
        WHEN (`regMidScore` + `regFinalScore` >= 70) THEN 'C'
        WHEN (`regMidScore` + `regFinalScore` >= 60) THEN 'D'
        ELSE 'F'
    END;

#6-9 2학년 학생의 학번, 이름, 학년, 수강 강좌명, 중간점수, 김라점수, 총합, 등급을 조회하시오.

SELECT STDNO,STDNAME,STDYEAR,LECNAME,REGMIDSCORE,REGFINALSCORE,REGTOTALSCORE,REGGRADE
FROM STUDENT S
JOIN REGISTER R
ON S.STDNO = R.REGSTDNO
JOIN LECTURE L
ON L.LECNO = R.REGLECNO
WHERE STDYEAR = 2;


