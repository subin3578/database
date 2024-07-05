#날짜: 24/7/2
#이름: 황수빈
#내용: 3장 제약조건

#실습 3-1

drop table user2;
create table User2 (
`uid` varchar(10) primary key,
`name` varchar(10),
`birth` char(10),
`addr` varchar(50)
);
#실습 3-3 
create table`User3` (
`uid` varchar(10) primary key,
`name` varchar(10),
`birth` char(10),
`hp` char(13) unique,
`addr` varchar(50)
);
#실습 3-2
select*from user2;
insert into user2 values('A101','김유신','1968-05-09','경남 김해시');
insert into user2 values('A102','김춘추','1972-11-23','경남 경주시');
insert into user2 values('A103','장보고','1978-03-01','전남 완도군');
insert into user2 values('A104','강감찬','1979-08-16','서울시 관악구');
insert into user2 values('A105','이순신','1981-05-23','부산시 진구');
#실습 3-4
select*from user3;
insert into User3 values('A101','김유신','1968-05-09','010-1234-1001','경남 김해시'); 
insert into User3 values('A102','김춘추','1972-11-23','010-1234-1002','경남 경주시'); 
insert into User3 values('A103','장보고','1978-03-01','010-1234-1003','전남 완도군'); 
insert into User3 values('A104','강감찬','1979-08-16','010-1234-1004','서울시 관악구'); 
insert into User3 values('A105','이순신','1981-05-23','010-1234-1005','부산시 진구'); 
update user3 set birth='1978-03-01' where `uid`='A103';
update user3 set birth='1979-08-16' where `uid`='A104';
#실습 3-5
create table Parent (
`pid` varchar(10) primary key,
`name` varchar(10),
`birth` char(10),
`addr` varchar(100)
);
select*from parent;
select*from child;
drop table child;
create table Child (
`cid` varchar(10) primary key,
`name` varchar(10),
`hp` char(13) unique,
`parent` varchar(10),
foreign key(parent) references parent(pid)
);

#실습 3-6 데이터추가
insert into Parent values('P101','김유신','1968-05-09','경남 김해시');
insert into Parent values('P102','김춘추','1972-11-23','경남 경주시');
insert into Parent values('P103','장보고','1978-03-01','전남 완도군');
insert into Parent values('P104','강감찬','1979-08-16','서울시 관악구');
insert into Parent values('P105','이순신','1981-05-23','부산시 진구');

insert into Child values('C101','김철수','010-1234-1001','P101');
insert into Child values('C102','김영희','010-1234-1002','P101');
insert into Child values('C103','강철수','010-1234-1003','P103');
insert into Child values('C104','이철수','010-1234-1004','P105');

select p.name,c.name from parent p join child c where p.pid=c.parent
order by pid='P101'; 

#실습 3-7
create table user4 (
`uid` varchar(10) primary key,
`name` varchar(10) not null,
`gender` char (1),
`age` int default 1,
`hp` char(13) unique,
`addr` varchar(20)
);

#실습 3-8
insert into user4 values('A101','김유신','M',25,'010-1234-1111','경남 김해시');
insert into user4 values('A102','김춘추','M',23,'010-1234-2222','경남 경주시');
insert into user4 values('A103','장보고','M',35,'010-1234-3333','전남 완도시');
insert into user4 values('A104','강감찬','M',42,'010-1234-4444','서울시 관악구');
insert into user4 (`uid`,`gender`,`hp`,`addr`) values('A105','M','010-1234-3333','부산시 진구'); 
insert into user4 (`uid`,`name`,`gender`,`age`,`addr`) values('A106','신사임당','F',32,'강릉시');
insert into user4 (`uid`,`name`,`gender`,`age`,`addr`) values('A107','허난설현','F',27,'경기도 광주시');


select*from user4;
drop table user4;


create table user5 (
`seq` int primary key auto_increment,
`name` varchar(10) not null,
`gender` char (1) check (`gender` in('M', 'F')),
`age` int default 1 check (`age` > 0 and `age` < 100),
`addr` varchar(20)
);
select*from user5;
insert into user5 values(NULL,'김유신','M',25,'경남 김해시');
insert into user5 values(NULL,'김춘추','M',25,'경남 경주시');
insert into user5 values(NULL,'장보고','M',25,'전남 완도시');
insert into user5 values(NULL,'강감찬','M','25','서울시 관악구');
insert into user5 values(NULL,'이순신','A',25,'부산시');
insert into user5 values(NULL,'신사임당','F',-1,'강릉시');



