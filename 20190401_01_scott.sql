SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
-- ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)       
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')       -- 1900��� ��
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)  
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       -- 2000��� ��
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
           ELSE 0 -- THEN �� ������� ���� Ÿ���̱� ������ '����Ȯ�κҰ�'(����Ÿ��)�� ��������� ��ȯ�� �� ����
       END "���糪��"
     , HIREDATE "�Ի���"
     , SAL "�޿�"
FROM TBL_SAWON;


SELECT TBL_SAWON.SANAME "�����", SAL*12 "����", SAL*12*2"�ι迬��"  
FROM SCOTT.TBL_SAWON;


SELECT T.�����, T.����*2 "�ι迬��"
FROM 
(
    SELECT SANAME "�����", SAL*12 "����"
    FROM TBL_SAWON;
) T; 
--> �������� : '()' ���� ��ȸ�� ����� �ϳ��� ���̺�� ���ڴ�.
--> �ζ��� �� : FROM������ ���������� ���� ����


-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
-- ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
    -- ����������
    -- ���������⵵ �� �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��
    -- ���� ���̰�... 58��... 2�� ��    �� 2019... 2021
    -- ���� ���̰�... 35��... 25�� ��   �� 2019... 2044
    -- ADD_MONTHS(SYSDATE, ���� ��� * 12)
    --                     ---------
    --                      60 - ���糪��
    -- ADD_MONTHS(SYSDATE, (60 - ���糪��) * 12)
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��) * 12), 'YYYY') �� �������� �⵵�� ����
    -- TO_CHAR(HIREDATE, 'MM-DD')                                 �� �Ի���   ���ϸ� ����
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��) * 12), 'YYYY') || '-' 
    --    || TO_CHAR(HIREDATE, 'MM-DD') "����������"
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-'  
      || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
    
    -- �ٹ��ϼ� 
    -- = ������ - �Ի���
    , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"  -- �ٹ��ϼ��� �Ҽ��� �ڸ��� ���� �Ϸ�� ä������ ���� ���̹Ƿ� ������
    
    -- ���� �ϼ�
    -- = ���������� - ������ 
    -- TRUNC(   TO_DATE(�����������ڿ�, 'YYYY-MM-DD') - SYSDATE ) "�����ϼ�"    
    , TRUNC( TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-'  
      || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE ) "�����ϼ�"
    , T.�޿� "�޿�"
    
    -- ���ʽ�
    -- �ٹ��ϼ��� 1000�� �̻� 2000�� �̸� �� ���� �޿� ���� 30% ����
    -- �ٹ��ϼ��� 2000�� �̻�             �� ���� �޿� ���� 50% ����
    -- ������                             �� 0
    , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5  -- ���ǻ� ū �������� ���� �����ϸ� ���� ������
           WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3  -- ������ ����(>=, <=)���� �� �ʿ� ����.
    ELSE 0
    END "���ʽ�"
FROM 
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)       
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')       -- 1900��� ��
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)  
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       -- 2000��� ��
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
           ELSE 0 -- THEN �� ������� ���� Ÿ���̱� ������ '����Ȯ�κҰ�'(����Ÿ��)�� ��������� ��ȯ�� �� ����
       END "���糪��"
     , HIREDATE "�Ի���"
     , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>>
/*
1001	�̿���	    8706241234567	����	33	2001-01-03	2046-01-03	6662	9773	3000	1500
1002	���ֿ�	    9405022234567	����	26	2010-11-05	2053-11-05	3069	12636	2000	1000
1003	������	    9710012234567	����	23	1999-08-16	2056-08-16	7168	13651	5000	2500
1004	��ȫ��	    9504102234567	����	25	1997-11-05	2054-11-05	7817	13001	4000	2000
1005	�̺��	    7210101234567	����	48	1998-02-02	2031-02-02	7728	4324	2000	1000
1006	������	    8004271234567	����	40	1998-02-02	2039-02-02	7728	7246	2000	1000
1007	������	    0405064234567	����	16	2010-07-15	2063-07-15	3182	16175	1000	500
1008	������	    0506074234567	����	15	2011-07-15	2064-07-15	2817	16541	1000	500
1009	������	    0505053234567	����	15	2011-07-15	2064-07-15	2817	16541	3000	1500
1010	���켱	    9505052234567	����	25	1999-11-11	2054-11-11	7081	13007	4000	2000
1011	������	7512122234567	����	45	1999-11-11	2034-11-11	7081	5702	5000	2500
1012	������	    9302131234567	����	27	2010-11-11	2052-11-11	3063	12277	3000	1500
1013	���ü�	    7202021234567	����	48	1992-10-10	2031-10-10	9669	4574	2000	1000
1014	����	    6912121234567	����	51	1987-10-10	2028-10-10	11496	3479	4000	2000
1015	���̰�	    8410141234567	����	36	1997-10-10	2043-10-10	7843	8957	5000	2500
*/

-- ��� ���뿡��... Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�,
-- Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 ���� �� �ִ�.
-- �̿� ���� ���... �ش� �������� �ٽ� �����ϴ� ���ŷο��� ���� �� �ֵ���
-- ��(VIEW)�� ����� �����ص� �� �ִ�.

CREATE OR REPLACE VIEW VIEW_SAWON   -- VIEW �� ���ڿ��� �����ϴ� ����(�޸� �Ҵ緮���� �������, ����� �Ҷ����� ���� ������ �������)
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-'  
      || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
    , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"  
    , TRUNC( TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-'  
      || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE ) "�����ϼ�"
    , T.�޿� "�޿�"  
    , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5 
           WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3  
    ELSE 0
    END "���ʽ�"
FROM 
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
    
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')     
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)  
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')     
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
           ELSE 0 
       END "���糪��"
     , HIREDATE "�Ի���"
     , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON��(��) �����Ǿ����ϴ�.


--SELECT *
--FROM VIEW_SAWON;
  

INSERT INTO TBL_SAWON(SANO, SANAME, SAL, HIREDATE)
VALUES(2000, '�輱��', 5000, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM VIEW_SAWON;
--==>> 2000	�輱��		����Ȯ�κҰ�	0	2019-04-01	2079-04-01	0	21914	5000	0
-- ���� ������ ���� �Ŀ� �信�� �ٷ� �����.


--�� TBL_SAWON ���̺��� �̿��� ����� �Ի��� �� �޿� ������ ����
--   ����TABLE : 1001	�̿���	8706241234567	2001-01-03	3000
--   ����VIEW  : 1001	�̿���	8706241234567	����	33	2001-01-03	2046-01-03	6662	


UPDATE TBL_SAWON
SET HIREDATE = SYSDATE, SAL = 100
WHERE SANO=1001;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_SAWON;
--==>> 1001	�̿���	8706241234567	2019-04-01	100


SELECT *
FROM VIEW_SAWON;
--==>> 1001	�̿���	8706241234567	����	33	2019-04-01	2046-04-01	0	9861	100	0


--�� ����
-- ���� ������ Ȱ���Ͽ� TBL_SAWON ���̺��� ������ ���� ��ȸȰ �� �ֵ��� �Ѵ�.
/*
------------------------------------------------
   �����  ����  ���糪��   �޿�   ���̺��ʽ�
------------------------------------------------  

��, ���̺��ʽ��� ���� ���̰� 40�� �̻��̸� �޿��� 70%
    30�� �̻� 40�� �̸��̸� �޿��� 50%
    20�� �̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�.

����, �ϼ��� ��ȸ ������ ������� 
VIEW_SAWON2 ��� �̸��� ��(VIEW)�� �����Ѵ�.
*/

SELECT T.*
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
( --> () ���� �̳�����(��������)�� ��ü�� ������ �Ǿ�� ��ü ������ �����ϴ�.
SELECT SANAME "�����"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE 'Ȯ�κҰ�'
        END "����"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0
       END "���糪��"
     , SAL "�޿�"
FROM TBL_SAWON
) T;

CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.*
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
( --> () ���� �̳�����(��������)�� ��ü�� ������ �Ǿ�� ��ü ������ �����ϴ�.
SELECT SANAME "�����"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE 'Ȯ�κҰ�'
        END "����"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0
       END "���糪��"
     , SAL "�޿�"
FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON2��(��) �����Ǿ����ϴ�.


--�� ������ �� Ȯ��
SELECT *
FROM VIEW_SAWON2;
--==>>
/*
�輱��	    Ȯ�κҰ�	0	5000	0
�̿���	    ����	    33	100	50
���ֿ�	    ����	    26	2000	600
������	    ����	    23	5000	1500
��ȫ��	    ����	    25	4000	1200
�̺��	    ����	    48	2000	1400
������	    ����	    40	2000	1400
������	    ����	    16	1000	0
������	    ����	    15	1000	0
������	    ����	    15	3000	0
���켱	    ����	    25	4000	1200
������	����	    45	5000	3500
������	    ����	    27	3000	900
���ü�	    ����	    48	2000	1400
����	    ����	    51	4000	2800
���̰�	    ����	    36	5000	2500
*/

-------------------------------------------------------------------------------------


--�� RANK() �� ���(����)�� ��ȯ�ϴ� �Լ�
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	 1
7902	FORD	20	3000	 2
7788	SCOTT	20	3000	 2
7566	JONES	20	2975	 4
7698	BLAKE	30	2850	 5
7782	CLARK	10	2450	 6
7499	ALLEN	30	1600	 7
7844	TURNER	30	1500	 8
7934	MILLER	10	1300	 9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	    13
7369	SMITH	20	800	    14
*/

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1	 1
7902	FORD	20	3000	1	 2
7788	SCOTT	20	3000	1	 2
7566	JONES	20	2975	3	 4
7698	BLAKE	30	2850	1	 5
7782	CLARK	10	2450	2	 6
7499	ALLEN	30	1600	2	 7
7844	TURNER	30	1500	3	 8
7934	MILLER	10	1300	3	 9
7521	WARD	30	1250	4	10
7654	MARTIN	30	1250	4	10
7876	ADAMS	20	1100	4	12
7900	JAMES	30	950	    6	13
7369	SMITH	20	800	    5	14
*/

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP
ORDER BY 3, 4 DESC;   -- 3.�μ���ȣ�� �������� / 4.��ü �޿������� ��������
--==>>
/*
7839	KING	10	5000	 1	 1
7782	CLARK	10	2450	 2	 6
7934	MILLER	10	1300	 3	 9
7902	FORD	20	3000	 1	 2
7788	SCOTT	20	3000	 1	 2
7566	JONES	20	2975	 3	 4
7876	ADAMS	20	1100	 4	12
7369	SMITH	20	800	     5	14
7698	BLAKE	30	2850	 1	 5
7499	ALLEN	30	1600	 2	 7
7844	TURNER	30	1500	 3	 8
7654	MARTIN	30	1250	 4	10
7521	WARD	30	1250	 4	10
7900	JAMES	30	950	     6  13
*/

--�� DENSE_RANK() �� ������ ��ȯ�ϴ� �Լ� (����� ������ �־ ���� ������ �ǳʶپ����� �ʰ� �̾��� EX. 2�� 3��, 3�� 2��..)
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP
ORDER BY 3, 4 DESC;
--==>>
/*
7839	KING	10	5000	1	 1
7782	CLARK	10	2450	2	 5
7934	MILLER	10	1300	3	 8
7902	FORD	20	3000	1	 2
7788	SCOTT	20	3000	1	 2
7566	JONES	20	2975	2	 3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800 	4	12
7698	BLAKE	30	2850	1	 4
7499	ALLEN	30	1600	2	 6
7844	TURNER	30	1500	3	 7
7654	MARTIN	30	1250	4	 9
7521	WARD	30	1250	4	 9
7900	JAMES	30	950	    5	11
*/
   
--�� EMP ���̺��� ��� ������
--   �����, �μ���ȣ, ����, �μ��� ��������, ��ü �������� �׸����� ��ȸ�Ѵ�.
-------------------------------------------------------------------------------------
SELECT T.*
     , RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ��� ��������"
     , RANK() OVER(ORDER BY T.���� DESC) "��ü ��������"
FROM 
(
SELECT ENAME "�����", DEPTNO "�μ���ȣ"
     , SAL*12+NVL(COMM,0) "����"
FROM EMP
) T
ORDER BY 2, 3 DESC;
--==>>
/*
KING	10	60000	1	 1
CLARK	10	29400	2	 6
MILLER	10	15600	3	10
FORD	20	36000	1	 2
SCOTT	20	36000	1	 2
JONES	20	35700	3	 4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	 5
ALLEN	30	19500	2	 7
TURNER	30	18000	3	 8
MARTIN	30	16400	4	 9
WARD	30	15500	5	11
JAMES	30	11400	6	13
*/


--�� EMP ���̺��� ��ü ���� ������ 1����� 5�������...
--   �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.

-- ���� Ǯ���� ����
SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ"
         , SAL*12+NVL(COMM,0) "����"
         , DENSE_RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
    FROM EMP
) T
WHERE T.��ü�������� < 6
ORDER BY 3 DESC;

--------------------------------------------------------
-- �Բ� Ǯ���� ����
SELECT ENAME "�����", DEPTNO "�����ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "��ü��������"  
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) <= 5;
--==>> ���� �߻�
/*
ORA-30483: window  functions are not allowed here
30483. 00000 -  "window  functions are not allowed here"
*Cause:    Window functions are allowed only in the SELECT list of a query.
           And, window function cannot be an argument to another window or group
           function.
*Action:
431��, 37������ ���� �߻�
*/

--�� ���� ������ RANK() OVER() �Լ��� WHERE ���������� ����� ����̸�
--   �� �Լ��� WHERE ���������� ����� �� ���� ������ �߻��ϴ� �����̴�.
--   �� ���, �츮�� INLINE VIEW(���� ����) �� Ȱ���Ͽ� Ǯ���ؾ� �Ѵ�.
-- RANK() OVER() : �����Լ�, �м��Լ�, ������ �Լ� �� WHERE������ �� �� ����. �� �������� ����ؼ� �����ذ� �ؾ���

SELECT T.*
FROM
(
SELECT ENAME "�����", DEPTNO "�����ȣ", SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "��ü ��������"  
FROM EMP
) T 
WHERE T."��ü ��������" <=5;


--�� EMP ���̺��� �� �μ����� ���� ����� 1�� ���� 2�� ������ ��ȸ�Ѵ�.
--   �����, �μ���ȣ, ����, �μ����������, ��ü�������

SELECT T.*
FROM
(
SELECT ENAME "�����", DEPTNO "�μ���ȣ", (SAL*12+NVL(COMM,0)) "����"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM,0)) DESC)"�μ����������"
     , DENSE_RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"��ü�������"
FROM EMP
) T
WHERE T.�μ���������� BETWEEN 1 AND 2 --  T.�μ���������� IN (1, 2)
ORDER BY 2, 3 DESC;
--==>>
/*
KING	10	60000	1	1
CLARK	10	29400	2	5
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	2	3
BLAKE	30	34200	1	4
ALLEN	30	19500	2	6
*/

--�� VIEW�� ����Ͽ� ��ü������� 1,2�� ��ȸ�ϱ�
CREATE OR REPLACE VIEW VIEW_TEST
AS
SELECT T.*
     , DENSE_RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC)"�μ����������"
     , DENSE_RANK() OVER(ORDER BY T.���� DESC)"��ü�������"
FROM
(
SELECT ENAME "�����", DEPTNO "�μ���ȣ", (SAL*12+NVL(COMM,0)) "����"
 
FROM EMP
) T;
--==>> View VIEW_TEST��(��) �����Ǿ����ϴ�.


SELECT *
FROM VIEW_TEST
WHERE ��ü������� BETWEEN 1 AND 2; 
--==>> 
/*
KING	10	60000	1	1
SCOTT	20	36000	1	2
FORD	20	36000	1	2
*/

--------------------------------------------------------------------------------------------------

--���� �׷� �Լ� ����--

-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�,
-- VARIANCE() �л�, STDDEV() ǥ������

--�� �׷� �Լ��� ���� ū Ư¡��
--   ó���ؾ� �� �����͵� �� NULL �� �����ϸ�
--   �� NULL �� �����ϰ� ������ �����Ѵٴ� ���̴�.

-- SUM()
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.
SELECT SUM(SAL)  -- 800+1600+1250+2975+1250+...+1300
FROM EMP;
--==>> 29025

SELECT SUM(COMM)  -- 300+500+1400+0
FROM EMP;
--==>> 2200


-- COUNT()
-- ���� ���� ��ȸ�Ͽ� ����� ��ȯ
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(SAL)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)  -- COMM �÷��� ���� ���� ��ȸ �� NULL �� ����~!!!
FROM EMP;
--==>> 4

SELECT COUNT(*)  -- ��ü �÷��� ���� ���� ��ȸ
FROM EMP;
--==>> 14


-- AVG()
-- ��� ��ȯ
SELECT SUM(SAL) / COUNT(SAL), AVG(SAL)
FROM EMP;
--==>> 
/*
2073.214285714285714285714285714285714286	
2073.214285714285714285714285714285714286
*/

SELECT AVG(COMM)
FROM EMP;
--==>> 550

SELECT SUM(COMM) / 14
FROM EMP;
--==>> 157.142857142857142857142857142857142857

SELECT SUM(COMM) / COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857


SELECT SUM(COMM) / COUNT(COMM), AVG(COMM)
FROM EMP;
--==>> 550	550 (�� �� Ʋ�� ��, ��� ���� �� NULL ���Կ��� ������ �߿�!)


--�� ǥ�������� ������ �л�
--   �л��� �������� ǥ������
SELECT AVG(SAL), VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
1398313.87362637362637362637362637362637	
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL), 2), VARIANCE(SAL) 
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL)
FROM EMP;
--==>> 
/*
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/


-- MAX() / MIN()
-- �ִ밪 / �ּҰ� ��ȯ
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--==>> 5000	800
--> ����Ŭ�� NULL �� �ִ밪���� ����, MSSQL�� NULL �� �ּҰ����� ����


--�� ����
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> ���� �߻� (14�� ���ڵ�, ���� ���ڵ�)
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
578��, 8������ ���� �߻�
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> ���� ���� ���� �߻�
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
589��, 8������ ���� �߻�
*/


--�� �μ��� �޿��� ��ȸ
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
10	8750
20	10875
30	9400
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	29025
*/


SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT *
FROM TBL_EMP;

--�� ������ �Է�
INSERT INTO TBL_EMP VALUES
(8001, '���μ�', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES 
(8002, '������', 'CLERK', 7565, SYSDATE, 1000, 0, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8003, '����', 'SLAESMAN', 7698, SYSDATE, 2000, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�

INSERT INTO TBL_EMP VALUES 
(8004, '�嵿��', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES 
(8005, '����', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.


--�� Ȯ�� �� TBL_EMP ���̺� ����
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		20
7839	KING	PRESIDENT		    1981-11-17	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		20
7900	JAMES	CLERK	    7698	1981-12-03	950		30
7902	FORD	ANALYST	    7566	1981-12-03	3000		20
7934	MILLER	CLERK	    7782	1982-01-23	1300		10
8001	���μ�	CLERK	    7566	2019-04-01	1500	10	
8002	������	CLERK	    7565	2019-04-01	1000	0	
8003	����	SLAESMAN	7698	2019-04-01	2000		
8004	�嵿��	SALESMAN	7698	2019-04-01	2500		
8005	����	SALESMAN	7698	2019-04-01	1000				
*/

--�� Ŀ�� 
COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP 
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
(null)	8000    -- �μ���ȣ�� null �� �����͵鳢���� �޿� ��
(null)	37025   -- ��� �μ��� �޿� �� �հ�
*/


-- ������ ��ȸ�� ������
/*
10	        8750
20	        10875
30	        9400
����	    8000   -- �μ���ȣ�� null �� �����͵鳢���� �޿� ��
���μ�	37025  -- ��� �μ��� �޿� �� �հ�
*/

SELECT CASE DEPTNO WHEN NULL 
            THEN '����'
            ELSE DEPTNO
        END "�μ���ȣ"
FROM TBL_EMP;
--==>> ���� �߻�
/*
ORA-00932: inconsistent datatypes: expected CHAR got NUMBER
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:
755��, 22������ ���� �߻�
*/

SELECT CASE DEPTNO WHEN NULL 
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
(null)
(null)
(null)
(null)
(null)
*/


SELECT CASE WHEN DEPTNO IS NULL 
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
FROM TBL_EMP;
--==>>
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
����
����
����
����
����
*/


(from > where > group by > having > select > order by)
SELECT CASE WHEN DEPTNO IS NULL 
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
     ,  SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
����	8000
����	37025
*/

SELECT CASE WHEN DEPTNO IS NULL 
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
     ,  SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>> 
/*
10	    8750
20	    10875
30	    9400
����	8000
*/

SELECT T.*
FROM 
(
SELECT CASE WHEN DEPTNO IS NULL
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"     
FROM TBL_EMP
--GROUP BY DEPTNO
--ORDER BY DEPTNO
) T
GROUP BY DEPTNO
ORDER BY DEPTNO
GROUP BY ROLLUP(T.�μ���ȣ);
--==>> ���� �߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
858��, 10������ ���� �߻�
*/



--�� GROUPING()
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750	0 -- ���̺� �ִ� ���� �÷����� ����
20	    10875	0
30	    9400	0
(null)	8000	0
(null)	37025	1 -- ���ο� �÷����� ����
*/

/*
10	        8750
20	        10875
30	        9400
����	    8000   -- �μ���ȣ�� null �� �����͵鳢���� �޿� ��
���μ�	37025  -- ��� �μ��� �޿� �� �հ�
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
       ELSE '���μ�' END "�μ���ȣ"
     , SUM(SAL) "�޿���"
FROM TBL_EMP 
GROUP BY ROLLUP(DEPTNO);


--�� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
----------------------------    
    ����         �޿���
----------------------------
    ��           XXXXXX
    ��           XXXXXX
    �����    XXXXXXX
----------------------------
*/
SELECT *
FROM TBL_SAWON;

SELECT CASE GROUPING(T.����) WHEN 0 THEN T.����
            ELSE '�����' 
        END "����"
      , SUM(T.�޿�) "�޿���"  
FROM 
(
SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
            ELSE 'Ȯ�κҰ�'
       END "����"
      ,SAL "�޿�"
FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.����);
--==>> 
/*
��	        21100
��	        22000
Ȯ�κҰ�	5000
�����	48100
*/

--�� TBL_SAWON ���̺��� ������ ���� ���ɴ뺰 �ο��� ���·�
--   ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
-------------------------------
    ���ɴ�         �ο���
-------------------------------
     0               X
    10               X
    20               X
    30               X
    40               X
    50               X
   ��ü             XX
-------------------------------
*/
-- ���1. INLINE VIEW �� �� �� ��ø~!!!

SELECT CASE GROUPING(Q.���ɴ�) WHEN 0 THEN TO_CHAR(Q.���ɴ�)
            ELSE '��ü'
       END "���ɴ�"
     , COUNT(Q.���ɴ�) "�ο���"
FROM
(    -- ���ɴ�
    SELECT CASE WHEN T.���� >= 50 THEN 50
                WHEN T.���� >= 40 THEN 40
                WHEN T.���� >= 30 THEN 30
                WHEN T.���� >= 20 THEN 20
                WHEN T.���� >= 10 THEN 10
                ELSE 0
           END "���ɴ�" 
    FROM 
    (   -- ����
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE 0
                END "����"
        FROM TBL_SAWON
    ) T
) Q
GROUP BY ROLLUP(Q.���ɴ�);
--==>>
/*
0	     1
10	     3
20	     5
30	     2
40	     4
50	     1
��ü	16
*/

-- ���2. INLINE VIEW �� �� ���� ���~!!!
SELECT CASE GROUPING (T.���ɴ�) WHEN 0 THEN TO_CHAR(T.���ɴ�)
            ELSE '��ü'
        END "���ɴ�"
      , COUNT(T.���ɴ�) "�ο���"
FROM 
(
SELECT TRUNC(CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                  THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                  WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                 THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                 ELSE 0
             END, -1) "���ɴ�"
FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.���ɴ�);
------------------------------------------------------------------------------------------------------------
SELECT CASE GROUPING(T.���ɴ�) WHEN 0 THEN T.���ɴ�
            ELSE '��ü'
        END "���ɴ�"
     , COUNT(T.���ɴ�)
FROM 
(
SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN TO_CHAR(TRUNC((EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899))/10)*10)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       
            THEN TO_CHAR(TRUNC((EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999))/10)*10)
            ELSE '0'
        END "���ɴ�"
FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.���ɴ�);
--------------------------------------------------------------------------------------------------------------

SELECT TRUNC(23, -1) "Ȯ��"
FROM DUAL;

--�� ROLLUP Ȱ�� �� CUBE
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000  -- 10�� PRESIDEN  ������ �޿���
10	    (null)      8750  -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)      10875 -- 20�� �μ� ��� ������ �޿���
30	    CLERK	    950
30	    MANAGER	    2850
30	   SALESMAN	    5600
30	   (null)       9400  -- 30�� �μ� ��� ������ �޿���
(null) (null)       29025 -- ��� �μ� ��� ������ �޿���
*/

--�� CUBE() �� ROLLUP() ���� ���� �� �ڼ��� ����� ��ȯ���� �� �ִ�.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER 	2450
10	    PRESIDENT	5000
10		(null)      8750   -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875  -- 20�� �μ� ��� ������ �޿��� 
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400   -- 30�� �μ� ��� ������ �޿���
(null)	ANALYST	    6000   -- ��� �μ� ANALYST ������ �޿���
(null)	CLERK	    4150   -- ��� �μ� CLERK ������ �޿���
(null)	MANAGER	    8275   -- ��� �μ� MANAGER ������ �޿���
(null)	PRESIDENT	5000   -- ��� �μ� PRESIDENT ������ �޿���
(null)	SALESMAN	5600   -- ��� �μ� SALESMAN ������ �޿���
(null)	(null)	    29025  -- ��� �μ� ��� ������ �޿���
*/

--�� ROLLUP() �� CUBE() �� 
--   �׷��� �����ִ� ����� �ٸ���. (����)

-- ROLLUP(A, B, C) 
-- �� (A, B, C) / (A, B) / (A) / ()

-- CUBE(A, B, C)
-- �� (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) /()

--==>> ���� ó�� ������ �ʹ� ���� ������� ��µǱ� ������
--     ������ ���� ���¸� �� ���� ����Ѵ�.
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS���� 
--     �̿��Ͽ� �����ִ� ����̴�.


--�� ROLLUP() ���
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
             ELSE '��ü����'
        END "����"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    ��ü����	8750
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER 	2975
20	    ��ü����	10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    ��ü����	9400
����	CLERK	    2500
����	SALESMAN	3500
����	SLAESMAN	2000
����	��ü����	8000
��ü�μ���ü����	37025
*/

--�� CUBE() ���
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
             ELSE '��ü����'
        END "����"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	    2500
����	    SALESMAN	3500
����	    SLAESMAN	2000
����	    ��ü����	8000
��ü�μ�	ANALYST	    6000
��ü�μ�	CLERK	    6650
��ü�μ�	MANAGER	    8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	9100
��ü�μ�	SLAESMAN	2000
��ü�μ�	��ü����	37025
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
             ELSE '��ü����'
        END "����"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ()) -- ROLLUP() �� ���� ���
ORDER BY 1, 2;
--==>>
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER 	2975
20	        ��ü����	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	    2500
����	    SALESMAN	3500
����	    SLAESMAN	2000
����	    ��ü����	8000
��ü�μ�	��ü����	37025
*/
        
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
      , CASE GROUPING(JOB) WHEN 0 THEN JOB
             ELSE '��ü����'
        END "����"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ()) -- CUBE() �� ���� ���
ORDER BY 1, 2;
--==>> 
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER 	2975
20	        ��ü����	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	    2500
����	    SALESMAN	3500
����	    SLAESMAN	2000
����	    ��ü����	8000
��ü�μ�	ANALYST	    6000
��ü�μ�	CLERK	    6650
��ü�μ�	MANAGER	    8275
��ü�μ�	PRESIDENT	5000
*/


--�� TBL_EMP ���̺��� �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;
/*
-------------------------
    �Ի�⵵    �ο���
-------------------------
    1980           1
    1981          10
    1982           1
    1987           2
    2019           5
    ��ü          19
------------------------
*/
---------------------------------------------------------------------
SELECT CASE GROUPING(T.�Ի�⵵) WHEN 0 THEN TO_CHAR(T.�Ի�⵵)
            ELSE '��ü'
        END "�Ի�⵵"
      , COUNT(T.�Ի�⵵)
FROM 
(
SELECT TO_NUMBER(SUBSTR(HIREDATE,1, 4)) "�Ի�⵵"
FROM TBL_EMP
) T
GROUP BY ROLLUP(T.�Ի�⵵)
ORDER BY T.�Ի�⵵;
---------------------------------------------------------------------
SELECT EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;


SELECT EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> GROUP BY ���� SELECT ���� ���� �Ľ̵Ǳ� ������
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
1,268��, 26������ ���� �߻�
*/


SELECT EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> ���� �߻�

SELECT EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY GROUPING SETS(TO_CHAR(HIREDATE, 'YYYY'), ())
ORDER BY 1;
--==>> ���� �߻�


SELECT TO_CHAR(HIREDATE 'YYYY') "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>> ���� �߻�


SELECT TO_CHAR(HIREDATE, 'YYYY')"�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> 
/*
1980	 1
1981	10
1982	 1
1987	 2
2019 	 5
(null)	19
*/

