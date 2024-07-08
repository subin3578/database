# 날짜 : 2024/07/08
# 이름 : 황수빈
# 내용 : SQL 연습문제 

#실습 1-1
CREATE DATABASE `Shop`;
CREATE USER 'shop'@'%' IDENTIFIED BY '1234';

#실습 1-2
CREATE TABLE Customer(
	custid VARCHAR(10) PRIMARY KEY,
    name	VARCHAR(10) NOT NULL,
    hp	VARCHAR(13) UNIQUE KEY,
    addr 	VARCHAR(100),
    rdate 	DATE NOT NULL);

CREATE TABLE Product(
	prodNo INT PRIMARY KEY,
	prodName VARCHAR(10) NOT NULL,
    stock	INT	NOT NULL DEFAULT 0,
    price	INT,
    company	VARCHAR(20));
    
CREATE TABLE `Order`(
	orderNo INT PRIMARY KEY auto_increment,
	orderID VARCHAR(10) NOT NULL,
    orderProduct INT	NOT NULL,
    orderCount	INT NOT NULL DEFAULT 1,
    orderDate	DATETIME NOT NULL);

#실습 1-3
#Customer 정보입력
INSERT INTO Customer VALUE("c101","김유신","010-1234-1001","김해시 봉황동","2022-01-01");
INSERT INTO Customer VALUE("c102","김춘추","010-1234-1002","경주시 보문동","2022-01-02");
INSERT INTO Customer VALUE("c103","장보고","010-1234-1003","완도구 청산면","2022-01-03");
INSERT INTO Customer VALUE("c104","강감찬","010-1234-1004","서울시 마포구","2022-01-04");
INSERT INTO Customer (custId, name, rdate) VALUE ("c105","이성계","2022-01-05");
INSERT INTO Customer VALUE("c106","정철","010-1234-1006","경기도 용인시","2022-01-06");
INSERT INTO Customer (custId, name, rdate) VALUE ("c107","허준","2022-01-07");
INSERT INTO Customer VALUE("c108","이순신","010-1234-1008","서울시 영등포구","2022-01-08");
INSERT INTO Customer VALUE("c109","송상현","010-1234-1009","부산시 동래구","2022-01-09");
INSERT INTO Customer VALUE("c110","정약용","010-1234-1010","경기도 광주시","2022-01-10");

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM `Order`;

#Product 정보입력
INSERT INTO Product VALUE("1","새우깡","5000","1500","농심");
INSERT INTO Product VALUE("2","초코파이","2500","2500","오리온");
INSERT INTO Product VALUE("3","포카칩","3600","1700","오리온");
INSERT INTO Product VALUE("4","양파링","1250","1800","농심");
INSERT INTO Product VALUE("6","마가렛트","3500","3500","롯데");
INSERT INTO Product (prodNo, prodName, stock, company)VALUE("5","죠리퐁","2200","크라운");
INSERT INTO Product VALUE("7","뿌셔뿌셔","1650","1200","오뚜기");


#Order 정보입력
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c102","3","2","2022-07-01 13:15:10");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c101","4","1","2022-07-01 14:16:11");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c108","1","1","2022-07-01 17:23:18");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c109","6","5","2022-07-02 10:46:36");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c102","2","1","2022-07-03 09:15:37");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c101","7","3","2022-07-03 12:35:12");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c110","1","2","2022-07-03 16:55:36");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c104","2","4","2022-07-04 14:23:23");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c102","1","3","2022-07-04 21:54:34");
INSERT INTO `Order` (orderID, orderProduct, orderCount,orderDate) Value ("c107","6","1","2022-07-05 14:21:03");

select * from `order`;
#실습 1-4
SELECT * FROM customer;
#실습 1-5
SELECT custid, name, hp FROM CUSTOMER;
#실습 1-6
SELECT * FROM PRODUCT;
#실습 1-7
SELECT COMPANY FROM PRODUCT ;
#실습 1-8
SELECT DISTINCT COMPANY FROM PRODUCT ;
#실습 1-9
SELECT prodName,price FROM PRODUCT;
#실습 1-10
SELECT prodName,price+500 AS 조정단가 FROM PRODUCT;
#실습 1-11
SELECT prodName, stock, price FROM PRODUCT WHERE COMPANY = "오리온";
#실습 1-12
SELECT orderproduct,ordercount,orderDate FROM `Order` where orderID = "C102";
#실습 1-13
SELECT orderproduct, orderCount, orderDate FROM `Order` WHERE orderID = "C102" AND orderCount>=2;
#실습 1-14
SELECT * FROM Product WHERE 1000<=PRICE AND PRICE<=2000;
#실습 1-15
SELECT custID, name, hp, addr FROM CUSTOMER WHERE name LIKE '김%';  #WHERE 컬럼명 LIKE
#실습 1-16
SELECT custID, name, hp, addr FROM CUSTOMER WHERE name LIKE '__';
#실습 1-17
SELECT * FROM CUSTOMER WHERE hp is null;
#실습 1-18
SELECT * FROM CUSTOMER WHERE addr is not null;
#실습 1-19
SELECT * FROM CUSTOMER ORDER BY rdate DESC;
#실습 1-20
SELECT * FROM `Order` WHERE `orderCount` >= 3 ORDER BY orderCount DESC, orderProduct ASC;
#실습 1-21
SELECT AVG(PRICE) FROM PRODUCT;
#실습 1-22
SELECT SUM(STOCK) AS '재고량 합계' FROM PRODUCT WHERE COMPANY ='농심';
#실습 1-23
SELECT COUNT(custID) AS '고객 수' FROM CUSTOMER;
#실습 1-24
SELECT COUNT(DISTINCT company) AS'제조업체 수'FROM PRODUCT;
#실습 1-25
select * from `order`;
SELECT orderProduct AS '주문 상품번호', SUM(orderCount) As '총 주문수량' FROM `ORDER` GROUP BY orderProduct ORDER BY orderproduct;
#실습 1-26
SELECT company AS 제조업체, COUNT(*) AS 제품수, MAX(PRICE) AS 최고가 FROM PRODUCT GROUP BY COMPANY ORDER BY COMPANY;
#실습 1-27
SELECT company AS 제조업체, COUNT(*) AS 제품수, MAX(PRICE) AS 최고가 FROM PRODUCT  GROUP BY COMPANY HAVING COUNT(*) >= 2;

#실습 1-28 
###################### only_full_group_by 옵션을 비활성화
SELECT orderProduct, orderID, SUM(orderCount) AS '총 주문수량' FROM `Order` group by orderID, orderproduct order by orderproduct, orderId;

#실습 1-29
SELECT a.orderID, b.prodName FROM `Order` AS  a JOIN `Product` AS b ON a.orderProduct = b.ProdNo WHERE ORDERID = 'C102';

#실습 1-30
SELECT `orderid`, `name`, `prodName`, `orderDate` 
FROM `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
WHERE date_format(a.orderDate, '%Y-%m-%d') = "2022-07-03";

# 실습1-30 substring 사용
SELECT `orderid`, `name`, `prodName`, `orderDate` 
FROM `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
WHERE substr(`orderDate`,1,10) = "2022-07-03";