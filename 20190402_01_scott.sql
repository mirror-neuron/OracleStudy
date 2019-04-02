SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ HAVING ■■■--

--○ EMP 테이블에서 부서번호가 20, 30인 부서를 대상으로
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN(20, 30)
  AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> 에러 발생
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
13행, 7열에서 오류 발생
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN(20, 30) --> 일반 조건이므로 WHERE 조건절로 사용하는 것을 권장함
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

--■■■ 중첩 그룹함수 / 분석함수 ■■■--

-- 그룹 함수 2 LEVEL 까지 중첩해서 사용할 수 있다.
-- 이마저도 MSSQL 은 불가능하다.
SELECT MAX(SUM(SAL))  --> SUM() 을 MAX() 로 감쌌기 때문에 2LEVEL 까지 중첩한 상태
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

-- RANK()
-- DENSE_RANK()
--> ORACLE 9i 부터 적용... MSSQL 2005 부터 적용...

--※ 하위 버전에서는 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에
--   이를 대체하여 연산을 수행할 수 있는 방법을 강구해야 한다.

-- 예를 들어, 급여의 순위를 구하고자 한다면...
-- 해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후 
-- 확인한 숫자에 +1 을 추가 연산해주면 그것이 곧 등수가 된다.

SELECT ENAME, SAL
FROM EMP;

SELECT COUNT(*) + 1 
FROM EMP
WHERE SAL > 800;
--==>> 14 → SMITH 의 급여 등수

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;
--==>> 7 → ALLEN 의 급여 등수


--※ 서브 상관 쿼리 (상관 서브 쿼리)
--   메인 쿼리에 있는 테이블의 컬럼이
--   서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
--   우리는 이 쿼리문을 서브 상관 쿼리 라고 부른다.

SELECT ENAME "사원명",  SAL "급여", 1 "급여등수"
FROM EMP;

SELECT ENAME "사원명",  SAL "급여", (1) "급여등수"
FROM EMP;

SELECT ENAME "사원명",  SAL "급여"
     , (SELECT COUNT(*) + 1 
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "급여등수"
FROM EMP E1; 
--> E1, E2 : 각각의 EMP 테이블에 별칭 붙인 것
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

SELECT ENAME "사원명",  SAL "급여"
     , (SELECT COUNT(*) + 1 
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "급여등수"
FROM EMP E1
ORDER BY 3; --> 급여등수에 따라 정렬
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


--○ EMP 테이블을 대상으로
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
--   단, RANK() 함수를 사용하지 않고 상관 서브 쿼리를 활용할 수 있도록 한다.


SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호"
      , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.SAL > E1.SAL) "부서내급여등수"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL > E1.SAL) "전체급여등수"
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
--==>> Session이(가) 변경되었습니다.

--○ EMP 테이블을 대상으로 다음과 같이 조회할 수 있도록 한다.
/*
--------------------------------------------------------------------------------
    사원명       부서번호       입사일        급여      부서내입사별급여누적
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
--○ 내가 풀이한 내용
SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여"
     ,(SELECT MAX(SUM(E2.SAL))
       FROM EMP E2
       WHERE E2.DEPTNO = E1.DEPTNO
       GROUP BY E2.HIREDATE) "부서내입사별급여누적"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.HIREDATE;  
--> 전혀 잘못 짚고 있었음.. (입사일이 빠른 사원은 누적하지 않음. 아래 조건 참고)
---------------------------------------------------------------------------------------------

--○ 함께 풀이한 내용
SELECT ENAME, DEPTNO, HIREDATE, SAL
FROM EMP
ORDER BY DEPTNO, HIREDATE;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (1)"부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2)"부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO)"부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO)"부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
          AND E2.HIREDATE <= E1.HIREDATE)"부서내입사별급여누적"
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


--○ TBL_EMP 테이블 기반으로 입사한 사원의 수가 제일 많았을 때의
--   입사년월과 인원수를 조회할 수 있는 쿼리문을 구성한다.
/*
----------------------------------
    입사년월        인원수
----------------------------------
    2019-04           5
----------------------------------
*/


SELECT ENAME, HIREDATE
FROM TBL_EMP;


SELECT E1.ENAME "사원명"
     , (SELECT E2.HIREDATE
        FROM TBL_EMP E2
        WHERE E2.HIREDATE = E1.HIREDATE
        GROUP BY E2.HIREDATE) "입사년월"
     , (SELECT COUNT(E2.HIREDATE)
        FROM TBL_EMP E2
        WHERE MAX(E2.HIREDATE)) "인원수"
FROM TBL_EMP E1;
--ORDER BY 2;


SELECT *
FROM TBL_EMP 
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');



