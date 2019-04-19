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
EXEC PRC_PROFESSORS_INSERT ('��̿�', '901015-2234567', '010-1567-1578', '2019-01-19');
EXEC PRC_PROFESSORS_INSERT ('�̼���', '790312-2845651', '010-2548-1117', '2017-02-01');
EXEC PRC_PROFESSORS_INSERT ('������', '871111-1845125', '010-4874-2451', '2018-12-31');
EXEC PRC_PROFESSORS_INSERT ('������', '807865-1335845', '010-2156-9494', '2019-03-01');

-- Ŀ��
COMMIT;
--==>> Ŀ�ԿϷ�

SELECT *
FROM TBL_PROFESSORS;
/*
PR10018	���׼�	782565-1324567	010-2323-7562       	18/05/25	P10041���׼�
PR10016	�趥��	870624-1045555	010-9170-3896       	19/04/11	P10039�趥��
PR10035	���׼�	782565-1324568	010-2323-7562       	16/10/10	P10068���׼�
PR10036	���׼�	82565-1324568 	010-2323-7562       	16/11/10	P10079���׼�
PR10037	���׳�	820213-1324568	010-2323-7562       	16/11/10	P10080���׳�
PR10038	������	800325-2490918	010-6748-0000       	17/11/10	P10081������
PR10001	������	870909-1234567	010-7894-1546       	18/09/09	P10010������
PR10002	��̿�	901009-2234567	010-1567-1578       	19/01/19	P10011��̿�
PR10003	�̼���	790312-2845651	010-2548-1117       	17/02/01	P10012�̼���
PR10004	������	871111-1845125	010-4874-2451       	18/12/31	P10013������
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
���׼�	MACHINERUNNING	19/06/13	19/07/18	����ȭ�� ���� ����Ŭ ����ȭ�ǹ�	B205	���� ����
�趥��	PYTHON	18/09/13	18/12/21	���̽�	A205	���� ����
�趥��	JAVA	18/06/11	18/09/12	¥��	A205	���� ����
������	SPRING	19/08/01	19/09/21	�������	C805	���� ����
������	ORACLE	18/07/11	18/08/11	¥��	A205	���� ����
������	ORACLE	19/05/22	19/07/30	����ȭ�� ���� ����Ŭ ����ȭ�ǹ�	C805	���� ����
��̿�	SPRING	19/10/02	19/11/24	�������	F105	���� ����
��̿�	JAVA	19/03/21	19/05/21	�̰��� �ڹٴ�	C805	���� ��
�̼���	PYTHON	18/12/26	19/02/10	�̰��� PYTHON�̴�	A101	���� ����
�̼���	ORACLE	19/02/11	19/04/01	����ȭ�� ���� ����Ŭ ����ȭ�ǹ�	A101	���� ����
�̼���	JAVA	19/02/11	19/04/11	�̰��� �ڹٴ�	B205	���� ����
�̼���	JAVA	19/05/21	19/07/21	�̰��� �ڹٴ�	F105	���� ����
������	ORACLE	19/04/12	19/06/12	�پ��� ������ ���� ���� ����Ŭ	B205	���� ��
������	ORACLE	19/07/22	19/10/01	�پ��� ������ ���� ���� ����Ŭ	F105	���� ����
*/
SELECT *
FROM VIEW_PR_REMATCH_TEST;
/*
������	PR10001	ORACLE	SU10002
������	PR10001	ORACLE	SU10002
������	PR10001	SPRING	SU10003
��̿�	PR10002	SPRING	SU10003
��̿�	PR10002	JAVA	SU10001
�̼���	PR10003	ORACLE	SU10002
�̼���	PR10003	JAVA	SU10001
�̼���	PR10003	JAVA	SU10001
�̼���	PR10003	PYTHON	SU10004
������	PR10004	ORACLE	SU10002
������	PR10004	ORACLE	SU10002
�趥��	PR10016	JAVA	SU10001
�趥��	PR10016	PYTHON	SU10004
���׼�	PR10018	MACHINERUNNING	SU10005
*/

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
             THEN '���� ��' ELSE (CASE WHEN SYSDATE < OS.START_DATE THEN '���� ����' 
                                       WHEN SYSDATE > OS.END_DATE THEN '���� ����'
                                       ELSE 'Ȯ�κҰ�' END) END ) "�������࿩��"
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


SELECT *
FROM TBL_QUIT_REASON;

SELECT *
FROM USER_VIEWS;


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


SELECT ut.table_name"���̺��̸�",ut.table_type"����",uc.column_name,uc.comments FROM  USER_TAB_COMMENTS UT LEFT JOIN USER_COL_COMMENTS UC 
   ON ut.table_name = uc.table_name
   WHERE ut.comments IS NOT NULL;


SELECT *
FROM TBL_

EXEC PRC_CLASSROOM_INSERT('A101', '�Ͼǰ�A 1��', 50);
EXEC PRC_CLASSROOM_INSERT('A205', '�Ͼǰ�A 1��', 50);
EXEC PRC_CLASSROOM_INSERT('B205', '����B 2��', 40);
EXEC PRC_CLASSROOM_INSERT('C805', '������C 8��', 45);
EXEC PRC_CLASSROOM_INSERT('F105', '������F 1��', 80);
EXEC PRC_CLASSROOM_INSERT('D106', 'ǳ����A 1��', 30);
EXEC PRC_CLASSROOM_INSERT('D106', 'ǳ����A 1��', 30);



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
CL10007	D106	ǳ����A 1��	30
CL10001	A101	�Ͼǰ�A 1��	50
CL10002	A205	�Ͼǰ�A 2��	50
CL10003	B205	����B 2��	40
CL10004	C805	������C 8��	45
CL10005	F105	������F 1��	80
CL10006	D106	ǳ����A 1��	30

SELECT * 
FROM TBL_OP_COURSES;

SELECT * 
FROM ALL_SOURCE
WHERE NAME = 'PRC_CLASSROOM_INSERT';
