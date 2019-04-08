SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ UPDATE ■■■--

-- 1. 테이블에서 기존 데이터를 변경하는 구문.

-- 2. 형식 및 구조
-- UPDATE 테이블명
-- SET 컬럼명 = 변경할 값[, 컬럼명 = 변경할 값, 컬럼명 = 변결할 값]
-- [WHERE 조건절]

SELECT *
FROM TBL_SAWON;

--○ TBL_SAWON 테이블에서 사원번호 1003번 사원의
--   주민번호를 『8710012234567』로 수정한다.

UPDATE TBL_SAWON
SET JUBUN = '8710012234567'
WHERE SANO = 1003;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SAWON;

-- 업데이트 실행 후 COMMIT 또는 ROLLBACK 을 반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.


--○ TBL_SAWON 테이블에서 1005번 사원의 입사일과 급여를 
--   각각 2018-02-22, 1200 으로 변경한다.


UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2018-02-22', 'YYYY-MM-DD')
  , SAL = 1200         --> 중첩된 조건이 아니라, 각각 따로 실행되는 조건이어서 논리연산자가 아닌 (,)로 연결
WHERE SANO = 1005;
--==>> 1 행 이(가) 업데이트되었습니다.

-- 업데이트 실행 후 COMMIT 또는 ROLLBACK 을 반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.


--○ TBL_INSA 테이블 복사(데이터만)
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP이(가) 생성되었습니다.


--○ TBL_INSABACKUP 테이블에서
--   직위가 과장과 부장만 수당 10% 인상~!!
SELECT *
FROM TBL_INSABACKUP;

-- UPDATE 전에 실행할 조건 확인해보기(UPDATE 하면 되돌릴 수 없음)
SELECT NAME "사원명", JIKWI "직위", SUDANG "수당", SUDANG * 1.1"10%인상된 수당"
FROM TBL_INSABACKUP
WHERE JIKWI IN ('과장', '부장');
--==>>
/*
홍길동	부장	200000	220000
이순애	부장	160000	176000
이기자	과장	150000	165000
김종서	부장	130000	143000
이상헌	과장	150000	165000
박문수	과장	165000	181500
김인수	부장	170000	187000
김영길	과장	170000	187000
정정해	과장	124000	136400
지재환	부장	160000	176000
최석규	과장	187000	205700
문길수	과장	150000	165000
허경운	부장	150000	165000
권영미	과장	104000	114400
이미경	부장	160000	176000
*/

UPDATE TBL_INSABACKUP
SET SUDANG = SUDANG * 1.1
WHERE JIKWI IN ('과장', '부장');
--==>> 15개 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM TBL_INSABACKUP;

-- 업데이트 실행 후 COMMIT 또는 ROLLBACK 을 반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.


--○ TBL_INSABACKUP 테이블에서 전화번호가 016, 017, 018, 019 로 시작하는
--   전화번호인 경우 이를 모두 010 으로 변경한다.
SELECT *
FROM TBL_INSABACKUP;

SELECT TEL "기존전화번호", '010' || SUBSTR(TEL, 4)"변경된전화번호"
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');

UPDATE TBL_INSABACKUP
SET TEL = '010' || SUBSTR(TEL, 4)
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');
--==>> 24개 행 이(가) 업데이트되었습니다.

--확인 
SELECT * 
FROM TBL_INSABACKUP;

-- 업데이트 실행 후 COMMIT 또는 ROLLBACK(UPDATE 되돌리기) 을 반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.


--○ TBL_SAWON 테이블 백업 (2019-04-08 09:40:00)
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT * 
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP이(가) 생성되었습니다.
--> TBL_SAWON 테이블의 데이터들만 백업을 수행
--  즉, 다른 이름의 테이블 형태로 저장해 둔 상황.


--○ 확인
SELECT *
FROM TBL_SAWONBACKUP
ORDER BY 1;
SELECT *
FROM TBL_SAWON
ORDER BY 1;


-- 실수로 TBL_SAWON 테이블에서 사원이름 전체를 똘똘이로 수정하고 COMMIT 했을 경우,
-- 위와 같이 UPDATE 처리 이후에 COMMIT 을 수행하였기 때문에
-- ROLLBACK 은 불가능한 상황이다.
-- 하지만, TBL_SAWONBACKUP 테이블에 데이터를 백업해 두었다. 
-- SANAME 컬럼의 내용만 추출하여 똘똘이 대신 넣어줄 수 있다는 것이다.

UPDATE TBL_SAWON 
SET SANAME = TBL_SAWONBACKUP 테이블의 1003번 사원의 사원명;

UPDATE TBL_SAWON
SET SANAME = ( SELECT SANAME
               FROM TBL_SAWONBACKUP
               WHERE SANO = TBL_SAWON.SANO );
--==>> 16개 행 이(가) 업데이트되었습니다.

SELECT * 
FROM TBL_SAWON
ORDER BY 1;
--==>>
/*
1001	이원영	8706241234567	19/04/01	100
1002	나주영	9405022234567	10/11/05	2000
1003	진윤비	8710012234567	99/08/16	5000
1004	권홍비	9504102234567	97/11/05	4000
1005	이비승	7210101234567	18/02/22	1200
1006	조영우	8004271234567	98/02/02	2000
1007	이하이	0405064234567	10/07/15	1000
1008	소이현	0506074234567	11/07/15	1000
1009	선동열	0505053234567	11/07/15	3000
1010	선우선	9505052234567	99/11/11	4000
1011	선우용녀	7512122234567	99/11/11	5000
1012	남상현	9302131234567	10/11/11	3000
1013	남궁선	7202021234567	92/10/10	2000
1014	남이	6912121234567	87/10/10	4000
1015	이이경	8410141234567	97/10/10	5000
2000	김선아		19/04/01	5000
*/

COMMIT;
--==>> 커밋 완료.
