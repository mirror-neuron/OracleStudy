SELECT USER
FROM DUAL;
--==>> HR

--�� EMPLOYEES ���̺� ������ SALARY �� 10% �λ��Ѵ�.
--   ��, �μ����� 'IT' �� ���� �����Ѵ�.
--   (��� Ȯ�� �� ROLLBACK)
SELECT *
FROM DEPARTMENTS;
--==>>
/*
10	Administration	    200	1700
20	Marketing	        201	1800
30	Purchasing	        114	1700
40	Human Resources	    203	2400
50	Shipping	        121	1500
60	IT	                103	1400 ----------------
70	Public Relations	204	2700
80	Sales	            145	2500
90	Executive	        100	1700
100	Finance	            108	1700
110	Accounting	        205	1700
120	Treasury		        1700
130	Corporate Tax		    1700
140	Control And Credit		1700
150	Shareholder Services	1700
160	Benefits		        1700
170	Manufacturing		    1700
180	Construction		    1700
190	Contracting		        1700
200	Operations		        1700
210	IT Support		        1700
220	NOC		                1700
230	IT Helpdesk		        1700
240	Government Sales		1700
250	Retail Sales		    1700
260	Recruiting		        1700
270	Payroll		            1700
*/


SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES;
--==>> 
/*
FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Steven               King                           24000            90
Neena                Kochhar                        17000            90
Lex                  De Haan                        17000            90
Alexander            Hunold                          9000            60
Bruce                Ernst                           6000            60
David                Austin                          4800            60
Valli                Pataballa                       4800            60
Diana                Lorentz                         4200            60
Nancy                Greenberg                      12008           100
Daniel               Faviet                          9000           100
John                 Chen                            8200           100

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Ismael               Sciarra                         7700           100
Jose Manuel          Urman                           7800           100
Luis                 Popp                            6900           100
Den                  Raphaely                       11000            30
Alexander            Khoo                            3100            30
Shelli               Baida                           2900            30
Sigal                Tobias                          2800            30
Guy                  Himuro                          2600            30
Karen                Colmenares                      2500            30
Matthew              Weiss                           8000            50
Adam                 Fripp                           8200            50

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Payam                Kaufling                        7900            50
Shanta               Vollman                         6500            50
Kevin                Mourgos                         5800            50
Julia                Nayer                           3200            50
Irene                Mikkilineni                     2700            50
James                Landry                          2400            50
Steven               Markle                          2200            50
Laura                Bissot                          3300            50
Mozhe                Atkinson                        2800            50
James                Marlow                          2500            50
TJ                   Olson                           2100            50

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Jason                Mallin                          3300            50
Michael              Rogers                          2900            50
Ki                   Gee                             2400            50
Hazel                Philtanker                      2200            50
Renske               Ladwig                          3600            50
Stephen              Stiles                          3200            50
John                 Seo                             2700            50
Joshua               Patel                           2500            50
Trenna               Rajs                            3500            50
Curtis               Davies                          3100            50
Randall              Matos                           2600            50

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Peter                Vargas                          2500            50
John                 Russell                        14000            80
Karen                Partners                       13500            80
Alberto              Errazuriz                      12000            80
Gerald               Cambrault                      11000            80
Eleni                Zlotkey                        10500            80
Peter                Tucker                         10000            80
David                Bernstein                       9500            80
Peter                Hall                            9000            80
Christopher          Olsen                           8000            80
Nanette              Cambrault                       7500            80

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Oliver               Tuvault                         7000            80
Janette              King                           10000            80
Patrick              Sully                           9500            80
Allan                McEwen                          9000            80
Lindsey              Smith                           8000            80
Louise               Doran                           7500            80
Sarath               Sewall                          7000            80
Clara                Vishney                        10500            80
Danielle             Greene                          9500            80
Mattea               Marvins                         7200            80
David                Lee                             6800            80

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Sundar               Ande                            6400            80
Amit                 Banda                           6200            80
Lisa                 Ozer                           11500            80
Harrison             Bloom                          10000            80
Tayler               Fox                             9600            80
William              Smith                           7400            80
Elizabeth            Bates                           7300            80
Sundita              Kumar                           6100            80
Ellen                Abel                           11000            80
Alyssa               Hutton                          8800            80
Jonathon             Taylor                          8600            80

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Jack                 Livingston                      8400            80
Kimberely            Grant                           7000              
Charles              Johnson                         6200            80
Winston              Taylor                          3200            50
Jean                 Fleaur                          3100            50
Martha               Sullivan                        2500            50
Girard               Geoni                           2800            50
Nandita              Sarchand                        4200            50
Alexis               Bull                            4100            50
Julia                Dellinger                       3400            50
Anthony              Cabrio                          3000            50

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Kelly                Chung                           3800            50
Jennifer             Dilly                           3600            50
Timothy              Gates                           2900            50
Randall              Perkins                         2500            50
Sarah                Bell                            4000            50
Britney              Everett                         3900            50
Samuel               McCain                          3200            50
Vance                Jones                           2800            50
Alana                Walsh                           3100            50
Kevin                Feeney                          3000            50
Donald               OConnell                        2600            50

FIRST_NAME           LAST_NAME                     SALARY DEPARTMENT_ID
-------------------- ------------------------- ---------- -------------
Douglas              Grant                           2600            50
Jennifer             Whalen                          4400            10
Michael              Hartstein                      13000            20
Pat                  Fay                             6000            20
Susan                Mavris                          6500            40
Hermann              Baer                           10000            70
Shelley              Higgins                        12008           110
William              Gietz                           8300           110
*/

SELECT EMPLOYEE_ID  "������ȣ ", FIRST_NAME "�����̸�", SALARY "�޿�", SALARY * 1.1"10%�λ�� �޿�", DEPARTMENT_ID "�μ���ȣ"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '60';  --> IT�� �μ� ID

SELECT EMPLOYEE_ID  "������ȣ ", FIRST_NAME "�����̸�", SALARY "�޿�", SALARY * 1.1"10%�λ�� �޿�", DEPARTMENT_ID "�μ���ȣ"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (DEPARTMENTS ���̺��� IT �μ��� �μ�ID);



SELECT EMPLOYEE_ID  "������ȣ ", FIRST_NAME "�����̸�", SALARY "�޿�", SALARY * 1.1"10%�λ�� �޿�", DEPARTMENT_ID "�μ���ȣ"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID           -- (3)
                       FROM DEPARTMENTS               -- (1)
                       WHERE DEPARTMENT_NAME = 'IT'); -- (2)
--==>>
/*
103	Alexander	9000	9900	60
104	Bruce	    6000	6600	60
105	David	    4800	5280	60
106	Valli	    4800	5280	60
107	Diana	    4200	4620	60
*/


-- UPDATE
UPDATE EMPLOYEES 
SET SALARY= SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS 
                       WHERE DEPARTMENT_NAME = 'IT');
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT EMPLOYEE_ID  "������ȣ ", FIRST_NAME "�����̸�", SALARY "�޿�", SALARY * 1.1"10%�λ�� �޿�", DEPARTMENT_ID "�μ���ȣ"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID          
                       FROM DEPARTMENTS               
                       WHERE DEPARTMENT_NAME = 'IT');

ROLLBACK TABLE EMPLOYEES;
--==>> �ѹ� �Ϸ�.

SELECT EMPLOYEE_ID  "������ȣ ", FIRST_NAME "�����̸�", SALARY "�޿�", SALARY * 1.1"10%�λ�� �޿�", DEPARTMENT_ID "�μ���ȣ"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID          
                       FROM DEPARTMENTS               
                       WHERE DEPARTMENT_NAME = 'IT');

--�� EMPLOYEES ���̺��� JOB_TITLE �� ��Sales Manager���� �������
--   SALARY �� �ش� ����(����)�� �ְ� �޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���Ͽ�
--   ������ �� �ֵ��� ó���Ѵ�.
--   (��� Ȯ�� �� ROLL BACK)
SELECT *
FROM JOBS;
SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = (Sales Manager �� MAX_SALARY)
WHERE JOB_ID = (Sales Manager �� JOB_ID)
      TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
      
-- (Sales Manager �� MAX_SALARY)
SELECT MAX_SALARY 
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080

-- (Sales Manager �� JOB_ID)
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> SA_MAN

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY 
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
  AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


-- Ȯ��
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
  AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
--==>>
/*
John	20080
Karen	20080
Alberto	20080
*/

ROLLBACK TABLE EMPLOYEES;
--==>> �ѹ� �Ϸ�.


--�� EMPLOYEES ���̺��� SALARY ��
--   �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance �� 10%
--   Eexecutive �� 15%
--   Accounting �� 20%
--   ������ �� 0%
--   (��� Ȯ�� �� ROLLBACK)

--�� �Բ� Ǯ���� ����
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'�� �μ����̵�)
                                THEN SALARY * 1.1
                                WHEN ('Executive'�� �μ����̵�)
                                THEN SALARY * 1.15
                                WHEN ('Accounting'�� �μ����̵�)
                                THEN SALARY * 1.2
                                ELSE SALARY
                            END;
-- ('Finance'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DPARTMENT_NAME = 'Finance'

-- ('Executive'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DPARTMENT_NAME = 'Executive' 

-- ('Accounting'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DPARTMENT_NAME = 'Accounting' 

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Executive')
                                THEN SALARY * 1.15
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting')
                                THEN SALARY * 1.2
                                ELSE SALARY
             END;
--==>> 107�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-----------------------------------------------------------------------------------
--�� ������ Ǯ���� ����
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

SELECT FIRST_NAME, SALARY 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'Finance');
                       
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME ='Finance');
--==>> 6�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID "�μ���ȣ", SALARY "�޿�"
    , DECODE(DEPARTMENT_ID
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance'), SALARY * 1.1
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive'), SALARY * 1.15
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting'), SALARY * 1.2)"�λ�ȱ޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME IN ( 'Finance', 'Executive', 'Accounting'));
 --==>>
/*
90	24000	27600
90	17000	19550
90	17000	19550
100	12008	13208.8
100	9000	9900
100	8200	9020
100	7700	8470
100	7800	8580
100	6900	7590
110	12008	14409.6
110	8300	9960
*/

-- ��� ��
UPDATE EMPLOYEES
SET SALARY = DECODE(DEPARTMENT_ID
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance'), SALARY * 1.1
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive'), SALARY * 1.15
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting'), SALARY * 1.2)
WHERE  DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME IN ( 'Finance', 'Executive', 'Accounting'));
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


-- ��� ��
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Executive')
                                THEN SALARY * 1.15
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting')
                                THEN SALARY * 1.2
                                ELSE SALARY
             END  
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME IN ( 'Finance', 'Executive', 'Accounting'));
--==>> --==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK TABLE EMPLOYEES;
                   
                   
--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴ� �� ����ϴ� ����.

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	07/06/21	SH_CLERK	2600		124	50

DELETE 
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK TABLE EMPLOYEES;
--==>> �ѹ� �Ϸ�.
                       
                       
--�� EMPLOYEES ���̺��� �������� ������ �����Ѵ�.
--   ��, �μ����� 'IT' �� ���� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ���)
--   �ٸ� ���̺�(Ȥ�� �ڱ� �ڽ� ���̺�)�� ���� �������ϴ� ���
--   �������� ���� �� �ִٴ� ����� �����ؾ� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.
--   (�θ�-�ڽ� ������ ���̺��� �������� ����, �ٸ� ���̺��� EMPLOYEES �� �����ȣ�� �����ϱ� ������)
SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ('IT'�� �μ���ȣ);

-- ('IT'�� �μ���ȣ)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS 
WHERE DEPARTMENT_NAME = 'IT';

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS 
                       WHERE DEPARTMENT_NAME = 'IT');

DELETE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS 
                       WHERE DEPARTMENT_NAME = 'IT');
--==>> ���� �߻�
/*
���� ���� -
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/



--���� ��(VIEW) ����--

-- 1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
--    �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͵鸸�� 
--    ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ���ϴ� �÷��鸸 ��Ƽ�
--    �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

--    ������ ���̺��̶� �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--    �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̸�
--    �� ������ �����س��� SQL �����̶�� �� �� �ִ�.

-- 2. ���� �� ����
-- CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS 
-- ��������(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY];


--�� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+) 
  AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.

--�� �� ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;


--�� ��(VIEW) ���� Ȯ��
DESC VIEW_EMPLOYEES;
--==>>
/*
View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.

�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/


--�� ��(VIEW) �ҽ� Ȯ�� -- CHECK~!!!
SELECT VIEW_NAME, TEXT "�ҽ�"           -- TEXT(�ҽ��� �ִ� ��)
FROM USER_VIEWS                         -- USER_VIEWS
WHERE VIEW_NAME='VIEW_EMPLOYEES';
--==>> � ������ Ȯ���� �� ����
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+) 
  AND C.REGION_ID = R.REGION_ID(+)"
*/


