#날짜:24/07/01
#이름:김소진
#내용: 데이터베이스 개요와 mysql 설치

#실습 2-1 테이블 생성, 제거
use StudyDB;

create table `User1` (
`uid` varchar(10),
`name` varchar(10),
`hp` char(13),
`age` int
);

select*from user1;
drop table user1;
#실습 2-2 데이터 입력
insert into `user1` (`uid`,`name`,`age`) values('A101','홍두깨', 33);
insert into `user1` (`uid`,`name`,`age`) values('A102','김소진', 32);
insert into `user1` (`uid`,`name`,`age`) values('A103','이순신', 31);
insert into `user1` (`uid`,`name`,`age`) values('A104','김자바', 35);
insert into `user1` (`uid`,`name`,`age`) values('A105','김두리', 36);


#실습 2-3 데이터 조회
select*from `User1`;
select*from `user1` where `uid`='A101';
select*from user1 where age < 30;
select*from user1 where age >=30;
select `uid`, `name`, `age` from user1;

#실습 2-4 데이터 수정
select*from `User1`;
update user1 set `hp`='010-1234-4444' where `uid`='A104';
update user1 set `hp`='010-1234-5555' where `uid`='A105';

update user1 set `age`=51 where `uid`='A105';
update user1 set `hp`='010-1234-1001', `age`=27 where `uid`='A101';

#실습 2-5 데이터 삭제
select*from `User1`;
delete from user1 where `uid`='A101';
delete from user1 where `uid`='A102' and `age`=25;
delete from user1 where `age` >= 30;

#실습 2-6 테이블 컬럼 수정
select*from user1;
alter table `user1` add `gender` tinyint;
alter table `user1` add `birth` char(10) after `name`;
alter table user1 modify `gender` char(1);
alter table user1 modify `age` tinyint;
alter table user1 drop `gender`;

#실습 2-7 테이블 복사
create table user1Copy like user1;
select*from user1Copy;
insert into user1Copy select*from user1;

#실습 2-8 연습문제
create table `TblUser` (
`user_id` varchar(20),
`user_name` varchar(20),
`user_hp` char(20),
`user_age` int,
`user_addr` varchar(20)
);
create table `TblProduct` (
`prod_no` varchar(20),
`prod_name` varchar(20),
`prod_price` int,
`prod_stock` int,
`prod_company` varchar(20)
);
alter table `TblProduct` add `prod_date` varchar(20);
drop table TblUser;
insert into TblUser values ('p101','김유신','010-1234-1001',25,'경남 김해시');
insert into TblUser values('p102','김춘추','010-1234-1001',25,'경남 경주시');
insert into TblUser (`user_id`,`user_name`,`user_age`,`user_addr`) value('p103','장보고',25,'전남 완도군');
insert into TblUser (`user_id`,`user_name`,`user_addr`) value('p104','강감찬','서울시 중구');
insert into TblUser (`user_id`,`user_name`,`user_hp`,`user_age`) value('p105','이순신','010-1234-1001',25);
select*from TblUser;
update TblUser set `user_age`= 23 where `user_id`='p102';
update TblUser set `user_age`= 31 where `user_id`='p103';
update TblUser set `user_age`= 50 where `user_id`='p105';

insert into TblProduct values ('1001','냉장고',800000,25,'LG전자','2022-01-06');
insert into TblProduct values ('1002','노트북',1200000,120,'삼성전자','2022-01-07');
insert into TblProduct values ('1003','모니터',350000,35,'LG전자','2023-01-13');
insert into TblProduct values ('1004','세탁기',1000000,80,'삼성전자','2021-01-01');
insert into TblProduct values ('1005','컴퓨터',1500000,20,'삼성전자','2023-01-01');
insert into TblProduct (`prod_no`,`prod_name`,`prod_price`,`prod_stock`) values ('1006','휴대폰',950000,102);
select*from TblProduct;

select*from tbluser;
select user_name from tbluser;
select user_name, user_hp from tbluser;
select*from tbluser where user_id='p102';
select*from tbluser where user_id='p104' or user_id='p105';
select*from tbluser where user_addr='부산시 금정구';
select*from tbluser where user_age > 30;
select*from tbluser where user_hp is null;

select*from tbluser;
update tbluser set user_age=42 where user_id='p104';
update tbluser set user_addr='부산시 진구' where user_id='p105';
delete from tbluser where user_id='p103';

select*from TblProduct;
select prod_name from tblproduct;
select prod_name,prod_company,prod_price from tblproduct;
select*from tblproduct where prod_company='lg전자';
select*from tblproduct where prod_company='삼성전자';
update tblproduct set
	`prod_company`='삼성전자',
    `prod_date`='2024-01-01'
    where `prod_no`=1006;


set sql_safe_updates = 0;
delete from user1 where name ='홍두깨';
