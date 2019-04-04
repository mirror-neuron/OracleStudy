SELECT USER
FROM DUAL;
--==>> HR 


/*
--�� ����ڡڡ�

1. ����(relationship, relation)
   - ��� ��Ʈ��(entry)�� ���ϰ��� ������.
   - �� ��(column)�� ������ �̸��� ������ ������ ���ǹ��ϴ�.
   - ���̺��� ��� ��(row = Ʃ�� = tuple)�� �������� ������ ������ ���ǹ��ϴ�.
   
2. �Ӽ�(attribute)
   - ���̺��� ��(column)�� ��Ÿ����.
   - �ڷ��� �̸��� ���� �ּ� ���� ���� : ��ü�� ����, ���� ���
   - �Ϲ� ����(file)�� �׸�(������ = item = �ʵ� = field)�� �ش��Ѵ�.
   - ��ƼƼ(entity)�� Ư���� ���¸� ���
   - �Ӽ�(attribute)�� �̸��� ��� �޶�� �Ѵ�.

3. Ʃ�� = tuple = ��ƼƼ = entity
   - ���̺��� ��(row)
   - ������ �� ���� �Ӽ����� ����
   - ���� ���� ����
   - �Ϲ� ����(file)�� ���ڵ�(record)�� �ش��Ѵ�.
   - Ʃ�� ����(tuple variable)
     : Ʃ��(tuple)�� ����Ű�� ����, ��� Ʃ�� ������ ���������� �ϴ� ����

4. ������(domain) �� ������Ÿ��
   - �� �Ӽ�(attribute)�� ���� �� �ֵ��� ���� ������ ����
   - �Ӽ� ��� ������ ���� �ݵ�� ������ �ʿ�� ����
   - ��� �����̼ǿ��� ��� �Ӽ����� �������� ������(atomic)�̾�� ��.
   - ������ ������
     : �������� ���Ұ� �� �̻� �������� �� ���� ����ü�� ���� ��Ÿ��

5. �����̼�(relation)
   - ���� �ý��ۿ��� ���ϰ� ���� ����
   - �ߺ��� Ʃ��(tuple = entity = ��ƼƼ)�� �������� �ʴ´�.
     �� ��� ������(Ʃ���� ���ϼ�)
   - �����̼� = Ʃ��(��ƼƼ = entity)�� ����. ���� Ʃ���� ������ ���ǹ��ϴ�. 
   - �Ӽ�(attribute)������ ������ ����.
   
*/

--------------------------------------------------------------------------------------------------------------------------------

--���� ���Ἲ(Integrity) ����--
/*
1. ���Ἲ���� ��ü ���Ἲ(Entity Integrity) 
              ���� ���Ἲ(Relational Integrity)
              ������ ���Ἲ(Domain Integrity) �� �ִ�.

2. ��ü ���Ἲ
   ��ü ���Ἲ�� �����̼ǿ��� ����Ǵ� Ʃ��(tuple)��
   ���ϼ��� �����ϱ� ���� ���������̴�.

3. ���� ���Ἲ(�θ�-�ڽ� ���̺� ����)
   ���� ���Ἲ�� �����̼� ���� ������ �ϰ�����
   �����ϱ� ���� ���������̴�.
   
4. ������ ���Ἲ(������ Ÿ��)
   ������ ���Ἲ�� ��� ������ ���� ������ 
   �����ϱ� ���� ���������̴�.
   
5. ���������� ����

   - PRIMARY KEY(PK:P) �� �θ� ���̺��� �����޴� �÷� �� �⺻Ű(����Ű), �ĺ��� 
     �ش� �÷��� ���� �ݵ�� �����ؾ� �ϸ�, �����ؾ� �Ѵ�.
     (UNIQUE �� NOT NULL �� ���յ� ����)
    
   - FOREIGN KEY(FK:F:R) �� �ڽ� ���̺��� �����ϴ� �÷� �� �ܺ�Ű, �ܷ�Ű, ����Ű
     �ش� �÷��� ���� �����Ǵ� ���̺��� �÷� �����͵� �� �ϳ���
     ��ġ�ϰų� NULL �� ������.
    
   - UNIQUE(UK:U)
     ���̺� ������ �ش� �÷��� ���� �׻� �����ؾ� �Ѵ�. EX.��ȭ��ȣ, �ֹι�ȣ ��
     
   - NOT NULL(NN:CK:C)
     �ش� �÷��� NULL �� ������ �� ����.
     
   - CHECK(CK:C)
     �ش� �÷����� ���� ������ �������� ���� ������ ������ �����Ѵ�.
     
     EX. NUMBER(3) -999 ~ 999 �� 0~100(CHECK)

*/


-----------------------------------------------------------------------------------

--���� PRIMARY KEY ����--

-- 1. ���̺� ���� �⺻ Ű�� �����Ѵ�.

-- 2. ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷� �Ǵ� �÷��� �����̴�.
--    �⺻ Ű�� ���̺� �� �ִ� �ϳ��� �����Ѵ�.
--    �׷��� �ݵ�� �ϳ��� �÷����θ� �����Ǵ� ���� �ƴϴ�.
--    NULL �� �� ����, �̹� ���̺� �����ϰ� �ִ� �����͸�
--    �ٽ� �Է��� �� ������ ó���ȴ�.
--    UNIQUE INDEX �� �ڵ����� �����ȴ�.
--    (����Ŭ�� ��ü������ �����.)

-- 3. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] PRIMARY KEY[(�÷���, ...)] �� ��[]���� ������ ������ ����

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� PRIMARY KEY(�÷���, ...) �� CONSTRAINT : ��������

-- 4. CONSTRAINT �߰� �� CONSTRAINT���� �����ϸ�
--    ����Ŭ ������ �ڵ������� CONSTRAINT ���� �ο��ϰ� �ȴ�. ��  CONSTRAINT���� ���� ���ϸ� ����Ŭ�� 'SYS~~~'�� �ο�, ���Ŀ� ���� �����
--    �Ϲ������� CONSTRAINT ���� �����̺��_�÷���_CONSTRAINT�� �� ������ CONSTRAINT���� �Ű�Ἥ �ۼ��ϰ� �����ؾ� �Ѵ�.
--    �������� ����Ѵ�.

--�� PK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST1
( COL1      NUMBER(5)       PRIMARY KEY -->  TEST1_COL1_PK (�� �ٸ� �۾��ڰ� �������Ǹ��� ���� ���� ã�� �۾��� �� ����)
, COL2      VARCHAR2(30)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST1(COL1) VALUES(4);
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻�  unique constraint (HR.SYS_C007012) violated
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2, 'KKKK'); --> ���� �߻�                     ---------------(���������� �̸�)
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST1"."COL1")
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻�
INSERT INTO TBL_TEST1(COL2) VALUES ('STUDY'); --> ���� �߻� ORA-01400: cannot insert NULL into ("HR"."TBL_TEST1"."COL1")

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

DESC TBL_TEST1;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)         �� PK ���� Ȯ�� �Ұ�
COL2          VARCHAR2(30)
*/

--�� �������� Ȯ��
SELECT *
FROM USER_CONSTRAINTS;
--==>> 
/*
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHA INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR                             SYS_C004102                    O EMP_DETAILS_VIEW                                                                                                                                                                        ENABLED  NOT DEFERRABLE IMMEDIATE NOT VALIDATED GENERATED NAME          14/05/29                                                                                     
HR                             JHIST_DATE_INTERVAL            C JOB_HISTORY                    end_date > start_date                                                                                                                                    ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_JOB_NN                   C JOB_HISTORY                    "JOB_ID" IS NOT NULL                                                                                                                                     ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_END_DATE_NN              C JOB_HISTORY                    "END_DATE" IS NOT NULL                                                                                                                                   ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_START_DATE_NN            C JOB_HISTORY                    "START_DATE" IS NOT NULL                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_EMPLOYEE_NN              C JOB_HISTORY                    "EMPLOYEE_ID" IS NOT NULL                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_SALARY_MIN                 C EMPLOYEES                      salary > 0                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_JOB_NN                     C EMPLOYEES                      "JOB_ID" IS NOT NULL                                                                                                                                     ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_HIRE_DATE_NN               C EMPLOYEES                      "HIRE_DATE" IS NOT NULL                                                                                                                                  ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_EMAIL_NN                   C EMPLOYEES                      "EMAIL" IS NOT NULL                                                                                                                                      ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_LAST_NAME_NN               C EMPLOYEES                      "LAST_NAME" IS NOT NULL                                                                                                                                  ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     

OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHA INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR                             JOB_TITLE_NN                   C JOBS                           "JOB_TITLE" IS NOT NULL                                                                                                                                  ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             DEPT_NAME_NN                   C DEPARTMENTS                    "DEPARTMENT_NAME" IS NOT NULL                                                                                                                            ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             LOC_CITY_NN                    C LOCATIONS                      "CITY" IS NOT NULL                                                                                                                                       ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             COUNTRY_ID_NN                  C COUNTRIES                      "COUNTRY_ID" IS NOT NULL                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             REGION_ID_NN                   C REGIONS                        "REGION_ID" IS NOT NULL                                                                                                                                  ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_EMP_FK                   R JOB_HISTORY                                                                                                     HR                             EMP_EMP_ID_PK                  NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             DEPT_MGR_FK                    R DEPARTMENTS                                                                                                     HR                             EMP_EMP_ID_PK                  NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_MANAGER_FK                 R EMPLOYEES                                                                                                       HR                             EMP_EMP_ID_PK                  NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_JOB_FK                   R JOB_HISTORY                                                                                                     HR                             JOB_ID_PK                      NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             EMP_JOB_FK                     R EMPLOYEES                                                                                                       HR                             JOB_ID_PK                      NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             JHIST_DEPT_FK                  R JOB_HISTORY                                                                                                     HR                             DEPT_ID_PK                     NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     

OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHA INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR                             EMP_DEPT_FK                    R EMPLOYEES                                                                                                       HR                             DEPT_ID_PK                     NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             DEPT_LOC_FK                    R DEPARTMENTS                                                                                                     HR                             LOC_ID_PK                      NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             LOC_C_ID_FK                    R LOCATIONS                                                                                                       HR                             COUNTRY_C_ID_PK                NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             COUNTR_REG_FK                  R COUNTRIES                                                                                                       HR                             REG_ID_PK                      NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29                                                                                     
HR                             COUNTRY_C_ID_PK                P COUNTRIES                                                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             COUNTRY_C_ID_PK                                      
HR                             DEPT_ID_PK                     P DEPARTMENTS                                                                                                                                                                             ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             DEPT_ID_PK                                           
HR                             EMP_EMAIL_UK                   U EMPLOYEES                                                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             EMP_EMAIL_UK                                         
HR                             EMP_EMP_ID_PK                  P EMPLOYEES                                                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             EMP_EMP_ID_PK                                        
HR                             JHIST_EMP_ID_ST_DATE_PK        P JOB_HISTORY                                                                                                                                                                             ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             JHIST_EMP_ID_ST_DATE_PK                              
HR                             JOB_ID_PK                      P JOBS                                                                                                                                                                                    ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             JOB_ID_PK                                            
HR                             LOC_ID_PK                      P LOCATIONS                                                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             LOC_ID_PK                                            

OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHA INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR                             REG_ID_PK                      P REGIONS                                                                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               14/05/29 HR                             REG_ID_PK                                            
HR                             SYS_C007012                    P TBL_TEST1                                                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          19/04/04 HR                             SYS_C007012                                          
*/

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='TBL_TEST1';
--==>>
/*
HR	SYS_C007012	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			19/04/04	HR	SYS_C007012		
*/

--�� ���������� ������ �÷� Ȯ��(��ȸ)
SELECT *
FROM USER_CONS_COLUMNS;

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>>
/*
HR	SYS_C007012	TBL_TEST1	COL1	1
*/

--�� ���������� ������ ������, �����, ���̺��, ��������, �÷��� �׸� ��ȸ
--(1) SQL 1992 CODE
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007012	TBL_TEST1	P	COL1

--(2) SQL 1999 CODE
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC LEFT JOIN USER_CONS_COLUMNS UCC
  ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
WHERE UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007012	TBL_TEST1	P	COL1


--�� PK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST2
( COL1  NUMBER(5)       
, COL2  VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.


-- ������ �Է�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES(4);
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻�  unique constraint (��HR.TEST2_COL1_PK) violated
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'KKKK'); --> ���� �߻�                     ---------------(���������� �̸�)
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST1"."COL1")
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻�
INSERT INTO TBL_TEST2(COL2) VALUES ('STUDY'); 

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

--�� ���������� ������ ������, �����, ���̺��, ��������, �÷��� �׸� ��ȸ
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1


--�� PK ���� �ǽ�(�� ���� �÷� PK ���� �� ���� �����̸Ӹ� Ű) --> �÷� �����δ� ���� ����(PK�� �ϳ� �̻� �����ϴ� �ǹ̰� �Ǵϱ�)
CREATE TABLE TBL_TEST3
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

--(X)
/*
CREATE TABLE TBL_TEST3
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST3_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST3_COL2_PK PRIMARY KEY(COL2)
);
*/

-- ������ �Է�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);  --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL2")
INSERT INTO TBL_TEST3(COL1) VALUES(4);              --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL2")
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');--> ���� �߻� unique constraint (HR.TEST3_COL1_COL2_PK) violated
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, 'ABCD'); --> ���� PK�̹Ƿ� ���� ���Ǹ� �����ϸ� �����
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'ABCD'); -- �ΰ��� ��� ��ġ�ؾ� �ߺ��� ������ ������
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'KKKK'); --                     "
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL1")
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL1")
INSERT INTO TBL_TEST3(COL2) VALUES('STUDY'); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST3"."COL1")

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� PK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� PK ����)
-- ���̺� ����
CREATE TABLE TBL_TEST4
( COL1      NUMBER(5)
, COL2      VARCHAR2(30)
);
--==>> Table TBL_TEST4��(��) �����Ǿ����ϴ�.

--�� �̹� ������� �ִ� ���̺�
--   �ο��Ϸ��� ���������� ������ �����Ͱ� ���ԵǾ� ���� ���
--   �ش� ���̺� ���������� �߰��ϴ� ���� �Ұ����ϴ�.

-- �������� �߰�(����� ������ ���ԾȵǾ� ����)
ALTER TABLE TBL_TEST4 
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4��(��) ����Ǿ����ϴ�.


-- ������ �Է�
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST4(COL1) VALUES(4);
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻�  unique constraint (HR.TEST4_COL1_PK) violated
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'KKKK'); --> ���� �߻�                     ---------------(���������� �̸�)
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� cannot insert NULL into ("HR"."TBL_TEST1"."COL1")
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(NULL, 'STUDY'); --> ���� �߻�
INSERT INTO TBL_TEST4(COL2) VALUES ('STUDY');


COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST4;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

--�� �������� Ȯ�ο� ���� ��(VIEW) ����
--(2) SQL 1999 CODE
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
     , UC.CONSTRAINT_NAME "CONSTARINT_NAME"
     , UC.TABLE_NAME "TABLE_NAME"
     , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
     , UCC.COLUMN_NAME "COLUMN_NAME"
     , UC.SEARCH_CONDITION "SEARCH_CONDITION"
     , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.

--�� ������ ��(VIEW)�� ���� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		


----------------------------------------------------------------------------------------------------------

--���� UNIQUE(UK:U) ����--

-- 1. ���̺��� ������ �÷��� �����Ͱ� �ߺ����� �ʰ�(������ ���� ����)
--    ���̺� ������ ������ �� �ֵ��� �����ϴ� ��������.
--    PRIMARY KEY �� ������ ��������������, NULL �� ����Ѵٴ� ���̰� �ִ�.��
--    ���������� PRIMARY KEY �� ���������� UNIQUE INDEX �� �ڵ� �����ȴ�.
--    �ϳ��� ���̺� ������ UNIQUE ���������� ���� �� �����ϴ� ���� �����ϴ�.
--    ��, �ϳ��� ���̺� UNIQUE ���������� ���� �� ����� ����
--    �����ϴٴ� ���̴�.(���� ���� ����)

-- 2. ���� �� ����
--�� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��]

--�� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��, 
-- CONSTRAINT CONSTRAINT�� UNIQUE(�÷���, ...)

--�� UK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST5
( COL1      NUMBER(5)       PRIMARY KEY
, COL2      VARCHAR2(30)    UNIQUE
);
--==>> Table TBL_TEST5��(��) �����Ǿ����ϴ�.
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>>
/*
HR	SYS_C007016	TBL_TEST5	P	COL1		
HR	SYS_C007017	TBL_TEST5	U	COL2		
*/

-- ������ �Է�
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST5(COL1) VALUES(4);
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(4, 'ABCD'); --> ���� �߻� 'ABCD'�ߺ� unique constraint (HR.SYS_C007016) violated
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(2, 'ABCD'); --> ���� �߻� '2'�� 'ABCD'�ߺ� unique constraint (HR.SYS_C007016) violated
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� PK NULL ��� �ȵ�  cannot insert NULL into ("HR"."TBL_TEST5"."COL1")
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(5, NULL);  --> NULL�� ������ ���� �ƴϹǷ� �ߺ����� ���� ����

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	
*/

--�� UK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST6
( COL1     NUMBER(5)
, COL2     VARCHAR2(30)
, CONSTRAINT PK_TEST6_COL1 PRIMARY KEY(COL1)  --> CONSTARINT TEST6_COL1_PK �� ���� 
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==>> Table TBL_TEST6��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
--==>>
/*
HR	PK_TEST6_COL1	TBL_TEST6	P	COL1		
HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		
*/


--�� UK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� UK �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_TEST7
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST7��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST7';
--==>> ��ȸ ��� ����(���� �������� �߰� ����)

-- �������� �߰�
ALTER TABLE TBL_TEST7
ADD ( CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST7_COL2_UK UNIQUE(COL2) );
--==>> Table TBL_TEST7��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST7';
--==>>
/*
HR	TEST7_COL1_PK	TBL_TEST7	P	COL1		
HR	TEST7_COL2_UK	TBL_TEST7	U	COL2		
*/


----------------------------------------------------------------------------------------------------------

--���� CHECK(CK:C) ����--

-- 1. �÷����� ��� ������ �������� ������ ������ �����ϱ� ���� ��������
--    �÷��� �ԷµǴ� �����͸� �˻��Ͽ� ���ǿ� �´� �����͸� �Էµ�
--    �� �ֵ��� ó���ϸ�, �����Ǵ� ������ ���� �˻��Ͽ� ���ǿ� �´�
--    �����ͷ� �����Ǵ� �͸� ����ϴ� ����� �����ϰ� �ȴ�.

-- 2. ���� �� ����
--�� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] CHECK (�÷� ����)

--�� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTARINT�� CHECK (�÷� ����)

--�� NUMBER(38)      ����...
--   CHAR(2000)      ����...
--   VARCHAR2(4000)  ����...
--   NCHAR(1000)     ����...
--   NVARCHAR2(2000) ����...


--�� CK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST8
( COL1      NUMBER(5)      PRIMARY KEY
, COL2      VARCHAR2(30)   
, COL3      NUMBER(3)      CHECK (COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST8��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(1, '����', 100);
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '����', 101); --> ���� �߻� check constraint (HR.SYS_C007022) violated
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(3, '����', -1);  --> ���� �߻� check constraint (HR.SYS_C007022) violated
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(4, '�ֿ�', 80);

COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_TEST8;
--==>>
/*
1	����	100
4	�ֿ�	80
*/

--�� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST8';
--==>>
/*
HR	SYS_C007022	TBL_TEST8	C	COL3	COL3 BETWEEN 0 AND 100	
HR	SYS_C007023	TBL_TEST8	P	COL1		
*/

--�� CK ���� �ǽ�(�� ���̺� ������ ����)
CREATE TABLE TBL_TEST9
( COL1      NUMBER(3)
, COL2      VARCHAR2(30)
, COL3      NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_UK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(1, '����', 100);
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '����', 101); --> ���� �߻� check constraint (HR.TEST9_COL3_UK) violated
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(3, '����', -1);  --> ���� �߻� check constraint (HR.TEST9_COL3_UK) violated
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(4, '�ֿ�', 80);

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST9';
--==>>
/*
HR	TEST9_COL3_UK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
HR	TEST9_COL1_PK	TBL_TEST9	P	COL1		
*/


--�� CK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� CK �������� �߰�)
CREATE TABLE TBL_TEST10
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, COL3  NUMBER(3)
);
--==>> Table TBL_TEST10��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>> ��ȸ ��� ����

-- �������� �߰�
ALTER TABLE TBL_TEST10
ADD ( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST10_COL3_PK CHECK(COL3 BETWEEN 0 AND 100) );
--==>> Table TBL_TEST10��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>>
/*
HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
HR	TEST10_COL3_PK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/


--�� �ǽ� ����
-- ������ ���� TBL_TESTMEMBER ���̺��� �����Ͽ�
-- SSN �÷�(�ֹι�ȣ �÷�)���� 
-- ������ �Է� �� ������ ��ȿ�� �����͸� �Էµ� �� �ֵ���
-- üũ ���������� �߰��� �� �ֵ��� �Ѵ�.
-- �� �ֹι�ȣ Ư�� �ڸ��� �Է� ������ �����ͷ� 1, 2, 3, 4 �� ����
-- ����, SID �÷����� PRIMARY KEY ���������� ������ �� �ֵ��� �Ѵ�.

-- ���̺� ����
CREATE TABLE TBL_TESTMEMBER
( SID      NUMBER
, NAME     VARCHAR2(30)
, SSN      CHAR(14)         -- �Է� ���� �� 'YYMMDD-NNNNNNN'
, TEL      VARCHAR2(40)
);
--==>> Table TBL_TESTMEMBER��(��) �����Ǿ����ϴ�.

-- �������� �߰�
ALTER TABLE TBL_TESTMEMBER 
ADD( CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
   , CONSTRAINT TESTMEMBER_SSN_CK CHECK(�ֹι�ȣ 8��° �ڸ� 1���� '1' �Ǵ� '2' �Ǵ� '3' �Ǵ� '4')
);

ALTER TABLE TBL_TESTMEMBER 
ADD( CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
   , CONSTRAINT TESTMEMBER_SSN_CK CHECK ((SUBSTR(SSN, 8, 1) IN ('1', '2', '3', '4'))
                                        AND (SSN LIKE '______-_______'))
);
     
DROP TABLE TBL_TESTMEMBER;     
                                        
-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';
--==>>
/*
HR	TESTMEMBER_SID_PK	TBL_TESTMEMBER	P	SID		
HR	TESTMEMBER_SSN_CK	TBL_TESTMEMBER	C	SSN	"(SUBSTR(SSN, 8, 1) IN ('1', '2', '3', '4'))
                                        AND (SSN LIKE '______-_______')"	
*/

--�� �������� ���� ���
ALTER TABLE TBL_TESTMEMBER          --> ALTER TABLE TABLE��
DROP CONSTRAINT TESTMEMBER_SID_PK;  --  DROP CONSTRAINT CONSTRAINT��;


-- �Է� �׽�Ʈ
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(1, '�̿���', '901212-1234567', '010-1111-1111');
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(2, '�輱��', '901212-2234567', '010-2222-2222');
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(3, '�ӳ���', '901212-8234567', '010-8888-8888'); --> ���� �߻� check constraint (HR.TESTMEMBER_SSN_CK) violated
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(4, '���ֿ�', '901212-0234567', '010-0000-0000'); --> ���� �߻� check constraint (HR.TESTMEMBER_SSN_CK) violated
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5, '���ֿ�', '01212-0234567', '010-0000-0000'); --> ���� �߻� check constraint (HR.TESTMEMBER_SSN_CK) violated

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TESTMEMBER;
--==>>
/*
1	�̿���	901212-1234567	010-1111-1111
2	�輱��	901212-2234567	010-2222-2222
*/

-----------------------------------------------------------------------------------------------------------------

--���� FOREIGN KEY(FK:F:R) ����--

-- 1. ���� Ű �Ǵ� �ܷ� Ű(FK)�� 
--    �� ���̺��� ������ �� ������ �����ϰ�
--    ���� �����Ű�µ� ���Ǵ� ���̴�.
--    �� ���̺��� �⺻ Ű ���� �ִ� ����
--    �ٸ� ���̺� �߰��ϸ� ���̺� �� ������ ������ �� �ִ�.
--    �� ��, �� ��° ���̺� �߰��Ǵ� ���� �ܷ� Ű�� �ȴ�.

-- 2. �θ� ���̺�(�����޴� �÷��� ���Ե� ���̺�)�� ���� ������ �� 
--    �ڽ� ���̺�(�����ϴ� �÷��� ���Ե� ���̺�)�� �����Ǿ�� �Ѵ�.
--    �� ��, �ڽ� ���̺� FOREIGN KEY ���������� �����ȴ�.

-- 3. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��]
--                   REFERENCES ���� ���̺��(���� �÷���)
--                   [ON DELETE CASCADE | ON DELETE SET NULL]


-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��, 
-- CONSTRAINT CONSTRAINT�� FOREIGN KEY(�÷���)
--            REFERECES �������̺��(�����÷���)
--            [ON DELETE CASCADE | ON DELETE SET NULL]

--�� FOREIGN KEY ���������� �����ϴ� �ǽ��� �����ϱ� ���ؼ���
--   �������� �ϳ��� ���̺��� �����Ͽ� ó���ϴ� ���� �ƴ϶�
--   �θ� ���̺� ���� �۾��� ���� �����ؾ� �Ѵ�.
--   �׸��� �� ��, �θ� ���̺��� �ݵ�� PK �Ǵ� UK ����������
--   ������ �÷��� �����ؾ� �Ѵ�.


-- �θ� ���̺� ���� 
CREATE TABLE TBL_JOBS
( JIKWI_ID      NUMBER
, JIKWI_NAME    VARCHAR2(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS��(��) �����Ǿ����ϴ�.

-- �θ� ���̺� ������ �Է�
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1, '���');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2, '�븮');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3, '����');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4, '����');

SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� FK ���� �ǽ�(�� �÷� ������ ����)
CREATE TABLE TBL_EMP1
( SID       NUMBER          PRIMARY KEY
, NAME      VARCHAR2(30)    
, JIKWI_ID  NUMBER          REFERENCES TBL_JOBS(JIKWI_ID) -- ��FOREIGN KEY �ۼ� ����(� ���̺��� �����ϳİ� �� �߿���)
);
--==>> Table TBL_EMP1��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007036	TBL_EMP1	P	SID		
HR	SYS_C007037	TBL_EMP1	R	JIKWI_ID		NO ACTION(��)
*/

-- ������ �Է�
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (1, '������', 1);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (2, '���Ѿ�', 2);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (3, '�̽���', 3);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (4, '������', 4);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (5, '��ȫ��', 5); --> ���� �߻� integrity constraint (HR.SYS_C007037) violated - parent key not found
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (5, '��ȫ��', 1);                                                                
INSERT INTO TBL_EMP1(SID, NAME) VALUES (6, '������');
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (7, '�̱��', NULL);


SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	���Ѿ�	2
3	�̽���	3
4	������	4
5	��ȫ��	1
6	������	
7	�̱��	
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� FK ���� �ǽ�(�� ���̺� ������ ����)
CREATE TABLE TBL_EMP2
( SID           NUMBER
, NAME          VARCHAR2(30)
, JIKWI_ID      NUMBER
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP2_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP2';
--==>>
/*
HR	EMP2_SID_PK	        TBL_EMP2	P	SID		
HR	EMP2_JIKWI_ID_FK	TBL_EMP2	R	JIKWI_ID		NO ACTION
*/

--�� FK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� FK �������� �߰�)
-- ���̺� ���� (�θ� ���̺� �ϳ��� �ڽ� ���̺� ������ ���� �� ���� �� TBL_JOBS / TBL_EMP1, TBL_EMP2, TBL_EMP3)
CREATE TABLE TBL_EMP3
( SID           NUMBER
, NAME          VARCHAR2(30)
, JIKWI_ID      NUMBER
);
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> ��ȸ ��� ����

-- �������� �߰� 
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIK_ID_FK FOREIGN KEY(JIKWI_ID)
                    REFERENCES TBL_JOBS(JIKWI_ID) );
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>>
/*
HR	EMP3_SID_PK	TBL_EMP3	    P	SID		
HR	EMP3_JIK_ID_FK	TBL_EMP3	R	JIKWI_ID		NO ACTION
*/


-- 4. FOREIGN KEY ���� �� ���ǻ���
--    �����ϰ��� �ϴ� �θ� ���̺��� ���� �����ؾ� �Ѵ�.
--    �����ϰ��� �ϴ� �÷��� PRIMARY KEY �� UNIQUE ���������� �־�� �Ѵ�.
--    ���̺� ���̿� PRIMARY KEY �� FOREIGN KEY �� ���ǵǾ� ������
--    PRIMARY KEY ���������� ������ �÷��� ������ ���� ��
--    FOREIGN KEY �÷��� �� ���� �ԷµǾ� �ִ� ��� �������� �ʴ´�.
--    (��, FK ���� �������� ��ON DELETE CASCADE���� 
--     ��ON DELETE SET NULL�� �ɼ��� ����Ͽ� ������ ��쿡��
--     ������ �����ϴ�.)
--    �θ� ���̺��� �����ϱ� ���ؼ��� �ڽ� ���̺��� ���� �����ؾ� �Ѵ�.


