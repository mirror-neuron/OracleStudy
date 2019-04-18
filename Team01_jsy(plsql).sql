/*
===========================================================================
■■■■■■■ 강의실(TBL_CLASSROOM) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 강의실(TBL_CLASSROOM)    'CL'로 시작하는 시퀀스 강의실 코드 생성
*/
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

/*
===========================================================================
■■■■■■■ 배점(TBL_ALLOT) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 배점(TBL_ALLOT)          'AL'로 시작하는 시퀀스 배점 코드 생성
*/
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

/*
===========================================================================
■■■■■■■ 평가종류(TBL_POINT_TYPE) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 평가종류(TBL_POINT_TYPE) 'PT'로 시작하는 시퀀스 평가종류 코드 생성
*/
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
--==>> Procedure PRC_POINT_TYPE_INSERT이(가) 컴파일되었습니다.


/*
===========================================================================
■■■■■■■ 시험(TBL_EXAMS) 입력 프로시저 생성 ■■■■■■■■■
===========================================================================
- 시험(TBL_EXAMS)          'EX'로 시작하는 시퀀스 시험코드 생성
*/
CREATE OR REPLACE PROCEDURE PRC_EXAMS_INSERT
( V_OP_SUBJECT_CODE     IN TBL_EXAMS.OP_SUBJECT_CODE%TYPE   -- 개설과정코드
, V_TEST_CODE           IN TBL_EXAMS.TEST_CODE%TYPE         -- 시험종류코드
, V_TIME_LIMITE         IN TBL_EXAMS.TIME_LIMITE%TYPE       -- 시험진행시간
)
IS 
     V_EXAM_DATE            TBL_EXAMS.EXAM_DATE%TYPE;       -- 시험일자 추가 변수 선언
BEGIN
    -- 과목 종료일을 시험일에 대입하여 자동으로 입력됨
    SELECT END_DATE INTO V_EXAM_DATE
    FROM TBL_OP_SUBJECTS        
    WHERE OP_SUBJECT_CODE = V_OP_SUBJECT_CODE;

    -- 시험 데이터 입력 시 'EX'로 시작하는 시퀀스 시험코드 생성하며 데이터 입력됨
    INSERT INTO TBL_EXAMS(EXAM_CODE, OP_SUBJECT_CODE, TEST_CODE, EXAM_DATE, TIME_LIMITE)
    VALUES(CONCAT('EX', TO_CHAR(SEQ_EXAMS.NEXTVAL)), V_OP_SUBJECT_CODE, V_TEST_CODE, V_EXAM_DATE, V_TIME_LIMITE);
    
    COMMIT;
END;
--==>> Procedure PRC_EXAMS_INSERT이(가) 컴파일되었습니다.


/*
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
--==>> Procedure PRC_TEST_TYPE_INSERT이(가) 컴파일되었습니다.

/*
===========================================================================
     ■■■■■■■ 교수자 성적 출력 프로시저 생성 ■■■■■■■■■
===========================================================================
*/
-- DBMS_OUTPUT.PUT_LINE을 출력하기 위해 사용
SET SERVEROUTPUT ON;

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




