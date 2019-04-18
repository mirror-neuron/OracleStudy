/*
===========================================================================
�������� ���ǽ�(TBL_CLASSROOM) �Է� ���ν��� ���� ����������
===========================================================================
- ���ǽ�(TBL_CLASSROOM)    'CL'�� �����ϴ� ������ ���ǽ� �ڵ� ����
*/
CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_INSERT
( V_NAME             IN TBL_CLASSROOM.NAME%TYPE         -- ���ǽǸ�
, V_LOCATION         IN TBL_CLASSROOM.LOCATION%TYPE     -- ���ǽ���ġ
, V_CAPACITY         IN TBL_CLASSROOM.CAPACITY%TYPE     -- �����ο�
)
IS 
BEGIN
    -- ���ǽ� ���� �Է� �� 'CL'�� �����ϴ� ������ ���ǽ� �ڵ� �����ϸ� ������ �Էµ�
    INSERT INTO TBL_CLASSROOM(CLR_CODE, NAME, LOCATION, CAPACITY)
    VALUES(CONCAT('CL', TO_CHAR(SEQ_CLASSROOM.NEXTVAL)), V_NAME, V_LOCATION, V_CAPACITY);
    
    COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_INSERT��(��) �����ϵǾ����ϴ�.

/*
===========================================================================
�������� ����(TBL_ALLOT) �Է� ���ν��� ���� ����������
===========================================================================
- ����(TBL_ALLOT)          'AL'�� �����ϴ� ������ ���� �ڵ� ����
*/
CREATE OR REPLACE PROCEDURE PRC_ALLOT_INSERT
( V_OP_SUBJECT_CODE     IN TBL_ALLOT.OP_SUBJECT_CODE%TYPE   -- ���������ڵ�
, V_ALLOT1              IN TBL_ALLOT.ALLOT%TYPE             -- ����1(���)
, V_ALLOT2              IN TBL_ALLOT.ALLOT%TYPE             -- ����2(�ʱ�)
, V_ALLOT3              IN TBL_ALLOT.ALLOT%TYPE             -- ����3(�Ǳ�)
)
IS 
    -- ����� ���� ����ó�� ���� ����
    USER_DEFINE_ERROR EXCEPTION;  
BEGIN 
    -- �� ������ ������ 100�� �ƴϸ� ���� �߻�
    IF (V_ALLOT1 + V_ALLOT2 + V_ALLOT3 != 100)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ���� �Է� �� 'AL'�� �����ϴ� ������ ���� �ڵ� �����ϸ� ������ �Էµ�
    INSERT INTO TBL_ALLOT(ALLOT_CODE, OP_SUBJECT_CODE, POINT_CODE, ALLOT)
    VALUES(CONCAT('AL',TO_CHAR(SEQ_ALLOT.NEXTVAL)), V_OP_SUBJECT_CODE, 'PT10001', V_ALLOT1);
    
    INSERT INTO TBL_ALLOT(ALLOT_CODE, OP_SUBJECT_CODE, POINT_CODE, ALLOT)
    VALUES(CONCAT('AL',TO_CHAR(SEQ_ALLOT.NEXTVAL)), V_OP_SUBJECT_CODE, 'PT10002', V_ALLOT2);
    
    INSERT INTO TBL_ALLOT(ALLOT_CODE, OP_SUBJECT_CODE, POINT_CODE, ALLOT)
    VALUES(CONCAT('AL',TO_CHAR(SEQ_ALLOT.NEXTVAL)), V_OP_SUBJECT_CODE, 'PT10003', V_ALLOT3);
    
    COMMIT;
    
    -- ���� �߻� �� �Ʒ� �޽��� ��� �� �ѹ��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, '�� ������ 100�� ������ �������� �Է� �����մϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--==>> Procedure PRC_ALLOT_INSERT��(��) �����ϵǾ����ϴ�.

/*
===========================================================================
�������� ������(TBL_POINT_TYPE) �Է� ���ν��� ���� ����������
===========================================================================
- ������(TBL_POINT_TYPE) 'PT'�� �����ϴ� ������ ������ �ڵ� ����
*/
CREATE OR REPLACE PROCEDURE PRC_POINT_TYPE_INSERT
( V_POINT   IN TBL_POINT_TYPE.POINT%TYPE    -- ��������
)
IS
BEGIN
    -- �������� �Է� �� 'PT'�� �����ϴ� ������ ������ �ڵ� �����ϸ� ������ �Էµ�
    INSERT INTO TBL_POINT_TYPE(POINT_CODE, POINT)
    VALUES(CONCAT('PT', TO_CHAR(SEQ_POINT_TYPE.NEXTVAL)), V_POINT);
    
    COMMIT;
    
END;
--==>> Procedure PRC_POINT_TYPE_INSERT��(��) �����ϵǾ����ϴ�.


/*
===========================================================================
�������� ����(TBL_EXAMS) �Է� ���ν��� ���� ����������
===========================================================================
- ����(TBL_EXAMS)          'EX'�� �����ϴ� ������ �����ڵ� ����
*/
CREATE OR REPLACE PROCEDURE PRC_EXAMS_INSERT
( V_OP_SUBJECT_CODE     IN TBL_EXAMS.OP_SUBJECT_CODE%TYPE   -- ���������ڵ�
, V_TEST_CODE           IN TBL_EXAMS.TEST_CODE%TYPE         -- ���������ڵ�
, V_TIME_LIMITE         IN TBL_EXAMS.TIME_LIMITE%TYPE       -- ��������ð�
)
IS 
     V_EXAM_DATE            TBL_EXAMS.EXAM_DATE%TYPE;       -- �������� �߰� ���� ����
BEGIN
    -- ���� �������� �����Ͽ� �����Ͽ� �ڵ����� �Էµ�
    SELECT END_DATE INTO V_EXAM_DATE
    FROM TBL_OP_SUBJECTS        
    WHERE OP_SUBJECT_CODE = V_OP_SUBJECT_CODE;

    -- ���� ������ �Է� �� 'EX'�� �����ϴ� ������ �����ڵ� �����ϸ� ������ �Էµ�
    INSERT INTO TBL_EXAMS(EXAM_CODE, OP_SUBJECT_CODE, TEST_CODE, EXAM_DATE, TIME_LIMITE)
    VALUES(CONCAT('EX', TO_CHAR(SEQ_EXAMS.NEXTVAL)), V_OP_SUBJECT_CODE, V_TEST_CODE, V_EXAM_DATE, V_TIME_LIMITE);
    
    COMMIT;
END;
--==>> Procedure PRC_EXAMS_INSERT��(��) �����ϵǾ����ϴ�.


/*
===========================================================================
�������� ��������(TBL_TEST_TYPE) �Է� ���ν��� ���� ����������
===========================================================================
- ��������(TBL_TEST_TYPE)  'TT'�� �����ϴ� ������ �������� ����
*/
CREATE OR REPLACE PROCEDURE PRC_TEST_TYPE_INSERT
( V_NAME   IN TBL_TEST_TYPE.NAME%TYPE       -- ����������
)
IS
BEGIN
    -- �������� ������ �Է� �� 'TT'�� �����ϴ� ������ �������� ����
    INSERT INTO TBL_TEST_TYPE(TEST_CODE, NAME)
    VALUES(CONCAT('TT', TO_CHAR(SEQ_TEST_TYPE.NEXTVAL)), V_NAME);
    
    COMMIT;
    
END;
--==>> Procedure PRC_TEST_TYPE_INSERT��(��) �����ϵǾ����ϴ�.

/*
===========================================================================
     �������� ������ ���� ��� ���ν��� ���� ����������
===========================================================================
*/
-- DBMS_OUTPUT.PUT_LINE�� ����ϱ� ���� ���
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_GRADE
( V_ID  IN TBL_PROFESSORS.ID%TYPE   -- ����ID �Է� �Ű�����
)
IS

    V_SUB_NAME          TBL_SUBJECTS.NAME%TYPE;             -- �����
    V_OS_START_DATE     TBL_OP_SUBJECTS.START_DATE%TYPE;    -- ���� ������
    V_OS_END_DATE       TBL_OP_SUBJECTS.END_DATE%TYPE;      -- ���� ������
    V_BOOK_NAME         TBL_BOOKS.NAME%TYPE;                -- �����
    V_STU_NAME          TBL_STUDENTS.NAME%TYPE;             -- �л���
    V_ATTEND            TBL_GRADE.ATTEND%TYPE;              -- ���
    V_WRITE             TBL_GRADE.WRITE%TYPE;               -- �ʱ�
    V_PRACTICE          TBL_GRADE.PRACTICE%TYPE;            -- �Ǳ�
    V_TOTAL             NUMBER(5);                          -- ����
    V_RANK              NUMBER(3);                          -- ���
    V_QUIT              VARCHAR2(40);                       -- �ߵ�Ż������

    -- Ŀ�� �̿��� ���� Ŀ�� ���� ����(�� Ŀ�� ����) 
    -- ������ ������ ���� ���� �л� ���������� ��ȸ�ϱ� ���� Ŀ��
    CURSOR CUR_PROFESSOR_GRADE_SELECT
    IS
    -- �� ������ ���� �л��� ���� ���������� ��ȸ�ϱ� ���� ���� �ζ��� �� ����
    SELECT I.����� "�����", I.������ "������", I.������ "������", I.����� "�����", I.�л��� "�л���" 
         , I.��� "���", I.�ʱ� "�ʱ�", I.�Ǳ� "�Ǳ�", I.���� "����", I.��� "���", I.�ߵ�Ż������ "�ߵ�Ż������"
    FROM 
    (SELECT T.���̵�"���̵�", T.����� "�����", T.������ "������", T.������ "������", T.����� "�����", T.�л��� "�л���"
         , T.��� "���", T.�ʱ� "�ʱ�", T.�Ǳ� "�Ǳ�", DENSE_RANK() OVER(PARTITION BY T.���������ڵ� ORDER BY T.���� DESC ) "���" 
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
   )I 
   -- ����ID���� ���� ���Ǹ� ��ģ ���Ǹ� ������� �л� ���� ��ȸ��
   WHERE I.���̵� = V_ID AND SYSDATE - I.������ >= 0;
BEGIN
    -- Ŀ�� ����   
    OPEN CUR_PROFESSOR_GRADE_SELECT;

    -- Ŀ�� ���� �� ����������� ������ ��Ƴ���
    LOOP

    -- �� �྿ ������� ��������
    FETCH CUR_PROFESSOR_GRADE_SELECT INTO V_SUB_NAME, V_OS_START_DATE, V_OS_END_DATE, V_BOOK_NAME, V_STU_NAME, V_ATTEND, V_WRITE, V_PRACTICE, V_TOTAL, V_RANK, V_QUIT;

    EXIT WHEN CUR_PROFESSOR_GRADE_SELECT%NOTFOUND;
    
    --���
    DBMS_OUTPUT.PUT_LINE(V_SUB_NAME||' , ' ||V_OS_START_DATE||' , ' ||V_OS_END_DATE||' , ' ||V_BOOK_NAME||' , ' ||V_STU_NAME||' , ��� :' ||
                         V_ATTEND||' , �ʱ� :' ||V_WRITE||' , �Ǳ� :' ||V_PRACTICE||' , ���� :' ||V_TOTAL||' , ��� :' ||V_RANK||' , '||V_QUIT);
                         
    END LOOP;
    
    -- Ŀ�� Ŭ���� 
    CLOSE CUR_PROFESSOR_GRADE_SELECT;

END;
--==>> Procedure PRC_PROFESSORS_GRADE��(��) �����ϵǾ����ϴ�.

COMMIT;




