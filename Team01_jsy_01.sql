    SELECT I.����� "�����", I.������ "������", I.������ "������", I.����� "�����", I.�л��� "�л���" 
         , I.��� "���", I.�ʱ� "�ʱ�", I.�Ǳ� "�Ǳ�", I.���� "����", I.��� "���", I.�ߵ�Ż������ "�ߵ�Ż������"
    FROM 
    (SELECT T.���̵�"���̵�", T.����� "�����", T.������ "������", T.������ "������", T.����� "�����", T.�л��� "�л���"
         , T.��� "���", T.�ʱ� "�ʱ�", T.�Ǳ� "�Ǳ�", DENSE_RANK() OVER(PARTITION BY T.���������ڵ� ORDER BY T.���� ) "���" 
         , T.���� "����", T.�ߵ�Ż������ "�ߵ�Ż������"
    FROM 
    (SELECT PR.ID "���̵�", SU.NAME "�����", OS.START_DATE"������", OS.END_DATE"������", BK.NAME"�����", ST.NAME"�л���", OS.OP_SUBJECT_CODE"���������ڵ�"
          , GR.ATTEND "���", GR.WRITE "�ʱ�", GR.PRACTICE "�Ǳ�"
          , NVL((GR.ATTEND*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10001')/100) 
            + GR.WRITE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10002')/100) 
            + GR.PRACTICE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10003')/100)),0) "����"
         , (CASE WHEN CR.REGIST_CODE = QU.REGIST_CODE THEN '�ߵ�Ż��' ELSE ' ' END) "�ߵ�Ż������"     
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
       WHERE T.���̵� = 'P10012�̼���';
   )I
   WHERE I.���̵� = 'P10039�趥��' ;
   --AND SYSDATE- I.������ >= 0; / PR10003 P10012�̼��� / PR10002 P10011��̿�

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



