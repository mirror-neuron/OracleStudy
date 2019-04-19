
====================================================
■■■■■ 수강신청 프로시저 ■■■■■
===================================================

CREATE OR REPLACE PROCEDURE PRC_COU_REGIST_INSERT
( V_STU_CODE          IN TBL_STUDENTS.STU_CODE%TYPE				--	학생코드
, V_OP_COURSE_CODE    IN TBL_OP_COURSES.OP_COURSE_CODE%TYPE		--	개강강좌코드
, V_REGIST_DATE       IN TBL_COU_REGIST.REGIST_DATE%TYPE		--	등록 일자
)
IS
    CURSOR CUR_REGIST_SELECT
    IS
    SELECT OP_SUBJECT_CODE
    FROM TBL_OP_SUBJECTS
    WHERE OP_COURSE_CODE = V_OP_COURSE_CODE;
    
    V_REGIST_CODE       TBL_COU_REGIST.REGIST_CODE%TYPE;
    V_OP_SUBJECT_CODE   TBL_OP_SUBJECTS.OP_SUBJECT_CODE%TYPE;
    
BEGIN
	-- 학생코드,개강강좌코드,등록일자를 조합한 수강신청 테이블 값 입력
    V_REGIST_CODE := CONCAT('CR',TO_CHAR(SEQ_COU_REGIST.NEXTVAL));

    INSERT INTO TBL_COU_REGIST VALUES(V_REGIST_CODE, V_STU_CODE, V_OP_COURSE_CODE, V_REGIST_DATE);
    
    
    OPEN CUR_REGIST_SELECT;
    LOOP
        FETCH CUR_REGIST_SELECT INTO V_OP_SUBJECT_CODE;
        
        EXIT WHEN CUR_REGIST_SELECT%NOTFOUND;
        
        INSERT INTO TBL_GRADE VALUES(CONCAT('GR',TO_CHAR(SEQ_GRADE.NEXTVAL)),V_REGIST_CODE, V_OP_SUBJECT_CODE,NULL,NULL,NULL);
        
        
    END LOOP;
    CLOSE CUR_REGIST_SELECT;
    
    EXCEPTION WHEN OTHERS THEN ROLLBACK;
    COMMIT;
    
    
END;


=============================================================================
	■■■ 개설과정 정보 입력 프로시저 ■■■
================================================================================

--○ 새로운 과정 입력시 이미 강의중인 과정의 강의실에는 배정이 되지 않게 하는 INSERT 프로시저

CREATE OR REPLACE PROCEDURE PRC_OP_COURSES_INSERT
( V_COURSE_CODE        IN TBL_COURSES.COURSE_CODE%TYPE
, V_START_DATE         IN TBL_OP_COURSES.START_DATE%TYPE
, V_END_DATE           IN TBL_OP_COURSES.END_DATE%TYPE
, V_CLR_CODE           IN TBL_CLASSROOM.CLR_CODE%TYPE
)
IS
    V_OLD_END_DATE      TBL_OP_COURSES.END_DATE%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;
    
    CURSOR CUR_CLR_CHECK
    IS
    SELECT END_DATE
    FROM TBL_OP_COURSES;
    
BEGIN

    OPEN CUR_CLR_CHECK;
    
    LOOP
        FETCH CUR_CLR_CHECK INTO V_OLD_END_DATE;
        
        EXIT WHEN CUR_CLR_CHECK%NOTFOUND;       
        
        IF (SYSDATE <= V_OLD_END_DATE)
        THEN RAISE USER_DEFINE_ERROR;
        
        
    END IF;
        
    END LOOP;
    
    CLOSE CUR_CLR_CHECK;
    

    INSERT INTO TBL_OP_COURSES
    VALUES (CONCAT('OC',TO_CHAR(SEQ_OP_COURSES.NEXTVAL)), V_COURSE_CODE, V_START_DATE, V_END_DATE,V_CLR_CODE);

    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, '현재 강의중인 과정의 강의실입니다.');
            ROLLBACK;   
        WHEN OTHERS
            THEN ROLLBACK;
END;

==========================================================================
	■■■■■ 과정 프로시저 ■■■■■
============================================================================
CREATE OR REPLACE PROCEDURE PRC_COURSES_INSERT
(
    V_NAME IN TBL_COURSES.NAME%TYPE		-- 과정명
) 
    IS
        V_COURSE_CODE  TBL_COURSES.COURSE_CODE%TYPE;  
        
    BEGIN
		--	과정 생성         
        V_COURSE_CODE := CONCAT('CO',TO_CHAR(SEQ_COURSES.NEXTVAL));        
        INSERT INTO TBL_COURSES (COURSE_CODE,NAME) VALUES (V_COURSE_CODE,V_NAME);  
        
        COMMIT;
        
    END;


===========================================================================
■■■■■■■ 강의실(TBL_CLASSROOM) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 강의실(TBL_CLASSROOM)    'CL'로 시작하는 시퀀스 강의실 코드 생성

CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_INSERT
( V_NAME             IN TBL_CLASSROOM.NAME%TYPE         -- 강의실명
, V_LOCATION         IN TBL_CLASSROOM.LOCATION%TYPE     -- 강의실위치
, V_CAPACITY         IN TBL_CLASSROOM.CAPACITY%TYPE     -- 수용인원
)
IS 
BEGIN
    -- 강의실 정보 입력 시 'CL'로 시작하는 시퀀스 강의실 코드 생성하며 데이터 입력됨
    INSERT INTO TBL_CLASSROOM(CLR_CODE, NAME, LOCATION, CAPACITY)
    VALUES(CONCAT('CL', TO_CHAR(SEQ_CLASSROOM.NEXTVAL)), V_NAME, V_LOCATION, V_CAPACITY);
    
    COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_INSERT이(가) 컴파일되었습니다.

========================================================
■■■ 개설과목 정보 입력 프로시저 ■■■
==============================================================
-- PRC_OP_SUBJECTS_INSERT(V_SUBJECT_CODE,V_OP_COURSE_CODE,V_PRO_CODE,V_START_DATE,V_END_DATE,V_BOOK_CODE)
-- 과목의 날짜가 겹치면 입력 안되는거 
-- 개설과목 인서트 프로시저 


CREATE OR REPLACE PROCEDURE PRC_OP_SUBJECTS_INSERT
( V_SUBJECT_CODE        IN TBL_SUBJECTS.SUBJECT_CODE%TYPE
, V_OP_COURSE_CODE      IN TBL_OP_COURSES.OP_COURSE_CODE%TYPE
, V_PRO_CODE            IN TBL_PROFESSORS.PRO_CODE%TYPE
, V_START_DATE          IN TBL_OP_SUBJECTS.START_DATE%TYPE
, V_END_DATE            IN TBL_OP_SUBJECTS.START_DATE%TYPE
, V_BOOK_CODE           IN TBL_BOOKS.BOOK_CODE%TYPE
)
IS
    USER_DEFINE_ERROR    EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION; 
    V_CHECK_SUBJECT_CODE    TBL_PROFESSORS.PRO_CODE%TYPE;
    
    CURSOR CUR_CHECK_SUBJECT_CODE
    IS
    SELECT SUBJECT_CODE  
    FROM TBL_PRO_SUB 
    WHERE PRO_CODE=V_PRO_CODE;
    
    V_DATE_CHECK NUMBER(20); --- 겹치는 날짜 체크용 카운트 변수 -- 과목 
    V_DATE_COURSE_CHECK NUMBER(20); -- 과정안에 날짜인지  체크~ 변수 
    
BEGIN
    ------------ 겹치는 날짜 체크 -- 과목 
    SELECT COUNT(*) INTO V_DATE_CHECK
    FROM TBL_OP_SUBJECTS
    WHERE (START_DATE  BETWEEN V_START_DATE AND V_END_DATE) AND (END_DATE  BETWEEN V_START_DATE AND V_END_DATE)
          AND PRO_CODE=V_PRO_CODE;
    --------------과정안에 날짜가 포함되어있어야함  
  

   SELECT  COUNT(*) INTO V_DATE_COURSE_CHECK            
   FROM  (SELECT START_DATE,END_DATE        
         FROM TBL_OP_COURSES      
         WHERE OP_COURSE_CODE = V_OP_COURSE_CODE)
   WHERE (V_START_DATE BETWEEN START_DATE AND END_DATE) AND  (V_END_DATE BETWEEN START_DATE AND END_DATE);
    
    
    IF( V_DATE_CHECK ^= 0   )
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF(V_DATE_COURSE_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    


    OPEN CUR_CHECK_SUBJECT_CODE;
        LOOP
            FETCH CUR_CHECK_SUBJECT_CODE INTO V_CHECK_SUBJECT_CODE;
            
                IF(V_SUBJECT_CODE  IN(V_CHECK_SUBJECT_CODE))
                    THEN INSERT INTO TBL_OP_SUBJECTS
                         VALUES (CONCAT('OS',TO_CHAR(SEQ_OP_SUBJECTS.NEXTVAL)), V_SUBJECT_CODE, V_OP_COURSE_CODE, V_PRO_CODE, V_START_DATE, V_END_DATE, V_BOOK_CODE);
                         
               -- ELSIF(V_SUBJECT_CODE NOT IN(V_CHECK_SUBJECT_CODE))
               --     THEN RAISE USER_DEFINE_ERROR;
                END IF;
            
            EXIT WHEN CUR_CHECK_SUBJECT_CODE%NOTFOUND;
        
        END LOOP;
    
    CLOSE CUR_CHECK_SUBJECT_CODE;
    
    -- 예외처리
    EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20056,'입력한 날짜가 기존 과목 날짜와 겹칩니다 다시 시도하세요');    -- RAISE_APPLICATION_ERROR(-에러번호,'구문' )는 함수!
                     ROLLBACK;
            WHEN USER_DEFINE_ERROR2   
                THEN RAISE_APPLICATION_ERROR(-20057,'입력한 날짜가 기존 개설강좌 날짜 안에 유효하지 않습니다.');
           WHEN OTHERS   --- IF ELSIF ELSE 구문에서 ELSE 느낌~ 
                THEN ROLLBACK;
     COMMIT;
END;
==================================================
	■■■■■ 과목 프로시저 ■■■■■
==================================================
CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_INSERT
(
    V_NAME IN TBL_SUBJECTS.NAME%TYPE			-- 과목명
) 
    IS
        V_SUBJECT_CODE  TBL_SUBJECTS.SUBJECT_CODE%TYPE;  
        
    BEGIN
        -- 과목 생성
        V_SUBJECT_CODE := CONCAT('SU',TO_CHAR(SEQ_SUBJECTS.NEXTVAL));        
        INSERT INTO TBL_SUBJECTS (SUBJECT_CODE,NAME) VALUES (V_SUBJECT_CODE,V_NAME);  
        
        COMMIT;
        
    END;

==================================================
■■■■■ 교수 강의가능과목 프로시저 ■■■■■
==================================================
CREATE OR REPLACE PROCEDURE PRC_PRO_SUB_INSERT
(
    V_PRO_CODE IN TBL_PRO_SUB.pro_code%TYPE				-- 교수코드
,   V_SUBJECT_CODE IN TBL_PRO_SUB.subject_code%TYPE		--	과목코드


) 
    IS
        V_PRO_SUB_CODE tbl_pro_sub.pro_sub_code%TYPE;  
        
    BEGIN
       -- 교수와 과목코드를 조합한 강의가능과목 테이블값 입력
        V_PRO_SUB_CODE := CONCAT('PS',TO_CHAR(SEQ_PRO_SUB.NEXTVAL));        
        INSERT INTO TBL_PRO_SUB (pro_sub_code,pro_code,subject_code) VALUES (V_PRO_SUB_CODE,V_PRO_CODE,V_SUBJECT_CODE);  
        
        COMMIT;
        
    END;

=============================================================
		■■■ 중도포기 정보 입력 프로시저 ■■■
============================================================
CREATE OR REPLACE PROCEDURE PRC_QUIT_INSERT
( V_REGIST_CODE      IN TBL_QUIT.REGIST_CODE%TYPE
, V_QUIT_DATE        IN TBL_QUIT.QUIT_DATE%TYPE
, V_REASON_CODE      IN TBL_QUIT.REASON_CODE%TYPE 
)
IS  
    CURSOR CUR_QUIT_CHECK
    IS
    SELECT GRADE_CODE
    FROM TBL_GRADE
    WHERE OP_SUBJECT_CODE IN (SELECT OP_SUBJECT_CODE
                              FROM TBL_OP_SUBJECTS
                              WHERE END_DATE > V_QUIT_DATE)
      AND REGIST_CODE = V_REGIST_CODE;

    V_GRADE_CODE    TBL_GRADE.GRADE_CODE%TYPE;
    
BEGIN
    
    INSERT INTO TBL_QUIT(QUIT_CODE,REGIST_CODE,QUIT_DATE,REASON_CODE)
                VALUES(CONCAT('QU',TO_CHAR(SEQ_QUIT.NEXTVAL)),V_REGIST_CODE,V_QUIT_DATE,V_REASON_CODE);
    
    OPEN CUR_QUIT_CHECK;
    
    LOOP
        FETCH CUR_QUIT_CHECK INTO V_GRADE_CODE;
        
        EXIT WHEN CUR_QUIT_CHECK%NOTFOUND;       
        
        DELETE
        FROM TBL_GRADE
        WHERE GRADE_CODE = V_GRADE_CODE;
        
    END LOOP;
    
    CLOSE CUR_QUIT_CHECK;
    
    COMMIT;
    
END;
======================================================
■■■■■ 중도포기 수정 ■■■■■■
====================================================
CREATE OR REPLACE PROCEDURE PRC_QUIT_UPDATE
(V_QUIT_CODE   IN TBL_QUIT.QUIT_CODE%TYPE
,V_REGIST_CODE IN TBL_QUIT.REGIST_CODE%TYPE
,V_QUIT_DATE   IN TBL_QUIT.QUIT_DATE%TYPE     
,V_REASON_CODE IN TBL_QUIT.REASON_CODE%TYPE
)
IS
BEGIN
    UPDATE TBL_QUIT
    SET REGIST_CODE=V_REGIST_CODE,   QUIT_DATE=V_QUIT_DATE,   REASON_CODE=V_REASON_CODE
    WHERE QUIT_CODE=V_QUIT_CODE;
    COMMIT;
END;

============================================
■■■■■ 교재 프로시저 ■■■■■
==============================================
CREATE OR REPLACE PROCEDURE PRC_BOOKS_INSERT
(
    V_NAME IN TBL_BOOKS.NAME%TYPE
,   V_AUTHOR IN TBL_BOOKS.AUTHOR%TYPE
) 
    IS
        V_BOOK_CODE  TBL_BOOKS.BOOK_CODE%TYPE;  
        
    BEGIN
        -- 교재 생성
        V_BOOK_CODE := CONCAT('BO',TO_CHAR(SEQ_BOOKS.NEXTVAL));        
        INSERT INTO TBL_BOOKS (BOOK_CODE,NAME,AUTHOR) VALUES (V_BOOK_CODE,V_NAME,V_AUTHOR);  
        
        COMMIT;
        
    END;


===========================================================================
■■■■■■■ 평가종류(TBL_POINT_TYPE) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 평가종류(TBL_POINT_TYPE) 'PT'로 시작하는 시퀀스 평가종류 코드 생성

CREATE OR REPLACE PROCEDURE PRC_POINT_TYPE_INSERT
( V_POINT   IN TBL_POINT_TYPE.POINT%TYPE    -- 평가종류명
)
IS
BEGIN
    -- 평가종류명 입력 시 'PT'로 시작하는 시퀀스 평가종류 코드 생성하며 데이터 입력됨
    INSERT INTO TBL_POINT_TYPE(POINT_CODE, POINT)
    VALUES(CONCAT('PT', TO_CHAR(SEQ_POINT_TYPE.NEXTVAL)), V_POINT);
    
    COMMIT;
    
END;
===========================================================================
■■■■■■■ 배점(TBL_ALLOT) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 배점(TBL_ALLOT)          'AL'로 시작하는 시퀀스 배점 코드 생성

CREATE OR REPLACE PROCEDURE PRC_ALLOT_INSERT
( V_OP_SUBJECT_CODE     IN TBL_ALLOT.OP_SUBJECT_CODE%TYPE   -- 개설과목코드
, V_ALLOT1              IN TBL_ALLOT.ALLOT%TYPE             -- 배점1(출결)
, V_ALLOT2              IN TBL_ALLOT.ALLOT%TYPE             -- 배점2(필기)
, V_ALLOT3              IN TBL_ALLOT.ALLOT%TYPE             -- 배점3(실기)
)
IS 
    -- 사용자 정의 예외처리 변수 선언
    USER_DEFINE_ERROR EXCEPTION;  
BEGIN 
    -- 각 배점의 총합이 100이 아니면 에러 발생
    IF (V_ALLOT1 + V_ALLOT2 + V_ALLOT3 != 100)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 각각의 배점 입력 시 'AL'로 시작하는 시퀀스 배점 코드 생성하며 데이터 입력됨
    INSERT INTO TBL_ALLOT(ALLOT_CODE, OP_SUBJECT_CODE, POINT_CODE, ALLOT)
    VALUES(CONCAT('AL',TO_CHAR(SEQ_ALLOT.NEXTVAL)), V_OP_SUBJECT_CODE, 'PT10001', V_ALLOT1);
    
    INSERT INTO TBL_ALLOT(ALLOT_CODE, OP_SUBJECT_CODE, POINT_CODE, ALLOT)
    VALUES(CONCAT('AL',TO_CHAR(SEQ_ALLOT.NEXTVAL)), V_OP_SUBJECT_CODE, 'PT10002', V_ALLOT2);
    
    INSERT INTO TBL_ALLOT(ALLOT_CODE, OP_SUBJECT_CODE, POINT_CODE, ALLOT)
    VALUES(CONCAT('AL',TO_CHAR(SEQ_ALLOT.NEXTVAL)), V_OP_SUBJECT_CODE, 'PT10003', V_ALLOT3);
    
    COMMIT;
    
    -- 에러 발생 시 아래 메시지 출력 후 롤백됨
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, '총 배점은 100점 만점을 기준으로 입력 가능합니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--==>> Procedure PRC_ALLOT_INSERT이(가) 컴파일되었습니다.

===========================================================================
■■■■■■■ 시험종류(TBL_TEST_TYPE) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 시험종류(TBL_TEST_TYPE)  'TT'로 시작하는 시퀀스 시험종류 생성
*/
CREATE OR REPLACE PROCEDURE PRC_TEST_TYPE_INSERT
( V_NAME   IN TBL_TEST_TYPE.NAME%TYPE       -- 시험종류명
)
IS
BEGIN
    -- 시험종류 데이터 입력 시 'TT'로 시작하는 시퀀스 시험종류 생성
    INSERT INTO TBL_TEST_TYPE(TEST_CODE, NAME)
    VALUES(CONCAT('TT', TO_CHAR(SEQ_TEST_TYPE.NEXTVAL)), V_NAME);
    
    COMMIT;
    
END;

===========================================================================
■■■■■■■ 시험(TBL_EXAMS) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
CREATE OR REPLACE PROCEDURE PRC_EXAMS_INSERT
( V_OP_SUBJECT_CODE     IN TBL_EXAMS.OP_SUBJECT_CODE%TYPE
, V_TEST_CODE           IN TBL_EXAMS.TEST_CODE%TYPE
, V_TIME_LIMITE         IN TBL_EXAMS.TIME_LIMITE%TYPE
)
IS 
  V_EXAM_DATE            TBL_EXAMS.EXAM_DATE%TYPE;
  
BEGIN
            SELECT END_DATE INTO V_EXAM_DATE  -- 개설과목에서 종료일 받아와서 변수에 저장!! 
            FROM TBL_OP_SUBJECTS        
            WHERE OP_SUBJECT_CODE = V_OP_SUBJECT_CODE;
    
    INSERT INTO TBL_EXAMS(EXAM_CODE, OP_SUBJECT_CODE, TEST_CODE, EXAM_DATE, TIME_LIMITE)
    VALUES(CONCAT('EX', TO_CHAR(SEQ_EXAMS.NEXTVAL)), V_OP_SUBJECT_CODE, V_TEST_CODE, V_EXAM_DATE, V_TIME_LIMITE);

    COMMIT;
END;


================================================
■■■■■■로그인 프로시저 생성■■■■■■■■
==================================================
CREATE OR REPLACE PROCEDURE PRC_LOGIN
( V_ID    IN TBL_IDPW.ID%TYPE
, V_PW    IN TBL_IDPW.PW%TYPE
)
IS
    V_PWTEMP            TBL_IDPW.PW%TYPE;			--  PW변수
    V_GROUP_CODE        TBL_IDPW.GROUP_CODE%TYPE;	--  권한변수
    V_IDENTITY          VARCHAR2(10);				--  학생코드변수
    V_APS_NAME          VARCHAR2(30);				--	이름변수
    USER_DEFINE_ERROR   EXCEPTION;					--  유저생성 에러변수
BEGIN    
    SELECT PW INTO V_PWTEMP
    FROM TBL_IDPW
    WHERE ID = V_ID;
    
    SELECT GROUP_CODE INTO V_GROUP_CODE
    FROM TBL_IDPW
    WHERE ID = V_ID;
    
	-- 비밀번호 부합시 에러발생
    IF (V_PW != V_PWTEMP)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    IF(V_GROUP_CODE = 'S') -- 학생
        THEN SELECT STU_CODE, NAME INTO V_IDENTITY, V_APS_NAME
             FROM TBL_STUDENTS
             WHERE ID = V_ID;   
             
             DBMS_OUTPUT.PUT_LINE(V_APS_NAME||' 님 어서오세요');                         
                         
                             
    ELSIF (V_GROUP_CODE = 'P') -- 교수
        THEN SELECT PRO_CODE, NAME INTO V_IDENTITY, V_APS_NAME
             FROM TBL_PROFESSORS
             WHERE ID = V_ID;
             
             DBMS_OUTPUT.PUT_LINE(V_APS_NAME||' 교수님 어서오세요');
             
             
             
    ELSIF (V_GROUP_CODE = 'A') -- 관리자
        THEN SELECT ADMIN_CODE, NAME INTO V_IDENTITY, V_APS_NAME
             FROM TBL_ADMIN
             WHERE ID = V_ID;
             
             DBMS_OUTPUT.PUT_LINE(V_APS_NAME||' 관리자님 어서오세요');
    END IF;
    
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20007,'아이디 또는 패스워드를 잘못 입력하였습니다.');
            WHEN NO_DATA_FOUND
                THEN RAISE_APPLICATION_ERROR(-20007,'아이디 또는 패스워드를 잘못 입력하였습니다.');
END;

======================================================
■■■■중도포기 과정의 이름을 반환하는 함수 ■■■■
=====================================================
CREATE OR REPLACE FUNCTION FN_QUIT_COURSE_NAME
(   V_QUIT_CODE   IN TBL_QUIT.QUIT_CODE%TYPE
)
RETURN VARCHAR2
IS
    RESULT  VARCHAR2(30);
BEGIN

    SELECT NAME INTO RESULT
    FROM TBL_QUIT QU JOIN TBL_COU_REGIST RE
    ON QU.REGIST_CODE = RE.REGIST_CODE
        JOIN TBL_OP_COURSES CO
        ON RE.OP_COURSE_CODE = CO.OP_COURSE_CODE
            JOIN TBL_COURSES COU
            ON CO.COURSE_CODE = COU.COURSE_CODE
    WHERE QU.QUIT_CODE = V_QUIT_CODE;
    
    RETURN RESULT;
    
END;

==========================================================
■■■■■■■■ 권한테이블  ■■■■■■■■■■■■
==========================================================
-- 권한 종류 생성
CREATE OR REPLACE PROCEDURE PRC_GROUP_INSERT
(V_GROUP_CODE IN TBL_GROUP.GROUP_CODE%TYPE
,V_NAME IN TBL_GROUP.NAME%TYPE
)
IS
BEGIN
    INSERT INTO TBL_GROUP(GROUP_CODE, NAME) VALUES(V_GROUP_CODE,V_NAME);
    COMMIT;
END;

DESC TBL_GROUP;

--○ 분류 (GP) TBL_GROUP(PRC_GROUP_UPDATE)
CREATE OR REPLACE PROCEDURE PRC_GROUP_UPDATE
(V_GROUP_CODE IN  TBL_GROUP.GROUP_CODE%TYPE 
,V_NAME       IN  TBL_GROUP.NAME%TYPE
)
IS
BEGIN
    UPDATE TBL_GROUP
    SET    NAME=V_NAME
    WHERE GROUP_CODE=V_GROUP_CODE;
    COMMIT;
END;


===================================================
■■■■■■ 관리자 INSERT 프로시저 ■■■■■
=====================================================
CREATE OR REPLACE PROCEDURE PRC_ADMIN_INSERT
(V_NAME     IN TBL_ADMIN.NAME%TYPE				-- 이름
,V_SIGNDATE IN TBL_ADMIN.SIGNDATE%TYPE			-- 등록일
)
IS
    V_ID    TBL_ADMIN.ID%TYPE;
BEGIN
    
    INSERT INTO TBL_IDPW VALUES ('A'||TO_CHAR(SEQ_IDPW.NEXTVAL)||V_NAME, 'java006$' , 'A');  
    
    
    
    SELECT ID INTO V_ID
    FROM TBL_IDPW
    WHERE PW = 'java006$';
    
    
    INSERT INTO TBL_ADMIN VALUES(CONCAT('AD',TO_CHAR(SEQ_ADMIN.NEXTVAL)),V_ID,V_NAME,V_SIGNDATE);
    COMMIT;   
END;



--=-=>> Procedure PRC_ADMIN_INSERT이(가) 컴파일되었습니다.
=============================================================================
  ■■■■■■■ 학생 INSERT 프로시저 ■■■■■■■■
==========================================================================

PROCEDURE PRC_STUDENTS_INSERT
/*
	V_NAME		-	학생이름
	V_SSN		-	학생주민번호
	V_TEL		-	학생전화번호
	V_SIGNDATE	-	등록일	
*/

( V_NAME        IN TBL_STUDENTS.NAME%TYPE
, V_SSN         IN TBL_STUDENTS.SSN%TYPE
, V_TEL         IN TBL_STUDENTS.TEL%TYPE
, V_SIGNDATE    IN TBL_STUDENTS.SIGNDATE%TYPE
)



IS
/*
	V_ID						-	아이디 생성 변수
	V_FD_SSN					-	학생주민번호 입력 변수
	STUDENT_DEFINE_ERROR		-	에러 발생 변수
	
*/
    V_ID    TBL_STUDENTS.ID%TYPE;
    V_FD_SSN    TBL_STUDENTS.ssn%TYPE;
    STUDENT_DEFINE_ERROR   EXCEPTION;

BEGIN
	
	-- 학생 SSN SELECT 후 변수에 담는다 --
    SELECT SSN INTO V_FD_SSN
        FROM TBL_STUDENTS
        WHERE SSN=V_SSN;

	-- SSN이 중복될 경우 에러문구 발생 --
        IF (V_FD_SSN IS NOT NULL)

            THEN RAISE STUDENT_DEFINE_ERROR;   

        END IF;  



    EXCEPTION
		
		-- 주민번호 중복 에러 --

        WHEN STUDENT_DEFINE_ERROR

            THEN RAISE_APPLICATION_ERROR(-20004,'주민번호가 중복됩니다. 다시 입력하세요.');-- 하이픈+에러번호, 에러내용

            ROLLBACK;

		-- 주민번호가 중복되지 않을경우 에러 발생 --

        WHEN NO_DATA_FOUND 

            THEN 
				
				-- 새로운 아이디를 생성후 ID테이블에 등록 후 STUDENT 테이블에 학생정보 생성 및 ID 연결 --

                V_ID := ('S'||TO_CHAR(SEQ_IDPW.NEXTVAL)||V_NAME);

                INSERT INTO TBL_IDPW VALUES (V_ID, SUBSTR(V_SSN,8), 'S'); 

                INSERT INTO TBL_STUDENTS

                VALUES (CONCAT('ST',TO_CHAR(SEQ_STUDENTS.NEXTVAL)), V_NAME, V_SSN, V_TEL, V_SIGNDATE, V_ID);

                COMMIT;

END;

===============================================================================================
    ■■■■■■■ 교수 INSERT 프로시저 ■■■■■■■■
================================================================================================

PROCEDURE PRC_PROFESSORS_INSERT
/*
	V_NAME		-	교수이름
	V_SSN		-	교수주민번호
	V_TEL		-	교수전화번호
	V_SIGNDATE	-	등록일	
*/


( V_NAME        IN TBL_PROFESSORS.NAME%TYPE
, V_SSN         IN TBL_PROFESSORS.SSN%TYPE
, V_TEL         IN TBL_PROFESSORS.TEL%TYPE
, V_SIGNDATE    IN TBL_PROFESSORS.SIGNDATE%TYPE
)


/*
	V_ID						-	아이디 생성 변수
	V_FD_SSN					-	교수주민번호 입력 변수
	PROFESSOR_DEFINE_ERROR		-	에러 발생 변수
	
*/
IS    
    V_ID    TBL_PROFESSORS.ID%TYPE;
    V_FD_SSN    tbl_professors.ssn%TYPE;
    PROFESSOR_DEFINE_ERROR   EXCEPTION;

BEGIN

-- 교수 SSN SELECT 후 변수에 담는다 --
    SELECT SSN INTO V_FD_SSN
    FROM TBL_PROFESSORS
    WHERE SSN=V_SSN;


-- SSN이 중복될 경우 에러문구 발생 --
    IF (V_FD_SSN IS NOT NULL)

        THEN RAISE PROFESSOR_DEFINE_ERROR;   

    END IF;    



    EXCEPTION
	-- 주민번호 중복 에러 --
        WHEN PROFESSOR_DEFINE_ERROR

            THEN RAISE_APPLICATION_ERROR(-20004,'주민번호가 중복됩니다. 다시 입력하세요.');-- 하이픈+에러번호, 에러내용
            ROLLBACK;


	-- 주민번호가 중복되지 않을경우 에러 발생 --
        WHEN NO_DATA_FOUND 

            THEN               
	-- 새로운 아이디를 생성후 ID테이블에 등록 후 STUDENT 테이블에 학생정보 생성 및 ID 연결 --
               V_ID := 'P'||TO_CHAR(SEQ_IDPW.NEXTVAL)||V_NAME;
                INSERT INTO TBL_IDPW VALUES (V_ID, SUBSTR(V_SSN,8), 'P');             
                INSERT INTO TBL_PROFESSORS            
                VALUES (CONCAT('PR',TO_CHAR(SEQ_PROFESSORS.NEXTVAL)), V_NAME, V_SSN, V_TEL, V_SIGNDATE, V_ID);     

                COMMIT;       



END;


==============================================================
		■■■ 관리자 UPDATE 프로시저 ■■■
==================================================================
CREATE OR REPLACE PROCEDURE PRC_ADMIN_CHANGE
( V_NAME        IN TBL_ADMIN.NAME%TYPE
, V_SIGNDATE    IN TBL_ADMIN.SIGNDATE%TYPE
)
IS
    V_ID            TBL_IDPW.ID%TYPE;
    V_BEFORE_ID     TBL_IDPW.ID%TYPE;
BEGIN
    V_ID := ('A'||TO_CHAR(SEQ_IDPW.NEXTVAL)||V_NAME);
    
    SELECT ID INTO V_BEFORE_ID
    FROM TBL_IDPW
    WHERE SUBSTR(ID,1,1 )IN ('A');
    
    
    INSERT INTO TBL_IDPW VALUES(V_ID, 'JAVA006$','A');

    UPDATE TBL_ADMIN
    SET ID = V_ID, NAME = V_NAME, SIGNDATE = SYSDATE;

    DELETE
    FROM TBL_IDPW
    WHERE ID = V_BEFORE_ID;
    
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE PRC_ADMIN_UPDATE
(V_ADMIN_CODE IN TBL_ADMIN.ADMIN_CODE%TYPE
,V_ID         IN TBL_ADMIN.ID%TYPE
,V_NAME       IN TBL_ADMIN.NAME%TYPE
,V_SIGNDATE   IN TBL_ADMIN.SIGNDATE%TYPE
)
IS
BEGIN
    UPDATE TBL_ADMIN
    SET    ID=V_ID,    NAME=V_NAME,    SIGNDATE=V_SIGNDATE
    WHERE ADMIN_CODE = V_ADMIN_CODE;
    COMMIT;
END;
========================================================
	■■■ 교수자 UPDATE 프로시저 ■■■
========================================================
CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_CHANGE

( V_NAME        IN TBL_PROFESSORS.NAME%TYPE
, V_SSN         IN TBL_PROFESSORS.SSN%TYPE
, V_TEL         IN TBL_PROFESSORS.TEL%TYPE
, V_SIGNDATE    IN TBL_PROFESSORS.SIGNDATE%TYPE
, V_BEFORE_ID   IN TBL_IDPW.ID%TYPE
)
IS
    V_ID                TBL_IDPW.ID%TYPE;
    V_NEW_PRO_CODE      TBL_PROFESSORS.PRO_CODE%TYPE;
    V_BEFORE_PRO_CODE   TBL_PROFESSORS.PRO_CODE%TYPE;
BEGIN
    V_ID := ('P'||TO_CHAR(SEQ_IDPW.NEXTVAL)||V_NAME);
    V_NEW_PRO_CODE := CONCAT('PR',TO_CHAR(SEQ_PROFESSORS.NEXTVAL));
    
    SELECT PRO_CODE INTO V_BEFORE_PRO_CODE
    FROM TBL_PROFESSORS
    WHERE ID = V_BEFORE_ID;
    
    INSERT INTO TBL_IDPW VALUES (V_ID ,SUBSTR(V_SSN,8),'P');

    INSERT INTO TBL_PROFESSORS VALUES(V_NEW_PRO_CODE, V_NAME, V_SSN, V_TEL, V_SIGNDATE, V_ID);

    UPDATE TBL_OP_SUBJECTS
    SET PRO_CODE = V_NEW_PRO_CODE
    WHERE PRO_CODE = V_BEFORE_PRO_CODE;
    
    UPDATE TBL_PRO_SUB
    SET PRO_CODE = V_NEW_PRO_CODE
    WHERE PRO_CODE = V_BEFORE_PRO_CODE;
    
    DELETE
    FROM TBL_PROFESSORS
    WHERE ID = V_BEFORE_ID;
    
    COMMIT;
    
END;

===========================================================================
		■■■■■■■ 학생 DELETE 프로시저 ■■■■■■■■■
===========================================================================

-- 아이디, 주민번호 입력시 해당 학생의 수강정보 및 학생정보, ID 삭제하는  프로시저

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_DELETE
(
/*
	V_ID	-	아이디 입력 변수
	V_SSN	-	주민번호 입력 
*/
    V_ID    IN TBL_STUDENTS.ID%TYPE	
   ,V_SSN   IN TBL_STUDENTS.SSN%TYPE 
)

IS 
/*
	V_ST_CODE		-	학생코드 변수
	V_NAME			-	학생이름 변수
	V_REGIST_CODE	-   학생 과정 등록 변수
*/
   V_ST_CODE       TBL_STUDENTS.STU_CODE%TYPE;
   V_NAME          TBL_STUDENTS.NAME%TYPE;
   V_REGIST_CODE   tbl_quit.regist_code%TYPE;

BEGIN
	
	-- ID와 주민번호로 조회 후 ,V_ST_CODE에 학생 코드를 담는다 --
    SELECT STU_CODE INTO V_ST_CODE
    FROM TBL_STUDENTS
    WHERE ID = V_ID AND SSN =V_SSN;

	-- V_ST_CODE로 학생 이름을 조회해 V_NAME에 담는다 --
    SELECT NAME INTO V_NAME
    FROM TBL_STUDENTS
    WHERE STU_CODE=V_ST_CODE;
	
	-- 학생 정보 출력 --
    DBMS_OUTPUT.PUT_LINE('STU_CODE :'|| V_ST_CODE ||' NAME : '||V_NAME);

	-- 중도포기자 테이블 조회 후 등록코드를 V_REGIST_CODE에 담는다 -
    SELECT NVL(REGIST_CODE,'NODATA') INTO V_REGIST_CODE
    FROM TBL_QUIT
    WHERE regist_code= 
                        (   SELECT vsc.개설과정코드
                           FROM VIEW_ST_COU VSC
                            WHERE vsc.학생코드 = V_ST_CODE
                        );


	-- 중도포기자 일 경우 중도포기자 테이블의 데이터 삭제 --
    IF (V_REGIST_CODE != 'NODATA') 

      THEN  DELETE FROM TBL_QUIT
            WHERE regist_code= V_REGIST_CODE;
    END IF;

    DELETE FROM TBL_GRADE

    WHERE REGIST_CODE = (   SELECT vsc.개설과정코드

                            FROM VIEW_ST_COU VSC

                            WHERE vsc.학생코드 = V_ST_CODE

                        );


	-- 학생의 수강과정 정보 삭제 --
    DELETE FROM  TBL_COU_REGIST

    WHERE REGIST_CODE =(   SELECT vsc.개설과정코드

                            FROM VIEW_ST_COU VSC

                            WHERE vsc.학생코드 = V_ST_CODE

                      );

	-- 학생정보 삭제 --
    
    DELETE FROM TBL_STUDENTS
    WHERE ID=V_ID;

	-- ID및 PW정보 삭제 --
    DELETE FROM TBL_IDPW
    WHERE V_ID=ID;
    
	-- 커밋 --
    commit;
    

	-- 입력 한 값에 해당하는 학생이 없을 시에 오류 처리 --
   EXCEPTION
	
       WHEN NO_DATA_FOUND 

           THEN RAISE_APPLICATION_ERROR(-20001,' 입력한 정보와 유효한 학생이 없습니다. 다시 입력하세요.');



END;


==============================================================================
	■■■■■■ 점수 INSERT 프로시저 ■■■■■■■
=============================================================================

CREATE OR REPLACE PROCEDURE PRC_GRADE_INSERT
( V_REGIST_CODE         IN TBL_COU_REGIST.REGIST_CODE%TYPE
, V_OP_SUBJECT_CODE     IN TBL_OP_SUBJECTS.OP_SUBJECT_CODE%TYPE
, V_ATTEND              IN TBL_GRADE.ATTEND%TYPE
, V_WRITE               IN TBL_GRADE.WRITE%TYPE
, V_PRACTICE            IN TBL_GRADE.PRACTICE%TYPE
)
IS
BEGIN

    INSERT INTO TBL_GRADE 
    VALUES(CONCAT('GR',TO_CHAR(SEQ_GRADE.NEXTVAL)), V_REGIST_CODE, V_OP_SUBJECT_CODE, V_ATTEND, V_WRITE, V_PRACTICE);

    COMMIT;
END;
-- 점수는 UPDATE형식으로 올려야 한다.
========================================================================
■■■■■■ 성적 업데이트(입력) 프로시저 ■■■■■■
======================================================================
CREATE OR REPLACE PROCEDURE PRC_GRADE_UPDATE
( V_GRADE_CODE  IN TBL_GRADE.GRADE_CODE%TYPE
, V_ATTEND      IN TBL_GRADE.ATTEND%TYPE
, V_WRITE       IN TBL_GRADE.WRITE%TYPE
, V_PRACTICE    IN TBL_GRADE.PRACTICE%TYPE
)
IS
    V_OP_SUBJECT_CODE   TBL_OP_SUBJECTS.OP_SUBJECT_CODE%TYPE;
    V_END_DATE          TBL_OP_SUBJECTS.END_DATE%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    SELECT OP_SUBJECT_CODE INTO V_OP_SUBJECT_CODE
    FROM TBL_GRADE
    WHERE GRADE_CODE = V_GRADE_CODE;

    SELECT END_DATE INTO V_END_DATE
    FROM TBL_GRADE GR JOIN TBL_OP_SUBJECTS SU
    ON GR.OP_SUBJECT_CODE = SU.OP_SUBJECT_CODE
    WHERE GR.GRADE_CODE = V_GRADE_CODE;
    
    
    IF(V_END_DATE > SYSDATE)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE TBL_GRADE
    SET ATTEND =V_ATTEND , WRITE =V_WRITE , PRACTICE = V_PRACTICE
    WHERE GRADE_CODE = V_GRADE_CODE; 
    
    COMMIT;
    
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20008,'성적입력은 과목이 종료된 후에 가능합니다.');
             ROLLBACK;
    WHEN OTHERS THEN ROLLBACK;
    
END;



===============================================================
	--■■■■■ 학사정보 출력 프로시저 ■■■■■--
===============================================================
-- 학생 정보 입력시 학생의 수강 과정및 과목, 성적, 중도하차여부를 출력한다.

CREATE OR REPLACE PROCEDURE PRC_PRINT_STUDENT_INFO
(
    V_ID IN TBL_STUDENTS.ID%TYPE	--	아이디 입력 변수
   
)

IS
    V_OP_SUBJECT_CODE  TBL_OP_SUBJECTS.OP_SUBJECT_CODE%TYPE;	-- 개설과목 코드
    V_ST_NAME TBL_STUDENTS.NAME%TYPE;							-- 학생 이름
    V_CR_NAME TBL_COURSES.NAME%TYPE;							-- 과정명
    V_SJ_NAME TBL_SUBJECTS.NAME%TYPE;							-- 과목명
    V_SJ_STDATE TBL_OP_SUBJECTS.START_DATE%TYPE;				-- 시작일
    V_SJ_ENDATE TBL_OP_SUBJECTS.END_DATE%TYPE;					-- 종료일
    V_BK_NAME TBL_BOOKS.NAME%TYPE;								-- 교재명
    V_ATTEND TBL_GRADE.ATTEND%TYPE;								-- 출결
    V_WRITE TBL_GRADE.WRITE%TYPE;								-- 필기
    V_PRACTICE TBL_GRADE.PRACTICE%TYPE;							-- 실기
    V_TOTAL NUMBER(3);											-- 총점
    V_RANK NUMBER(3);											-- 등수
    V_QUIT VARCHAR2(40);										-- 중도하차 여부
  
    -- 커서로 아이디에 해당하는 수료한 과목 대한 정보를 조회한 후 커서에 담는다 --

    CURSOR CUR_STUDENT_INFO_SELECT
    IS
        SELECT I.개설과목코드,I.이름,I.과정명,I.과목명,I.시작일,I.종료일,I.교재명,I.출결,I.필기,I.실기,I.총점,I.등수,
        CASE WHEN I.중도하차 IS NULL THEN '-' ELSE TO_CHAR('['||I.중도하차||']') END "충도하차여부"
        
        FROM
            (
            SELECT T.개설과목식별코드"개설과목코드" ,T.아이디 "아이디",T.학생이름 "이름",T.과정명 "과정명",T.과목명 "과목명",T.과목시작일 "시작일",T.과목종료일 "종료일"
                  ,T.교재명 "교재명",T.출결 "출결",T.필기 "필기",T.실기 "실기",T.총점 "총점"
                  ,DENSE_RANK() OVER (PARTITION BY T.개설과목식별코드 ORDER BY T.총점 DESC)"등수",T.중도하차"중도하차"
            FROM
            (
                SELECT cr.regist_code "등록식별코드",cr.op_course_code"개설강좌코드",cr.regist_date"개설일자"
                        ,st.stu_code"학생식별코드",st.id "아이디",st.name"학생이름",st.ssn"학생주민번호"
                        ,oc.course_code"과정식별코드",tc.name"과정명",oc.start_date"과정시작일",oc.end_date"과정종료일",tr.name"반이름"
                        ,os.op_subject_code"개설과목식별코드",OS.SUBJECT_CODE"과목코드",ts.name"과목명",os.start_date"과목시작일",os.end_date"과목종료일",os.pro_code"교수코드",BK.NAME"교재명"
                        ,tg.attend"출결",tg.write"필기",tg.practice"실기"
                        ,tg.attend *(( SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE= os.op_subject_code AND POINT_CODE ='PT10001')/100)
                        +tg.write*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE=OS.op_subject_code AND POINT_CODE='PT10002')/100)
                         +tg.practice*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE=OS.op_subject_code AND POINT_CODE='PT10003')/100)"총점"
                         ,TQ.QUIT_DATE"중도하차"
                FROM TBL_STUDENTS ST JOIN TBL_IDPW ID
                ON id.id=st.id
                    RIGHT JOIN TBL_COU_REGIST CR
                        ON st.stu_code = cr.stu_code
                          LEFT JOIN TBL_OP_COURSES OC
                            ON cr.op_course_code =oc.op_course_code
                                LEFT JOIN TBL_COURSES TC
                                    ON tc.course_code =oc.course_code
                                        LEFT JOIN TBL_CLASSROOM TR
                                            ON oc.clr_code= tr.clr_code
                                                LEFT JOIN TBL_OP_SUBJECTS OS
                                                    ON oc.op_course_code = os.op_course_code
                                                        LEFT JOIN TBL_SUBJECTS TS
                                                            ON ts.subject_code=os.subject_code
                                                                LEFT JOIN TBL_BOOKS BK
                                                                    ON OS.BOOK_CODE = BK.BOOK_CODE
                                                                         JOIN TBL_GRADE TG                                                
                                                                            ON TG.OP_SUBJECT_CODE = os.op_subject_code AND TG.REGIST_CODE =CR.REGIST_CODE
                                                                                LEFT JOIN TBL_QUIT TQ
                                                                                    ON TQ.REGIST_CODE = CR.REGIST_CODE
                                                                                        LEFT JOIN TBL_QUIT_REASON QR
                                                                                            ON QR.REASON_CODE=TQ.REASON_CODE
            )T
        )I
        WHERE I.아이디  = V_ID AND SYSDATE-I.종료일>=0;
    

BEGIN
    
    OPEN CUR_STUDENT_INFO_SELECT;
    
    LOOP

    FETCH CUR_STUDENT_INFO_SELECT INTO V_OP_SUBJECT_CODE, V_ST_NAME, V_CR_NAME, V_SJ_NAME
                                    , V_SJ_STDATE ,V_SJ_ENDATE ,V_BK_NAME ,V_ATTEND ,V_WRITE ,V_PRACTICE,V_TOTAL,V_RANK,V_QUIT ;
    EXIT WHEN CUR_STUDENT_INFO_SELECT%NOTFOUND;
    
    -- 출력
	-- 중도 하차시 날짜가 출력되고 중도하차가 아닌경우 공백 [ - ] 가 출력
    
    DBMS_OUTPUT.PUT_LINE(V_ST_NAME||'||'||V_CR_NAME|| '||'||V_SJ_NAME|| '||' 
                        ||V_SJ_STDATE||'||'||V_SJ_ENDATE|| '||'||V_BK_NAME|| '||출석 : '||V_ATTEND|| '점||필기 : '||V_WRITE||'점||실기 : '
                        ||V_PRACTICE|| '점|| 총점 : ' ||V_TOTAL|| '점||등수 : '||V_RANK||'등 ||'||' 중도하차 : '||V_QUIT);
    END LOOP;
    
    CLOSE CUR_STUDENT_INFO_SELECT;   

END;

===========================================================================
     ■■■■■■■ 교수자 성적 출력 프로시저 생성 ■■■■■■■■■
===========================================================================
*/
-- DBMS_OUTPUT.PUT_LINE을 출력하기 위해 사용

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_GRADE
( V_ID  IN TBL_PROFESSORS.ID%TYPE   -- 교수ID 입력 매개변수
)
IS

    V_SUB_NAME          TBL_SUBJECTS.NAME%TYPE;             -- 과목명
    V_OS_START_DATE     TBL_OP_SUBJECTS.START_DATE%TYPE;    -- 과목 시작일
    V_OS_END_DATE       TBL_OP_SUBJECTS.END_DATE%TYPE;      -- 과목 종료일
    V_BOOK_NAME         TBL_BOOKS.NAME%TYPE;                -- 교재명
    V_STU_NAME          TBL_STUDENTS.NAME%TYPE;             -- 학생명
    V_ATTEND            TBL_GRADE.ATTEND%TYPE;              -- 출결
    V_WRITE             TBL_GRADE.WRITE%TYPE;               -- 필기
    V_PRACTICE          TBL_GRADE.PRACTICE%TYPE;            -- 실기
    V_TOTAL             NUMBER(5);                          -- 총점
    V_RANK              NUMBER(3);                          -- 등수
    V_QUIT              VARCHAR2(40);                       -- 중도탈락여부

    -- 커서 이용을 위한 커서 변수 선언(→ 커서 정의) 
    -- 교수가 강의한 과목에 한해 학생 성적정보를 조회하기 위한 커서
    CURSOR CUR_PROFESSOR_GRADE_SELECT
    IS
    -- 한 교수의 여러 학생에 대한 성적정보를 조회하기 위해 다중 인라인 뷰 생성
    SELECT I.과목명 "과목명", I.시작일 "시작일", I.종료일 "종료일", I.교재명 "교재명", I.학생명 "학생명" 
         , I.출결 "출결", I.필기 "필기", I.실기 "실기", I.총점 "총점", I.등수 "등수", I.중도탈락여부 "중도탈락여부"
    FROM 
    (SELECT T.아이디"아이디", T.과목명 "과목명", T.시작일 "시작일", T.종료일 "종료일", T.교재명 "교재명", T.학생명 "학생명"
         , T.출결 "출결", T.필기 "필기", T.실기 "실기", DENSE_RANK() OVER(PARTITION BY T.개설과목코드 ORDER BY T.총점 DESC ) "등수" 
         , T.총점 "총점", T.중도탈락여부 "중도탈락여부"
    FROM 
    (SELECT PR.ID "아이디", SU.NAME "과목명", OS.START_DATE"시작일", OS.END_DATE"종료일", BK.NAME"교재명", ST.NAME"학생명", OS.OP_SUBJECT_CODE"개설과목코드"
          , GR.ATTEND "출결", GR.WRITE "필기", GR.PRACTICE "실기"
          , NVL((GR.ATTEND*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10001')/100) 
            + GR.WRITE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10002')/100) 
            + GR.PRACTICE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10003')/100)),0) "총점"
         , (CASE WHEN CR.REGIST_CODE = QU.REGIST_CODE THEN '중도탈락' ELSE ' ' END) "중도탈락여부"     
    FROM TBL_PROFESSORS PR  JOIN TBL_IDPW ID
        ON PR.ID = ID.ID
        LEFT JOIN TBL_OP_SUBJECTS OS
        ON PR.PRO_CODE = OS.PRO_CODE
            JOIN TBL_GRADE GR
            ON OS.OP_SUBJECT_CODE = GR.OP_SUBJECT_CODE
                LEFT JOIN TBL_SUBJECTS SU
                ON OS.SUBJECT_CODE = SU.SUBJECT_CODE
                    LEFT JOIN TBL_COU_REGIST CR
                    ON GR.REGIST_CODE = CR.REGIST_CODE
                        LEFT JOIN TBL_STUDENTS ST
                        ON CR.STU_CODE = ST.STU_CODE
                            LEFT JOIN TBL_BOOKS BK
                            ON OS.BOOK_CODE = BK.BOOK_CODE
                               LEFT JOIN TBL_QUIT QU
                               ON CR.REGIST_CODE = QU.REGIST_CODE
       )T
   )I 
   -- 교수ID에서 현재 강의를 마친 강의를 대상으로 학생 성적 조회함
   WHERE I.아이디 = V_ID AND SYSDATE - I.종료일 >= 0;
BEGIN
    -- 커서 오픈   
    OPEN CUR_PROFESSOR_GRADE_SELECT;

    -- 커서 오픈 시 쏟아져나오는 데이터 잡아내기
    LOOP

    -- 한 행씩 끄집어내어 가져오기
    FETCH CUR_PROFESSOR_GRADE_SELECT INTO V_SUB_NAME, V_OS_START_DATE, V_OS_END_DATE, V_BOOK_NAME, V_STU_NAME, V_ATTEND, V_WRITE, V_PRACTICE, V_TOTAL, V_RANK, V_QUIT;

    EXIT WHEN CUR_PROFESSOR_GRADE_SELECT%NOTFOUND;
    
    --출력
    DBMS_OUTPUT.PUT_LINE(V_SUB_NAME||' , ' ||V_OS_START_DATE||' , ' ||V_OS_END_DATE||' , ' ||V_BOOK_NAME||' , ' ||V_STU_NAME||' , 출결 :' ||
                         V_ATTEND||' , 필기 :' ||V_WRITE||' , 실기 :' ||V_PRACTICE||' , 총점 :' ||V_TOTAL||' , 등수 :' ||V_RANK||' , '||V_QUIT);
                         
    END LOOP;
    
    -- 커서 클로즈 
    CLOSE CUR_PROFESSOR_GRADE_SELECT;

END;
--==>> Procedure PRC_PROFESSORS_GRADE이(가) 컴파일되었습니다.

COMMIT;


================================================
■■■ 교수자 로그인시 과목 출력 ■■■■■■■
=============================================
CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_PRINT
(V_ID IN TBL_PROFESSORS.ID%TYPE
)
IS
    V_PRO_NAME      TBL_PROFESSORS.NAME%TYPE;
    V_SUB_NAME      TBL_SUBJECTS.NAME%TYPE;
    V_START_DATE    TBL_OP_SUBJECTS.START_DATE%TYPE;
    V_END_DATE      TBL_OP_SUBJECTS.END_DATE%TYPE;
    V_BOOK_NAME     TBL_BOOKS.NAME%TYPE;

 
    
    CURSOR CUR_PRO_ID_SELECT
    IS
        (SELECT 교수이름,과목이름,START_DATE "시작일",END_DATE"종료일",NAME"교재명"
        FROM  (SELECT*
                FROM  (SELECT 교수코드,  교수이름,  PRO_SUB_CODE, 과목코드,과목이름  
                             FROM(SELECT 교수코드,교수이름,PRO_SUB_CODE,SUBJECT_CODE
                                  FROM    (SELECT PRO_CODE "교수코드",NAME "교수이름"
                                        FROM TBL_PROFESSORS 
                                        WHERE ID=V_ID)T
                                        JOIN
                                        (SELECT *
                                        FROM TBL_PRO_SUB)E
                                ON T.교수코드=E.PRO_CODE)K
                                JOIN
                                (SELECT SUBJECT_CODE "과목코드", NAME "과목이름"
                                 FROM TBL_SUBJECTS) L
                             ON  K.SUBJECT_CODE=L.과목코드) O
                             JOIN
                             (SELECT*
                             FROM TBL_OP_SUBJECTS)K
                ON O.과목코드=K.SUBJECT_CODE)KK
                JOIN
                (SELECT*
                 FROM TBL_BOOKS)KKK
        ON KK.BOOK_CODE=KKK.BOOK_CODE);
    
BEGIN

    OPEN CUR_PRO_ID_SELECT;
    LOOP
        FETCH CUR_PRO_ID_SELECT INTO  V_PRO_NAME, V_SUB_NAME,  V_START_DATE,  V_END_DATE,  V_BOOK_NAME;
        EXIT WHEN CUR_PRO_ID_SELECT%NOTFOUND;
        --출력
        DBMS_OUTPUT.PUT_LINE(V_PRO_NAME||' , ' ||V_SUB_NAME||' , ' ||V_START_DATE||' , ' ||V_END_DATE||' , ' ||V_BOOK_NAME);
    END LOOP;
    CLOSE CUR_PRO_ID_SELECT;
END;


==================================================
■■■■ 게시판 (BO) TBL_BOARD (PRC_BOARD_INSERT)■■■■■
=====================================================
CREATE OR REPLACE PROCEDURE PRC_BOARD_INSERT
(V_WRITE_ID IN TBL_BOARD.WRITE_ID%TYPE
,V_WRITE_DATE IN TBL_BOARD.WRITE_DATE%TYPE
,V_CONTENT IN TBL_BOARD.CONTENT%TYPE
)
IS
BEGIN
    INSERT INTO TBL_BOARD(SEQ_INDEX,WRITE_ID,WRITE_DATE,CONTENT,VIEWS)
                VALUES(CONCAT('BO',TO_CHAR(SEQ_BOARD.NEXTVAL)),V_WRITE_ID,V_WRITE_DATE,V_CONTENT,DEFAULT);
    COMMIT;
END;

--○ 게시판 (BO) TBL_BOARD (PRC_BOARD_UPDATE)

CREATE OR REPLACE PROCEDURE PRC_BOARD_UPDATE
(V_SEQ_INDEX   IN   TBL_BOARD.SEQ_INDEX%TYPE        
,V_WRITE_ID    IN   TBL_BOARD.WRITE_ID%TYPE    
,V_WRITE_DATE  IN   TBL_BOARD.WRITE_DATE%TYPE             
,V_CONTENT     IN   TBL_BOARD.CONTENT%TYPE     
--,V_VIEWS       IN   TBL_BOARD.VIEWS%TYPE   
)
IS
BEGIN
    UPDATE TBL_BOARD
    SET     WRITE_ID = V_WRITE_ID, WRITE_DATE=V_WRITE_DATE,   CONTENT=V_CONTENT--,   VIEWS= V_VIEWS
    WHERE SEQ_INDEX=V_SEQ_INDEX;
    COMMIT;
END;

=================================================================================
--■■■■■■■■■ 과목교수자 변경 프로시저 ■■■■■■■■■--
================================================================================
CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_REMATCH
( V_PRO_CODE              IN TBL_PROFESSORS.PRO_CODE%TYPE
, V_BEFORE_PRO_CODE       IN TBL_PROFESSORS.PRO_CODE%TYPE
)
IS
    USER_DEFINE_ERROR   EXCEPTION;
    
    V_MATCH_PRO_CODE        NUMBER;                       
    
BEGIN   
    SELECT COUNT(*) INTO V_MATCH_PRO_CODE 
    FROM
    (
    SELECT SUBJECT_CODE
    FROM TBL_OP_SUBJECTS
    WHERE PRO_CODE = V_PRO_CODE
    MINUS
    SELECT SUBJECT_CODE
    FROM TBL_PRO_SUB
    WHERE PRO_CODE = V_BEFORE_PRO_CODE);
        
    IF ( V_MATCH_PRO_CODE != 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE TBL_OP_SUBJECTS
    SET PRO_CODE = V_PRO_CODE
    WHERE PRO_CODE = V_BEFORE_PRO_CODE;
    
    DELETE
    FROM TBL_PRO_SUB
    WHERE PRO_CODE = V_BEFORE_PRO_CODE;
    
    DELETE
    FROM TBL_PROFESSORS
    WHERE PRO_CODE = V_BEFORE_PRO_CODE;    
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '대체되는 교수가 강의가 불가능한 과목입니다.');
            ROLLBACK;   
        WHEN OTHERS
            THEN ROLLBACK;
    COMMIT;
END;