SELECT USER
FROM DUAL;
--==>> ORASTUDY

/*-----------------------------------------------------------------
������ ���� ���̺�(TBL_COURSES) ������ 
-------------------------------------------------------------------
COURSE_CODE     -    �����ڵ� (PRIMARY KEY) 
NAME            -    ������   (NOT NULL) 
*/
-- ���� ���̺� ����
CREATE TABLE TBL_COURSES        
( COURSE_CODE   VARCHAR2(10)    
, NAME          VARCHAR2(100) CONSTRAINT COUSRES_NAME_NN NOT NULL 
, CONSTRAINT COU_COURSE_CODE_PK PRIMARY KEY(COURSE_CODE)
);
--==>> Table TBL_COURSES��(��) �����Ǿ����ϴ�.

-- ���� ������ �Է�
EXEC PRC_COURSES_INSERT ('JAVA�� Ȱ���� �� ���� ������ �缺');
EXEC PRC_COURSES_INSERT ('JAVA �����ӿ�ũ ������');
EXEC PRC_COURSES_INSERT ('���̽�, R��� ������ �÷��� ������');
EXEC PRC_COURSES_INSERT ('������ �м� �� ���� ������ �缺');
EXEC PRC_COURSES_INSERT ('������ UI������ �缺');

-- ���� ������ �Է�
EXEC PRC_PROFESSORS_INSERT ('������', '870909-1234567', '010-7894-1546', '2018-09-09');
EXEC PRC_PROFESSORS_INSERT ('��̿�', '901009-2234567', '010-1567-1578', '2019-01-19');
EXEC PRC_PROFESSORS_INSERT ('�̼���', '790312-2845651', '010-2548-1117', '2017-02-01');
EXEC PRC_PROFESSORS_INSERT ('������', '871111-1845125', '010-4874-2451', '2018-12-31');
EXEC PRC_PROFESSORS_INSERT ('������', '807865-1335845', '010-2156-9494', '2019-03-01');

-- Ŀ��
COMMIT;
--==>> Ŀ�ԿϷ�



/*-----------------------------------------------------------------
������ ���� ���̺�(TBL_BOOKS) ������ 
-------------------------------------------------------------------
BOOK_CODE       -    �����ڵ� (PRIMARY KEY) 
NAME            -    �����   (NOT NULL) 
AUTHOR          -    ����        
*/
-- ���� ���̺� ����
CREATE TABLE TBL_BOOKS
( BOOK_CODE    VARCHAR2(10) 
, NAME         VARCHAR2(80) CONSTRAINT BOOKS_NAME_NN NOT NULL
, AUTHOR       VARCHAR2(50)
, CONSTRAINT BOK_BOOK_CODE_PK PRIMARY KEY (BOOK_CODE)
);
--==>> Table TBL_BOOKS��(��) �����Ǿ����ϴ�.



/*-----------------------------------------------------------------
������ ���� ���̺�(TBL_EXAMS) ������ 
-------------------------------------------------------------------
EXAM_CODE           -    �����ڵ� (PRIMARY KEY) 
OP_SUBJECT_CODE     -    ���������ڵ� (FOREIGN KEY: TBL_OP_SUBJECTS) 
TEST_CODE           -    ���������ڵ� (FOREIGN KEY: TBL_TEST_TYPE)
EXAM_DATE           -    ������
TIME_LIMIT          -    ��������ð� 
*/

-- ���� ���̺� ����
CREATE TABLE TBL_EXAMS
( EXAM_CODE         VARCHAR2(10)
, OP_SUBJECT_CODE   VARCHAR2(10)
, TEST_CODE         VARCHAR2(10)
, EXAM_DATE         DATE DEFAULT SYSDATE   
, TIME_LIMITE       VARCHAR2(20)
, CONSTRAINT EXA_EXAM_CODE_PK PRIMARY KEY(EXAM_CODE)
);
--==>> Table TBL_EXAMS��(��) �����Ǿ����ϴ�.


-- ���� ���̺� �ַ�Ű �߰� ����
ALTER TABLE TBL_EXAMS 
ADD ( CONSTRAINT EXA_OP_SUBJECT_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE)
                 REFERENCES TBL_OP_SUBJECTS(OP_SUBJECT_CODE) 
    , CONSTRAINT EXA_TEST_CODE_FK FOREIGN KEY(TEST_CODE)
                 REFERENCES TBL_TEST_TYPE(TEST_CODE) );
--==>> Table TBL_EXAMS��(��) ����Ǿ����ϴ�.


/*-----------------------------------------------------------------
������ �������� ���̺�(TBL_TEST_TYPE) ������ 
-------------------------------------------------------------------
TEST_CODE       -    ���������ڵ� (PRIMARY KEY) 
NAME            -    ���������� (NOT NULL)
*/
-- �� ���� ���̺� ����
CREATE TABLE TBL_TEST_TYPE
( TEST_CODE     VARCHAR2(10)
, NAME          VARCHAR2(30) CONSTRAINT TEST_TYPE_NAME_NN NOT NULL
, CONSTRAINT TEST_TEST_CODE_PK PRIMARY KEY(TEST_CODE)
);
--==>> Table TBL_TEST_TYPE��(��) �����Ǿ����ϴ�.


/*-----------------------------------------------------------------
������ ���� ���̺�(TBL_SUBJECTS) ������ 
-------------------------------------------------------------------
SUBJECT_CODE    -    �����ڵ� (PRIMARY KEY) 
NAME            -    �����   (NOT NULL) 

*/
-- ���� ���̺� ����
CREATE TABLE TBL_SUBJECTS
( SUBJECT_CODE  VARCHAR2(10)
, NAME          VARCHAR2(30) CONSTRAINT SUBJECTS_NAME_NN NOT NULL
, CONSTRAINT SUB_SUBJECT_CODE_PK PRIMARY KEY(SUBJECT_CODE)
);
--==>> Table TBL_SUBJECTS��(��) �����Ǿ����ϴ�.

-- ���� ������ �Է�
INSERT INTO TBL_SUBJECTS VALUES('1', 'JAVA');						
INSERT INTO TBL_SUBJECTS VALUES('2', 'ORACLE');						
INSERT INTO TBL_SUBJECTS VALUES('3', 'SPRING');						
INSERT INTO TBL_SUBJECTS VALUES('4', 'JSP');						
INSERT INTO TBL_SUBJECTS VALUES('5', 'JDBC');						
INSERT INTO TBL_SUBJECTS VALUES('6', 'CSS');						
INSERT INTO TBL_SUBJECTS VALUES('7', 'HTML');						
INSERT INTO TBL_SUBJECTS VALUES('8', 'JAVASCRIPT');		



-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�

-- ���ǽ� ������ �Է� 
INSERT INTO TBL_CLASSROOM VALUES('A1' , 'A101',  'A�� A-1��',  24);			
INSERT INTO TBL_CLASSROOM VALUES('A2' , 'A102',  'A�� A-2��',  21);			
INSERT INTO TBL_CLASSROOM VALUES('A3' , 'A103',  'A�� A-1��',  15);			
INSERT INTO TBL_CLASSROOM VALUES('A4' , 'A104',  'A�� A-2��',  19);			
INSERT INTO TBL_CLASSROOM VALUES('A5' , 'A105',  'A�� A-2��',  20);			
INSERT INTO TBL_CLASSROOM VALUES('B1' , 'B101',  'B�� B-1��',  22);			
INSERT INTO TBL_CLASSROOM VALUES('B2' , 'B102',  'B�� B-2��',  17);			
INSERT INTO TBL_CLASSROOM VALUES('B3' , 'B103',  'B�� B-1��',  20);			
INSERT INTO TBL_CLASSROOM VALUES('B4' , 'B104',  'B�� B-2��',  20);			
INSERT INTO TBL_CLASSROOM VALUES('B5' , 'B105',  'B�� B-2��',  11);			

-- Ŀ�� 
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_CLASSROOM 
ORDER BY 1;

---------------------------------------------------------------------------------------------------------------------------------
/*
===========================================================================
     �������� ������ ���� �� ���� ����������
===========================================================================
- ������ ���� ���� ��� ������ �� 
  ������, �����Ȱ����, �Ⱓ, �����, ���ǽ�, �������࿩�� ��ȸ 
*/
CREATE OR REPLACE VIEW VIEW_PROFESSORS
AS
SELECT PR.NAME "������", SU.NAME "�����Ȱ����", OS.START_DATE "������", OS.END_DATE "������"
     , BO.NAME "�����", CL.NAME "���ǽ�"
     , (CASE WHEN SYSDATE BETWEEN OS.START_DATE AND OS.END_DATE
             THEN '����������' ELSE '�����غ���' END) "�������࿩��"
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
--==>> View VIEW_PROFESSORS��(��) �����Ǿ����ϴ�.


/*
===========================================================================
     �������� �л� ���� �� ���� ����������
===========================================================================
- ������ �л� ���� ��� ������ ��
  �л���, ������, ��������, �������� ����, �ߵ�Ż������ ��ȸ 
*/
CREATE OR REPLACE VIEW VIEW_STUDENTS
AS
SELECT ST.NAME "�л���", CO.NAME "������", SU.NAME "��������", 
       NVL((GR.ATTEND*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10001')/100) 
        + GR.WRITE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10002')/100) 
        + GR.PRACTICE*((SELECT ALLOT FROM TBL_ALLOT WHERE OP_SUBJECT_CODE = OS.OP_SUBJECT_CODE AND POINT_CODE = 'PT10003')/100)),0)"������������"
     , (CASE WHEN CR.REGIST_CODE = QU.REGIST_CODE THEN '�ߵ�Ż��' ELSE ' ' END) "�ߵ�Ż������"          
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
--==>> View VIEW_STUDENTS��(��) �����Ǿ����ϴ�.
