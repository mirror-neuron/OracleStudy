SELECT USER
FROM DUAL;
--==>> SCOTT


--���� HAVING ����--

--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� �������
--   �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN(20, 30)
  AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> ���� �߻�
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
13��, 7������ ���� �߻�
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN(20, 30) --> �Ϲ� �����̹Ƿ� WHERE �������� ����ϴ� ���� ������
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO IN(20, 30) 
   AND SUM(SAL) < 10000;
--==>> 30	9400


----------------------------------------------------------------------------------------------

--���� ��ø �׷��Լ� / �м��Լ� ����--

-- �׷� �Լ� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- �̸����� MSSQL �� �Ұ����ϴ�.
SELECT MAX(SUM(SAL))  --> SUM() �� MAX() �� ���ձ� ������ 2LEVEL ���� ��ø�� ����
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

-- RANK()
-- DENSE_RANK()
--> ORACLE 9i ���� ����... MSSQL 2005 ���� ����...

--�� ���� ���������� RANK() �� DENSE_RANK() �� ����� �� ���� ������
--   �̸� ��ü�Ͽ� ������ ������ �� �ִ� ����� �����ؾ� �Ѵ�.

-- ���� ���, �޿��� ������ ���ϰ��� �Ѵٸ�...
-- �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� �� 
-- Ȯ���� ���ڿ� +1 �� �߰� �������ָ� �װ��� �� ����� �ȴ�.

SELECT ENAME, SAL
FROM EMP;

SELECT COUNT(*) + 1 
FROM EMP
WHERE SAL > 800;
--==>> 14 �� SMITH �� �޿� ���

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;
--==>> 7 �� ALLEN �� �޿� ���


--�� ���� ��� ���� (��� ���� ����)
--   ���� ������ �ִ� ���̺��� �÷���
--   ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ���� ��� �θ���.

SELECT ENAME "�����",  SAL "�޿�", 1 "�޿����"
FROM EMP;

SELECT ENAME "�����",  SAL "�޿�", (1) "�޿����"
FROM EMP;

SELECT ENAME "�����",  SAL "�޿�"
     , (SELECT COUNT(*) + 1 
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "�޿����"
FROM EMP E1; 
--> E1, E2 : ������ EMP ���̺� ��Ī ���� ��
--==>>
/*
SMITH	800	    14
ALLEN	1600	 7
WARD	1250	10
JONES	2975	 4
MARTIN	1250	10
BLAKE	2850	 5
CLARK	2450	 6
SCOTT	3000	 2
KING	5000	 1
TURNER	1500	 8
ADAMS	1100	12
JAMES	950	    13
FORD	3000	 2
MILLER	1300	 9
*/

SELECT ENAME "�����",  SAL "�޿�"
     , (SELECT COUNT(*) + 1 
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "�޿����"
FROM EMP E1
ORDER BY 3; --> �޿������ ���� ����
--==>>
/*
KING	5000	 1
FORD	3000	 2
SCOTT	3000	 2
JONES	2975	 4
BLAKE	2850	 5
CLARK	2450	 6
ALLEN	1600	 7
TURNER	1500	 8
MILLER	1300	 9
WARD	1250	10
MARTIN	1250	10
ADAMS	1100	12
JAMES	950	    13
SMITH	800	    14
*/


--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK() �Լ��� ������� �ʰ� ��� ���� ������ Ȱ���� �� �ֵ��� �Ѵ�.


SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
      , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.SAL > E1.SAL) "�μ����޿����"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL > E1.SAL) "��ü�޿����"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL DESC;
--==>>
/*
KING	5000	10	1	 1
CLARK	2450	10	2	 6
MILLER	1300	10	3	 9
SCOTT	3000	20	1	 2
FORD	3000	20	1	 2
JONES	2975	20	3	 4
ADAMS	1100	20	4	12
SMITH	800	    20	5	14
BLAKE	2850	30	1	 5
ALLEN	1600	30	2	 7
TURNER	1500	30	3	 8
MARTIN	1250	30	4	10
WARD	1250	30	4	10
JAMES	950	    30	6	13
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
--------------------------------------------------------------------------------
    �����       �μ���ȣ       �Ի���        �޿�      �μ����Ի纰�޿�����
--------------------------------------------------------------------------------
    CLARK	        10	        1981-06-09	  2450
    KING	        10	        1981-11-17	  5000
    MILLER	        10	        1982-01-23	  1300
    SMITH	        20	        1980-12-17	  800
    JONES	        20	        1981-04-02	  2975
    FORD	        20	        1981-12-03	  3000
    SCOTT	        20	        1987-07-13	  3000
    ADAMS	        20	        1987-07-13	  1100
    ALLEN	        30	        1981-02-20	  1600
    WARD	        30	        1981-02-22	  1250
    BLAKE	        30	        1981-05-01	  2850
    TURNER	        30	        1981-09-08	  1500
    MARTIN	        30	        1981-09-28	  1250
    JAMES	        30	        1981-12-03	  950
--------------------------------------------------------------------------------
*/
---------------------------------------------------------------------------------------------
--�� ���� Ǯ���� ����
SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     ,(SELECT MAX(SUM(E2.SAL))
       FROM EMP E2
       WHERE E2.DEPTNO = E1.DEPTNO
       GROUP BY E2.HIREDATE) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.HIREDATE;  
--> ���� �߸� ¤�� �־���.. (�Ի����� ���� ����� �������� ����. �Ʒ� ���� ����)
---------------------------------------------------------------------------------------------

--�� �Բ� Ǯ���� ����
SELECT ENAME, DEPTNO, HIREDATE, SAL
FROM EMP
ORDER BY DEPTNO, HIREDATE;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (1)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
          AND E2.HIREDATE <= E1.HIREDATE)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;
--==>>
/*
CLARK	10	1981-06-09	2450	 2450
KING	10	1981-11-17	5000	 7450
MILLER	10	1982-01-23	1300	 8750
SMITH	20	1980-12-17	800	      800
JONES	20	1981-04-02	2975	 3775
FORD	20	1981-12-03	3000	 6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	 1600
WARD	30	1981-02-22	1250	 2850
BLAKE	30	1981-05-01	2850	 5700
TURNER	30	1981-09-08	1500	 7200
MARTIN	30	1981-09-28	1250	 8450
JAMES	30	1981-12-03	950	     9400
*/


--�� TBL_EMP ���̺� ������� �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ִ� �������� �����Ѵ�.
/*
----------------------------------
    �Ի���        �ο���
----------------------------------
    2019-04           5
----------------------------------
*/


SELECT ENAME, HIREDATE
FROM TBL_EMP;


SELECT E1.ENAME "�����"
     , (SELECT E2.HIREDATE
        FROM TBL_EMP E2
        WHERE E2.HIREDATE = E1.HIREDATE
        GROUP BY E2.HIREDATE) "�Ի���"
     , (SELECT COUNT(E2.HIREDATE)
        FROM TBL_EMP E2
        WHERE MAX(E2.HIREDATE)) "�ο���"
FROM TBL_EMP E1;
--ORDER BY 2;


SELECT *
FROM TBL_EMP 
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');



