    SELECT I.과목명 "과목명", I.시작일 "시작일", I.종료일 "종료일", I.교재명 "교재명", I.학생명 "학생명" 
         , I.출결 "출결", I.필기 "필기", I.실기 "실기", I.총점 "총점", I.등수 "등수", I.중도탈락여부 "중도탈락여부"
    FROM 
    (SELECT T.아이디"아이디", T.과목명 "과목명", T.시작일 "시작일", T.종료일 "종료일", T.교재명 "교재명", T.학생명 "학생명"
         , T.출결 "출결", T.필기 "필기", T.실기 "실기", DENSE_RANK() OVER(PARTITION BY T.개설과목코드 ORDER BY T.총점 ) "등수" 
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
       WHERE T.아이디 = 'P10012이선율';
   )I
   WHERE I.아이디 = 'P10039김땅콩' ;
   --AND SYSDATE- I.시작일 >= 0; / PR10003 P10012이선율 / PR10002 P10011김미영

SELECT *
FROM TBL_PROFESSORS;

SELECT *
FROM TBL_OP_SUBJECTS;


SELECT *
FROM TBL_QUIT;

SELECT *
FROM TBL_PROFESSORS;

SELECT *
FROM TBL_OP_COURSES;

SELECT *
FROM TBL_OP_SUBJECTS;



