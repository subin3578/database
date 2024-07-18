#ERD 실습 3


#고객
insert into users values ('user1','김유신','1976-91-21','M','010-1101-1976','kimys@naver.com',0,1,'서울',now());
insert into users (`userId`,`userName`,`userBirth`,`userGender`,`userHp`,userPoint,`userLevel`,`userAddr`,`userRegDate`) values ('user2','계백','1975-06-11','M','010-1102-1976',0,1,'서울',now());
insert into users (`userId`,`userName`,`userBirth`,`userGender`,`userHp`,userPoint,`userLevel`,`userAddr`,`userRegDate`) values ('user3','김춘추','1989-05-30','M','010-1103-1976',0,1,'서울',now());
insert into users values ('user4','이사부','1979-04-13','M','010-2101-1976','leesabu@gmail.com',0,1,'서울',now());
insert into users values ('user5','장보고','1966-09-12','M','010-2104-1976','jangbg@naver.com',0,1,'대전',now());
insert into users values ('user6','선덕여왕','1979-07-28','M','010-3101-1976','gueen@naver.com',0,1,'대전',now());
insert into users values ('user7','강감찬','1984-06-15','F','010-4101-1976','kang@daum.net',0,1,'대구',now());
insert into users values ('user8','신사임당','1965-10-21','M','010-5101-1976','sinsa@gmail.com',0,1,'대구',now());
insert into users values ('user9','이이','1972-11-28','M','010-6101-1976','leelee@nate.com',0,1,'부산',now());
insert into users (`userId`,`userName`,`userBirth`,`userGender`,`userHp`,userPoint,`userLevel`,`userAddr`,`userRegDate`) values ('user10','허난설헌','1992-09-07','M','010-7101-1976',0,1,'광주',now());
#포인트
insert into points values (1,'user1',1000,'회원가입 1000 적립',now());
insert into points values (2,'user1',6000,'상품구매 5% 적립',now());
insert into points values (3,'user3',2835,'상품구매 5% 적립',now());
insert into points values (4,'user7',3610,'상품구매 5% 적립',now());
insert into points values (5,'user5',3000,'이벤트 응모 3000 적립',now());
insert into points values (6,'user2',1000,'회원가입 1000 적립',now());
insert into points values (7,'user2',2000,'이벤트 응모 2000 적립',now());
insert into points values (8,'user2',2615,'상품구매 5% 적립',now());
insert into points values (9,'user3',1500,'이벤트 응모 1500 적립',now());
insert into points values (10,'user6',15840,'상품구매 2% 적립',now());
#판매자 
insert into sellers values(10001,'(주)다팔아','02-201-1976','정우성','서울');
insert into sellers values(10002,'판매의민족','02-102-1975','이정재','서울');
insert into sellers values(10003,'멋남','031-103-1989','원빈','경기');
insert into sellers values(10004,'스타일살아','032-201-1979','이나영','경기');
insert into sellers values(10005,'(주)삼성전자','02-214-1996','장동건','서울');
insert into sellers values(10006,'복실이옷짱','051-301-1979','고소영','부산');
insert into sellers values(10007,'컴퓨존(주)','055-401-1984','유재석','대구');
insert into sellers values(10008,'(주)LG전자','02-511-1965','강호동','서울');
insert into sellers values(10009,'(주)굿바디스포츠','070-6101-1972','조인성','부산');
insert into sellers values(10010,'누리푸드','051-701-1992','강동원','부산');
#카테고리
insert into categories values
(10,'여성의류패션'),
(11,'남성의류패션'),
(12,'식품,생필품'),
(13, '취미,반려견'),
(14,'홈,문구'),
(15,'자동차,공구'),
(16,'스포츠 건강'),
(17,'컴퓨터,가전,디지털'),
(18, '여행'),
(19, '도서');
#상품
insert into products values (100101,11,10003,'반팔티 L~2XL',869,25000,132,20);
insert into products values (100110,10,10004,'트레이닝 통바지',1602,38000,398,15);
insert into products values (110101,10,10003,'신상 여성운동화',160,76000,40,5);
insert into products (PRODNO,CATENO,SELLERNO,PRODNAME,PRODPRICE,PRODSOLD,PRODDISCOUNT) VALUES (120101,12,10010,'암소 1등급 구이셋트 1.2KG',150000,87,15);
insert into products (PRODNO,CATENO,SELLERNO,PRODNAME,PRODPRICE,PRODSOLD,PRODDISCOUNT) VALUES (120103,12,10010,'바로구이 부채살 250G',21000,61,10);
insert into products valueS (130101,13,10006,'[ANF] 식스프리 강아지 사료',58,56000,142,0);
insert into products valueS (130112,13,10006,'중대형 사계절 강아지옷',120,15000,80,0);
insert into products (PRODNO,CATENO,SELLERNO,PRODNAME,PRODPRICE,PRODSOLD,PRODDISCOUNT) VALUES (141001,14,10001,'라떼 2인 소파/방수 패브릭',320000,42,0);
insert into products valueS (170115,17,10007,'지포스 3080 그래픽카드',28,900000,12,12);
insert into products value (160103,16,10009,'치닝디핑 33BR 철봉',32,120000,28,0);
#주문

insert into Orders values(22010210001, 'user2', 52300, '서울시 마포구 121', 1, '2022-01-10 10:50:12');
insert into Orders values(22010210002, 'user3', 56700, '서울시 강남구 21-1', 1, '2022-01-10 10:50:12');
insert into Orders values(22010210010, 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-01-10 10:50:12');
insert into Orders values(22010310001, 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-01-10 10:50:12');
insert into Orders values(22010310100, 'user1', 120000, '경기도 수원시 120번지', 0, '2022-01-10 10:50:12');
insert into Orders values(22010410101, 'user6', 792000, '부산시 남구 21-1', 2, '2022-01-10 10:50:12');
insert into Orders values(22010510021, 'user7', 92000, '부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12');
insert into Orders values(22010510027, 'user8', 112000, '대구시 팔달로 19', 3, '2022-01-10 10:50:12');
insert into Orders values(22010510031, 'user10', 792000, '대전시 한발로 24-1', 2, '2022-01-10 10:50:12');
insert into Orders values(22010710110, 'user9', 94500, '광주시 충열로 11', 1, '2022-01-10 10:50:12');
#주문 상품
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010210001',100110,38000,15,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010210001',100101,25000,20,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010210002',120103,21000,10,3);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010310001',130112,15000,0,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010310001',130101,56000,0,2);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010210010',110101,76000,5,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010310100',160103,120000,0,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010410101',170115,900000,12,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010510021',110101,76000,5,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010510027',130101,56000,0,2);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010510021',110101,25000,20,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010510031',170115,900000,12,1);
insert into orderitems (ORDERNO, PRODNO, ITEMPRICE,ITEMDISCOUNT,ITEMCOUNT)values ('22010710110',120103,21000,10,5);
#카트
INSERT INTO CARTS (USERID,PRODNO,CARTPRODCOUNT,CARTPRODDATE) VALUES 
('USER1', 100101,1,NOW()),
('USER1', 100110,2,NOW()),
('USER3', 120103,1,NOW()),
('USER4', 130112,1,NOW()),
('USER5', 130101,1,NOW()),
('USER2', 110101,3,NOW()),
('USER2', 160103,1,NOW()),
('USER2', 170115,1,NOW()),
('USER3', 110101,1,NOW()),
('USER6', 130101,1,NOW());


#문제 1 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. (단 상품수량 2건이상만 조회 할 것)
SELECT U.USERNAME,P.PRODNAME, C.CARTPRODCOUNT
FROM CARTS AS C
JOIN USERS AS U ON C.USERID = U.USERID
JOIN PRODUCTS P ON P.PRODNO = C.PRODNO
WHERE CARTPRODCOUNT >= 2;

#문제 2 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오.
SELECT PRODNO,CATENAME,PRODNAME,PRODPRICE,SELLERBIZNAME,SELLERPHONE
FROM PRODUCTS P
JOIN CATEGORIES C
ON P.CATENO=C.CATENO 
JOIN SELLERS S
ON S.SELLERNO = P.SELLERNO;

#문제3 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오.
SELECT U.USERID,USERNAME,USERHP,IF( SUM(POINT) IS NULL, 0, SUM(POINT)) AS '적립포인트 총합'
FROM USERS AS U
LEFT JOIN POINTS AS P
ON P.USERID = U.USERID
GROUP BY U.USERID;

#문제4 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오.
# 단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될 것
SELECT ORDERNO, U.USERID, USERNAME,ORDERTOTALPRICE,ORDERDATE
FROM USERS U
JOIN ORDERS O
ON O.USERID = U.USERID
WHERE ORDERTOTALPRICE>=100000
ORDER BY ORDERTOTALPRICE DESC, USERNAME;

#문제 5 모든 주문의 주문번호 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 
#주문번호는 중복없이 상품명은 구분자 ,로 나열할 것
SELECT OI.ORDERNO, U.USERID, USERNAME, GROUP_CONCAT(PRODNAME SEPARATOR','), ORDERDATE
FROM USERS U
JOIN ORDERS O
ON O.USERID = U.USERID
JOIN ORDERITEMS OI
ON OI.ORDERNO = O.ORDERNO
JOIN PRODUCTS P 
ON P.PRODNO = OI.PRODNO
GROUP BY OI.ORDERNO;


#문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오.
SELECT PRODNO, PRODNAME, PRODPRICE,PRODDISCOUNT, (PRODPRICE * ((100-PRODDISCOUNT)/100)) AS '할인된 가격' FROM PRODUCTS;

#문제7 고소영이 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자 이름을 조회하시오.
SELECT PRODNO, PRODNAME, PRODPRICE, PRODSTOCK, SELLERBIZNAME
FROM PRODUCTS P
JOIN ORDERS O 
ON P.PRODNO = O.PRODNO
JOIN SELLERS S
ON P.SELLERNO = S.SELLERNO;