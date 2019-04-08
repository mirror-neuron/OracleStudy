SELECT USER
FROM DUAL;
--==>> HR

--○ EMPLOYEES 테이블 직원들 SALARY 를 10% 인상한다.
--   단, 부서명이 'IT' 인 경우로 한정한다.
--   (결과 확인 후 ROLLBACK)
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

SELECT EMPLOYEE_ID  "직원번호 ", FIRST_NAME "직원이름", SALARY "급여", SALARY * 1.1"10%인상된 급여", DEPARTMENT_ID "부서번호"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '60';  --> IT의 부서 ID

SELECT EMPLOYEE_ID  "직원번호 ", FIRST_NAME "직원이름", SALARY "급여", SALARY * 1.1"10%인상된 급여", DEPARTMENT_ID "부서번호"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (DEPARTMENTS 테이블에서 IT 부서의 부서ID);



SELECT EMPLOYEE_ID  "직원번호 ", FIRST_NAME "직원이름", SALARY "급여", SALARY * 1.1"10%인상된 급여", DEPARTMENT_ID "부서번호"
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
--==>> 5개 행 이(가) 업데이트되었습니다.

-- 확인
SELECT EMPLOYEE_ID  "직원번호 ", FIRST_NAME "직원이름", SALARY "급여", SALARY * 1.1"10%인상된 급여", DEPARTMENT_ID "부서번호"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID          
                       FROM DEPARTMENTS               
                       WHERE DEPARTMENT_NAME = 'IT');

ROLLBACK TABLE EMPLOYEES;
--==>> 롤백 완료.

SELECT EMPLOYEE_ID  "직원번호 ", FIRST_NAME "직원이름", SALARY "급여", SALARY * 1.1"10%인상된 급여", DEPARTMENT_ID "부서번호"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID          
                       FROM DEPARTMENTS               
                       WHERE DEPARTMENT_NAME = 'IT');

--○ EMPLOYEES 테이블에서 JOB_TITLE 이 『Sales Manager』인 사원들의
--   SALARY 를 해당 직무(직종)의 최고 급여(MAX_SALARY)로 수정한다.
--   단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한하여
--   적용할 수 있도록 처리한다.
--   (결과 확인 후 ROLL BACK)
SELECT *
FROM JOBS;
SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = (Sales Manager 의 MAX_SALARY)
WHERE JOB_ID = (Sales Manager 의 JOB_ID)
      TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
      
-- (Sales Manager 의 MAX_SALARY)
SELECT MAX_SALARY 
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080

-- (Sales Manager 의 JOB_ID)
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
--==>> 3개 행 이(가) 업데이트되었습니다.


-- 확인
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
--==>> 롤백 완료.


--○ EMPLOYEES 테이블에서 SALARY 를
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance → 10%
--   Eexecutive → 15%
--   Accounting → 20%
--   나머지 → 0%
--   (결과 확인 후 ROLLBACK)

--○ 함께 풀이한 내용
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'의 부서아이디)
                                THEN SALARY * 1.1
                                WHEN ('Executive'의 부서아이디)
                                THEN SALARY * 1.15
                                WHEN ('Accounting'의 부서아이디)
                                THEN SALARY * 1.2
                                ELSE SALARY
                            END;
-- ('Finance'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DPARTMENT_NAME = 'Finance'

-- ('Executive'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DPARTMENT_NAME = 'Executive' 

-- ('Accounting'의 부서아이디)
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
--==>> 107개 행 이(가) 업데이트되었습니다.

-----------------------------------------------------------------------------------
--○ 팀에서 풀이한 내용
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
--==>> 6개 행 이(가) 업데이트되었습니다.


SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID "부서번호", SALARY "급여"
    , DECODE(DEPARTMENT_ID
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance'), SALARY * 1.1
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive'), SALARY * 1.15
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting'), SALARY * 1.2)"인상된급여"
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

-- 방법 ①
UPDATE EMPLOYEES
SET SALARY = DECODE(DEPARTMENT_ID
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance'), SALARY * 1.1
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive'), SALARY * 1.15
                    , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting'), SALARY * 1.2)
WHERE  DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME IN ( 'Finance', 'Executive', 'Accounting'));
--==>> 11개 행 이(가) 업데이트되었습니다.


-- 방법 ②
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
--==>> --==>> 11개 행 이(가) 업데이트되었습니다.

ROLLBACK TABLE EMPLOYEES;
                   
                   
--■■■ DELETE ■■■--

-- 1. 테이블에서 지정된 행(레코드)을 삭제하는 데 사용하는 구문.

-- 2. 형식 및 구조
-- DELETE [FROM] 테이블명
-- [WHERE 조건절];

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	07/06/21	SH_CLERK	2600		124	50

DELETE 
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK TABLE EMPLOYEES;
--==>> 롤백 완료.
                       
                       
--○ EMPLOYEES 테이블에서 직원들의 정보를 삭제한다.
--   단, 부서명이 'IT' 인 경우로 한정한다.

--※ 실제로는 EMPLOYEES 테이블의 데이터가(삭제하고자 하는 대상)
--   다른 테이블(혹은 자기 자신 테이블)에 의해 참조당하는 경우
--   삭제되지 않을 수 있다는 사실을 염두해야 하며...
--   그에 대한 이유도 알아야 한다.
--   (부모-자식 관계의 테이블의 제약조건 위반, 다른 테이블에서 EMPLOYEES 의 사원번호를 참조하기 때문에)
SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ('IT'의 부서번호);

-- ('IT'의 부서번호)
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
--==>> 에러 발생
/*
오류 보고 -
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/



--■■■ 뷰(VIEW) ■■■--

-- 1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에 존재하는
--    하나 이상의 테이블에서 사용자가 얻기 원하는 데이터들만을 
--    정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만 모아서
--    만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.

--    가상의 테이블이란 뷰가 실제로 존재하는 테이블(객체)이 아니라
--    하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이며
--    그 정보를 추출해내는 SQL 문장이라고 볼 수 있다.

-- 2. 형식 및 구조
-- CREATE [OR REPLACE] VIEW 뷰이름
-- [(ALIAS[, ALIAS, ...])]
-- AS 
-- 서브쿼리(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY];


--○ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+) 
  AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES이(가) 생성되었습니다.

--○ 뷰 조회
SELECT *
FROM VIEW_EMPLOYEES;


--○ 뷰(VIEW) 구조 확인
DESC VIEW_EMPLOYEES;
--==>>
/*
View VIEW_EMPLOYEES이(가) 생성되었습니다.

이름              널?       유형           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/


--○ 뷰(VIEW) 소스 확인 -- CHECK~!!!
SELECT VIEW_NAME, TEXT "소스"           -- TEXT(소스가 있는 곳)
FROM USER_VIEWS                         -- USER_VIEWS
WHERE VIEW_NAME='VIEW_EMPLOYEES';
--==>> 어떤 뷰인지 확인할 수 있음
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+) 
  AND C.REGION_ID = R.REGION_ID(+)"
*/


