
--�� TBL_�԰� ���̺��� �԰������ ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_�԰�_UPDATE(�԰��ȣ, �������԰����);

--�� TBL_��� ���̺��� �������� �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_���_DELETE(����ȣ);  --> ��� ��� ������ ���·� ���ư�

--�� TBL_�԰� ���̺��� �԰������ �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_�԰�_DELETE(�԰��ȣ);  --> ��� �԰� ������ ���·� ���ư�

EXEC PRC_�԰�_UPDATE(1, 30);

SELECT *
FROM TBL_�԰�;

SELECT *
FROM TBL_���;

EXEC PRC_���_DELETE(2);

SELECT *
FROM TBL_��ǰ;


EXEC PRC_�԰�_DELETE(2);
EXEC PRC_�԰�_DELETE(3);
EXEC PRC_�԰�_DELETE(11);
--==>> �԰� ������ ������ �� �����ϴ�.


----------------------------------------------------------------------------------------------------------------

--���� AFTER STATEMENT TRIGEER ��Ȳ �ǽ� ����--
--�� DML �۾��� ���� �̺�Ʈ ���

--�� �ǽ� ���̺� ����(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� �������� �߰�
--   ID �÷��� PK �������� ����
ALTER TABLE TBL_TEST1
ADD CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID);
--==>> Table TBL_TEST1��(��) ����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, ILJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST1;
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_EVENTLOG;
--==>> ��ȸ ��� ����



--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� TBL_TEST1 ���̺� ������ �Է�
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '������', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '������', '010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� TBL_TEST1 ���̺��� ������ ����
UPDATE TBL_TEST1 
SET NAME = '������'
WHERE ID = 1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� TBL_TEST1 ���̺��� ������ ����
DELETE
FROM TBL_TEST1
WHERE ID = 2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE 
FROM TBL_TEST1
WHERE ID = 1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ȯ��
SELECT *
FROM TBL_TEST1;
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT �������� ����Ǿ����ϴ�.	2019-04-11 12:18:48
INSERT �������� ����Ǿ����ϴ�.	2019-04-11 12:19:21
UPDATE �������� ����Ǿ����ϴ�.	2019-04-11 12:20:29
DELETE �������� ����Ǿ����ϴ�.	2019-04-11 12:21:21
DELETE �������� ����Ǿ����ϴ�.	2019-04-11 12:21:44
*/


--�� �׽�Ʈ 
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '�̱��', '010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(4, '���Ѿ�', '010-4444-4444');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET NAME = '������'
WHERE ID = 3;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID = 4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- ����Ŭ ������ �ð��� 21�� ��� ����(�� �۾�ǥ���� �� ��¥/�ð�����)

-- �ð��� ����� ���¿��� ������ �Է�
INSERT INTO TBL_TEST1 (ID, NAME, TEL)
VALUES(5, '�̽���', '010-5555-5555');
--==>> ���� �߻�
/*
ORA-20003: �۾��� 08:00 ~ 18:00 ���� �����մϴ�.
*/

-- ��ȸ 
SELECT *
FROM TBL_TEST1;
--==>> 3	������	010-3333-3333

-- �ð��� ����� ���¿��� ������ ����
UPDATE TBL_TEST1
SET NAME = '��ȫ��'
WHERE ID = 3;
--==>> ���� �߻�
/*
ORA-20003: �۾��� 08:00 ~ 18:00 ���� �����մϴ�.
*/

-- �ð��� ����� ���¿��� ������ ����
DELETE
FROM TBL_TEST1
WHERE ID = 3;
--==>> ���� �߻� 
/*
ORA-20003: �۾��� 08:00 ~ 18:00 ���� �����մϴ�.
*/

-- ���� ��ȸ (�ð� ���� ���� �Է�, ����, ���� �ȵ�)
SELECT *
FROM TBL_TEST1;
--==>> 3	������	010-3333-3333


--�� �ǽ� ���̺� ����(TBL_TEST2) �� �θ� ���̺�
CREATE TABLE TBL_TEST2
( CODE  NUMBER  
, NAME  VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_TEST3) �� �ڽ� ���̺�
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.


--�� �ǽ� ������ �Է�
INSERT INTO TBL_TEST2 (CODE, NAME) VALUES(1, '�����');
INSERT INTO TBL_TEST2 (CODE, NAME) VALUES(2, '��Ź��');
INSERT INTO TBL_TEST2 (CODE, NAME) VALUES(3, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3��

--�� Ȯ��
SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�����
2	��Ź��
3	������
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ǽ� ������ �Է�
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 1, 40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 2, 50);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 1, 60);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 1, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 2, 40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 1, 50);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 9��

--�� Ȯ��
SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	20
2	2	30
3	1	40
4	2	50
5	1	60
6	1	20
7	1	30
8	2	40
9	1	50
*/

--�� INNER JOIN(�̳� ����) ���� ��ȸ�ϱ�
SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>>
/*
1	1	�����	20
2	2	��Ź��	30
3	1	�����	40
4	2	��Ź��	50
5	1	�����	60
6	1	�����	20
7	1	�����	30
8	2	��Ź��	40
9	1	�����	50
*/

--�� ���� Ŀ��
COMMIT;
--==> Ŀ�� �Ϸ�.


-- ����
DELETE
FROM TBL_TEST2
WHERE CODE = 3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
--> �ڽ� ���̺��� 3(������) �� �����ϴ� ���� ���� ������ ������


-- ��ȸ
SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�����
2	��Ź��
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- Ʈ����(TRG_TEST2_DELETE) �� ���� ������
DELETE
FROM TBL_TEST2
WHERE CODE = 2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- ��ȸ
SELECT *
FROM TBL_TEST2;
--==>> 1	�����

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	20
3	1	40
5	1	60
6	1	20
7	1	30
9	1	50
*/


SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>>
/*
1	1	�����	20
3	1	�����	40
9	1	�����	50
6	1	�����	20
7	1	�����	30
5	1	�����	60
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


---------------------------------------------------------------------------------------------

TRUNCATE TABLE TBL_�԰�;
--==>> Table TBL_�԰���(��) �߷Ƚ��ϴ�.
TRUNCATE TABLE TBL_���;
--==>> Table TBL_�԰���(��) �߷Ƚ��ϴ�.
UPDATE TBL_��ǰ
SET ������ = 0;
--==>> 21�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(1, 'H001', SYSDATE, 100, 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- ��ȸ
SELECT *
FROM TBL_��ǰ;
--==>> 
/*
H001	Ȩ����	1000	100 
        :
*/


SELECT *
FROM TBL_�԰�;
--==>> 1	H001	19/04/11	100	1000

INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(2, 'H002', SYSDATE, 50, 1000);

UPDATE TBL_�԰�
SET �԰���� = 30;

DELETE 
FROM TBL_�԰�
WHERE �԰��ȣ = 2;


-------------------------------------------------------------------------
INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, �������, ������, ���ܰ�)
VALUES(2, 'H001', SYSDATE, 10, 1500);

SELECT *
FROM TBL_���;

SELECT *
FROM TBL_��ǰ;

UPDATE TBL_���
SET ������ = 0;

DELETE
FROM TBL_���
WHERE ����ȣ = 2;



--�� TRIGGER �� ���� ��ȸ
SELECT *
FROM USER_TRIGGERS;
--==>> DESCRIPTION, TRIGGER BODY
/*
"TRG_TEST2_DELETE
          BEFORE
          DELETE ON TBL_TEST2 --> TEST3 �� TEST2�� �����ϱ� ���� ������ �����Ǵ� ���ϻ�
          FOR EACH ROW 
"

"BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;"
*/

----------------------------------------------------------------------------

--�� ��Ű�� 
SELECT INSA_PACK.FN_GENDER('751212-1234567')
FROM DUAL;
--==>> ����

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN)
FROM TBL_INSA;
--==>>
/*
�ѽ¿�	910101-1234567	����
�輱��	901212-2234567	����
ȫ�浿	771212-1022432	����
�̼���	801007-1544236	����
�̼���	770922-2312547	����
������	790304-1788896	����
�Ѽ���	811112-1566789	����
�̱���	780505-2978541	����
����ö	780506-1625148	����
�迵��	821011-2362514	����
������	810810-1552147	����
������	751010-1122233	����
������	801010-2987897	����
���ѱ�	760909-1333333	����
���̼�	790102-2777777	����
Ȳ����	810707-2574812	����
������	800606-2954687	����
�̻���	781010-1666678	����
�����	820507-1452365	����
�̼���	801028-1849534	����
�ڹ���	780710-1985632	����
������	800304-2741258	����
ȫ�泲	801010-1111111	����
�̿���	800501-2312456	����
���μ�	731211-1214576	����
�踻��	830225-2633334	����
�����	801103-1654442	����
�����	810907-2015457	����
�迵��	801216-1898752	����
�̳���	810101-1010101	����
�踻��	800301-2020202	����
������	790210-2101010	����
����ȯ	771115-1687988	����
�ɽ���	810206-2222222	����
��̳�	780505-2999999	����
������	820505-1325468	����
������	831010-2153252	����
���翵	701126-2852147	����
�ּ���	770129-1456987	����
���μ�	791009-2321456	����
�����	800504-2000032	����
�ڼ���	790509-1635214	����
�����	721217-1951357	����
ä����	810709-2000054	����
��̿�	830504-2471523	����
����ȯ	820305-1475286	����
ȫ����	690906-1985214	����
����	760105-1458752	����
�긶��	780505-1234567	����
�̱��	790604-1415141	����
�̹̼�	830908-2456548	����
�̹���	810403-2828287	����
�ǿ���	790303-2155554	����
�ǿ���	820406-2000456	����
��̽�	800715-1313131	����
����ȣ	810705-1212141	����
���ѳ�	820506-2425153	����
������	800605-1456987	����
*/