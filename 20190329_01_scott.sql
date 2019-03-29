SELECT USER
FROM DUAL;
--==>> SCOTT

--○ ROUND() 반올림을 처리해주는 함수

SELECT 48.678 "①"
     , ROUND(48.678, 2) "②"        -- 소숫점 둘째 자리까지 유효하게 처리해라(셋째 자리에서 반올림)   
     , ROUND(48.674, 2) "③"        
     , ROUND(48.678, 1) "④"
     , ROUND(48.678, 0) "⑤"
     , ROUND(48.678) "⑥"           -- 두 번째 파라미터 값이 0일 경우 생략
     , ROUND(48.678, -1) "⑦"
     , ROUND(48.678, -2) "⑧"
     , ROUND(48.678, -3) "⑨"
FROM DUAL;
--==>> 48.678	48.68	48.67	48.7	49	49	50	0	0




--○ TRUNC() 절삭을 처리해주는 함수
SELECT 48.678 "①"
     , TRUNC(48.678, 2) "②"         -- 소숫점 이하 둘째 자리까지 표현
     , TRUNC(48.674, 2) "③"
     , TRUNC(48.678, 1) "④"
     , TRUNC(48.678, 0) "⑤"
     , TRUNC(48.678) "⑥"            -- 두 번째 파라미터 값이 0일 경우 생략
     , TRUNC(48.678, -1) "⑦"
     , TRUNC(48.678, -2) "⑧"
     , TRUNC(48.678, -3) "⑨"
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0


--○ MOD() 나머지를 반환하는 함수
SELECT MOD(5, 2)
FROM DUAL;
--==>> 1
--> 5를 2로 나눈 나머지 결과값 반환


--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5, 3)
FROM DUAL;
--==>> 125
--> 5의 3승을 결과값으로 반환

--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> 루트 2 에 대한 결과값 반환


--○ LOG() 로그 함수
--   (※ 오라클은 상용로그만 지원하는 반면, MSSQL은 상용로그, 자연로그 모두 지원한다.)
SELECT LOG(10, 100), LOG (10, 20)
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--○ 삼각 함수
--   싸인, 코싸인, 탄젠트 결과값을 반환한다.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233
0.5403023058681397174009366074429766037354
1.55740772465490223050697480745836017308
*/


--○ 삼각함수의 역함수 (범위 : -1 ~ 1)
--   어싸인, 어코싸인, 어탄젠트 결과값을 반환한다.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405
1.04719755119659774615421446109316762805
0.4636476090008061162142562314612144020295
*/


--○ SING()         서명, 부호, 특징
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1을 반환한다.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-7)
FROM DUAL;
--==>> 1	0	-1
--> 매출이나 수지와 관련하여 적자 및 흑자의 개념을 나타낼 때 주로 사용한다.
--  (오로지 3가지(양수, 0, 음수) 결과값만 반환한다.)


--○ ASCII(), CHR() → 서로 상응하는 개념의 함수
SELECT ASCII('A'), CHR(65)
FROM DUAL;
--==>> 65	A
--> ASCII()  : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
--  CHR()    : 매개변수로 넘겨받은 숫자를 아스키코드 값으로 취하는 문자를 반환한다.


------------------------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--※ 날짜 연산의 기본 단위는 DAY(일수)이다~!! CHECK~!!!
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE-29
FROM DUAL;
--==>>
-- 2019-03-29 09:28:54   -- 현재
-- 2019-03-30 09:28:54   -- 1일 후 
-- 2019-03-27 09:28:54   -- 2일 전
-- 2019-02-28 09:28:54   -- 29일 전


--○ 시간 단위 연산
SELECT SYSDATE, SYSDATE + 1/24, SYSDATE - 2/24
FROM DUAL;
--==>> 
-- 2019-03-29 09:30:58   -- 현재
-- 2019-03-29 10:30:58   -- 1시간 후
-- 2019-03-29 07:30:58   -- 2시간 전


--○ 현재 시간과... 현재 시간 기준 1일 2시간 3분 4초 후를 조회한다.
--   (실행 예)
/*
-----------------------------------------------------
    현재 시간             연산 후 시간
-----------------------------------------------------
2019-03-29 09:30:48      2019-03-30 11:33:52
-----------------------------------------------------
*/

-- 방법1.
SELECT SYSDATE "현재 시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "연산 후 시간"
FROM DUAL;
--==>>
/*
2019-03-29 09:40:53
2019-03-30 11:43:57
*/

-- 방법2.
SELECT SYSDATE "현재 시간"
     , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "연산 후 시간"
     --              1일         2시간       3분   4초 / 1일 전체 초
FROM DUAL;
--==>>
/*
2019-03-29 09:44:33
2019-03-30 11:47:37
*/


--○ 날짜 - 날짜 = 일수
-- ex) (2019-07-18) - (2019-03-29)
--        수료일         현재일
SELECT TO_DATE('2019-07-18', 'YYYY-MM-DD')-TO_DATE('2019-03-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> 111


--○ 데이터 타입의 변환
SELECT TO_DATE('2019-03-29', 'YYYY-MM-DD')     -- 날짜 형식으로 변환
FROM DUAL;
--==>> 2019-03-29

SELECT TO_DATE('2019-02-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> 에러 발생
/*
ORA-01839: date not valid for month specified
01839. 00000 -  "date not valid for month specified"
*Cause:    
*Action:
*/
--> 지정한 월의 날짜 부적합 에러

SELECT TO_DATE('2019-13-29', 'YYYY-MM-DD')
FROM DUAL;
--==>>
/*
ORA-00936: missing expression
00936. 00000 -  "missing expression"
*Cause:    
*Action:
185행, 8열에서 오류 발생
*/
--> 지정한 월에 대한 날짜 부적합 에러

--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 진행할 때
--   내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다~!!!


--○ ADD_MONTHS() 개월 수를 더해주는 함수
SELECT SYSDATE "1"
     , ADD_MONTHS(SYSDATE, 2) "2"
     , ADD_MONTHS(SYSDATE, 3) "3"
     , ADD_MONTHS(SYSDATE, -2) "4"
     , ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
--==>> 
/*
2019-03-29 10:05:18     -- 현재
2019-05-29 10:05:18     -- 2개월 후 
2019-06-29 10:05:18     -- 3개월 후 
2019-01-29 10:05:18     -- 2개월 전  
2018-12-29 10:05:18     -- 3개월 전
*/
--> 월을 더하고 빼기


--※ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ MONTHS_BETWEEN()
--  첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 201.949153225806451612903225806451612903(과거)

--> 개월 수의 차이를 반환하는 함수
--  ※ 결과값의 부호가 『-』로 반환되었을 경우에는
--     첫 번째 인자값에 해당하는 날짜보다
--     두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-07-18', 'YYYY-MM-DD'))
FROM DUAL;
--==>> -3.63145161290322580645161290322580645161(미래)


--○ NEXT_DAY()
-- 첫 번째 인자값을 기준 날짜로 돌아오는 가장 빠른 요일 반환
SELECT NEXT_DAY(SYSDATE, '토'), NEXT_DAY(SYSDATE, '월')
FROM DUAL;
--==>> 2019-03-30	2019-04-01


--※ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session이(가) 변경되었습니다.

--○ 세션 설정 변경한 이후 위의 쿼리문을 다시 한 번 조회
SELECT NEXT_DAY(SYSDATE, '토'), NEXT_DAY(SYSDATE, '월')
FROM DUAL;
--==>> 에러 발생
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>> 2019-03-30	2019-04-01


--○ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE='KOREAN';
--==>> Session이(가) 변경되었습니다.


--○ LAST_DAY()
-- 해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>> 2019-03-31

SELECT LAST_DAY(TO_DATE('2019-02-01', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 2019-02-28


--○ 오늘부로... 김정규 님이.. 군대에 또 끌려(?)간다.
--   복무 기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.
SELECT ADD_MONTHS(SYSDATE, 22) "전역 일자"
FROM DUAL;
--==>> 2021-01-29

-- 2. 하루 꼬박꼬박 3끼 식사를 해야 한다고 가정하면
--    정규가 몇 끼를 먹어야 집에 보내줄까.

-- 복무기간 * 3
-- --------
-- (전역일자 - 현재일자)

-- (전역일자 - 현재일자) * 3

SELECT (전역일자 - 현재일자) * 3
FROM DUAL;

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3 "전체 끼니 수"
FROM DUAL;
--==>> 2016
-- ※ 내가 풀이한 내용
-- SELECT (TO_DATE('2021-01-29', 'YYYY-MM-DD')-TO_DATE('2019-03-29', 'YYYY-MM-DD') )* 3"2. 전체 끼니 수" 
-- FROM DUAL;


--○ 현재 날짜 및 시각으로부터... 수료일(2019-07-18 18:00:00) 까지 
--   남은 기간을... 다음과 같은 형태로 조회할 수 있도록 한다.
--   (실행 예)
/*
--------------------------------------------------------------------------------------
현재 시각           | 수료일              |      일 |     시간 |       분 |      초 |
--------------------------------------------------------------------------------------
2019-03-29 10:33:27 | 2019-07-18 18:00:00 |     110 |        7 |      26  |      33 |
--------------------------------------------------------------------------------------
*/

--방법1. 『NLS_DATE_FORMAT』날짜 관련 세션 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--방법2. 『TO_CHAR』날짜 타입 변경 출력
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "현재 시각"
--==>> 2019-03-29 10:42:51
--> 단, 날짜 타입이 아닌 문자 타입으로 결과값 출력
SELECT SYSDATE
     , TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
     , TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE) "일"
     , TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 ) "시간"
     , TRUNC( (( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 
     - TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 )) * 60) "분"
     , TRUNC( ((( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 
     - TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 )) * 60 
     - TRUNC( (( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 
     - TRUNC( ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE 
     - TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)) * 24 )) * 60)) * 60) "초"
FROM DUAL;


-- 『1일 2시간 3분 4초』 를... 『초』로 환산하면..
SELECT (1일) + (2시간) + (3분) + (4초)
FROM DUAL;


SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

-- 『93784』초를 다시 일, 시간, 분, 초로 환산하면...

SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)"시간"
     , MOD(TRUNC(93784/60), 60)"분"
     , MOD(93784, 60)"초"
FROM DUAL;


-- 수료일까지 남은 기간 확인(날짜 기준) → 단위 : 일수
SELECT 수료일자 - 현재일자
FROM DUAL;


-- 수료일자
SELECT TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;


SELECT  TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 111.238194444444444444444444444444444444
--> 수료일까지 남은 일수


-- 수료일까지 남은 기간 확인(날짜 기준) → 단위 : 초
SELECT (수료일까지 남은 일수) * (하루를 구성하는 전체 초)
FROM DUAL

SELECT (수료일까지 남은 일수) * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 9610770.00000000000000000000000000000001

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"시간"
     , MOD(TRUNC((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60)"분"
     , TRUNC(MOD((TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60))"초"
FROM DUAL;
--==>> 111	5	27	57


--○ 문제
-- 본인이 태어나서 현재까지 얼마만큼의 일, 시간, 분, 초를 살았는지... (살고 있는지) 조회한다.
/*
--------------------------------------------------------------------------------------
현재 시각           | 태어난 시각         |      일 |     시간 |       분 |      초 |
--------------------------------------------------------------------------------------
2019-03-29 10:33:27 | 1990-04-16 18:00:00 |     XXX |       XX |       XX |      XX |
--------------------------------------------------------------------------------------
*/
--○ 날짜 세션 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 확인
SELECT SYSDATE
FROM DUAL;
--==>> 2019-03-29 12:40:10

--○ 태어난 이후 기간 확인(날짜 기준) → 단위 : 일수
SELECT 현재시각 - 태어난 시각
FROM DUAL;

SELECT SYSDATE - TO_DATE('1990-04-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 10573.7785532407407407407407407407407407

--○ 태어난 이후 기간 확인(날짜 기준) → 단위 : 초
SELECT (SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)
FROM DUAL;
--==>> 913639486.000000000000000000000000000003



SELECT SYSDATE "현재 시각"
     , TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS') "태어난 시각"
     , TRUNC(TRUNC(TRUNC((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)/60)/24)) "일"
     , MOD(TRUNC(TRUNC((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)/60)/60), 60) "시간"
     , MOD(TRUNC((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60)/60), 60) "분"
     , TRUNC(MOD((SYSDATE - TO_DATE('1990-04-16', 'YYYY-MM-DD HH24:MI:SS'))* (24*60*60), 60)) "초"
FROM DUAL;


--○ 날짜 형식 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--※ 날짜 데이터를 대상으로 반올림, 절삭을 수행할 수 있다.

--○ 날짜 반올림
SELECT SYSDATE "1"                  --  2019-03-29  → 기본 현재 날짜				
     , ROUND(SYSDATE, 'YEAR') "2"   --  2019-01-01  → 년도까지 유효한 데이터 (상반기, 하반기 기준) 
     , ROUND(SYSDATE, 'MONTH')"3"   --  2019-04-01  → 월까지 유효한 데이터 (15일 기준)
     , ROUND(SYSDATE, 'DD') "4"     --  2019-03-30  → 날짜까지 유효한 데이터 (정오 이전 이후 기준)
     , ROUND(SYSDATE, 'DAY') "5"    --  2019-03-31  → 날짜까지 유효한 데이터 (수요일에서 목요일로 넘어가는 자정 기준: 이전/전주 일요일, 이후/그주 일요일 )
FROM DUAL;


--○ 날짜 절삭
SELECT SYSDATE "1"                  --  2019-03-29  → 기본 현재 날짜				
     , TRUNC(SYSDATE, 'YEAR') "2"   --  2019-01-01  → 년도까지 유효한 데이터 
     , TRUNC(SYSDATE, 'MONTH')"3"   --  2019-03-01  → 월까지 유효한 데이터 
     , TRUNC(SYSDATE, 'DD') "4"     --  2019-03-29  → 날짜까지 유효한 데이터 
     , TRUNC(SYSDATE, 'DAY') "5"    --  2019-03-24  → 날짜까지 유효한 데이터 (모든 결과값은 전주 일요일로 고정)
FROM DUAL;


--------------------------------------------------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()    : 숫자나 날짜 데이터를 '문자 타입'으로 변환시켜주는 함수
-- TO_DATE()    : 문자 데이터(날짜 형식)를 '날짜 타입'으로 변환시켜주는 함수
-- TO_NUMBER()  : 문자 데이터(숫자 형식)를 '숫자 타입'으로 변환시켜주는 함수

--※ 날짜나 통화 형식이 맞지 않을 경우
--   세션 설정값을 통해 설정할 수 있도록 한다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.


ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.


ALTER SESSION SET NLS_CURRENCY = '\';    -- 원화
--==>> Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')  -- 2019-03-29
     , TO_CHAR(SYSDATE, 'YYYY')        -- 2019
     , TO_CHAR(SYSDATE, 'YEAR')        -- TWENTY NINETEEN (한국어에 2019에 대한 문자 타입 데이터가 없음)
     , TO_CHAR(SYSDATE, 'MM')          -- 03
     , TO_CHAR(SYSDATE, 'MONTH')       -- 3월 
     , TO_CHAR(SYSDATE, 'MON')         -- 3월 (MON : MONTH 의 줄임말)
     , TO_CHAR(SYSDATE, 'DD')          -- 29
     , TO_CHAR(SYSDATE, 'DAY')         -- 금요일
     , TO_CHAR(SYSDATE, 'DY')          -- 금
     , TO_CHAR(SYSDATE, 'HH24')        -- 14
     , TO_CHAR(SYSDATE, 'HH')          -- 02
     , TO_CHAR(SYSDATE, 'HH AM')       -- 02 오후 (현재 기준으로 오전 오후로 나눠서 봄)
     , TO_CHAR(SYSDATE, 'HH PM')       -- 02 오후
     , TO_CHAR(SYSDATE, 'MI')          -- 19
     , TO_CHAR(SYSDATE, 'SS')          -- 08
     , TO_CHAR(SYSDATE, 'SSSSS')       -- 51548 → 금일 흘러온 전체 초(어제 자정 기준)
     , TO_CHAR(SYSDATE, 'Q')           -- 1 → 분기(QUARTER): 1,2,3월(1사분기)
FROM DUAL;


SELECT TO_CHAR(4), '4'
FROM DUAL;
--==>> 4	4 (둘 다 '4'라는 문자 타입 : 좌측정렬)


SELECT '04', TO_NUMBER('04')
FROM DUAL;
--==>> 04	4(숫자 타입이므로 앞에 0이 탈락됨 : 우측정렬)


SELECT SYSDATE
FROM DUAL;
--==>> 2019-03-29 (날짜 타입 : 좌측정렬)


SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>> 2019 (최종 숫자 타입 : 우측정렬)


--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY')     -- 2019 → 연도를 추출하여 문자 타입으로...
     , TO_CHAR(SYSDATE, 'MM')       -- 03   → 월을 추출하여 문자 타입으로
     , TO_CHAR(SYSDATE, 'DD')       -- 29   → 일을 추출하여 문자 타입으로
     , EXTRACT(YEAR FROM SYSDATE)   -- 2019 → 연도를 추출하여 숫자 타입으로...
     , EXTRACT(MONTH FROM SYSDATE)  -- 3    → 월을 추출하여 숫자 타입으로
     , EXTRACT(DAY FROM SYSDATE)    -- 29   → 일을 추출하여 숫자 타입으로
FROM DUAL;
--> 년, 월, 일 이하 다른 것은 불가


--○ TO_CHAR() 활용 → 형식 맞춤 표기 결과값 반환
SELECT 60000                             -- 60000
     , TO_CHAR(60000)                    -- 60000
     , TO_CHAR(60000, '999,999')         -- 60,000
     , TO_CHAR(60000, '$99,999')         -- $60,000
     , TO_CHAR(60000, 'L99,999')         --           \60,000   --> L : 국가별 화폐단위표시(현재 설정된 화폐가 반영됨)
     , LTRIM(TO_CHAR(60000, 'L99,999'))  -- \60,000            
FROM DUAL;


--○ 날짜 세션 설정 정보 변경
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.

SELECT SYSDATE "현재시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))
FROM DUAL;
--==>> 2019-03-29 14:47:19
--     2019-03-30 16:50:23

--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
--   TO_YMINTERVAL(), TO_DSINTERVAL()

SELECT SYSDATE "현재시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')"연산 결과"
FROM DUAL;
--==>> 2019-03-29 14:50:34
--     2020-06-01 18:55:40




-----------------------------------------------------------------------------------------------------------


--○ CASE 구문 (조건문, 분기문)
/*
CASE
WHEN 
THEN 
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는몰라요' END "확인"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2는몰라요' END "결과확인"
FROM DUAL;
--==>> 5+2는몰라요

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '몰라'
       END "결과 확인"
FROM DUAL;
--==>> 1+1=2


--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2는 몰라') "결과 확인"
FROM DUAL;
--==>> 5-2=3
--> Java 의 삼항 연산자와 비슷함


--○ CASE WHEN THEN ELSE END 구문 활용
-- 조건식이 여러 개일 때 CASE 뒤에 조건식 안 씀.
-- 첫 WHEN 조건식의 결과값이 TRUE일 때 다음 조건식이 TRUE여도 CASE문을 빠져나온다.
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5와2는 비교불가'
       END "결과 확인"
FROM DUAL;
--==>> 5>2 -- TRUE 결과값 반환


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '지혜만세'
            WHEN 5>2 OR 2=3 THEN '기승만세'
            ELSE '희진만세'
       END "결과 확인"
FROM DUAL;
--==>> 지혜만세
/*
SELECT CASE WHEN T AND T THEN '지혜만세'
            WHEN T THEN '기승만세'
            ELSE '희진만세'
       END "결과 확인"
FROM DUAL;
*/


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
--==>> 훈의만세
/*
SELECT CASE WHEN F AND F => F OR T => T AND T => T THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
--==>> 보라만세
/*
SELECT CASE WHEN F AND (T) => F AND T => F THEN '훈의만세'
            WHEN F AND F => F THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
*/

SELECT *
FROM TBL_SAWON;

--○ 문제
-- TBL_SAWON 테이블을 활용하여 다음과 같은 항목들을 조회한다.
-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
-- , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스

-- 단, 현재 나이는 한국나이 계산법에 따라 연산을 수행한다.
-- 또한, 정년퇴직일은 해당 직원의 나이가 한국 나이로 60세가 되는 해(년도)의 
-- 그 직원의 입사 월, 일로 연산을 수행한다.
-- 그리고 보너스는 1000일 이상 2000일 미만 근무한 사원은
-- 그 사원의 원래 급여 기준 30% 지급, 
-- 2000일 이상 근무한 사원은 
-- 그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--○내가 풀이한 내용
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
            ELSE '성별확인안됨'
            END "성별"  
     , EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2)) +1 "현재나이", HIREDATE "입사일"
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || TO_CHAR(HIREDATE, '-MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE) "근무일수"     
     , 
     --, 365*(TO_NUMBER(TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') 
     --  || SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') - EXTRACT(YEAR FROM SYSDATE))"남은일수"
     --, TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1', '19','2','19','20') || SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || TO_CHAR(HIREDATE, '-MM-DD')  "남은일수"
     --, SAL "급여", CASE WHEN EXTRACT(DAY FROM SYSDATE- DAY FROM HIREDATE)>=1000 AND CASE WHEN EXTRACT(DAY FROM SYSDATE- DAY FROM HIREDATE)<2000 THEN SAL*0.3 
     --                  WHEN EXTRACT(DAY FROM SYSDATE- DAY FROM HIREDATE)>=2000 THEN SAL*0.5 "보너스"
FROM TBL_SAWON;

----------------------------------------------------------------------------------------------------------------------------------

--○함께 풀이한 내용
-- TBL_SAWON 테이블에 존재하는 사원들의
-- 입사일(HIREDATE) 컬럼에서 월, 일만 조회하기

--방법1.문자 타입의 데이터 조회됨
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM-DD')
FROM TBL_SAWON;
--==>>
/*
이원영	2001-01-03	01-03
나주영	2010-11-05	11-05
진윤비	1999-08-16	08-16
권홍비	1997-11-05	11-05
이비승	1998-02-02	02-02
조영우	1998-02-02	02-02
이하이	2010-07-15	07-15
소이현	2011-07-15	07-15
선동열	2011-07-15	07-15
선우선	1999-11-11	11-11
선우용녀	1999-11-11	11-11
남상현	2010-11-11	11-11
남궁선	1992-10-10	10-10
남이	1987-10-10	10-10
이이경	1997-10-10	10-10
*/

--방법2. 문자 타입의 데이터 조회됨
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM')|| '-' || TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;
--==>> 위와 같은 결과


-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
-- 정년퇴직일, 근무일수, 남은일수, 급여, 보너스

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN 주민번호 7번째자리 1개가 1 또는 3 THEN '남자'
            WHEN 주민번호 7번째자리 1개가 2 또는 4 THEN '여자'
            ELSE '성별확인불가'
       END "성별"
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
            ELSE '성별확인불가'
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 생 / 2000년대 생)
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')       -- 1900년대 생
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY') - (주민번호 앞 두자리 + 1899)  -- 태어나자마자 1살 먹으니까 (1900-1)을 더함
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       -- 2000년대 생
           THEN EXTRACT(YEAR FROM SYSDATE) - (주민번호 앞 두자리 + 1999)
           ELSE 0 -- THEN 의 결과값이 숫자 타입이기 때문에 '나이확인불가'(문자타입)을 결과값으로 반환할 수 없음
       END "현재나이"
FROM TBL_SAWON;
--==>>
/*
1001	이원영	    8706241234567	    남자
1002	나주영	    9405022234567	    여자
1003	진윤비	    9710012234567	    여자
1004	권홍비	    9504102234567	    여자
1005	이비승	    7210101234567	    남자
1006	조영우	    8004271234567	    남자
1007	이하이	    0405064234567	    여자
1008	소이현	    0506074234567	    여자
1009	선동열	    0505053234567	    남자
1010	선우선	    9505052234567	    여자
1011	선우용녀	7512122234567	    여자
*/


SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
            ELSE '성별확인불가'
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 생 / 2000년대 생)
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')       -- 1900년대 생
           THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY') - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)  
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')       -- 2000년대 생
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2) + 1999)
           ELSE 0 -- THEN 의 결과값이 숫자 타입이기 때문에 '나이확인불가'(문자타입)을 결과값으로 반환할 수 없음
       END "현재나이"
FROM TBL_SAWON;

--> 현재년도 구하는 공식 1) TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')
--                       2) EXTRACT(YEAR FROM SYSDATE)
--  숫자타입의 현재년도가 결과값. 메모리 효율이 더 좋은 것은 없고, 두 방식 모두 차이는 없다.

