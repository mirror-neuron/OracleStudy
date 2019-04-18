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
EXEC PRC_PROFESSORS_INSERT ('김미영', '901009-2234567', '010-1567-1578', '2019-01-19');
EXEC PRC_PROFESSORS_INSERT ('이선율', '790312-2845651', '010-2548-1117', '2017-02-01');
EXEC PRC_PROFESSORS_INSERT ('정해인', '871111-1845125', '010-4874-2451', '2018-12-31');
EXEC PRC_PROFESSORS_INSERT ('전병곤', '807865-1335845', '010-2156-9494', '2019-03-01');

-- 커밋
COMMIT;
--==>> 커밋완료



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
             THEN '강의진행중' ELSE '강의준비중' END) "강의진행여부"
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
