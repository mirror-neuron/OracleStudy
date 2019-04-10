SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ������ ���ν���(PRC_STUDNETS_INSERT())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��

-- ���� ������ ���ν���(INSERT ���ν���, �Է� ���ν���)�� �����ϰ� �Ǹ�
EXEC PRC_STUDNETS_INSERT('batman', 'java006$', '������', '010-2222-2222', '����');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_STUDENTS;
--==>> 
/*
superman	������	010-1111-1111	���ֵ� ��������
batman	    ������	010-2222-2222	����
*/

SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batman	    java006$
*/


--�� �й�, �̸�, ��������, ��������, �������� �����͸�
--   �Է¹��� �� �ִ� �ǽ� ���̺� ����(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� �÷� ���� �߰�
--   (������TOT, ��ա�AVG, ��ޡ�GRADE)
ALTER TABLE TBL_SUNGJUK
ADD ( TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR );
--==>> Table TBL_SUNGJUK��(��) ����Ǿ����ϴ�.

--�� ���⼭ �߰��� �÷��� ���� �׸����
--   ���ν��� �ǽ��� ���� �߰��� ���� ��
--   ���� ���̺� ������ ����������, �ٶ��������� ���� �����̴�.


--�� ����� ���̺� ���� Ȯ��
DESC TBL_SUNGJUK;
--==>>
/*
�̸�     ��?       ����           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)   
*/

--�� ������ �Է� �� 
--   Ư�� �׸��� ������(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�
--   ���������� ����, ���, ��� �׸��� �Բ� �Է� ó���� �� �ֵ��� �ϴ�
--   ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '�̿���', 90,  80, 70);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������  ��������   ��������   ����  ���  ���
1    �̿���    90        80         70       240   80     B
*/

--�� ������ ���ν���(PRC_SUNGJUK_INSERT())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_SUNGJUK_INSERT(1, '�̿���', 90,  80, 70);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	�̿���	90	80	70	240	80	B


--�� TBL_SUNGJUK ���̺��� Ư�� �л��� ����(�й�, ����, ����, ����) 
--   ������ ���� �� ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_UNDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������  ��������   ��������   ����  ���  ���
1    �̿���    50        50         50       150   50     F
*/

--�� ������ ���ν���(PRC_SUNGJUK_UPDATE())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	�̿���	50	50	50	150	50	F


--�� TBL_STUDENTS ���̺��� 
--   ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�) ���ν����� �ۼ��Ѵ�.
--   ��, ID �� PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�.
--   ���ν��� �� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '���');

���ν��� ȣ��� ó���� ���)
superman	������	010-9999-9999	���
*/

SELECT *
FROM TBL_STUDENTS;

UPDATE ���̺��
SET �������=��������
WHERE ����

( SELECT I.ID, I.PW, S.TEL, S.ADDR
FROM TBL_IDPW I JOIN TBL_STUDENTS S
ON I.ID = S.ID ) T

UPDATE ( SELECT I.ID, I.PW, S.TEL, S.ADDR
FROM TBL_IDPW I JOIN TBL_STUDENTS S
ON I.ID = S.ID ) T
SET T.TEL = �Է¹�����ȭ��ȣ, T.ADDR = �Է¹����ּ�
WHERE T.ID = �Է¹���ID AND T.PW = �Է¹���PW;

--�� ������ ���ν���(PRC_STUDNETS_UPDATE())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '���');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
--> ID �� PW �� ��� ��ȿ�� �����ͷ� �׽�Ʈ �� ���... ������ ���� ���� CHECK~!!!
--  (ID, PW �ٸ��� �Է��ϸ� ������Ʈ �� ��)

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-9999-9999	���
batman	    ������	010-2222-2222	����
*/


--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   ������ ���� �ִ� ��� ���̺� ������ �Է� �� 
--   NUM �÷�(�����ȣ)�� ����
--   ���� �ο��� �����ȣ ������ ��ȣ�� �� ���� ��ȣ�� �ڵ����� 
--   �Է� ó���� �� �ֵ��� ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG);
/*
���� ��)
EXEC PRC_INSA_INSERT('�輱��', '901212-2234567', SYSDATE, '����'
                     , '010-5555-5555', '������', '�븮', 1000000, 200000);
                     
���ν��� ȣ��� ó���� ���)
1061 �輱�� 901212-2234567 2019-04-09 ���� 010-5555-5555 ������ �븮 1000000 200000
*/

EXEC PRC_INSA_INSERT('�輱��', '901212-2234567', SYSDATE, '����', '010-5555-5555', '������', '�븮', 1000000, 200000);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_INSA;
--==>>
/*
1061	�輱��	901212-2234567	19/04/09	����	010-5555-5555	������	�븮	1000000	200000
1001	ȫ�浿	771212-1022432	98/10/11	����	011-2356-4528	��ȹ��	����	2610000	200000
                      :                                   :
*/

