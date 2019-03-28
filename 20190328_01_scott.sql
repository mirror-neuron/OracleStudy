SELECT USER
FROM DUAL;
--==>> SCOTT


select *
FROM EMP
WHERE JOB='salesman';
--==>> ��ȸ ��� ����(''������ �� ��ҹ��� �����ϰ� �����ϹǷ�)


--�� UPPER(), LOWER(), INITCAP() / ���� �ڡڡ�
SELECT 'oRaCLe' "1", UPPER('oRaCLe') "2", LOWER('oRaCLe') "3", INITCAP('oRaCLe') "4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
--> UPPER() �� ��� �빮�ڷ� ��ȯ
--  LOWER() �� ��� �ҹ��ڷ� ��ȯ
--  INITCAP() �� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ

--�����
select *
FROM EMP
WHERE EMPNO='�Է°�';

select *
FROM EMP
WHERE EMPNO=UPPER('�Է°�');


select *
FROM EMP
WHERE JOB=UPPER('SalEsmAn');
--==>>
/*
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
*/

--�����
select *
FROM EMP
WHERE UPPER(JOB)=UPPER('SalEsmAn');

--�����
SELECT*
FROM EMP
WHERE LOWER(JOB)=LOWER('SalEsmAn');

--�����
SELECT*
FROM EMP
WHERE INITCAP(JOB)=INITCAP('SalEsmAn');


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� �Ի��� ������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE='1981-09-28';
--==>> MARTIN	SALESMAN	81/09/28

--�� TO_DATE() / ��¥ ����ȯ �Լ�(����Ŭ������ ����� ����ȯ�� �Ѵ�.)
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE=TO_DATE('1981-09-28', 'YYYY-MM-DD');


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� ����(�ش��� ����)�� �Ի��� ������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	81/09/28
SCOTT	ANALYST	    87/07/13
KING	PRESIDENT	81/11/17
ADAMS	CLERK	    87/07/13
JAMES	CLERK	    81/12/03
FORD	ANALYST	    81/12/03
MILLER	CLERK	    82/01/23
*/

--�� ����Ŭ������ ��¥ �������� ũ�� �񱳰� �����ϴ�.
--   ����Ŭ���� ��¥ �����Ϳ� ���� ũ�� �� �� 
--   ���ź��� �̷��� �� ū ������ �����Ͽ� ó���ȴ�.


--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�� ����
--   1981�� 9�� 28�� ���̿� �Ի��� ��������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)

SELECT �����, ������, �Ի��� 
FROM TBL_EMP
WHERE �Ի����� 1981�� 4�� 2�� ����
      �Ի����� 1981�� 9�� 28�� ����;
      
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���" 
FROM TBL_EMP
WHERE HIREDATE�� TO_DATE('1981-04-02', 'YYYY-MM-DD') ����
      HIREDATE�� TO_DATE('1981-09-28', 'YYYY-MM-DD') ����;
      
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���" 
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') 
      HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���" 
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') 
  AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN	81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	Q   81/06/09
TURNER	SALESMAN	81/09/08
*/


--�� BETWEEN �� AND ��
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���" 
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN	81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN	81/09/08
*/


SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2000 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	81/04/02	2975		20
7698	BLAKE	MANAGER	7839	81/05/01	2850		30
7782	CLARK	MANAGER	7839	81/06/09	2450		10
7788	SCOTT	ANALYST	7566	87/07/13	3000		20
7902	FORD	ANALYST	7566	81/12/03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';  -- �������� ������ �迭�� �̷���('S'��� �ܾ� �ڿ� SCOTT, SMITH�� ������ ������)

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';

--�� BETWEEN �� AND �� �� ��¥��, ������, ������ ������ ��ο� ����ȴ�.
--   ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������
--   �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����, BETWEEN �� AND �� �� �������� ����Ǵ� ��������
--   ����Ŭ ���������δ� �ε�ȣ ������(<=)�� ���·� �ٲ�� ������ ó���ȴ�.

--�� ASCII()
SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('b')
FROM DUAL;
--==>> 65	66	97	98


--�� TBL_EMP ���̺��� ������ SALESMAN �� CLERK �� �����
--   �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
--�����   
SELECT ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB='SALESMAN'
   OR JOB='CLERK'; 
-- OR JOB='MANAGER';

--�����   
SELECT ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB IN('SALESMAN','CLERK');   

--�����
SELECT ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB=ANY('SALESMAN','CLERK');      -- cf. ��=ALL�� (AND�� ���� ȿ��, �� �����Ͱ� ���ÿ� ����ִ� ���)
--WHERE JOB=ANY('SALESMAN','CLERK','MANAGER');  
--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--   ������, �� ���� �������� ���� ������ ó���ȴ�.
--   ����, �޸𸮿� ���� ������ �ƴ϶� CPU �� ���� �����̹Ƿ�
--   �� �κб��� �����Ͽ� �������� ������ �����ϴ� ���� ���� �ʴ�.
--   �� ��IN�� �� ��=ANY�� �� ���� ������ ȿ���� ������.
--      ��� ���������δ� ��OR�������� ����Ǿ� ���� ó���ȴ�.
--==>>
/*
SMITH	CLERK	    800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	    950
MILLER	CLERK	    1300
*/

----------------------------------------------------------------------------------------

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO         NUMBER(4)
, SANAME       VARCHAR2(30)
, JUBUN        CHAR(13)
, HIREDATE     DATE DEFAULT SYSDATE
, SAL          NUMBER(10)
);
--==>> Table TBL_SAWON��(��) �����Ǿ����ϴ�.


SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)
*/


--�� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '�̿���', '8706241234567', TO_DATE('2001-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '���ֿ�', '9405022234567', TO_DATE('2010-11-05', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '������', '9710012234567', TO_DATE('1999-08-16', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '��ȫ��', '9504102234567', TO_DATE('1997-11-05', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '�̺��', '7210101234567', TO_DATE('1998-02-02', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '8004271234567', TO_DATE('1998-02-02', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0405064234567', TO_DATE('2010-07-15', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '0506074234567', TO_DATE('2011-07-15', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '0505053234567', TO_DATE('2011-07-15', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '���켱', '9505052234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '7512122234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '������', '9302131234567', TO_DATE('2010-11-11', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '���ü�', '7202021234567', TO_DATE('1992-10-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '����', '6912121234567', TO_DATE('1987-10-10', 'YYYY-MM-DD'), 4000);

--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 14��

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	�̿���	    8706241234567	01/01/03	3000
1002	���ֿ�	    9405022234567	10/11/05	2000
1003	������	    9710012234567	99/08/16	5000
1004	��ȫ��	    9504102234567	97/11/05	4000
1005	�̺��	    7210101234567	98/02/02	2000
1006	������	    8004271234567	98/02/02	2000
1007	������	    0405064234567	10/07/15	1000
1008	������	    0506074234567	11/07/15	1000
1009	������	    0505053234567	11/07/15	3000
1010	���켱	    9505052234567	99/11/11	4000
1011	������	7512122234567	99/11/11	5000
1012	������	    9302131234567	10/11/11	3000
1013	���ü�	    7202021234567	92/10/10	2000
1014	����	    6912121234567	87/10/10	4000
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_SAWON ���̺��� �̿��� ����� ������ ��� ��ȸ�Ѵ�.
--�����
SELECT *
FROM TBL_SAWON
WHERE SANAME='�̿���';
--==>> 1001	�̿���	8706241234567	01/01/03	3000

--�����
SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '�̿���';
--==>> 1001	�̿���	8706241234567	01/01/03	3000

--�� LIKE : ���� �� �����ϴ�.
--          �λ� �� ~�� ����, ~ó��

--�� WILD CHARACTER �� ��%��
--   ��LIKE���� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE���� �Բ� ���Ǵ� ��_���� �ƹ� ���� 1���� �ǹ��Ѵ�.


--�� TBL_SAWON ���̺��� ������ ���̡����� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME='��';
--==>> ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME='��__';
--==>> ��ȸ ��� ���� ( '='�� ���� �� ��ü�� '��__'�� ã��)

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>
/*
�̿���	8706241234567	3000
�̺��	7210101234567	2000
������	0405064234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_'; --> '_'�� 1���ڸ� �ǹ��ϹǷ� ��ȸ �ȵ�
--==>> ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��___';
--==>> ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';  -->'��'�� �����ϴ� ��� �̸��� ��ȸ��
--==>>
/*
�̿���	8706241234567	3000
�̺��	7210101234567	2000
������	0405064234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>> 
/*
������	9302131234567	3000
���ü�	7202021234567	2000
����	6912121234567	4000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>> ����	6912121234567	4000

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>> ������	9302131234567	3000
--     ���ü�	7202021234567	2000


--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ���񡻷� 
--   ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '__��';
--==>> 
/*
������	9710012234567	99/08/16	5000
��ȫ��	9504102234567	97/11/05	4000
*/

--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ���̡��� 
--   ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '__��';
--==>> ������	0405064234567	10/07/15	1000

SELECT SANAME "�����", JUBUN "�ֹι�ȣ", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>> 
/*
������	0405064234567	10/07/15	1000
����	6912121234567	87/10/10	4000
*/


--�� ������ �߰� �Է�
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '���̰�', '8410141234567', TO_DATE('1997-10-10', 'YYYY-MM-DD'), 5000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_SAWON ���̺��� ��� �̸� �ȿ� ���̡���� ���ڰ�
--   �ϳ��� ���ԵǾ� ������ �� ����� 
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
1001	�̿���	01/01/03	3000
1005	�̺��	98/02/02	2000
1007	������	10/07/15	1000
1008	������	11/07/15	1000
1014	����	87/10/10	4000
1015	���̰�	97/10/10	5000
*/

--�� TBL_SAWON ���̺��� ��� �̸� �ȿ� ���̡���� ���ڰ�
--   �� �� ���ԵǾ� ������ �� ����� 
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.

SELECT SANO "�����ȣ", SANAME "�����", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';   --���̡��� ���������� �� �� ����ִ� ������ ��ȸ
--==>> 1015	���̰�	97/10/10	5000

SELECT SANO "�����ȣ", SANAME "�����", HIREDATE "�Ի���", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';  --���̡��� �� �� ����ִ� ������ ��ȸ
--==>> 
/*
1007	������	10/07/15	1000
1015	���̰�	97/10/10	5000
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", HIREDATE "�Ի���", SAL "�޿�" 
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
1012	������	10/11/11	3000
1013	���ü�	92/10/10	2000  --> ���� ���̹Ƿ� ��Ȯ�� �����Ͱ� �ƴ�
1014	����	87/10/10	4000
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.


--�� �����ͺ��̽� ���� �� ���� �̸��� �и��ؼ� ó���ؾ� ��
--   ���� ��ȹ�� �ִٸ�(���� ������ �ƴϴ���...) ���̺��� �� �÷���
--   �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.


--�� TBL_SAWON ���̺��� ���������� �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE ������;

SELECT �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE �ֹι�ȣ�÷��� 7��° �ڸ�  1���� 2
      �ֹι�ȣ�÷��� 7��° �ڸ�  1���� 4;

SELECT �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE JUBUN LIKE '______2'
   OR JUBUN LIKE '______4'; --> 7��° �ڸ��� 2 �Ǵ� 4�� ������ �ֹι�ȣ�� ã�� ���̹Ƿ� ��ȸ �� ��.
   
 SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______'
   OR JUBUN LIKE '______4______';   

SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%'; --> 7��° �ڸ��� Ȯ���ϸ� �� ���Ĵ� ������ �ʿ� ����
--==>>
/*
���ֿ�	    9405022234567	2000
������	    9710012234567	5000
��ȫ��	    9504102234567	4000
������	    0405064234567	1000
������	    0506074234567	1000
���켱	    9505052234567	4000
������	7512122234567	5000
*/


--�� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR2(20)
, BIGO          VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է�
INSERT INTO TBL_WATCH VALUES('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');
INSERT INTO TBL_WATCH VALUES('���ð�', '�� ������ 99.99���� ȹ���� �ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2��

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_WATCH ;
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

--�� TBL_WATCH ���̺��� BIGO �÷���
--   ��99.99%�� ��� ���ڰ� ����ִ� ��(���ڵ�)�� ������ ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';  --> BIGO �� '99.99%' ��ü�� ����ִ��� Ȯ���ϹǷ� ��ȸ �ȵ�
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%';
--==>> 
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%'; --> % �� ������ ���ڸ� �ǹ��ϹǷ� ���� ���� ��� ��ȸ��
--==>> 
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

--�� �̽������� ����
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';  
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

--�� ESCAPE �� ���� ������ ���� �� ���ڴ� ���ϵ� ĳ����(%)���� Ż����Ѷ�...
--   ��ESCAPE '\'��
--   �Ϲ������� ���󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.


-------------------------------------------------------------------------------------------------------

--���� COMMIT / ROLLBACK ����--

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
-- 50��... ���ߺ�... ����...
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴ϶�
-- �޸�(RAM)�� �Էµ� ���̴�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50��... ���ߺ�... ����... �� ���� �����Ͱ� �ҽǵǾ����� Ȯ��(�������� ����)


--�� �ٽ� �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--> �޸𸮻� �Էµ� �� �����͸� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
--  COMMIT �� �����ؾ� �Ѵ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
--  50�� ���ߺ� ����... �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT �� ������ ���ķ� DML ����(INSERT, UPDATE, DELETE) �� ����
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ����� ����� �� COMMIT �ϰ��� ROLLBACK �� �����غ���
--   ���� ���·� �ǵ��� �� ����. (�ƹ��� �ҿ��� ����.)

--�� ������ ����(TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME = '������', LOC='��õ'
WHERE DEPTNO=50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	������	    ��õ
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> ����(UPDATE)�� �����ϱ� ���� ���·� �����Ǿ����� Ȯ��


--�� ������ ����(DELETE)
SELECT *
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 50	���ߺ�	����

DELETE
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>  
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> ���� ������ �����ϱ� ���� ���·� �����Ǿ����� Ȯ��
--> �ڵ����� ���� �� ���� ������ ���Ŀ� Ȯ���Ϸ���(ROLLBACK) �ξ��ٰ�
--  ���̺� ������ ���� �ڵ� Ŀ��(AUTO COMMIT)�� �Ǵ� ��찡 �����Ƿ� �����Ѵ١�


-------------------------------------------------------------------------------------------------------

--���� ����(ORDER BY) �� ����--

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
SMITH	20	CLERK	    800	    9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����", COMM "Ŀ�̼�"
FROM TBL_EMP
ORDER BY DEPTNO ASC;  --> DEPTNO�� �μ���ȣ ���� ����, ASC�� �������� ����
--==>> ASC : �������� ���� COMM �� ORDER BY���� �Ѵ�.
/*
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
WARD	30	SALESMAN	1250	15500	500
MARTIN	30	SALESMAN	1250	16400	1400
SCOTT	20	ANALYST	    3000	36000	
KING	10	PRESIDENT	5000	60000	
ADAMS	20	CLERK	    1100	13200	
JAMES	30	CLERK	    950	    11400	
FORD	20	ANALYST	    3000	36000	
MILLER	10	CLERK	    1300	15600	
BLAKE	30	MANAGER	    2850	34200	
JONES	20	MANAGER	    2975	35700	
SMITH	20	CLERK	    800	    9600	
CLARK	10	MANAGER	    2450	29400	
*/
--> ����Ŭ������ (null)���� ���ɼ��� ������ ���� ū ������ �ν��Ѵ�.

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����", COMM "Ŀ�̼�"
FROM TBL_EMP
ORDER BY DEPTNO; --> ASC�� �������� ���� ��������
--==>>
/*
CLARK	10	MANAGER	    2450	29400	
KING	10	PRESIDENT	        5000	60000	
MILLER	10	CLERK	    1300	15600	
JONES	20	MANAGER	    2975	35700	
FORD	20	ANALYST	    3000	36000	
ADAMS	20	CLERK	    1100	13200	
SMITH	20	CLERK	    800	    9600	
SCOTT	20	ANALYST	    3000	36000	
WARD	30	SALESMAN	1250	15500	500
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
JAMES	30	CLERK	950	11400	
BLAKE	30	MANAGER	2850	    34200	
MARTIN	30	SALESMAN	1250	16400	1400
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����", COMM "Ŀ�̼�"
FROM TBL_EMP
ORDER BY DEPTNO DESC;  --> DESC �� �������� �����Ұ�
--==>>
/*
BLAKE	30	MANAGER	    2850	34200	
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
MARTIN	30	SALESMAN	1250	16400	1400
WARD	30	SALESMAN	1250	15500	500
JAMES	30	CLERK	    950	    11400	
SCOTT	20	ANALYST	    3000	36000	
JONES	20	MANAGER	    2975	35700	
SMITH	20	CLERK	    800	    9600	
ADAMS	20	CLERK	    1100	13200	
FORD	20	ANALYST	    3000	36000	
KING	10	PRESIDENT	         5000	60000	
MILLER	10	CLERK	    1300	15600	
CLARK	10	MANAGER 	2450	29400	
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY ���� DESC;  
--==>> 
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
SMITH	20	CLERK	    800 	9600
*/
--> ��ORDER BY ������ SELECT ���� ���� ó���Ǳ� ������
--  �÷��� ��� SELECT ������ ����� ALIAS(��Ī)��
--  ORDER BY ������ ����ص� ������ �߻����� �ʴ´�. (�����ϴ�.)

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY �μ� ��ȣ DESC;  
--==>> ���� �߻�

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY "�μ� ��ȣ" DESC; 
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	    950 	11400
SCOTT	20	ANALYST 	3000	36000
JONES	20	MANAGER 	2975	35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB "����", SAL "�޿�"
     , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY 2; 
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/
--> TBL_EMP ���̺��� ���� �ִ� ���̺��� ������ �÷� ������ �ƴ϶�
--  SELECT ó�� �Ǵ� �� ��° �÷� (��, DEPTNO)�� �������� ���ĵǴ� ���� Ȯ��
--  ASC ������ ���� �� �������� ���ĵǴ� ���� Ȯ��



SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 4; -- DEPTNO ���� 1�� ����, SAL ���� 2�� ����  ...ASC(��������)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	    800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER	    2975
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
JAMES	30	CLERK	    950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	    2850
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 3, 4 DESC;
--> ������ �켱������ ���� ���������� ����
--  �� DEPTNO(�μ���ȣ) ���� �������� ����
--  �� JOB(������) ���� �������� ����
--  �� SAL(�޿�) ���� �������� ����
--  (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	    1300 -- ��,���� �̹� ������ ���Ʊ� ������ �������� ������� ����
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	    800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	    950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/

--------------------------------------------------------------------------------------------

--�� CONCAT() -- ���ڿ� �����ϴ� �Լ�
SELECT '������' || '������' ��
     , CONCAT('������', '������') "��"
FROM DUAL;
--==>> ������������	������������


SELECT ENAME || JOB "��"
     , CONCAT(ENAME, JOB) "��"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST 	FORDANALYST
MILLERCLERK 	MILLERCLERK
*/

SELECT ENAME || JOB || DEPTNO "��"
     , CONCAT(ENAME, JOB, DEPTNO) "��"
FROM TBL_EMP;
--==>> ���� �߻�
--> CONCAT() �� 2���� ���ڿ��� ���ս����ִ� ����� ���� �Լ�.
--  ������ 2���� ���ս�ų �� �ִ�.

SELECT ENAME || JOB || DEPTNO "��"
     , CONCAT(CONCAT(ENAME, JOB), DEPTNO) "��"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30	    ALLENSALESMAN30
WARDSALESMAN30	    WARDSALESMAN30
JONESMANAGER20	    JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	    BLAKEMANAGER30
CLARKMANAGER10	    CLARKMANAGER10
SCOTTANALYST20	    SCOTTANALYST20
KINGPRESIDENT10	    KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	    FORDANALYST20
MILLERCLERK10	    MILLERCLERK10
*/

--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--  CONCAT()�� ���ڿ��� ���ڿ��� ���ս����ִ� �Լ�������
--  ���������δ� ���ڳ� ��¥�� ����Ÿ������ �ٲپ��ִ� ������ ���ԵǾ� �ִ�.

/* JAVA�� STRING.SUBSTRING()]
obj.substring()
---
��
���ڿ�.substring(n, m);
                 n���� m-1����... (0���� �����ϴ� �ε��� ����)
*/

--�� SUBSTR() ���� ��� / SUBSTRB() ����Ʈ ��� �� ���ڿ� ���� �Լ�

SELECT ENAME "��"
     , SUBSTR(ENAME, 1, 2) "��"  
     , SUBSTR(ENAME, 2, 2) "��"
     , SUBSTR(ENAME, 3, 2) "��"
     , SUBSTR(ENAME, 2) "��"
FROM TBL_EMP;
--> ���ڿ��� �����ϴ� ����� ���� �Լ�
--  ù ��° �Ķ���� ���� ��� ���ڿ�(������ ���)
--  �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(��, �ε����� 1���� ����)
--  �� ��° �Ķ���� ���� ������ ���ڿ��� ����(���� ��.. ������ġ ���� ������)

--==>>
/*
SMITH	SM	MI	IT	MITH
ALLEN	AL	LL	LE	LLEN
WARD	WA	AR	RD	ARD
JONES	JO	ON	NE	ONES
MARTIN	MA	AR	RT	ARTIN
BLAKE	BL	LA	AK	LAKE
CLARK	CL	LA	AR	LARK
SCOTT	SC	CO	OT	COTT
KING	KI	IN	NG	ING
TURNER	TU	UR	RN	URNER
ADAMS	AD	DA	AM	DAMS
JAMES	JA	AM	ME	AMES
FORD	FO	OR	RD	ORD
MILLER	MI	IL	LL	ILLER
*/



--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�
--   �޿� �������� �������� ������ ������ �� �ֵ��� �Ѵ�.
SELECT �����ȣ, �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE ������ ����
ORDER BY �޿� ��������;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE ������ ����
ORDER BY SAL DESC;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE �ֹι�ȣ 7��° �ڸ� 1���� 1
    , �ֹι�ȣ 7��° �ڸ� 1���� 3
ORDER BY SAL DESC;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = 1
      SUBSTR(JUBUN, 7, 1) = 3
ORDER BY SAL DESC;

--�����
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1'  --> 1�̶�� ���ڰ� �ƴ϶� '1' ����Ÿ���̾�� ��(����Ŭ�� ����ȯ�� �ʹ� ���� ����)
   OR SUBSTR(JUBUN, 7, 1) = '3'  --  ��ȸ�� ������ ����ȯ�� ������ ������ Ʋ�� �Ŵ�.
ORDER BY SAL DESC;

--�����
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3') 
ORDER BY SAL DESC;

--�����
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) =ANY ('1', '3')
ORDER BY SAL DESC;
--==>>
/*
1015	���̰�	8410141234567	5000
1014	����	6912121234567	4000
1001	�̿���	8706241234567	3000
1009	������	0505053234567	3000
1012	������	9302131234567	3000
1013	���ü�	7202021234567	2000
1005	�̺��	7210101234567	2000
1006	������	8004271234567	2000
*/

SELECT *
FROM TBL_SAWON;

--�� LENTH() / LENGTHB()  --���ڿ��� ���� ��ȯ(���� ��/����Ʈ ��)
SELECT ENAME "��"
     , LENGTH(ENAME) "��"
     , LENGTHB(ENAME) "��"
FROM TBL_EMP;
--> LENGTH() �� ���� ���� ��ȯ, LENGTHB() �� ����Ʈ ���� ��ȯ
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/

SELECT '�̿���' "��"
     , LENGTH('�̿���') "��"
     , LENGTHB('�̿���') "��" 
FROM DUAL;
--==>> �̿���	3	9


--�� ������ ��ųʸ�
SELECT *
FROM NLS_DATABASE_PARAMETERS; 
--> ������ �����Ͱ� ��� �����Ǿ��ִ��� Ȯ�� ����

/*
Java �� String Ŭ������ index of �� �����
*/


--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 2) "��"
FROM DUAL;
--==>> ORACLE ORAHOME BIORA	1	8	8	8	18
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����... (��� ���ڿ�)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!!
--  �� ��° �Ķ���� ���� ã�� �����ϴ�...(��, ��ĵ�� �����ϴ�) ��ġ
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(1�� ���� ����)

SELECT '���ǿ���Ŭ �����ο��� �մϴ�' "��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 1) "��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 2) "��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 10) "��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 11) "��"
FROM DUAL;
-- ������ �Ķ����(�� ��° �Ķ����) ���� ������ ���·� ���~!!! �� 1
--==>> ���ǿ���Ŭ �����ο��� �մϴ�	3	3	10	0


--�� REVERSE()
SELECT 'ORACLE' "��"
     , REVERSE('ORACLE') "��"
     , REVERSE('����Ŭ') "��"
FROM DUAL;
--==>> ORACLE	ELCARO	???
--> ��� ���ڿ��� �Ųٷ� ��ȯ�Ѵ�. (��, �ѱ��� ����)


--�� �ǽ� ��� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO       NUMBER(3)
, FILENAME     VARCHAR2(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� �ǽ� ������ �Է�
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20190328_01_SCOTT.SQL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8��

--�� Ȯ��
SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20190328_01_SCOTT.SQL
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT FILENO "���Ϲ�ȣ", FILENAME "���ϸ�"
FROM TBL_FILES;
--==>>
/*
  ���Ϲ�ȣ ���ϸ�                                                                                                 
---------- -----------------------------------------------
         1 C:\AAA\BBB\CCC\SALES.DOC                                                                            
         2 C:\AAA\PANMAE.XXLS                                                                                  
         3 D:\RESEARCH.PPT                                                                                     
         4 C:\DOCUMENTS\STUDY.HWP                                                                              
         5 C:\DOCUMENTS\TEMP\SQL.TXT                                                                           
         6 D:\SHARE\F\TEST.PNG                                                                                 
         7 C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG                                                           
         8 C:\ORACLESTUDY\20190328_01_SCOTT.SQL   
*/

/*
  ���Ϲ�ȣ ���ϸ�                                                                                                 
---------- -----------------------------------------------
         1 SALES.DOC                                                                            
         2 PANMAE.XXLS                                                                                  
         3 RESEARCH.PPT                                                                                     
         4 STUDY.HWP                                                                              
         5 SQL.TXT                                                                           
         6 TEST.PNG                                                                                 
         7 SPRING.JPG                                                           
         8 20190328_01_SCOTT.SQL   
*/


--�� TBL_FILES ���̺��� ������� ���� ���� ��ȸ�� �� �ֵ��� 
--   �������� �����Ѵ�.
SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�", SUBSTR(FILENAME, 16, 9)"���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(FILENAME, �׹�°\��ġ+1, 9)"���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(FILENAME, �ι�°\��ġ+1, 9)"���ϸ�"
FROM TBL_FILES
WHERE FILENO=2;

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , REVERSE(FILENAME)"�Ųٷε����ϸ�"
FROM TBL_FILES;
/*
ó�� �����ϴ� (\)��ġ�� �ϰ��ǰ� ��ȸ ����
COD.SELAS\CCC\BBB\AAA\:C
SLXX.EAMNAP\AAA\:C
TPP.HCRAESER\:D
PWH.YDUTS\STNEMUCOD\:C
TXT.LQS\PMET\STNEMUCOD\:C
GNP.TSET\F\ERAHS\:D
GPJ.GNIRPS\OTOHP\ERUTCIP\GNODLIUG\RESU\:C
LQS.TTOCS_10_82309102\YDUTSELCARO\:C
*/

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(����ڿ�, ���������ġ, ���ⰹ��), REVERSE(FILENAME)"�Ųٷε����ϸ�"
FROM TBL_FILES;

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, ����'\'�� �����ϴ� ��ġ -1) "�Ųٷε����ϸ�" -- '-1': '\'�� �������� �ʱ� ���� ��ĭ ����
FROM TBL_FILES;

-- ���� '\'�� �����ϴ� ��ġ 
INSTR(REVERSE(FILENAME), '\', 1);  -- ������ �Ű����� 1 ����

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

SELECT FILENO"���Ϲ�ȣ"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

SELECT FILENO"���Ϲ�ȣ"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1)) "���ϸ�"
FROM TBL_FILES;
--==>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20190328_01_SCOTT.SQL
*/
SELECT REVERSE( SUBSTR ( REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) ) )
FROM TBL_FILES;


--�� LPAD();
-->  Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "��"
     , LPAD('ORACLE', 10, '*') "��" 
FROM DUAL;
--==>> ORACLE	****ORACLE
--> �� 10Byte ������ Ȯ���Ѵ�.                  �� �� ��° �Ķ���� ���� ����...
--  �� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.  �� ù ��° �Ķ���� ���� ����...
--  �� �����ִ� Byte ������ ���ʺ��� �� ��° �Ķ���� ������ ä���.
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.

--�� RPAD();
-->  Byte ������ Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "��"
     , RPAD('ORACLE', 10, '*') "��" 
FROM DUAL;
--==>> ORACLE	ORACLE****
--> �� 10Byte ������ Ȯ���Ѵ�.                  �� �� ��° �Ķ���� ���� ����...
--  �� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.  �� ù ��° �Ķ���� ���� ����...
--  �� �����ִ� Byte ������ �����ʺ��� �� ��° �Ķ���� ������ ä���.
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.

/*
Java �� trim() �� ������� ��� 
*/

--�� LTRIM()
SELECT 'ORAORAORACLEORACLE' "��"    -- ���� ���� ����Ŭ ����Ŭ
     , LTRIM('ORAORAORACLEORACLE', 'ORA') "��"
     , LTRIM('AAAORAORAORACLEORACLE', 'ORA') "��"
     , LTRIM('ORAoRAORACLEORACLE', 'ORA') "��"
     , LTRIM('ORA ORAORACLEORACLE', 'ORA') "��"
     , LTRIM('              ORACLE') "��"  -- ���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;
--==>> 
/*
ORAORAORACLEORACLE
CLEORACLE
CLEORACLE
oRAORACLEORACLE
 ORAORACLEORACLE
*/
--> 'ORA'�� ������ ����(O,R,A) �ϳ��ϳ��� ������ó�� �ڸ���, �߶� ���� ������ ������ ���
--  ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� ������� 
--  ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.

SELECT LTRIM('�̱���̱���̱���̱���̱���̱���̱�Ź��̱��', '�̱��') "TEST"
FROM DUAL;
--==>> ���̱��

--�� RTRIM()
SELECT 'ORAORAORACLEORACLE' "��"    -- ���� ���� ����Ŭ ����Ŭ
     , RTRIM('ORAORAORACLEORACLE', 'ORA') "��"
     , RTRIM('AAAORAORAORACLEORACLE', 'ORA') "��"
     , RTRIM('ORAoRAORACLEORACLE', 'ORA') "��"
     , RTRIM('ORA ORAORACLEORACLE', 'ORA') "��"
     , RTRIM('ORACLE              ') "��"  -- ������ ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;
--==>>
/*
ORAORAORACLEORACLE
ORAORAORACLEORACLE
AAAORAORAORACLEORACLE
ORAoRAORACLEORACLE
ORA ORAORACLEORACLE
ORACLE
*/
-->  ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� ������� 
--  �����ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ��� 
--  (�� �������� E�� ���� �����ϹǷ� ���ڸ�)
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.


--�� TRANSLATE()  
--> 1:1 �� �ٲپ��ش�. 
SELECT TRANSLATE('MY ORACLE SERVER'
               , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
               , 'abcdefghijklmnopqrstuvwxyz')
FROM DUAL;
--==>> my oracle server
--> ù ��° �Ķ���� ��: ��� ���ڿ�
--  �� ��° �Ķ���� �� : ��󿡼� ���ϴ� ����
--  �� ��° �Ķ���� �� : �ϴ��Ϸ� ��ġ�ؼ� ��ȯ

SELECT TRANSLATE('010-6575-2297'
                ,'0123456789'
                ,'�����̻�����ĥ�ȱ�')
FROM DUAL;
--==>> ���Ͽ�-����ĥ��-���̱�ĥ


--�� REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����')
FROM DUAL;
--==>> MY ����CLE ����HOME





