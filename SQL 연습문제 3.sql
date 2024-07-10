#실습 3-2
CREATE TABLE STUDENT(
stdNo CHAR(8) PRIMARY KEY,
stdName VARCHAR(20) NOT NULL,
stdHp CHAR(13) NOT NULL,
stdYear INT NOT NULL,
stdAddress VARCHAR(100)
);

CREATE TABLE LECTURE(
lecNo INT PRIMARY KEY,
lecName VARCHAR(20) NOT NULL,
lecCredit INT NOT NULL,
lecTime INT NOT NULL,
lecClass VARCHAR(10));

CREATE TABLE REGISTER(
regStdNo CHAR(8) NOT NULL,
regLecNo INT NOT NULL,
regMidScore INT,
regFinalScore INT,
regTotalScore INT,
regGrade CHAR(1));

#실습 3-3
INSERT INTO Student VALUES
('20201016', '김유신', '010-1234-1001', 3, NULL),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES
(159, '인지행동심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B05'),
(234, '중급 영문법', 3, 20, '본201'),
(239, '세법개론', 3, 40, '본204'),
(248, '빅데이터 개론', 3, 20, '본B01'),
(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO REGISTER (regStdNo, regLecNo) VALUES
('20201126', 234),
('20201016', 248),
('20201016', 253),
('20201126', 239),
('20210216', 349),
('20210326', 349),
('20201016', 167),
('20220416', 349);

#실습 3-4
SELECT * FROM lecture;
#실습 3-5
SELECT * FROM student;
#실습 3-6
SELECT * FROM REGISTER;
#실습 3-7
SELECT * FROM STUDENT WHERE stdYear = '3';
#실습 3-8
SELECT * FROM LECTURE WHERE lecCredit ='2';

#실습 3-9
UPDATE REGISTER  SET `regMidScore` = 36, `regFinalScore`= 42 
WHERE `regStdNo`='20201126' AND `regLecNo`=234;
UPDATE REGISTER SET `regMidScore` = 24, `regFinalScore`= 62
WHERE`regStdNo`='20201016' AND `regLecNo`=248;
UPDATE REGISTER  SET `regMidScore` = 28, `regFinalScore`= 40 
WHERE `regStdNo`='20201016' AND `regLecNo`=253;
UPDATE REGISTER SET `regMidScore` = 37, `regFinalScore`= 57
WHERE`regStdNo`='20201126' AND `regLecNo`=239;
UPDATE REGISTER  SET `regMidScore` = 28, `regFinalScore`= 68 
WHERE `regStdNo`='20210216' AND `regLecNo`=349;
UPDATE REGISTER SET `regMidScore` = 16, `regFinalScore`= 65
WHERE`regStdNo`='20210326' AND `regLecNo`=349;
UPDATE REGISTER  SET `regMidScore` = 18, `regFinalScore`= 38 
WHERE `regStdNo`='20201016' AND `regLecNo`=167;
UPDATE REGISTER SET `regMidScore` = 25, `regFinalScore`= 58
WHERE`regStdNo`='20220416' AND `regLecNo`=349;

#실습 3-10
UPDATE REGISTER SET regTotalScore = regMidscore+regFinalscore , 
					regGrade =	IF(regTotalScore>=90,'A',
								IF(regTotalScore>=80, 'B',
                                IF(regTotalScore>=70,'C',
                                IF(regTotalScore>=60,'D','F'))));
SELECT * FROM REGISTER;
 
#실습 3-11
SELECT * FROM REGISTER ORDER BY regTotalScore Desc;
#실습 3-12
SELECT * FROM REGISTER WHERE regLecNo='349' ORDER BY regTotalScore DESC;
#실습 3-13
SELECT * FROM LECTURE WHERE lecTime >=30;
#실습 3-14
SELECT lecName, lecClass FROM LECTURE;
#실습 3-15
SELECT stdNo,stdName FROM STUDENT;
#실습 3-16 #################### = NULL 이 아닌 'IS NULL'######################
SELECT * FROM STUDENT WHERE stdAddress IS NULL;
#실습 3-17
SELECT * FROM STUDENT WHERE stdAddress LIKE '부산시%';
SELECT * FROM STUDENT WHERE SUBSTRING(stdAddress,1,3)='부산시';

#실습 3-18 학생과 수강 테이블을 결합하시오. 수강신청 하지 않아서 점수가 없어도 조회 되어야 함
SELECT * 
FROM STUDENT AS A
LEFT JOIN REGISTER AS B
ON A.stdNo=B.regStdNo;
################# => 그냥 JOIN을 이용하면 수강신청안한 송상현 안나옴 LEFT JOIN 를 이용하여 LEFT(A)는 다 나오게 실시 ##########################

#실습 3-19
SELECT  stdNo, stdName, regLecNo,regMidScore,regFinalScore, regGrade
FROM STUDENT AS A
JOIN REGISTER AS B
WHERE A.stdNo = B.regStdNo
ORDER BY stdNO;

#실습 3-20
SELECT stdName, stdNo, regLecNo
FROM Student AS A
JOIN REGISTER AS B
ON A.stdNo = B.regstdNo
WHERE regLecNo='349';

# SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

#실습 3-21 학생별 수강 신청 건수와 모든 수강과목의 전체점수 합계, 평균을 조회하시오.
SELECT 	
	stdNo, stdName, 
    COUNT(stdNo) AS '수강 신청 건수' , 
    SUM(regTotalScore) AS '종합점수',
    SUM(regTotalScore) / COUNT(stdNo) AS '평균'
FROM Student AS A
JOIN REGISTER AS B
ON A.stdNo = B.regstdNo
GROUP BY stdNo;

#실습 3-22
SELECT * 
FROM REGISTER AS A
JOIN LECTURE AS B
ON A.reglecNo=B.lecNo;

#실습 3-23
SELECT 
regStdNo,
regLecNo,
lecName,
regMidScore,
regFinalScore,
regTotalScore,
regGrade
FROM REGISTER AS A
JOIN LECTURE AS B
ON A.reglecNo=B.lecNo;


#실습 3-24 사회복지 마케팅 강좌를 신청한 건수와 평균을 조회하시오.
SELECT
COUNT(*) AS '사회복지 마케팅 신청건수',
AVG(regTotalScore) AS'사회복지 마케팅 평균'
FROM REGISTER AS A
JOIN LECTURE AS B
ON A.REGLECNO=B.LECNO
WHERE B.LECNAME = '사회복지 마케팅';

select * from lecture;

#실습 3-25 A등급을 받은 학번과 강좌명을 조회하시오
SELECT regstdNo, lecName
FROM REGISTER AS B
JOIN LECTURE AS C
ON  c.lecno = b.regLecno
WHERE regGrade = 'A';

#실습 3-26 학생테이블과 수강테이블 그리고 강좌테이블을 결합하시오.
SELECT * 
FROM LECTURE AS A
JOIN REGISTER AS B
ON A.LECNO = B.REGLECNO
JOIN STUDENT AS C
ON C.STDNO = B.REGSTDNO;

#실습 3-27
SELECT 
stdNo, stdName, lecNo,lecname,regMidScore,regFinalScore,regTotalScore,regGrade
FROM STUDENT AS A
JOIN REGISTER AS B
ON A.STDNO = B.REGSTDNO
JOIN LECTURE AS C
ON C.LECNO = B.regLECNO;

#실습 3-28 'F' 학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오.
SELECT stdno, stdname, lecName, regTotalScore, reggrade
FROM STUDENT AS A
JOIN REGISTER AS B
ON A.STDNO = B.REGSTDNO
JOIN LECTURE AS C
ON C.LECNO = B.regLECNO
WHERE b.regGrade = 'F';
select reggrade from register;

#실습 3-29 학생별 이수학점을 조회하시오 단, F등급을 받은 과목은 학점으로 인정되지 않습니다
SELECT 
stdNo, stdName, 
SUM(lecCredit) AS 이수학점

FROM STUDENT AS A
JOIN REGISTER AS B
ON A.STDNO = B.REGSTDNO
JOIN LECTURE AS C
ON  B.regLECNO = C.lecNo
WHERE regGrade IN('A','B','C','D')
GROUP BY STDNO;
####### WHERE 절과 GROUP BY를 같이 쓰려면 먼저 조건을 주고 나온 결과를 GROUP BY 해야함 ################################

#실습 3-30 신청과목과 이수과목을 조회하시오 단 F등급을 받은 과목은 이수과목으로 인정되지 않습니다.
SELECT 
stdNo, stdName, 
GROUP_CONCAT(lecName) AS 신청과목,
GROUP_CONCAT(IF(regTotalScore >=60,lecName,null)) as 이수과목
FROM REGISTER AS A
JOIN STUDENT AS B
ON A.regstdNo = B.stdno
JOIN LECTURE AS C
ON c.lecNo = a.reglecNo
group by stdNo;
