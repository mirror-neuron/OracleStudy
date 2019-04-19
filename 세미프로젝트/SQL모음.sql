/*------------------------------------------------
■■■■■ 강의가능과목 테이블(TBL_PRO_SUB)■■■■■
---------------------------------------------------
PRO_SUB_CODE              -   강의가능과목 코드 (PRIMARY KEY)
PRO_CODE                  -   교수코드 (FOREGIN KEY : TBL_PROFESSORS) 
SUBJECT_CODE              -   과목코드 (FOREGIN KEY : TBL_SUBJECTS) 
*/

CREATE TABLE TBL_PRO_SUB
( PRO_SUB_CODE VARCHAR2(10)
, PRO_CODE  VARCHAR2(10)
, SUBJECT_CODE  VARCHAR2(10)
, CONSTRAINT PSB_PRO_SUB_CODE_PR PRIMARY KEY(PRO_SUB_CODE)
);

ALTER TABLE TBL_PRO_SUB
ADD (
    CONSTRAINT TBL_PRO_SUB_PRO_CODE_FK FOREIGN KEY(PRO_CODE) REFERENCES TBL_PROFESSORS(PRO_CODE)
,   CONSTRAINT TBL_PRO_SUB_SUBJECT_CODE_FK FOREIGN KEY(SUBJECT_CODE) REFERENCES TBL_SUBJECTS(SUBJECT_CODE)
);

/*------------------------------------------------
■■■■■ 배점 테이블(TBL_ALLOT)■■■■■
---------------------------------------------------
ALLOT_CODE              -   과목코드 (PRIMARY KEY)
OP_SUBJECT_CODE         -   개설과목코드 (FOREGIN KEY : TBL_OP_SUBJECTS) 
POINT_CODE               -   시험분류코드 (FOREGIN KEY : TBL_POINT_TYPE) 
ALLOT                   -   배점 (NOT NULL)
*/

CREATE TABLE TBL_ALLOT
(   ALLOT_CODE    VARCHAR2(10) 
,   OP_SUBJECT_CODE VARCHAR2(10)
,   POINT_CODE   VARCHAR2(10)
,   ALLOT   NUMBER(5,2) CONSTRAINT AL_ALLOT NOT NULL
,   CONSTRAINT AL_ALLOT_CODE_PK PRIMARY KEY(ALLOT_CODE)
);


ALTER TABLE TBL_ALLOT
ADD (
   CONSTRAINT ALLOT_OP_SUBJECT_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE) REFERENCES TBL_OP_SUBJECTS(OP_SUBJECT_CODE)
,  CONSTRAINT ALLOT_POINT_CODE_FK FOREIGN KEY(POINT_CODE) REFERENCES TBL_POINT_TYPE(POINT_CODE)
);

/*------------------------------------------------
■■■■■ 강의실 테이블(TBL_CLASSROOM)■■■■■
---------------------------------------------------
CLR_CODE    -   강의실코드 (PRIMARY KEY)
NAME        -   강의실명 (NOT NULL) 
CAPACITY    -   수용인원 (NOT NULL)
LOCATION    -   위치
*/

CREATE TABLE TBL_CLASSROOM
(   CLR_CODE    VARCHAR2(10)  
,   NAME        VARCHAR2(20) CONSTRAINT CLASSROOM_NAME_NN NOT NULL
,   LOCATION    VARCHAR2(20) 
,   CAPACITY    NUMBER(3) CONSTRAINT CLASSROOM_CAPACITY_NN NOT NULL
,   CONSTRAINT CLASSROOM_CLR_CODE_PK PRIMARY KEY(CLR_CODE)
);

/*------------------------------------------------
■■■■■ 수강신청 테이블(TBL_COU_REGIST)■■■■■
---------------------------------------------------
REGIST_CODE     -   수강신청코드 (PRIMANRY KEY)
STU_CODE        -   학생코드    (FOREGIN KEY : TBL_STUDENTS) 
OP_COURSE_CODE  -   개설과정코드 (FOREGIN KEY : TBL_OP_COURSES) 
REGIST_DATE     -   수강신청일   (NOT NULL)
*/
CREATE TABLE TBL_COU_REGIST
(   REGIST_CODE VARCHAR2(10)
,   STU_CODE   VARCHAR2(10) 
,   OP_COURSE_CODE  VARCHAR2(10) 
,   REGIST_DATE   DATE CONSTRAINT COU_REG_REGIST_DATE NOT NULL
,   CONSTRAINT COU_REG_REGIST_COD_PK PRIMARY KEY(REGIST_CODE)
);



ALTER TABLE TBL_COU_REGIST
ADD (
    CONSTRAINT COU_REG_STU_CODE_FK FOREIGN KEY(STU_CODE) REFERENCES TBL_STUDENTS(STU_CODE)
,   CONSTRAINT COU_REG_OP_COURSE_CODE_FK FOREIGN KEY(OP_COURSE_CODE) REFERENCES TBL_OP_COURSES(OP_COURSE_CODE)
);

==========================================================
■■■■■■ 포기사유 테이블 ■■■■■■■
====================================================
--○ 포기사유 테이블(TBL_QUIT_REASON) 생성 및 PRIMARY KEY 추가
CREATE TABLE TBL_QUIT_REASON
( REASON_CODE   VARCHAR2(10)                                                    
, REASON        VARCHAR2(30)     CONSTRAINT QUIT_REASON_REASON_NN NOT NULL       
, CONSTRAINT QUIT_REASON_REASON_CODE_PK PRIMARY KEY(REASON_CODE)
);

==========================================================
■■■■■■ 중도포기 테이블 ■■■■■■■
====================================================

--○ 중도포기 테이블(TBL_QUIT) 생성 및 PRIMARY KEY 추가
CREATE TABLE TBL_QUIT
( QUIT_CODE     VARCHAR2(10)
, REGIST_CODE   VARCHAR2(10)
, QUIT_DATE     DATE DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(10)    CONSTRAINT QUIT_REASON_CODE_NN NOT NULL
, CONSTRAINT QUIT_QUIT_CODE_PK PRIMARY KEY(QUIT_CODE)
);

--○ 중도포기 테이블(TBL_QUIT) 제약조건 생성
ALTER TABLE TBL_QUIT
ADD ( CONSTRAINT QUIT_REGIST_CODE_FK FOREIGN KEY(REGIST_CODE) REFERENCES TBL_COU_REGIST(REGIST_CODE)
    , CONSTRAINT QUIT_REASON_CODE_FK FOREIGN KEY(REASON_CODE) REFERENCES TBL_QUIT_REASON(REASON_CODE));

==========================================================
■■■■■■ 성적목록 테이블 ■■■■■■■
==========================================================

--○ 성적 테이블(TBL_GRADE) 생성 및 PRIMARY KEY 추가
CREATE TABLE TBL_GRADE
( GRADE_CODE        VARCHAR2(10)
, REGIST_CODE       VARCHAR2(10)
, OP_SUBJECT_CODE   VARCHAR2(10)
, ATTEND            NUMBER(3)
, WRITE             NUMBER(3)
, PRACTICE          NUMBER(3)
, CONSTRAINT GRADE_GRADE_CODE_PK PRIMARY KEY(GRADE_CODE)
);

--○ 성적 테이블(TBL_GRADE) 제약조건 생성
ALTER TABLE TBL_GRADE
ADD ( CONSTRAINT GRADE_REGIST_CODE_FK FOREIGN KEY(REGIST_CODE) REFERENCES TBL_COU_REGIST(REGIST_CODE)
    , CONSTRAINT GRADE_OP_SUBJECT_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE) REFERENCES TBL_OP_SUBJECTS(OP_SUBJECT_CODE));
==========================================================
■■■■■■ 게시판 테이블 ■■■■■■■
==========================================================
--○ 게시판 테이블(TBL_BOARD) 생성 및 PRIMARY KEY 추가
CREATE TABLE TBL_BOARD
( SEQ_INDEX     NUMBER
, WRITE_ID      VARCHAR2(20)
, WRITE_DATE    DATE DEFAULT SYSDATE
, CONTENT       VARCHAR2(2000)
, VIEWS         NUMBER(6)   DEFAULT 0
, CONSTRAINT BOARD_SEQ_INDEX_PK PRIMARY KEY(SEQ_INDEX)
);

--○ 게시판 테이블(TLB_BOARD) 제약조건 생성
ALTER TABLE TBL_BOARD
ADD CONSTRAINT BOARD_WRITE_ID_FK FOREIGN KEY(WRITE_ID) REFERENCES TBL_IDPW(ID);

==========================================================
■■■■■■학생 테이블 생성■■■■■■
==========================================================
CREATE TABLE TBL_STUDENTS
( STU_CODE  VARCHAR2(10)
, NAME      VARCHAR2(30) CONSTRAINT STUDENTS_NAME_NN NOT NULL
, SSN       CHAR(14) CONSTRAINT STUDENTS_SSN_NN NOT NULL
, TEL       CHAR(20)
, SIGNDATE  DATE DEFAULT SYSDATE
, ID        VARCHAR2(20)
, CONSTRAINT STUDENTS_STU_CODE_PK PRIMARY KEY (STU_CODE)
);

-- 학생 테이블 제약조건 추가
ALTER TABLE TBL_STUDENTS
ADD CONSTRAINT STUDENTS_ID_FK FOREIGN KEY(ID) REFERENCES TBL_IDPW(ID);

ALTER TABLE TBL_STUDENTS
ADD CONSTRAINT STUDENTS_SSN_UK UNIQUE (SSN);

==========================================================
■■■■■■개설과정 테이블 생성 ■■■■■■
==========================================================

CREATE TABLE TBL_OP_COURSES
( OP_COURSE_CODE    VARCHAR2(10)    
, COURSE_CODE       VARCHAR2(10) CONSTRAINT COUTSES_COURSE_CODE_NN NOT NULL
, START_DATE        DATE
, END_DATE          DATE
, CLR_CODE          VARCHAR2(10)
, CONSTRAINT OP_COURSES_OP_COURSE_CODE_PK PRIMARY KEY (OP_COURSE_CODE)
);

-- 개설과정 제약조건 추가
ALTER TABLE TBL_OP_COURSES
ADD (CONSTRAINT COURSES_COURSE_CODE_FK FOREIGN KEY (COURSE_CODE) REFERENCES TBL_COURSES(COURSE_CODE)
    ,CONSTRAINT COURSES_CLR_CODE_FK FOREIGN KEY (CLR_CODE) REFERENCES TBL_CLASSROOM(CLR_CODE));

ALTER TABLE TBL_OP_COURSES
ADD CONSTRAINT OP_COURSES_DATE_CK CHECK (START_DATE < END_DATE);

==========================================================
■■■■■■개설과목 테이블 생성 ■■■■■■
==========================================================

-- 개설과목 테이블 생성
CREATE TABLE TBL_OP_SUBJECTS
( OP_SUBJECT_CODE   VARCHAR2(10)
, SUBJECT_CODE      VARCHAR2(10) CONSTRAINT OP_SUBJECTS_SUBJECT_CODE_NN NOT NULL
, OP_COURSE_CODE    VARCHAR2(10)
, PRO_CODE          VARCHAR2(10)
, START_DATE        DATE
, END_DATE          DATE
, BOOK_CODE         VARCHAR2(10)
, CONSTRAINT OP_SUBJECTS_OP_SUBJECT_CODE_PK PRIMARY KEY (OP_SUBJECT_CODE)
);


-- 개설과목 제약조건 추가
ALTER TABLE TBL_OP_SUBJECTS
ADD (CONSTRAINT OP_SUBJECTS_SUBJECT_CODE_FK FOREIGN KEY (SUBJECT_CODE) REFERENCES TBL_SUBJECTS(SUBJECT_CODE)
    ,CONSTRAINT OP_SUBJECTS_OP_COURSE_CODE_FK FOREIGN KEY (OP_COURSE_CODE) REFERENCES TBL_OP_COURSES(OP_COURSE_CODE)
    ,CONSTRAINT OP_SUBJECTS_PRO_CODE_FK FOREIGN KEY (PRO_CODE) REFERENCES TBL_PROFESSORS(PRO_CODE)
    ,CONSTRAINT OP_SUBJECTS_BOOK_CODE_FK FOREIGN KEY (BOOK_CODE) REFERENCES TBL_BOOKS(BOOK_CODE));   
    
-- 개설과목(TBL_OP_SUBJECTS) 제약조건 추가
ALTER TABLE TBL_OP_SUBJECTS
ADD CONSTRAINT OP_SUBJECTS_DATE_CK CHECK (START_DATE < END_DATE);

==========================================================
■■■■■■평가종류 테이블 생성 ■■■■■■
==========================================================

-- 평가종류 테이블 생성
CREATE TABLE TBL_POINT_TYPE
( POINT_CODE    VARCHAR2(10)
, POINT         VARCHAR2(20)
, CONSTRAINT POINT_TYPE_POINT_CODE_PK PRIMARY KEY (POINT_CODE)
);


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

/*-----------------------------------------------------------------
■■■■■ 관리자 테이블(TBL_ADMIN) ■■■■■ 
-------------------------------------------------------------------*/
CREATE TABLE TBL_ADMIN
(ADMIN_CODE VARCHAR2(10)                    --관리자코드 PK
,ID         VARCHAR2(20)   CONSTRAINT TBL_ADMIN_NAME_NN NOT NULL --관리자ID (NOT NULL)제약 조건 설정 
,NAME       VARCHAR2(30)                    --이름 (NOT NULL)
,SIGNDATE   DATE DEFAULT SYSDATE            --등록일 (SYSDATE)
,CONSTRAINT ADMIN_ADMIN_CODE_PK PRIMARY KEY(ADMIN_CODE)   --관리자코드 PRIMARY KEY 제약조건 설정 
);

--○ TBL_관리자 - FOREIGN KEY 제약조건 추가
ALTER TABLE TBL_ADMIN
ADD CONSTRAINT ADMIN_ID_FK FOREIGN KEY(ID) 
                REFERENCES TBL_IDPW(ID); --ID FOREIGN KEY 제약조건 추가


----------------------------------------------
■■■■■  TBL_IDPW 생성 ■■■■■ 
------------------------------------------------
CREATE TABLE TBL_IDPW
(ID VARCHAR2(20)                            --ID  PK
,PW VARCHAR2(30)  CONSTRAINT IDPW_PW_NN NOT NULL  --PW (NOT NULL)제약 조건 설정          
,GROUP_CODE CHAR(2) CONSTRAINT IDPW_GROUP_CODE_NN NOT NULL  --분류코드 (NOT NULL)제약 조건 설정  
,CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)      ----ID PRIMARY KEY 제약조건 설정 
);

-- ○ TBL_IDPW-- 제약조건 추가 
ALTER TABLE TBL_IDPW
ADD CONSTRAINT IDPW_GROUP_CODE_FK FOREIGN KEY(GROUP_CODE) 
                REFERENCES TBL_GROUP(GROUP_CODE); -- FOREIGN KEY 제약조건 추가


--------------------------------------------------
	■■■■■ 권한 생성 ■■■■■
-------------------------------------------------
CREATE TABLE TBL_GROUP
(GROUP_CODE CHAR(2)                         --분류코드 PK
,NAME       VARCHAR2(20)  CONSTRAINT GROUP_NAME_NN NOT NULL -- 분류명 (NOT NULL)제약 조건 설정
,CONSTRAINT GROUP_GROUP_CODE_PK PRIMARY KEY(GROUP_CODE)  
);

--------------------------------------------------
■■■■■ TBL_교수 생성 ■■■■■
------------------------------------------------
CREATE TABLE TBL_PROFESSORS
(PRO_CODE       VARCHAR2(20)                --교수코드   PK
,NAME           VARCHAR2(20) CONSTRAINT PROFESSORS_NAME_NN NOT NULL -- 교수명 (NOT NULL)제약 조건 설정
,SSN            CHAR(14)     CONSTRAINT PROFESSORS_SSN_NN NOT NULL -- 주민등록번호 (NOT NULL)제약 조건 설정
,TEL            CHAR(20)                    --전화번호
,SIGNDATE       DATE DEFAULT SYSDATE        --재직일 (SYSDATE)
,ID             VARCHAR2(20)                --교수ID
,CONSTRAINT PROFESSORS_PRO_CODE_PK PRIMARY KEY(PRO_CODE) --교수코드 PRIMARY KEY 
);


--○TBL_교수  제약조건 추가 
ALTER TABLE TBL_PROFESSORS
ADD CONSTRAINT PROFESSORS_ID_FK FOREIGN KEY(ID) 
                REFERENCES TBL_IDPW(ID); --ID FOREIGN KEY 제약조건 추가

ALTER TABLE TBL_PROFESSORS
ADD CONSTRAINT PROFESSORS_SSN_UK UNIQUE(SSN);