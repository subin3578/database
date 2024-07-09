#2024/07/09
#이름 : 황수빈
#내용 : SQL 연습문제2
GRANT ALL PRIVILEGES ON Bank.* TO 'bank'@'%';
FLUSH PRIVILEGES;
CREATE TABLE bank_customer (
	c_no	VARCHAR(14) PRIMARY KEY,
	c_name	VARCHAR(20) NOT NULL,
	c_dist INT NOT NULL DEFAULT 0,
	c_phone	VARCHAR(20) NOT NULL,
	c_addr VARCHAR(100) DEFAULT NULL);
    
CREATE TABLE bank_account(
	a_no VARCHAR(11) PRIMARY KEY,
	a_item_dist VARCHAR(2) NOT NULL,
	a_item_name	VARCHAR(20) NOT NULL,
	a_c_no VARCHAR(14) NOT NULL,
	a_balance INT NOT NULL default 0,
	a_open_date date NOT NULL);
    
CREATE TABLE bank_transaction(
	t_no	INT PRIMARY KEY AUTO_INCREMENT,
    t_a_no	VARCHAR(11)  NOT NULL,
    t_dist	INT	NOT NULL,
    t_amount	 INT NOT NULL DEFAULT 0,
    t_datetime	DATETIME NOT NULL
);


SELECT * FROM bank_customer;
SELECT * FROM bank_account;
SELECT * FROM bank_transaction;
drop table BANK_ACCOUNT;
INSERT INTO bank_customer (c_no, c_name, c_dist, c_phone, c_addr) VALUES
('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 군포시'),
('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 성북구'),
('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21'),
('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17'),
('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30'),
('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07'),
('101-12-1002', 'S2', '정기저축예금', '830513-2000003', 1020000, '2011-05-13'),
('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 5500000, '2012-10-15'),
('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25'),
('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11'),
('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES
('101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
('101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
('101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
('101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
('101-11-1001', 3, 0, '2022-08-21 04:26:52'),
('101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
('101-11-1001', 1, 450000, '2022-08-21 04:26:52'),
('101-11-2002', 2, 32000, '2022-08-21 04:26:52'),
('101-11-2003', 3, 0, '2022-08-21 04:26:52'),
('101-11-1003', 1, 75000, '2022-08-21 04:26:52');

#실습 2-4
SELECT * FROM bank_account;
#실습 2-5
SELECT * FROM bank_customer;
#실습 2-6
SELECT * FROM bank_transaction;
#실습 2-7
SELECT c_name, c_no FROM bank_customer;
#실습 2-8
SELECT a_item_dist, a_item_name from bank_account;
#실습 2-9
SELECT DISTINCT a_item_dist, a_item_name FROM bank_account;
#실습 2-10
SELECT * FROM bank_account WHERE a_item_name ='자유저축예금' and a_balance>=1000000;
#실습 2-11
SELECT * FROM bank_customer WHERE substr(`c_addr`,1,3)='경기도';
#실습 2-12
SELECT * FROM bank_customer WHERE c_dist = '2';
#실습 2-13
SELECT * FROM bank_transaction WHERE t_dist = '1';
#실습 2-14
SELECT * FROM bank_transaction WHERE t_dist = '2' ORDER BY t_amount DESC;
#실습 2-15
SELECT	SUM(t_amount) AS 입금총합, 
		AVG(t_amount) AS 입금평균
FROM bank_transaction 
WHERE t_dist = '1';

#실습 2-16
SELECT	MAX(t_amount) AS '큰 금액', 
		MIN(t_amount) AS '작은 금액'
FROM bank_transaction 
WHERE t_dist = '2';
#실습 2-17
SELECT * FROM bank_account WHERE a_item_name = '자유저축예금' ORDER BY a_balance DESC;
#실습 2-18
SELECT * FROM bank_account WHERE  a_item_name = '자유저축예금' ORDER BY a_balance DESC LIMIT 1;
#실습 2-19
SELECT * FROM bank_transaction WHERE t_dist = '1' or t_dist = '2'
ORDER BY t_dist, t_amount DESC;

#실습 2-20 ************ CASE WHEN ... THEN ... ELSE NULL END ************** COUNT 절 안에 조건 넣기
SELECT
	COUNT(case WHEN t_dist = '1' THEN 1 ELSE NULL END) AS '입금 건수',
	COUNT(case WHEN t_dist = '2' THEN 1 ELSE NULL END) AS '출금 건수',
	COUNT(case WHEN t_dist = '3' THEN 1 ELSE NULL END) AS '조회 건수'
FROM bank_transaction;

#실습 2-21
SELECT t_dist, 
CASE
	WHEN t_dist = '1' THEN '입금'
    WHEN t_dist = '2' THEN '출금'
    WHEN t_dist = '3' THEN '조회'
END AS'type',
t_a_no,
t_amount
FROM bank_transaction;

#실습 2-22
SELECT t_dist, COUNT(`t_no`) FROM bank_transaction GROUP BY t_dist;
#실습 2-23
SELECT t_a_no, t_dist, SUM(`t_amount`)
FROM bank_transaction
WHERE t_dist = 1
GROUP BY t_a_no;

#2-24 
SELECT
`t_a_no`, `t_dist`,
SUM(`t_amount`) AS `합계`
FROM `bank_transaction`
WHERE `t_dist` = 1
GROUP BY t_a_no HAVING 합계 >= 100000
ORDER BY 합계 DESC;

#2-25
SELECT * 
FROM	bank_account As a
JOIN bank_customer AS c
ON a.a_c_no=c.c_no;

#2-26
SELECT 
a.a_no AS '계좌번호',
a.a_item_name AS '계좌이름',
c.c_no AS '주민번호(사업자번호)',
c.c_name AS '고객명',
a.a_balance AS '현재 잔액'
FROM	bank_account As a
JOIN bank_customer AS c
ON a.a_c_no=c.c_no;

#2-27
SELECT * 
FROM bank_transaction AS t
JOIN bank_account AS a
ON a.a_no=t.t_a_no;

#2-28
SELECT
`t_no` AS `거래번호`,
`t_a_no` AS `계좌번호`,
`a_c_no` AS `고객번호(주민번호)`,
`t_dist` AS `거래구분`,
`t_amount` AS `거래금액`,
`t_datetime` AS `거래일자`
FROM `bank_account` AS a
JOIN `bank_transaction` AS t
ON a.a_no=t.t_a_no;

#2-29
SELECT
`t_no`,
`a_no`,
`c_no`,
`t_dist`,
`a_item_name`,
`c_name`,
`t_amount`,
`t_datetime`
FROM bank_transaction AS t
JOIN bank_account AS a
ON a.a_no=t.t_a_no
JOIN bank_customer AS c
ON a.a_c_no=c.c_no
WHERE t_dist = 1
ORDER BY t_amount DESC;

#2-30
SELECT
`t_no`,
`a_no`,
`c_no`,
`t_dist`,
`a_item_name`,
`c_name`,COUNT(`t_no`) AS `거래건수`
FROM bank_transaction AS t
JOIN bank_account AS a
ON a.a_no=t.t_a_no
JOIN bank_customer AS c
ON a.a_c_no=c.c_no

WHERE t_dist IN(1,2) and c_dist =1
group by a_no
order by t_dist, 거래건수 desc;
