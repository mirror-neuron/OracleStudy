/*------------------------------------------------
������ ���ǰ��ɰ��� ���̺�(TBL_PRO_SUB)������
---------------------------------------------------
PRO_SUB_CODE              -   ���ǰ��ɰ��� �ڵ� (PRIMARY KEY)
PRO_CODE                  -   �����ڵ� (FOREGIN KEY : TBL_PROFESSORS) 
SUBJECT_CODE              -   �����ڵ� (FOREGIN KEY : TBL_SUBJECTS) 
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
������ ���� ���̺�(TBL_ALLOT)������
---------------------------------------------------
ALLOT_CODE              -   �����ڵ� (PRIMARY KEY)
OP_SUBJECT_CODE         -   ���������ڵ� (FOREGIN KEY : TBL_OP_SUBJECTS) 
POINT_CODE               -   ����з��ڵ� (FOREGIN KEY : TBL_POINT_TYPE) 
ALLOT                   -   ���� (NOT NULL)
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
������ ���ǽ� ���̺�(TBL_CLASSROOM)������
---------------------------------------------------
CLR_CODE    -   ���ǽ��ڵ� (PRIMARY KEY)
NAME        -   ���ǽǸ� (NOT NULL) 
CAPACITY    -   �����ο� (NOT NULL)
LOCATION    -   ��ġ
*/

CREATE TABLE TBL_CLASSROOM
(   CLR_CODE    VARCHAR2(10)  
,   NAME        VARCHAR2(20) CONSTRAINT CLASSROOM_NAME_NN NOT NULL
,   LOCATION    VARCHAR2(20) 
,   CAPACITY    NUMBER(3) CONSTRAINT CLASSROOM_CAPACITY_NN NOT NULL
,   CONSTRAINT CLASSROOM_CLR_CODE_PK PRIMARY KEY(CLR_CODE)
);

/*------------------------------------------------
������ ������û ���̺�(TBL_COU_REGIST)������
---------------------------------------------------
REGIST_CODE     -   ������û�ڵ� (PRIMANRY KEY)
STU_CODE        -   �л��ڵ�    (FOREGIN KEY : TBL_STUDENTS) 
OP_COURSE_CODE  -   ���������ڵ� (FOREGIN KEY : TBL_OP_COURSES) 
REGIST_DATE     -   ������û��   (NOT NULL)
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
������� ������� ���̺� ��������
====================================================
--�� ������� ���̺�(TBL_QUIT_REASON) ���� �� PRIMARY KEY �߰�
CREATE TABLE TBL_QUIT_REASON
( REASON_CODE   VARCHAR2(10)                                                    
, REASON        VARCHAR2(30)     CONSTRAINT QUIT_REASON_REASON_NN NOT NULL       
, CONSTRAINT QUIT_REASON_REASON_CODE_PK PRIMARY KEY(REASON_CODE)
);

==========================================================
������� �ߵ����� ���̺� ��������
====================================================

--�� �ߵ����� ���̺�(TBL_QUIT) ���� �� PRIMARY KEY �߰�
CREATE TABLE TBL_QUIT
( QUIT_CODE     VARCHAR2(10)
, REGIST_CODE   VARCHAR2(10)
, QUIT_DATE     DATE DEFAULT SYSDATE
, REASON_CODE   VARCHAR2(10)    CONSTRAINT QUIT_REASON_CODE_NN NOT NULL
, CONSTRAINT QUIT_QUIT_CODE_PK PRIMARY KEY(QUIT_CODE)
);

--�� �ߵ����� ���̺�(TBL_QUIT) �������� ����
ALTER TABLE TBL_QUIT
ADD ( CONSTRAINT QUIT_REGIST_CODE_FK FOREIGN KEY(REGIST_CODE) REFERENCES TBL_COU_REGIST(REGIST_CODE)
    , CONSTRAINT QUIT_REASON_CODE_FK FOREIGN KEY(REASON_CODE) REFERENCES TBL_QUIT_REASON(REASON_CODE));

==========================================================
������� ������� ���̺� ��������
==========================================================

--�� ���� ���̺�(TBL_GRADE) ���� �� PRIMARY KEY �߰�
CREATE TABLE TBL_GRADE
( GRADE_CODE        VARCHAR2(10)
, REGIST_CODE       VARCHAR2(10)
, OP_SUBJECT_CODE   VARCHAR2(10)
, ATTEND            NUMBER(3)
, WRITE             NUMBER(3)
, PRACTICE          NUMBER(3)
, CONSTRAINT GRADE_GRADE_CODE_PK PRIMARY KEY(GRADE_CODE)
);

--�� ���� ���̺�(TBL_GRADE) �������� ����
ALTER TABLE TBL_GRADE
ADD ( CONSTRAINT GRADE_REGIST_CODE_FK FOREIGN KEY(REGIST_CODE) REFERENCES TBL_COU_REGIST(REGIST_CODE)
    , CONSTRAINT GRADE_OP_SUBJECT_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE) REFERENCES TBL_OP_SUBJECTS(OP_SUBJECT_CODE));
==========================================================
������� �Խ��� ���̺� ��������
==========================================================
--�� �Խ��� ���̺�(TBL_BOARD) ���� �� PRIMARY KEY �߰�
CREATE TABLE TBL_BOARD
( SEQ_INDEX     NUMBER
, WRITE_ID      VARCHAR2(20)
, WRITE_DATE    DATE DEFAULT SYSDATE
, CONTENT       VARCHAR2(2000)
, VIEWS         NUMBER(6)   DEFAULT 0
, CONSTRAINT BOARD_SEQ_INDEX_PK PRIMARY KEY(SEQ_INDEX)
);

--�� �Խ��� ���̺�(TLB_BOARD) �������� ����
ALTER TABLE TBL_BOARD
ADD CONSTRAINT BOARD_WRITE_ID_FK FOREIGN KEY(WRITE_ID) REFERENCES TBL_IDPW(ID);

==========================================================
��������л� ���̺� �����������
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

-- �л� ���̺� �������� �߰�
ALTER TABLE TBL_STUDENTS
ADD CONSTRAINT STUDENTS_ID_FK FOREIGN KEY(ID) REFERENCES TBL_IDPW(ID);

ALTER TABLE TBL_STUDENTS
ADD CONSTRAINT STUDENTS_SSN_UK UNIQUE (SSN);

==========================================================
������ᰳ������ ���̺� ���� �������
==========================================================

CREATE TABLE TBL_OP_COURSES
( OP_COURSE_CODE    VARCHAR2(10)    
, COURSE_CODE       VARCHAR2(10) CONSTRAINT COUTSES_COURSE_CODE_NN NOT NULL
, START_DATE        DATE
, END_DATE          DATE
, CLR_CODE          VARCHAR2(10)
, CONSTRAINT OP_COURSES_OP_COURSE_CODE_PK PRIMARY KEY (OP_COURSE_CODE)
);

-- �������� �������� �߰�
ALTER TABLE TBL_OP_COURSES
ADD (CONSTRAINT COURSES_COURSE_CODE_FK FOREIGN KEY (COURSE_CODE) REFERENCES TBL_COURSES(COURSE_CODE)
    ,CONSTRAINT COURSES_CLR_CODE_FK FOREIGN KEY (CLR_CODE) REFERENCES TBL_CLASSROOM(CLR_CODE));

ALTER TABLE TBL_OP_COURSES
ADD CONSTRAINT OP_COURSES_DATE_CK CHECK (START_DATE < END_DATE);

==========================================================
������ᰳ������ ���̺� ���� �������
==========================================================

-- �������� ���̺� ����
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


-- �������� �������� �߰�
ALTER TABLE TBL_OP_SUBJECTS
ADD (CONSTRAINT OP_SUBJECTS_SUBJECT_CODE_FK FOREIGN KEY (SUBJECT_CODE) REFERENCES TBL_SUBJECTS(SUBJECT_CODE)
    ,CONSTRAINT OP_SUBJECTS_OP_COURSE_CODE_FK FOREIGN KEY (OP_COURSE_CODE) REFERENCES TBL_OP_COURSES(OP_COURSE_CODE)
    ,CONSTRAINT OP_SUBJECTS_PRO_CODE_FK FOREIGN KEY (PRO_CODE) REFERENCES TBL_PROFESSORS(PRO_CODE)
    ,CONSTRAINT OP_SUBJECTS_BOOK_CODE_FK FOREIGN KEY (BOOK_CODE) REFERENCES TBL_BOOKS(BOOK_CODE));   
    
-- ��������(TBL_OP_SUBJECTS) �������� �߰�
ALTER TABLE TBL_OP_SUBJECTS
ADD CONSTRAINT OP_SUBJECTS_DATE_CK CHECK (START_DATE < END_DATE);

==========================================================
������������� ���̺� ���� �������
==========================================================

-- ������ ���̺� ����
CREATE TABLE TBL_POINT_TYPE
( POINT_CODE    VARCHAR2(10)
, POINT         VARCHAR2(20)
, CONSTRAINT POINT_TYPE_POINT_CODE_PK PRIMARY KEY (POINT_CODE)
);


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

/*-----------------------------------------------------------------
������ ������ ���̺�(TBL_ADMIN) ������ 
-------------------------------------------------------------------*/
CREATE TABLE TBL_ADMIN
(ADMIN_CODE VARCHAR2(10)                    --�������ڵ� PK
,ID         VARCHAR2(20)   CONSTRAINT TBL_ADMIN_NAME_NN NOT NULL --������ID (NOT NULL)���� ���� ���� 
,NAME       VARCHAR2(30)                    --�̸� (NOT NULL)
,SIGNDATE   DATE DEFAULT SYSDATE            --����� (SYSDATE)
,CONSTRAINT ADMIN_ADMIN_CODE_PK PRIMARY KEY(ADMIN_CODE)   --�������ڵ� PRIMARY KEY �������� ���� 
);

--�� TBL_������ - FOREIGN KEY �������� �߰�
ALTER TABLE TBL_ADMIN
ADD CONSTRAINT ADMIN_ID_FK FOREIGN KEY(ID) 
                REFERENCES TBL_IDPW(ID); --ID FOREIGN KEY �������� �߰�


----------------------------------------------
������  TBL_IDPW ���� ������ 
------------------------------------------------
CREATE TABLE TBL_IDPW
(ID VARCHAR2(20)                            --ID  PK
,PW VARCHAR2(30)  CONSTRAINT IDPW_PW_NN NOT NULL  --PW (NOT NULL)���� ���� ����          
,GROUP_CODE CHAR(2) CONSTRAINT IDPW_GROUP_CODE_NN NOT NULL  --�з��ڵ� (NOT NULL)���� ���� ����  
,CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)      ----ID PRIMARY KEY �������� ���� 
);

-- �� TBL_IDPW-- �������� �߰� 
ALTER TABLE TBL_IDPW
ADD CONSTRAINT IDPW_GROUP_CODE_FK FOREIGN KEY(GROUP_CODE) 
                REFERENCES TBL_GROUP(GROUP_CODE); -- FOREIGN KEY �������� �߰�


--------------------------------------------------
	������ ���� ���� ������
-------------------------------------------------
CREATE TABLE TBL_GROUP
(GROUP_CODE CHAR(2)                         --�з��ڵ� PK
,NAME       VARCHAR2(20)  CONSTRAINT GROUP_NAME_NN NOT NULL -- �з��� (NOT NULL)���� ���� ����
,CONSTRAINT GROUP_GROUP_CODE_PK PRIMARY KEY(GROUP_CODE)  
);

--------------------------------------------------
������ TBL_���� ���� ������
------------------------------------------------
CREATE TABLE TBL_PROFESSORS
(PRO_CODE       VARCHAR2(20)                --�����ڵ�   PK
,NAME           VARCHAR2(20) CONSTRAINT PROFESSORS_NAME_NN NOT NULL -- ������ (NOT NULL)���� ���� ����
,SSN            CHAR(14)     CONSTRAINT PROFESSORS_SSN_NN NOT NULL -- �ֹε�Ϲ�ȣ (NOT NULL)���� ���� ����
,TEL            CHAR(20)                    --��ȭ��ȣ
,SIGNDATE       DATE DEFAULT SYSDATE        --������ (SYSDATE)
,ID             VARCHAR2(20)                --����ID
,CONSTRAINT PROFESSORS_PRO_CODE_PK PRIMARY KEY(PRO_CODE) --�����ڵ� PRIMARY KEY 
);


--��TBL_����  �������� �߰� 
ALTER TABLE TBL_PROFESSORS
ADD CONSTRAINT PROFESSORS_ID_FK FOREIGN KEY(ID) 
                REFERENCES TBL_IDPW(ID); --ID FOREIGN KEY �������� �߰�

ALTER TABLE TBL_PROFESSORS
ADD CONSTRAINT PROFESSORS_SSN_UK UNIQUE(SSN);