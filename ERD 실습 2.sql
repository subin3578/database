# 날짜 : 2024/07/17
# 내용 : ERD 실습 2
# 이름 : 황수빈

INSERT INTO DEPARTMENTS VALUES
(101, '소아과', '김유신', '051-123-0101'),
(102, '내과', '김춘추', '051-123-0102'),
(103, '외과', '장보고', '051-123-0103'),
(104, '피부과', '신덕여왕', '051-123-0104'),
(105, '이비인후과', '강감찬', '051-123-0105'),
(106, '산부인과', '신사임당', '051-123-0106'),
(107, '흉부외과', '류성룡', '051-123-0107'),
(108, '정형외과', '송상현', '051-123-0108'),
(109, '신경외과', '이순신', '051-123-0109'),
(110, '비뇨기과', '정약용', '051-123-0110'),
(111, '안과', '박지원', '051-123-0111'),
(112, '치과', '전봉준', '051-123-0112');

SELECT * FROM DOCTORS;
INSERT INTO DOCTORS VALUES
('D101101', '김유신', '1976-01-21', 'M', 101, '과장', '010-1101-1976', 'kimrys@bw.com'),
('D101102', '계백', '1975-06-11', 'M', 101, '전문의', '010-1102-1975', 'gaeback@bw.com'),
('D101103', '김관창', '1989-05-30', 'M', 101, '전문의', '010-1103-1989', 'kwanch@bw.com'),
('D102101', '김춘추', '1979-04-13', 'M', 102, '과장', '010-2101-1979', 'kimcc@bw.com'),
('D102104', '이사부', '1966-09-12', 'M', 102, '전문의', '010-2104-1966', 'leesabu@bw.com'),
('D103101', '장보고', '1979-07-28', 'M', 103, '과장', '010-3101-1979', 'jangbg@bw.com'),
('D104101', '신덕여왕', '1984-06-15', 'F', 104, '과장', '010-4101-1984', 'gueen@bw.com'),
('D105101', '강감찬', '1965-10-21', 'M', 105, '과장', '010-5101-1965', 'kang@bw.com'),
('D106101', '신사임당', '1972-11-28', 'F', 106, '과장', '010-6101-1972', 'sinsa@bw.com'),
('D107103', '이이', '1992-09-07', 'M', 107, '전문의', '010-7103-1992', 'leelee@bw.com'),
('D107104', '이황', '1989-12-09', 'M', 107, '전문의', '010-7104-1989', 'hwang@bw.com'),
('D108101', '송상현', '1977-03-14', 'M', 108, '과장', '010-8101-1977', 'ssh@bw.com');

SELECT * FROM PATIENTS;
INSERT INTO patients VALUES ('P102102', 'D102104', 'N102103', '전지현', '890530-1234567', 'F', '대전', '010-1103-8905', 'jjh@naver.com', '자영업');
INSERT INTO patients VALUES('P104101', 'D104101', 'N104101', '이나영', '790413-1234567', 'F', '대전', '010-1104-7904', 'lee@naver.com', '회사원');
INSERT INTO patients VALUES('P105101', 'D105101', 'N105101', '원빈', '660912-1234567', 'M', '대전', '010-2104-6609', 'one@daum.net', '배우');
INSERT INTO patients VALUES('P103102', 'D103101', 'N103101', '장동건', '790728-1234567', 'M', '대구', '010-3102-7907', 'jang@naver.com', '배우');
INSERT INTO patients VALUES('P104102', 'D104101', 'N104101', '고소영', '840615-1234567', 'F', '대구', '010-4101-8406', 'goso@daum.net', '회사원');
INSERT INTO patients VALUES('P108101', 'D108101', 'N108101', '김연아', '651021-1234567', 'F', '대구', '010-5101-6510', 'yuna@daum.net', '운동선수');
INSERT INTO patients VALUES('P105102', 'D105101', 'N105101', '조인성', '891209-1234567', 'M', '광주', '010-7104-8912', 'join@gmail.com', '배우');
INSERT INTO patients VALUES('P104103', 'D104101', 'N104101', '강동원', '770314-1234567', 'M', '광주', '010-8101-7703', 'dong@naver.com', '배우');
INSERT INTO PATIENTS (pat_id, doc_id, nur_id,pat_name,pat_jumin,pat_jen,pat_addr,pat_phone,pat_job) VALUES
('P102101', 'D102101', 'N102101', '정우성', '760121-1234567', 'M', '서울', '010-1101-7601', '배우');
INSERT INTO PATIENTS (pat_id, doc_id, nur_id,pat_name,pat_jumin,pat_jen,pat_addr,pat_phone,pat_job) VALUES
('P103101', 'D103101', 'N103101', '이정재', '750611-1234567', 'M', '서울', '010-1102-7506',  '배우');
INSERT INTO PATIENTS (pat_id, doc_id, nur_id,pat_name,pat_jumin,pat_jen,pat_addr,pat_phone,pat_job) VALUES
('P102103', 'D102104', 'N102102', '유재석', '721128-1234567', 'M', '부산', '010-6101-7211', '개그맨');
INSERT INTO PATIENTS (pat_id, doc_id, nur_id,pat_name,pat_jumin,pat_jen,pat_addr,pat_phone,pat_job) VALUES
('P107101', 'D107104', 'N107101', '강호동', '920907-1234567', 'M', '부산', '010-7103-9209', '개그맨');

SELECT * FROM NURSES;
INSERT INTO Nurses  VALUES
('N101101', '101', '송승헌', '1976-02-21', 'M', '수간호사', '010-1101-7602', 'ssh@bw.com'),
('N102101', '102', '이영애', '1975-07-11', 'F', '수간호사', '010-1102-7507', 'yung@bw.com'),
('N102102', '102', '엄정화', '1989-06-30', 'F', '주임', '010-1103-8906', 'um@bw.com'),
('N102103', '102', '박명수', '1979-05-13', 'M', '주임', '010-2101-7905', 'park@bw.com'),
('N103101', '103', '정준하', '1986-10-12', 'M', '주임', '010-2104-6610', 'jung@bw.com'),
('N104101', '104', '김태희', '1978-08-25', 'F', '주임', '010-2101-7908', 'taeh@bw.com'),
('N105101', '105', '송혜교', '1984-07-15', 'F', '주임', '010-4101-8407', 'song@bw.com'),
('N106101', '106', '공유', '1965-11-21', 'M', '간호사', '010-5101-6511', 'gong@bw.com'),
('N107101', '107', '이병헌', '1972-12-28', 'M', '간호사', '010-6101-7212', 'byung@bw.com'),
('N108101', '108', '송중기', '1982-10-07', 'M', '간호사', '010-7103-8210', 'jungi@bw.com');


INSERT INTO treatments VALUE('1021001','D102101','P102101','감기, 몸살',NOW());
INSERT INTO treatments VALUE('1031002','D103101','P103101','교통사고 외상',NOW());
INSERT INTO treatments VALUE('1021003','D102104','P102102','피부 트러블',NOW());
INSERT INTO treatments VALUE('1041004','D104101','P104101','감기, 몸살',NOW());
INSERT INTO treatments VALUE('1051005','D105101','P105101','코막힘 및 비염',NOW());
INSERT INTO treatments VALUE('1031006','D103101','P103102','목 디스크',NOW());
INSERT INTO treatments VALUE('1041007','D104101','P104102','여드름',NOW());
INSERT INTO treatments VALUE('1081008','D108101','P108101','오른쪽 발목 뼈 골절',NOW());
INSERT INTO treatments VALUE('1021009','D102104','P102103','소화불량',NOW());
INSERT INTO treatments VALUE('1071010','D107104','P107101','가슴 통증',NOW());
INSERT INTO treatments VALUE('1051011','D105101','P105102','귀 이명',NOW());
INSERT INTO treatments VALUE('1041012','D104101','P104103','팔목 화상',NOW());
select * from treatments;

INSERT INTO charts VALUE('C1021001','1021001','D102101','P102101','감기 주사 및 약 처방');
INSERT INTO charts VALUE('C1031002','1031002','D103101','P103101','입원 치료');
INSERT INTO charts VALUE('C1021003','1021003','D102104','P102102','위내시경');
INSERT INTO charts VALUE('C1041004','1041004','D104101','P104101','피부 감염 방지 주사');
INSERT INTO charts VALUE('C1051005','1051005','D105101','P105101','비염 치료');
INSERT INTO charts VALUE('C1031006','1031006','D103101','P103102','목 견인치료');
INSERT INTO charts VALUE('C1041007','1041007','D104101','P104102','여드름 치료약 처방');
INSERT INTO charts VALUE('C1081008','1081008','D108101','P108101','발목깁스');
INSERT INTO charts VALUE('C1021009','1021009','D102104','P102103','주사처방');
INSERT INTO charts VALUE('C1071010','1071010','D107104','P107101','MRI 검사');
INSERT INTO charts VALUE('C1051011','1051011','D105101','P105102','귀 청소 및 약 처방');
INSERT INTO charts VALUE('C1041012','1041012','D104101','P104103','화상 크림약 처방');



#문제1 모든 의사의 의사 ID, 이름, 생년원일, 전공의과 번호, 전공의과 이름을 조회하시오.
SELECT DOC_ID,DOC_NAME,DOC_BIRTH,B.DEP_NO,B.DEP_NAME 
FROM DOCTORS A
JOIN departments B
ON A.DEP_NO = B.DEP_NO;

#문제2 모든 간호사의 간호사 ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
SELECT NUR_ID,NUR_NAME,NUR_BIRTH,D.DEP_NO,DEP_NAME
FROM NURSES N
JOIN DEPARTMENTS D
ON N.DEP_NO = D.DEP_NO;


#문제3 모든 환자의 환자ID, 이름, 주민번호, 휴대폰, 담당의사 이름, 담당 간호사 이름을 조회하시오.
SELECT PAT_ID,PAT_NAME,PAT_JUMIN,PAT_PHONE,D.DOC_NAME,N.NUR_NAME
FROM PATIENTS P
JOIN DOCTORS D 
ON P.DOC_ID = D.DOC_ID
JOIN NURSES N
ON P.NUR_ID = N.NUR_ID;

#문제4 모든 진료내역에서 환자 이름, 담당의사 이름, 진료내용, 처방내용, 진료날짜를 조회하시오.
SELECT PAT_NAME,DOC_NAME,TREAT_CONTENTS,CHART_CONTENTS,TREAT_DATETIME
FROM PATIENTS P 
JOIN TREATMENTS T
ON P.PAT_ID = T.PAT_ID
JOIN CHARTS C
ON C.TREAT_NO = T.TREAT_NO
JOIN DOCTORS D
ON D.DOC_ID = P.DOC_ID;

#문제5 모든 진료내역에서 '외과'에서 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오.
SELECT DEP_NAME,T.TREAT_NO,PAT_NAME,DOC_NAME,TREAT_CONTENTS,CHART_CONTENTS,TREAT_DATETIME
FROM DEPARTMENTS A
JOIN DOCTORS D 
ON A.DEP_NO = D.DEP_NO
JOIN PATIENTS P 
ON P.DOC_ID = D.DOC_ID
JOIN TREATMENTS T
ON P.PAT_ID = T.PAT_ID
JOIN CHARTS C
ON C.TREAT_NO = T.TREAT_NO
WHERE DEP_NAME = '외과';

#문제6 모든 진료내역에서 '화상'으로 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오.
SELECT DEP_NAME,T.TREAT_NO,PAT_NAME,DOC_NAME,TREAT_CONTENTS,CHART_CONTENTS,TREAT_DATETIME
FROM DEPARTMENTS A
JOIN DOCTORS D 
ON A.DEP_NO = D.DEP_NO
JOIN PATIENTS P 
ON P.DOC_ID = D.DOC_ID
JOIN TREATMENTS T
ON P.PAT_ID = T.PAT_ID
JOIN CHARTS C
ON C.TREAT_NO = T.TREAT_NO
WHERE TREAT_CONTENTS LIKE '%화상%';

#문제7 현재 날짜를 기준으로 30세이상 40세 미만 환자를 조회하시오.
SELECT *
FROM PATIENTS
WHERE (YEAR(NOW()) - (SUBSTRING(PAT_JUMIN,1,2)+1900) + 1) >30 AND
(YEAR(NOW()) - (SUBSTRING(PAT_JUMIN,1,2)+1900) + 1)<40; 

SELECT *,(YEAR(NOW()) - (SUBSTRING(PAT_JUMIN,1,2)+1900) + 1) AS age
FROM PATIENTS
WHERE  (YEAR(NOW()) - (SUBSTRING(PAT_JUMIN,1,2)+1900) + 1)>=30
AND (YEAR(NOW()) - (SUBSTRING(PAT_JUMIN,1,2)+1900) + 1)<40;

#Where절 내에서 별칭 사용 못함
SELECT *,(YEAR(NOW()) - (SUBSTRING(PAT_JUMIN,1,2)+1900) + 1) AS 'age'
FROM PATIENTS
WHERE  'age'>=30
AND 'age'<40; 



#문제8 모든 전공부서에서 아직 의사 ID가 부여되지 않은 의사의 이름과 부서명을 조회하시오.
SELECT dep_name, doc_name
FROM DEPARTMENTS D
LEFT JOIN DOCTORS T
ON T.DEP_NO = D.DEP_NO
WHERE T.DOC_ID IS NULL;

#문제 9 김태희 간호사가 맡고 있는 모든 환자의 이름을 구분자 ^으로 해서 강동원^고소영^이나영 과 같이 조회하시오
SELECT group_concat(P.PAT_NAME SEPARATOR '^') AS '담당하는 모든 환자 이름' 
FROM NURSES N
JOIN PATIENTS P
ON N.NUR_ID = P.NUR_ID
WHERE N.NUR_NAME = '김태희';

#문제 10 가장 많은 환자 수를 담당하는 간호사 ID, 간호사 이름, 담당환자 수를 조회하시오.
SELECT N.NUR_ID, NUR_NAME, COUNT(P.PAT_NAME) AS '담당 환자 수'
FROM NURSES N
JOIN PATIENTS P
ON N.NUR_ID = P.NUR_ID
GROUP BY P.NUR_ID 
ORDER BY COUNT(P.PAT_NAME) DESC LIMIT 1;

