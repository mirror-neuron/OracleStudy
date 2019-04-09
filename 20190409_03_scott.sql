SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 생성한 함수(FN_GENDER())가 제대로 작동하는지의 여부 확인
SELECT NAME, SSN, FN_GENDER(SSN) "함수호출결과"
FROM TBL_INSA;
--==>>
/*
홍길동	771212-1022432	남자
이순신	801007-1544236	남자
이순애	770922-2312547	여자
김정훈	790304-1788896	남자
한석봉	811112-1566789	남자
이기자	780505-2978541	여자
장인철	780506-1625148	남자
김영년	821011-2362514	여자
나윤균	810810-1552147	남자
김종서	751010-1122233	남자
유관순	801010-2987897	여자
정한국	760909-1333333	남자
조미숙	790102-2777777	여자
황진이	810707-2574812	여자
이현숙	800606-2954687	여자
이상헌	781010-1666678	남자
엄용수	820507-1452365	남자
이성길	801028-1849534	남자
박문수	780710-1985632	남자
유영희	800304-2741258	여자
홍길남	801010-1111111	남자
이영숙	800501-2312456	여자
김인수	731211-1214576	남자
김말자	830225-2633334	여자
우재옥	801103-1654442	남자
김숙남	810907-2015457	여자
김영길	801216-1898752	남자
이남신	810101-1010101	남자
김말숙	800301-2020202	여자
정정해	790210-2101010	여자
지재환	771115-1687988	남자
심심해	810206-2222222	여자
김미나	780505-2999999	여자
이정석	820505-1325468	남자
정영희	831010-2153252	여자
이재영	701126-2852147	여자
최석규	770129-1456987	남자
손인수	791009-2321456	여자
고순정	800504-2000032	여자
박세열	790509-1635214	남자
문길수	721217-1951357	남자
채정희	810709-2000054	여자
양미옥	830504-2471523	여자
지수환	820305-1475286	남자
홍원신	690906-1985214	남자
허경운	760105-1458752	남자
산마루	780505-1234567	남자
이기상	790604-1415141	남자
이미성	830908-2456548	여자
이미인	810403-2828287	여자
권영미	790303-2155554	여자
권옥경	820406-2000456	여자
김싱식	800715-1313131	남자
정상호	810705-1212141	남자
정한나	820506-2425153	여자
전용재	800605-1456987	남자
이미경	780406-2003214	여자
*/

--○ 생성한 함수(FN_GENDER())가 제대로 작동하는지의 여부 재확인
SELECT FN_GENDER('900416-2222222') "함수호출결과"
FROM DUAL;
--==>> 여자

SET SERVEROUTPUT ON;

--○ 생성한 함수(FN_POW())가 제대로 작동하는지의 여부 확인
SELECT FN_POW(10, 3) "함수호출결과"
FROM DUAL;
--==>> 1000

SELECT FN_POW(2, 24) "함수호출결과"
FROM DUAL;
--==>> 16777216

SELECT FN_POW(2, 8) "함수호출결과"
FROM DUAL;
--==>> 256

SELECT FN_POW(3, 3) "함수호출결과"
FROM DUAL;
--==>> 27


--○ 생성한 함수(FN_PAY())가 제대로 작동하는지의 여부 확인
SELECT FN_PAY(800, 300) "함수호출결과"
FROM DUAL;
--==>> ￦9,900

--○ 생성한 함수(FN_PAY())가 제대로 작동하는지의 여부 확인
SELECT FN_WORKYEAR(IBSADATE) "함수호출결과"
FROM TBL_INSA;