SELECT USER
FROM DUAL;
--==>> ORASTUDY

/*-----------------------------------------------------------------
■■■■■ 과정 테이블(TBL_COURSES) ■■■■■ 
-------------------------------------------------------------------
COURSE_CODE     -    과정코드 (PRIMARY KEY) 
NAME            -    과정명   (NOT NULL) 
*/
-- 과정 테이블 생성
CREATE TABLE TBL_COURSES        
( COURSE_CODE   VARCHAR2(10)    
, NAME          VARCHAR2(100) CONSTRAINT COUSRES_NAME_NN NOT NULL 
, CONSTRAINT COU_COURSE_CODE_PK PRIMARY KEY(COURSE_CODE)
);
--==>> Table TBL_COURSES이(가) 생성되었습니다.

-- 과정 데이터 입력
EXEC PRC_COURSES_INSERT ('JAVA를 활용한 웹 응용 개발자 양성');
EXEC PRC_COURSES_INSERT ('JAVA 프레임워크 개발자');
EXEC PRC_COURSES_INSERT ('파이썬, R기반 빅데이터 플랫폼 개발자');
EXEC PRC_COURSES_INSERT ('빅데이터 분석 및 개발 전문가 양성');
EXEC PRC_COURSES_INSERT ('빅데이터 UI전문가 양성');

-- 교수 데이터 입력
EXEC PRC_PROFESSORS_INSERT ('서진욱', '870909-1234567', '010-7894-1546', '2018-09-09');
EXEC PRC_PROFESSORS_INSERT ('김미영', '901015-2234567', '010-1567-1578', '2019-01-19');
EXEC PRC_PROFESSORS_INSERT ('이선율', '790312-2845651', '010-2548-1117', '2017-02-01');
EXEC PRC_PROFESSORS_INSERT ('정해인', '871111-1845125', '010-4874-2451', '2018-12-31');
EXEC PRC_PROFESSORS_INSERT ('전병곤', '807865-1335845', '010-2156-9494', '2019-03-01');

-- 커밋
COMMIT;
--==>> 커밋완료

SELECT *
FROM TBL_PROFESSORS;
/*
PR10018	박항서	782565-1324567	010-2323-7562       	18/05/25	P10041박항서
PR10016	김땅콩	870624-1045555	010-9170-3896       	19/04/11	P10039김땅콩
PR10035	박항순	782565-1324568	010-2323-7562       	16/10/10	P10068박항순
PR10036	박항순	82565-1324568 	010-2323-7562       	16/11/10	P10079박항순
PR10037	박항녀	820213-1324568	010-2323-7562       	16/11/10	P10080박항녀
PR10038	김태희	800325-2490918	010-6748-0000       	17/11/10	P10081김태희
PR10001	서진욱	870909-1234567	010-7894-1546       	18/09/09	P10010서진욱
PR10002	김미영	901009-2234567	010-1567-1578       	19/01/19	P10011김미영
PR10003	이선율	790312-2845651	010-2548-1117       	17/02/01	P10012이선율
PR10004	정해인	871111-1845125	010-4874-2451       	18/12/31	P10013정해인
*/

SELECT *
FROM TBL_OP_COURSES;
/*
OC10005	CO10005	18/06/11	18/12/21	CL10002
OC10001	CO10001	19/03/21	19/09/21	CL10004
OC10002	CO10002	19/05/21	19/11/24	CL10005
OC10003	CO10003	18/12/26	19/04/01	CL10001
OC10004	CO10004	19/02/11	19/07/18	CL10003
*/
SELECT *
FROM VIEW_PROFESSORS;
/*
박항서	MACHINERUNNING	19/06/13	19/07/18	정규화를 위한 오라클 정규화실무	B205	강의 예정
김땅콩	PYTHON	18/09/13	18/12/21	빠이썬	A205	강의 종료
김땅콩	JAVA	18/06/11	18/09/12	짜바	A205	강의 종료
서진욱	SPRING	19/08/01	19/09/21	토비스프링	C805	강의 예정
서진욱	ORACLE	18/07/11	18/08/11	짜바	A205	강의 종료
서진욱	ORACLE	19/05/22	19/07/30	정규화를 위한 오라클 정규화실무	C805	강의 예정
김미영	SPRING	19/10/02	19/11/24	토비스프링	F105	강의 예정
김미영	JAVA	19/03/21	19/05/21	이것이 자바다	C805	강의 중
이선율	PYTHON	18/12/26	19/02/10	이것이 PYTHON이다	A101	강의 종료
이선율	ORACLE	19/02/11	19/04/01	정규화를 위한 오라클 정규화실무	A101	강의 종료
이선율	JAVA	19/02/11	19/04/11	이것이 자바다	B205	강의 종료
이선율	JAVA	19/05/21	19/07/21	이것이 자바다	F105	강의 예정
정해인	ORACLE	19/04/12	19/06/12	다양한 예제로 쉽게 배우는 오라클	B205	강의 중
정해인	ORACLE	19/07/22	19/10/01	다양한 예제로 쉽게 배우는 오라클	F105	강의 예정
*/
SELECT *
FROM VIEW_PR_REMATCH_TEST;
/*
서진욱	PR10001	ORACLE	SU10002
서진욱	PR10001	ORACLE	SU10002
서진욱	PR10001	SPRING	SU10003
김미영	PR10002	SPRING	SU10003
김미영	PR10002	JAVA	SU10001
이선율	PR10003	ORACLE	SU10002
이선율	PR10003	JAVA	SU10001
이선율	PR10003	JAVA	SU10001
이선율	PR10003	PYTHON	SU10004
정해인	PR10004	ORACLE	SU10002
정해인	PR10004	ORACLE	SU10002
김땅콩	PR10016	JAVA	SU10001
김땅콩	PR10016	PYTHON	SU10004
박항서	PR10018	MACHINERUNNING	SU10005
*/

/*-----------------------------------------------------------------
■■■■■ 교재 테이블(TBL_BOOKS) ■■■■■ 
-------------------------------------------------------------------
BOOK_CODE       -    교재코드 (PRIMARY KEY) 
NAME            -    교재명   (NOT NULL) 
AUTHOR          -    저자        
*/
-- 교재 테이블 생성
CREATE TABLE TBL_BOOKS
( BOOK_CODE    VARCHAR2(10) 
, NAME         VARCHAR2(80) CONSTRAINT BOOKS_NAME_NN NOT NULL
, AUTHOR       VARCHAR2(50)
, CONSTRAINT BOK_BOOK_CODE_PK PRIMARY KEY (BOOK_CODE)
);
--==>> Table TBL_BOOKS이(가) 생성되었습니다.



/*-----------------------------------------------------------------
■■■■■ 시험 테이블(TBL_EXAMS) ■■■■■ 
-------------------------------------------------------------------
EXAM_CODE           -    시험코드 (PRIMARY KEY) 
OP_SUBJECT_CODE     -    개설과정코드 (FOREIGN KEY: TBL_OP_SUBJECTS) 
TEST_CODE           -    시험종류코드 (FOREIGN KEY: TBL_TEST_TYPE)
EXAM_DATE           -    시험일
TIME_LIMIT          -    시험진행시간 
*/

-- 시험 테이블 생성
CREATE TABLE TBL_EXAMS
( EXAM_CODE         VARCHAR2(10)
, OP_SUBJECT_CODE   VARCHAR2(10)
, TEST_CODE         VARCHAR2(10)
, EXAM_DATE         DATE DEFAULT SYSDATE   
, TIME_LIMITE       VARCHAR2(20)
, CONSTRAINT EXA_EXAM_CODE_PK PRIMARY KEY(EXAM_CODE)
);
--==>> Table TBL_EXAMS이(가) 생성되었습니다.


-- 시험 테이블 왜래키 추가 선언
ALTER TABLE TBL_EXAMS 
ADD ( CONSTRAINT EXA_OP_SUBJECT_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE)
                 REFERENCES TBL_OP_SUBJECTS(OP_SUBJECT_CODE) 
    , CONSTRAINT EXA_TEST_CODE_FK FOREIGN KEY(TEST_CODE)
                 REFERENCES TBL_TEST_TYPE(TEST_CODE) );
--==>> Table TBL_EXAMS이(가) 변경되었습니다.


/*-----------------------------------------------------------------
■■■■■ 시험종류 테이블(TBL_TEST_TYPE) ■■■■■ 
-------------------------------------------------------------------
TEST_CODE       -    시험종류코드 (PRIMARY KEY) 
NAME            -    시험종류명 (NOT NULL)
*/
-- 평가 종류 테이블 생성
CREATE TABLE TBL_TEST_TYPE
( TEST_CODE     VARCHAR2(10)
, NAME          VARCHAR2(30) CONSTRAINT TEST_TYPE_NAME_NN NOT NULL
, CONSTRAINT TEST_TEST_CODE_PK PRIMARY KEY(TEST_CODE)
);
--==>> Table TBL_TEST_TYPE이(가) 생성되었습니다.


/*-----------------------------------------------------------------
■■■■■ 과목 테이블(TBL_SUBJECTS) ■■■■■ 
-------------------------------------------------------------------
SUBJECT_CODE    -    과목코드 (PRIMARY KEY) 
NAME            -    과목명   (NOT NULL) 

*/
-- 과목 테이블 생성
CREATE TABLE TBL_SUBJECTS
( SUBJECT_CODE  VARCHAR2(10)
, NAME          VARCHAR2(30) CONSTRAINT SUBJECTS_NAME_NN NOT NULL
, CONSTRAINT SUB_SUBJECT_CODE_PK PRIMARY KEY(SUBJECT_CODE)
);
--==>> Table TBL_SUBJECTS이(가) 생성되었습니다.

-- 과목 데이터 입력
INSERT INTO TBL_SUBJECTS VALUES('1', 'JAVA');						
INSERT INTO TBL_SUBJECTS VALUES('2', 'ORACLE');						
INSERT INTO TBL_SUBJECTS VALUES('3', 'SPRING');						
INSERT INTO TBL_SUBJECTS VALUES('4', 'JSP');						
INSERT INTO TBL_SUBJECTS VALUES('5', 'JDBC');						
INSERT INTO TBL_SUBJECTS VALUES('6', 'CSS');						
INSERT INTO TBL_SUBJECTS VALUES('7', 'HTML');						
INSERT INTO TBL_SUBJECTS VALUES('8', 'JAVASCRIPT');		



-- 커밋
COMMIT;
--==>> 커밋 완료

-- 강의실 데이터 입력 
INSERT INTO TBL_CLASSROOM VALUES('A1' , 'A101',  'A동 A-1관',  24);			
INSERT INTO TBL_CLASSROOM VALUES('A2' , 'A102',  'A동 A-2관',  21);			
INSERT INTO TBL_CLASSROOM VALUES('A3' , 'A103',  'A동 A-1관',  15);			
INSERT INTO TBL_CLASSROOM VALUES('A4' , 'A104',  'A동 A-2관',  19);			
INSERT INTO TBL_CLASSROOM VALUES('A5' , 'A105',  'A동 A-2관',  20);			
INSERT INTO TBL_CLASSROOM VALUES('B1' , 'B101',  'B동 B-1관',  22);			
INSERT INTO TBL_CLASSROOM VALUES('B2' , 'B102',  'B동 B-2관',  17);			
INSERT INTO TBL_CLASSROOM VALUES('B3' , 'B103',  'B동 B-1관',  20);			
INSERT INTO TBL_CLASSROOM VALUES('B4' , 'B104',  'B동 B-2관',  20);			
INSERT INTO TBL_CLASSROOM VALUES('B5' , 'B105',  'B동 B-2관',  11);			

-- 커밋 
COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_CLASSROOM 
ORDER BY 1;

---------------------------------------------------------------------------------------------------------------------------------
/*
===========================================================================
     ■■■■■■■ 교수자 정보 뷰 생성 ■■■■■■■■■
===========================================================================
- 교수자 계정 관리 기능 구현한 뷰 
  교수명, 배정된과목명, 기간, 교재명, 강의실, 강의진행여부 조회 
*/
CREATE OR REPLACE VIEW VIEW_PROFESSORS
AS
SELECT PR.NAME "교수명", SU.NAME "배정된과목명", OS.START_DATE "시작일", OS.END_DATE "종료일"
     , BO.NAME "교재명", CL.NAME "강의실"
     , (CASE WHEN SYSDATE BETWEEN OS.START_DATE AND OS.END_DATE
             THEN '강의 중' ELSE (CASE WHEN SYSDATE < OS.START_DATE THEN '강의 예정' 
                                       WHEN SYSDATE > OS.END_DATE THEN '강의 종료'
                                       ELSE '확인불가' END) END ) "강의진행여부"
FROM TBL_OP_SUBJECTS OS JOIN TBL_OP_COURSES OC
ON OS.OP_COURSE_CODE = OC.OP_COURSE_CODE
    JOIN TBL_PROFESSORS PR
    ON OS.PRO_CODE = PR.PRO_CODE
        JOIN TBL_SUBJECTS SU
        ON OS.SUBJECT_CODE = SU.SUBJECT_CODE
            JOIN TBL_BOOKS BO
            ON OS.BOOK_CODE = BO.BOOK_CODE
                JOIN TBL_CLASSROOM CL
                ON OC.CLR_CODE = CL.CLR_CODE;              
--==>> View VIEW_PROFESSORS이(가) 생성되었습니다.


SELECT *
FROM TBL_QUIT_REASON;

SELECT *
FROM USER_VIEWS;


/*
===========================================================================
     ■■■■■■■ 학생 정보 뷰 생성 ■■■■■■■■■
===========================================================================
- 관리자 학생 관리 기능 구현한 뷰
  학생명, 과정명, 수강과목, 수강과목 총점, 중도탈락여부 조회 
*/
CREATE OR REPLACE VIEW VIEW_STUDENTS
AS
SELECT ST.NAME "학생명", CO.NAME "과정명", SU.NAME "수강과목", 
       NVL((GR.ATTEND*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10001')/100) 
        + GR.WRITE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10002')/100) 
        + GR.PRACTICE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10003')/100)),0)"수강과목총점"
     , (CASE WHEN CR.REGIST_CODE = QU.REGIST_CODE THEN '중도탈락' ELSE ' ' END) "중도탈락여부"          
FROM TBL_STUDENTS ST JOIN TBL_COU_REGIST CR 
ON ST.STU_CODE = CR.STU_CODE
    LEFT JOIN TBL_OP_COURSES OC
    ON CR.OP_COURSE_CODE = OC.OP_COURSE_CODE
        LEFT JOIN TBL_COURSES CO
        ON OC.COURSE_CODE = CO.COURSE_CODE
            LEFT JOIN TBL_OP_SUBJECTS OS
            ON OC.OP_COURSE_CODE = OS.OP_COURSE_CODE
                LEFT JOIN TBL_SUBJECTS SU
                ON OS.SUBJECT_CODE = SU.SUBJECT_CODE
                    LEFT JOIN TBL_GRADE GR
                    ON OS.OP_SUBJECT_CODE = GR.OP_SUBJECT_CODE AND GR.REGIST_CODE = CR.REGIST_CODE
                        LEFT JOIN TBL_QUIT QU
                        ON CR.REGIST_CODE = QU.REGIST_CODE;
--==>> View VIEW_STUDENTS이(가) 생성되었습니다.


SELECT ut.table_name"테이블이름",ut.table_type"유형",uc.column_name,uc.comments FROM  USER_TAB_COMMENTS UT LEFT JOIN USER_COL_COMMENTS UC 
   ON ut.table_name = uc.table_name
   WHERE ut.comments IS NOT NULL;


SELECT *
FROM TBL_

EXEC PRC_CLASSROOM_INSERT('A101', '북악관A 1층', 50);
EXEC PRC_CLASSROOM_INSERT('A205', '북악관A 1층', 50);
EXEC PRC_CLASSROOM_INSERT('B205', '경상관B 2층', 40);
EXEC PRC_CLASSROOM_INSERT('C805', '예술관C 8층', 45);
EXEC PRC_CLASSROOM_INSERT('F105', '복지관F 1층', 80);
EXEC PRC_CLASSROOM_INSERT('D106', '풍성관A 1층', 30);
EXEC PRC_CLASSROOM_INSERT('D106', '풍성관A 1층', 30);



EXEC PRC_ALLOT_INSERT('OS10001', 20, 30, 50);
EXEC PRC_ALLOT_INSERT('OS10002', 45, 45, 10);
EXEC PRC_ALLOT_INSERT('OS10003', 35, 25, 40);
EXEC PRC_ALLOT_INSERT('OS10004', 30, 40, 30);
EXEC PRC_ALLOT_INSERT('OS10005', 25, 25, 50);
EXEC PRC_ALLOT_INSERT('OS10006', 40, 40, 20);
EXEC PRC_ALLOT_INSERT('OS10007', 30, 25, 45);
EXEC PRC_ALLOT_INSERT('OS10008', 40, 50, 10);
EXEC PRC_ALLOT_INSERT('OS10009', 35, 35, 30);
EXEC PRC_ALLOT_INSERT('OS10010', 55, 25, 20);
EXEC PRC_ALLOT_INSERT('OS10011', 20, 20, 60);
EXEC PRC_ALLOT_INSERT('OS10012', 20, 40, 40);
EXEC PRC_ALLOT_INSERT('OS10013', 10, 45, 45);


EXEC PRC_OP_SUBJECTS_INSERT('SU10001', 'OC10005', 'PR10016', '18/06/11', '18/09/12', 'BO10006');
EXEC PRC_OP_SUBJECTS_INSERT('SU10004', 'OC10005', 'PR10016', '18/09/13', '18/12/21', 'BO10007');
EXEC PRC_OP_SUBJECTS_INSERT('SU10001', 'OC10001', 'PR10002', '19/03/21', '19/05/21', 'BO10001');
EXEC PRC_OP_SUBJECTS_INSERT('SU10002', 'OC10001', 'PR10001', '19/05/22', '19/07/30', 'BO10004');
EXEC PRC_OP_SUBJECTS_INSERT('SU10003', 'OC10001', 'PR10001', '19/08/01', '19/09/21', 'BO10003');
EXEC PRC_OP_SUBJECTS_INSERT('SU10003', 'OC10002', 'PR10002', '19/10/02', '19/11/24', 'BO10003');
EXEC PRC_OP_SUBJECTS_INSERT('SU10002', 'OC10002', 'PR10004', '19/07/22', '19/10/01', 'BO10002');
EXEC PRC_OP_SUBJECTS_INSERT('SU10001', 'OC10002', 'PR10003', '19/05/21', '19/07/21', 'BO10001');
EXEC PRC_OP_SUBJECTS_INSERT('SU10004', 'OC10003', 'PR10003', '18/12/26', '19/02/10', 'BO10005');
EXEC PRC_OP_SUBJECTS_INSERT('SU10002', 'OC10003', 'PR10003', '19/02/11', '19/04/11', 'BO10004');
EXEC PRC_OP_SUBJECTS_INSERT('SU10004', 'OC10003', 'PR10003', '18/12/26', '19/02/10', 'BO10005');
EXEC PRC_OP_SUBJECTS_INSERT('SU10001', 'OC10004', 'PR10003', '19/02/11', '19/04/11', 'BO10001');
EXEC PRC_OP_SUBJECTS_INSERT('SU10002', 'OC10004', 'PR10004', '19/04/12', '19/06/12', 'BO10002');
EXEC PRC_OP_SUBJECTS_INSERT('SU10005', 'OC10004', 'PR10018', '19/06/13', '19/07/18', 'BO10004');
EXEC PRC_OP_SUBJECTS_INSERT('SU10002', 'OC10005', 'PR10001', '18/07/11', '18/08/11', 'BO10006');


SELECT * 
FROM ALL_SOURCE
WHERE NAME = 'PRC_OP_SUBJECTS_INSERT';
"( V_SUBJECT_CODE        IN TBL_SUBJECTS.SUBJECT_CODE%TYPE
"
", V_OP_COURSE_CODE      IN TBL_OP_COURSES.OP_COURSE_CODE%TYPE
"
", V_PRO_CODE            IN TBL_PROFESSORS.PRO_CODE%TYPE
"
", V_START_DATE          IN TBL_OP_SUBJECTS.START_DATE%TYPE
"
", V_END_DATE            IN TBL_OP_SUBJECTS.START_DATE%TYPE
"
", V_BOOK_CODE           IN TBL_BOOKS.BOOK_CODE%TYPE
"

SELECT *
FROM TBL_CLASSROOM;
CL10007	D106	풍성관A 1층	30
CL10001	A101	북악관A 1층	50
CL10002	A205	북악관A 2층	50
CL10003	B205	경상관B 2층	40
CL10004	C805	예술관C 8층	45
CL10005	F105	복지관F 1층	80
CL10006	D106	풍성관A 1층	30

SELECT * 
FROM TBL_OP_COURSES;

SELECT * 
FROM ALL_SOURCE
WHERE NAME = 'PRC_CLASSROOM_INSERT';
