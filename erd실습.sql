# 날짜 : 2024/07/16
# 내용 : ERD 실습 1
# 이름 : 황수빈

#학과
INSERT INTO DEPARTMENTS VALUES (10,'국어국문학과','051-510-1010');
INSERT INTO DEPARTMENTS VALUES (11,'영어영문학과','051-510-1011');
INSERT INTO DEPARTMENTS VALUES (20,'경영학과','051-510-1020');
INSERT INTO DEPARTMENTS VALUES (21,'경제학과','051-510-1021');
INSERT INTO DEPARTMENTS VALUES (22,'정치외교학과','051-510-1022');
INSERT INTO DEPARTMENTS VALUES (23,'사회복지학과','051-510-1023');
INSERT INTO DEPARTMENTS VALUES (30,'수학과','051-510-1030');
INSERT INTO DEPARTMENTS VALUES (31,'통계학과','051-510-1031');
INSERT INTO DEPARTMENTS VALUES (32,'생명과학과','051-510-1032');
INSERT INTO DEPARTMENTS VALUES (40,'기계공학과','051-510-1040');
INSERT INTO DEPARTMENTS VALUES (41,'전자공학과','051-510-1041');
INSERT INTO DEPARTMENTS VALUES (42,'컴퓨터공학','051-510-1042');

INSERT INTO PROFESSORS VALUES ('P10101',10,'김유신','750120-1234567','010-1101-1976','kimys@hg.ac.kr','서울');
INSERT INTO PROFESSORS VALUES ('P10102',10,'계백','740610-1234567','010-1102-1975','gaeback@hg.ac.kr','서울');
INSERT INTO PROFESSORS VALUES ('P11101',11,'김관창','880529-1234567','010-1103-1989','kwanch@hg.ac.kr','대전');
INSERT INTO PROFESSORS VALUES ('P11103',11,'김춘추','780412-1234567','010-2101-1979','kimcc@hg.ac.kr','대전');
INSERT INTO PROFESSORS VALUES ('P11104',11,'이사부','650911-1234567','010-2104-1966','leesabu@hg.ac.kr','대전');
INSERT INTO PROFESSORS VALUES ('P22110',22,'장보고','780727-1234567','010-3101-1979','jangbg@hg.ac.kr','대구');
INSERT INTO PROFESSORS VALUES ('P23102',23,'선덕여왕','830614-1234567','010-4101-1984','gueen@hg.ac.kr','대구');
INSERT INTO PROFESSORS VALUES ('P31101',31,'강감찬','641020-1234567','010-5101-1965','kang@hg.ac.kr','대구');
INSERT INTO PROFESSORS VALUES ('P31104',31,'신사임당','711127-1234567','010-6101-1972','sinsa@hg.ac.kr','부산');
INSERT INTO PROFESSORS VALUES ('P40101',40,'이이','910906-1234567','010-7103-1992','leelee@hg.ac.kr','부산');
INSERT INTO PROFESSORS VALUES ('P40102',40,'이황','881208-1234567','010-7104-1989','hwang@hg.ac.kr','광주');
INSERT INTO PROFESSORS VALUES ('P42103',42,'송상현','760313-1234567','010-8101-1977','ssh@hg.ac.kr','광준s');
#강의
insert into `lectures` values ( 101001, 'p10101', '대학 글쓰기', 2, 10, '본102');
insert into `lectures` values ( 101002, 'p10102', '한국어음운론', 3, 30, '본102');
insert into `lectures` values ( 101003, 'p10102', '한국현대문학사', 3, 30, '본103');
insert into `lectures` values ( 111011, 'p11103', '중세영문학', 3, 25, '본201');
insert into `lectures` values ( 111012, 'p11104', '영미시', 3, 25, '본201');
insert into `lectures` values ( 231110, 'p23102', '사회복지학개론', 1, 8, '별관103');
insert into `lectures` values ( 311002, 'p31101', '통계학의 이해', 2, 16, '별관303');
insert into `lectures` values ( 311003, 'p31104', '기초 통계학', 3, 26, '별관303');
insert into `lectures` values ( 401019, 'p40101', '기계역학', 3, 36, '공학관 102');
insert into `lectures` values ( 421012, 'p42103', '데이터베이스', 3, 32, '공학관 103');

#학생
insert into `students` (`stdNo`,`depNo`,`prodNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) values ('20101001',10,'p10101','정우성','760121-1234567','010-1101-7601','서울');
insert into `students` (`stdNo`,`depNo`,`prodNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) values ('20101002',10,'p10101','이정재','750611-1234567','010-1102-7506','서울');
insert into `students` values ('20111011',11,'P11103','전지현','890530-1234567','010-1103-8905','jjh@naver.com','대전');
insert into `students` values ('20111013',11,'P11103','이나영','790413-1234567','010-2101-7904','lee@naver.com','대전');
insert into `students` values ('20111014',11,'P11104','원빈','660912-1234567','010-2104-6609','one@daum.net','대전');
insert into `students` values ('21221010',22,'P22110','장동건','790728-1234567','010-3101-7907','jang@naver.com','대구');
insert into `students` values ('21231002',23,'P23102','고소영','840615-1234567','010-4101-8406','goso@daum.net','대구');
insert into `students` values ('22311011',31,'P31104','김연아','651021-1234567','010-5101-6510','yuna@daum.net','대구');
insert into `students`(`stdNo`,`depNo`,`prodNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) values ('22311014',31,'P31104','유재석','721128-1234567','010-6101-7211','부산');
insert into `students` (`stdNo`,`depNo`,`prodNo`,`stdName`,`stdJumin`,`stdHp`,`stdAddr`) values ('22401001',40,'P40101','강호동','920907-1234567','010-7103-9209','부산');
insert into `students` values ('22401002',40,'P40101','조인성','891209-1234567','010-7104-8912','join@gmail.com','광주');
insert into `students` values ('22421003',42,'P42103','강동원','770314-1234567','010-8101-7703','dong@naver.com','광주');

#등록
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 20101001, 101001, 'p10101');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 20101001, 101002, 'P10102');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 20111013, 111011, 'P11103');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 21231002, 231110, 'P23102');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 22401001, 401019, 'P40101');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 22401001, 421012, 'P42103');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 20101001, 101003, 'P10102');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 22421003, 311003, 'P31104');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 22421003, 421012, 'P42103');
insert into `register` (`stdNo`, `lecNo`, `proNo`)values ( 20111013, 111012, 'P11104');

#문제 1 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.
SELECT  S.STDNO, S.STDNAME,D.DEPNO,D.DEPNAME 
FROM STUDENTS AS S
JOIN DEPARTMENTS AS D
ON D.DEPNO = S.DEPNO;

#문제 2 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오. 
SELECT P.PRONO, P.PRONAME, P.PROHP,P.DEPNO,D.DEPNAME
FROM PROFESSORS P
JOIN DEPARTMENTS D
ON P.DEPNO = D.DEPNO;

#문제3. 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오. 
SELECT L.LECNO,L.LECNAME,P.PRONAME,P.PROHP
FROM LECTURES L
JOIN PROFESSORS P
ON P.PRONO = L.PRONO;

#문제4. 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오.
SELECT L.LECNO, L.LECNAME, P.PRONO,P.PRONAME, P.PROHP, D.DEPNO,D.DEPNAME
FROM LECTURES L
JOIN PROFESSORS P
ON P.PRONO = L.PRONO
JOIN DEPARTMENTS D
ON D.DEPNO = P.DEPNO;

#문제5. 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오.
SELECT S.STDNO,S.STDNAME,L.LECNO,L.LECNAME,P.PRONO,P.PRONAME
FROM LECTURES L
JOIN PROFESSORS P
ON L.PRONO = P.PRONO
JOIN STUDENTS S
ON S.PRONO = P.PRONO;


SELECT * FROM REGISTER;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
#문제6. 수강 테이블에서 출석점수, 중간고사점수, 기말고사 점수를 임의로 입력하시오.
UPDATE REGISTER SET `REGATTENSCORE` = (CEIL(RAND()*100)) WHERE `REGATTENSCORE` IS NULL;
UPDATE REGISTER SET `REGMIDSCORE` = (CEIL(RAND()*100)) WHERE `REGMIDSCORE` IS NULL;
UPDATE REGISTER SET `REGFINALSCORE` = (CEIL(RAND()*100)) WHERE `REGFINALSCORE` IS NULL;

#문제7. 수강 테이블에 출석점수, 중간고사 점수, 기말고사 점수를 모두 더한 평균을 구해 총점에 입력하시오.
UPDATE REGISTER SET REGTOTAL = (REGMIDSCORE + REGFINALSCORE+REGATTENSCORE) / 3;

#문제8. 수강 테이블에 총점을 기준으로 A ~ F 등급을 입력하시오
UPDATE REGISTER SET REGGRADE = CASE 
WHEN(REGTOTAL>=90) THEN 'A'
WHEN(REGTOTAL>=80) THEN 'B'
WHEN(REGTOTAL>=70) THEN 'C'
WHEN(REGTOTAL>=60) THEN 'D'
ELSE 'F'
END;

#문제9. 수강 테이블에서 총점이 가장 큰 점수를 조회하시오.
SELECT REGTOTAL FROM REGISTER
ORDER BY REGTOTAL DESC LIMIT 1;

#문제10. 수강 테이블에서 정우성 학생의 총점의 평균을 조회하시오.
SELECT AVG(REGTOTAL)
FROM STUDENTS S
JOIN REGISTER R
ON S.STDNO = R.STDNO
WHERE S.STDNAME = '정우성';