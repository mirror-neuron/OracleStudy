SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ROUND() �ݿø��� ó�����ִ� �Լ�

SELECT 48.678 "��"
     , ROUND(48.678, 2) "��"        -- �Ҽ��� ��° �ڸ����� ��ȿ�ϰ� ó���ض�(��° �ڸ����� �ݿø�)   
     , ROUND(48.674, 2) "��"        
     , ROUND(48.678, 1) "��"
     , ROUND(48.678, 0) "��"
     , ROUND(48.678) "��"           -- �� ��° �Ķ���� ���� 0�� ��� ����
     , ROUND(48.678, -1) "��"
     , ROUND(48.678, -2) "��"
     , ROUND(48.678, -3) "��"
FROM DUAL;
--==>> 48.678	48.68	48.67	48.7	49	49	50	0	0




--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678 "��"
     , TRUNC(48.678, 2) "��"         -- �Ҽ��� ���� ��° �ڸ����� ǥ��
     , TRUNC(48.674, 2) "��"
     , TRUNC(48.678, 1) "��"
     , TRUNC(48.678, 0) "��"
     , TRUNC(48.678) "��"            -- �� ��° �Ķ���� ���� 0�� ��� ����
     , TRUNC(48.678, -1) "��"
     , TRUNC(48.678, -2) "��"
     , TRUNC(48.678, -3) "��"
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5, 2)
FROM DUAL;
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ


--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5, 3)
FROM DUAL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ

--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2 �� ���� ����� ��ȯ


--�� LOG() �α� �Լ�
--   (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α�, �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10, 100), LOG (10, 20)
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--�� �ﰢ �Լ�
--   ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233
0.5403023058681397174009366074429766037354
1.55740772465490223050697480745836017308
*/


--�� �ﰢ�Լ��� ���Լ� (���� : -1 ~ 1)
--   �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405
1.04719755119659774615421446109316762805
0.4636476090008061162142562314612144020295
*/


--�� SING()         ����, ��ȣ, Ư¡
--> ���� ������� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-7)
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�.
--  (������ 3����(���, 0, ����) ������� ��ȯ�Ѵ�.)


--�� ASCII(), CHR() �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A'), CHR(65)
FROM DUAL;
--==>> 65	A
--> ASCII()  : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--  CHR()    : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.


------------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ ������ �⺻ ������ DAY(�ϼ�)�̴�~!! CHECK~!!!
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE-29
FROM DUAL;
--==>>
-- 2019-03-29 09:28:54   -- ����
-- 2019-03-30 09:28:54   -- 1�� �� 
-- 2019-03-27 09:28:54   -- 2�� ��
-- 2019-02-28 09:28:54   -- 29�� ��


--�� �ð� ���� ����
SELECT SYSDATE, SYSDATE + 1/24, SYSDATE - 2/24
FROM DUAL;
--==>> 
-- 2019-03-29 09:30:58   -- ����
-- 2019-03-29 10:30:58   -- 1�ð� ��
-- 2019-03-29 07:30:58   -- 2�ð� ��


--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
--   (���� ��)
/*
-----------------------------------------------------
    ���� �ð�             ���� �� �ð�
-----------------------------------------------------
2019-03-29 09:30:48      2019-03-30 11:33:52
-----------------------------------------------------
*/

-- ���1.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;
--==>>
/*
2019-03-29 09:40:53
2019-03-30 11:43:57
*/

-- ���2.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "���� �� �ð�"
     --              1��         2�ð�       3��   4�� / 1�� ��ü ��
FROM DUAL;
--==>>
/*
2019-03-29 09:44:33
2019-03-30 11:47:37
*/


--�� ��¥ - ��¥ = �ϼ�
-- ex) (2019-07-18) - (2019-03-29)
--        ������         ������
SELECT TO_DATE('2019-07-18', 'YYYY-MM-DD')-TO_DATE('2019-03-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> 111


--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2019-03-29', 'YYYY-MM-DD')     -- ��¥ �������� ��ȯ
FROM DUAL;
--==>> 2019-03-29

SELECT TO_DATE('2019-02-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01839: date not valid for month specified
01839. 00000 -  "date not valid for month specified"
*Cause:    
*Action:
*/
--> ������ ���� ��¥ ������ ����

SELECT TO_DATE('2019-13-29', 'YYYY-MM-DD')
FROM DUAL;
--==>>
/*
ORA-00936: missing expression
00936. 00000 -  "missing expression"
*Cause:    
*Action:
185��, 8������ ���� �߻�
*/
--> ������ ���� ���� ��¥ ������ ����

--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������~!!!


--�� ADD_MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE "1"
     , ADD_MONTHS(SYSDATE, 2) "2"
     , ADD_MONTHS(SYSDATE, 3) "3"
     , ADD_MONTHS(SYSDATE, -2) "4"
     , ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
--==>> 
/*
2019-03-29 10:05:18     -- ����
2019-05-29 10:05:18     -- 2���� �� 
2019-06-29 10:05:18     -- 3���� �� 
2019-01-29 10:05:18     -- 2���� ��  
2018-12-29 10:05:18     -- 3���� ��
*/
--> ���� ���ϰ� ����


--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� MONTHS_BETWEEN()
--  ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 201.949153225806451612903225806451612903(����)

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--  �� ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
--     ù ��° ���ڰ��� �ش��ϴ� ��¥����
--     �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-07-18', 'YYYY-MM-DD'))
FROM DUAL;
--==>> -3.63145161290322580645161290322580645161(�̷�)


--�� NEXT_DAY()
-- ù ��° ���ڰ��� ���� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> 2019-03-30	2019-04-01


--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ���� ������ ���� ���� �������� �ٽ� �� �� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>> 2019-03-30	2019-04-01


--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE='KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� LAST_DAY()
-- �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>> 2019-03-31

SELECT LAST_DAY(TO_DATE('2019-02-01', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 2019-02-28


--�� ���úη�... ������ ����.. ���뿡 �� ����(?)����.
--   ���� �Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.
SELECT ADD_MONTHS(SYSDATE, 22) "���� ����"
FROM DUAL;
--==>> 2021-01-29

-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �ؾ� �Ѵٰ� �����ϸ�
--    ���԰� �� ���� �Ծ�� ���� �����ٱ�.

-- �����Ⱓ * 3
-- --------
-- (�������� - ��������)

-- (�������� - ��������) * 3

SELECT (�������� - ��������) * 3
FROM DUAL;

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3 "��ü ���� ��"
FROM DUAL;
--==>> 2016
-- �� ���� Ǯ���� ����
-- SELECT (TO_DATE('2021-01-29', 'YYYY-MM-DD')-TO_DATE('2019-03-29', 'YYYY-MM-DD') )* 3"2. ��ü ���� ��" 
-- FROM DUAL;


--�� ���� ��¥ �� �ð����κ���... ������(2019-07-18 18:00:00) ���� 
--   ���� �Ⱓ��... ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
--   (���� ��)
/*
--------------------------------------------------------------------------------------
���� �ð�           | ������              |      �� |     �ð� |       �� |      �� |
--------------------------------------------------------------------------------------
2019-03-29 10:33:27 | 2019-07-18 18:00:00 |     110 |        7 |      26  |      33 |
--------------------------------------------------------------------------------------
*/

--���1. ��NLS_DATE_FORMAT����¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--���2. ��TO_CHAR����¥ Ÿ�� ���� ���
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "���� �ð�"
--==>> 2019-03-29 10:42:51
--> ��, ��¥ Ÿ���� �ƴ� ���� Ÿ������ ����� ���
SELECT SYSDATE
     , TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE) "��"
     , TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 ) "�ð�"
     , TRUNC( (( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 
     - TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 )) * 60) "��"
     , TRUNC( ((( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 
     - TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 )) * 60 
     - TRUNC( (( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 
     - TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 )) * 60)) * 60) "��"
FROM DUAL;


-- ��1�� 2�ð� 3�� 4�ʡ� ��... ���ʡ��� ȯ���ϸ�..
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;


SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

-- ��93784���ʸ� �ٽ� ��, �ð�, ��, �ʷ� ȯ���ϸ�...

SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)"��"
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)"�ð�"
     , MOD(TRUNC(93784/60), 60)"��"
     , MOD(93784, 60)"��"
FROM DUAL;


-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�
SELECT �������� - ��������
FROM DUAL;


-- ��������
SELECT TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;


SELECT  TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 111.238194444444444444444444444444444444
--> �����ϱ��� ���� �ϼ�


-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : ��
SELECT (�����ϱ��� ���� �ϼ�) * (�Ϸ縦 �����ϴ� ��ü ��)
FROM DUAL

SELECT (�����ϱ��� ���� �ϼ�) * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 9610770.00000000000000000000000000000001

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24)"��"
     , MOD(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"�ð�"
     , MOD(TRUNC((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60)"��"
     , TRUNC(MOD((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60))"��"
FROM DUAL;
--==>> 111	5	27	57


--�� ����
-- ������ �¾�� ������� �󸶸�ŭ�� ��, �ð�, ��, �ʸ� ��Ҵ���... (��� �ִ���) ��ȸ�Ѵ�.
/*
--------------------------------------------------------------------------------------
���� �ð�           | �¾ �ð�         |      �� |     �ð� |       �� |      �� |
--------------------------------------------------------------------------------------
2019-03-29 10:33:27 | 1990-04-16 18:00:00 |     XXX |       XX |       XX |      XX |
--------------------------------------------------------------------------------------
*/
--�� ��¥ ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT SYSDATE
FROM DUAL;
--==>> 2019-03-29 12:40:10

--�� �¾ ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�
SELECT ����ð� - �¾ �ð�
FROM DUAL;

SELECT SYSDATE - TO_DATE('1990-04-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 10573.7785532407407407407407407407407407

--�� �¾ ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : ��
SELECT (SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)
FROM DUAL;
--==>> 913639486.000000000000000000000000000003



SELECT SYSDATE "���� �ð�"
     , TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS') "�¾ �ð�"
     , TRUNC(TRUNC(TRUNC((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)/60)/24)) "��"
     , MOD(TRUNC(TRUNC((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)/60)/60), 60) "�ð�"
     , MOD(TRUNC((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)/60), 60) "��"
     , TRUNC(MOD((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60), 60)) "��"
FROM DUAL;


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                  --  2019-03-29  �� �⺻ ���� ��¥				
     , ROUND(SYSDATE, 'YEAR') "2"   --  2019-01-01  �� �⵵���� ��ȿ�� ������ (��ݱ�, �Ϲݱ� ����) 
     , ROUND(SYSDATE, 'MONTH')"3"   --  2019-04-01  �� ������ ��ȿ�� ������ (15�� ����)
     , ROUND(SYSDATE, 'DD') "4"     --  2019-03-30  �� ��¥���� ��ȿ�� ������ (���� ���� ���� ����)
     , ROUND(SYSDATE, 'DAY') "5"    --  2019-03-31  �� ��¥���� ��ȿ�� ������ (�����Ͽ��� ����Ϸ� �Ѿ�� ���� ����: ����/���� �Ͽ���, ����/���� �Ͽ��� )
FROM DUAL;


--�� ��¥ ����
SELECT SYSDATE "1"                  --  2019-03-29  �� �⺻ ���� ��¥				
     , TRUNC(SYSDATE, 'YEAR') "2"   --  2019-01-01  �� �⵵���� ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'MONTH')"3"   --  2019-03-01  �� ������ ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'DD') "4"     --  2019-03-29  �� ��¥���� ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'DAY') "5"    --  2019-03-24  �� ��¥���� ��ȿ�� ������ (��� ������� ���� �Ͽ��Ϸ� ����)
FROM DUAL;


--------------------------------------------------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥ �����͸� '���� Ÿ��'���� ��ȯ�����ִ� �Լ�
-- TO_DATE()    : ���� ������(��¥ ����)�� '��¥ Ÿ��'���� ��ȯ�����ִ� �Լ�
-- TO_NUMBER()  : ���� ������(���� ����)�� '���� Ÿ��'���� ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ �� �ֵ��� �Ѵ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.


ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.


ALTER SESSION SET NLS_CURRENCY = '\';    -- ��ȭ
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')  -- 2019-03-29
     , TO_CHAR(SYSDATE, 'YYYY')        -- 2019
     , TO_CHAR(SYSDATE, 'YEAR')        -- TWENTY NINETEEN (�ѱ�� 2019�� ���� ���� Ÿ�� �����Ͱ� ����)
     , TO_CHAR(SYSDATE, 'MM')          -- 03
     , TO_CHAR(SYSDATE, 'MONTH')       -- 3�� 
     , TO_CHAR(SYSDATE, 'MON')         -- 3�� (MON : MONTH �� ���Ӹ�)
     , TO_CHAR(SYSDATE, 'DD')          -- 29
     , TO_CHAR(SYSDATE, 'DAY')         -- �ݿ���
     , TO_CHAR(SYSDATE, 'DY')          -- ��
     , TO_CHAR(SYSDATE, 'HH24')        -- 14
     , TO_CHAR(SYSDATE, 'HH')          -- 02
     , TO_CHAR(SYSDATE, 'HH AM')       -- 02 ���� (���� �������� ���� ���ķ� ������ ��)
     , TO_CHAR(SYSDATE, 'HH PM')       -- 02 ����
     , TO_CHAR(SYSDATE, 'MI')          -- 19
     , TO_CHAR(SYSDATE, 'SS')          -- 08
     , TO_CHAR(SYSDATE, 'SSSSS')       -- 51548 �� ���� �귯�� ��ü ��(���� ���� ����)
     , TO_CHAR(SYSDATE, 'Q')           -- 1 �� �б�(QUARTER): 1,2,3��(1��б�)
FROM DUAL;


SELECT TO_CHAR(4), '4'
FROM DUAL;
--==>> 4	4 (�� �� '4'��� ���� Ÿ�� : ��������)


SELECT '04', TO_NUMBER('04')
FROM DUAL;
--==>> 04	4(���� Ÿ���̹Ƿ� �տ� 0�� Ż���� : ��������)


SELECT SYSDATE
FROM DUAL;
--==>> 2019-03-29 (��¥ Ÿ�� : ��������)


SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>> 2019 (���� ���� Ÿ�� : ��������)


--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY')     -- 2019 �� ������ �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'MM')       -- 03   �� ���� �����Ͽ� ���� Ÿ������
     , TO_CHAR(SYSDATE, 'DD')       -- 29   �� ���� �����Ͽ� ���� Ÿ������
     , EXTRACT(YEAR FROM SYSDATE)   -- 2019 �� ������ �����Ͽ� ���� Ÿ������...
     , EXTRACT(MONTH FROM SYSDATE)  -- 3    �� ���� �����Ͽ� ���� Ÿ������
     , EXTRACT(DAY FROM SYSDATE)    -- 29   �� ���� �����Ͽ� ���� Ÿ������
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�


--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000                             -- 60000
     , TO_CHAR(60000)                    -- 60000
     , TO_CHAR(60000, '999,999')         -- 60,000
     , TO_CHAR(60000, '$99,999')         -- $60,000
     , TO_CHAR(60000, 'L99,999')         --           \60,000   --> L : ������ ȭ�����ǥ��(���� ������ ȭ�� �ݿ���)
     , LTRIM(TO_CHAR(60000, 'L99,999'))  -- \60,000            
FROM DUAL;


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.

SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))
FROM DUAL;
--==>> 2019-03-29 14:47:19
--     2019-03-30 16:50:23

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
--   TO_YMINTERVAL(), TO_DSINTERVAL()

SELECT SYSDATE "����ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')"���� ���"
FROM DUAL;
--==>> 2019-03-29 14:50:34
--     2020-06-01 18:55:40




-----------------------------------------------------------------------------------------------------------


--�� CASE ���� (���ǹ�, �б⹮)
/*
CASE
WHEN 
THEN 
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�¸����' END "Ȯ��"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2�¸����' END "���Ȯ��"
FROM DUAL;
--==>> 5+2�¸����

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '����'
       END "��� Ȯ��"
FROM DUAL;
--==>> 1+1=2


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� ����') "��� Ȯ��"
FROM DUAL;
--==>> 5-2=3
--> Java �� ���� �����ڿ� �����


--�� CASE WHEN THEN ELSE END ���� Ȱ��
-- ���ǽ��� ���� ���� �� CASE �ڿ� ���ǽ� �� ��.
-- ù WHEN ���ǽ��� ������� TRUE�� �� ���� ���ǽ��� TRUE���� CASE���� �������´�.
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5��2�� �񱳺Ұ�'
       END "��� Ȯ��"
FROM DUAL;
--==>> 5>2 -- TRUE ����� ��ȯ


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��¸���'
            ELSE '��������'
       END "��� Ȯ��"
FROM DUAL;
--==>> ��������
/*
SELECT CASE WHEN T AND T THEN '��������'
            WHEN T THEN '��¸���'
            ELSE '��������'
       END "��� Ȯ��"
FROM DUAL;
*/


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
--==>> ���Ǹ���
/*
SELECT CASE WHEN F AND F => F OR T => T AND T => T THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
--==>> ���󸸼�
/*
SELECT CASE WHEN F AND (T) => F AND T => F THEN '���Ǹ���'
            WHEN F AND F => F THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
*/

SELECT *
FROM TBL_SAWON;

--�� ����
-- TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
-- , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

-- ��, ���� ���̴� �ѱ����� ������ ���� ������ �����Ѵ�.
-- ����, ������������ �ش� ������ ���̰� �ѱ� ���̷� 60���� �Ǵ� ��(�⵵)�� 
-- �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
-- �׸��� ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
-- �� ����� ���� �޿� ���� 30% ����, 
-- 2000�� �̻� �ٹ��� ����� 
-- �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�۳��� Ǯ���� ����
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�ξȵ�'
            END "����"  
     , EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1 "���糪��", HIREDATE "�Ի���"
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || TO_CHAR(HIREDATE, '-MM-DD') "����������"
     , TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"     
     , 
     --, 365*(TO_NUMBER(TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') 
     --  || SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') - EXTRACT(YEAR FROM SYSDATE))"�����ϼ�"
     --, TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || TO_CHAR(HIREDATE, '-MM-DD')  "�����ϼ�"
     --, SAL "�޿�", CASE WHEN EXTRACT(DAY FROM SYSDATE- DAY FROM HIREDATE)>=1000 AND CASE WHEN EXTRACT(DAY FROM SYSDATE- DAY FROM HIREDATE)<2000 THEN SAL*0.3 
     --                  WHEN EXTRACT(DAY FROM SYSDATE- DAY FROM HIREDATE)>=2000 THEN SAL*0.5 "���ʽ�"
FROM TBL_SAWON;

----------------------------------------------------------------------------------------------------------------------------------

--���Բ� Ǯ���� ����
-- TBL_SAWON ���̺� �����ϴ� �������
-- �Ի���(HIREDATE) �÷����� ��, �ϸ� ��ȸ�ϱ�

--���1.���� Ÿ���� ������ ��ȸ��
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM-DD')
FROM TBL_SAWON;
--==>>
/*
�̿���	2001-01-03	01-03
���ֿ�	2010-11-05	11-05
������	1999-08-16	08-16
��ȫ��	1997-11-05	11-05
�̺��	1998-02-02	02-02
������	1998-02-02	02-02
������	2010-07-15	07-15
������	2011-07-15	07-15
������	2011-07-15	07-15
���켱	1999-11-11	11-11
������	1999-11-11	11-11
������	2010-11-11	11-11
���ü�	1992-10-10	10-10
����	1987-10-10	10-10
���̰�	1997-10-10	10-10
*/

--���2. ���� Ÿ���� ������ ��ȸ��
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM')|| '-' || TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;
--==>> ���� ���� ���


-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
-- ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� 1 �Ǵ� 3 THEN '����'
            WHEN �ֹι�ȣ 7��°�ڸ� 1���� 2 �Ǵ� 4 THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')       -- 1900��� ��
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY') - (�ֹι�ȣ �� ���ڸ� + 1899)  -- �¾�ڸ��� 1�� �����ϱ� (1900-1)�� ����
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       -- 2000��� ��
           THEN EXTRACT(YEAR FROM SYSDATE) - (�ֹι�ȣ �� ���ڸ� + 1999)
           ELSE 0 -- THEN �� ������� ���� Ÿ���̱� ������ '����Ȯ�κҰ�'(����Ÿ��)�� ��������� ��ȯ�� �� ����
       END "���糪��"
FROM TBL_SAWON;
--==>>
/*
1001	�̿���	    8706241234567	    ����
1002	���ֿ�	    9405022234567	    ����
1003	������	    9710012234567	    ����
1004	��ȫ��	    9504102234567	    ����
1005	�̺��	    7210101234567	    ����
1006	������	    8004271234567	    ����
1007	������	    0405064234567	    ����
1008	������	    0506074234567	    ����
1009	������	    0505053234567	    ����
1010	���켱	    9505052234567	    ����
1011	������	7512122234567	    ����
*/


SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')       -- 1900��� ��
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY') - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)  
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       -- 2000��� ��
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2) + 1999)
           ELSE 0 -- THEN �� ������� ���� Ÿ���̱� ������ '����Ȯ�κҰ�'(����Ÿ��)�� ��������� ��ȯ�� �� ����
       END "���糪��"
FROM TBL_SAWON;

--> ����⵵ ���ϴ� ���� 1) TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')
--                       2) EXTRACT(YEAR FROM SYSDATE)
--  ����Ÿ���� ����⵵�� �����. �޸� ȿ���� �� ���� ���� ����, �� ��� ��� ���̴� ����.

