--�� �ٽ� ���̺� ���� (SCOTT.TBL_INSA)
CREATE TABLE TBL_INSA
( NUM      NUMBER(5)    NOT NULL
, NAME     VARCHAR2(20) NOT NULL
, SSN      VARCHAR2(14) NOT NULL
, IBSADATE DATE         NOT NULL
, CITY     VARCHAR2(10)
, TEL      VARCHAR2(15)
, BUSEO    VARCHAR2(15) NOT NULL
, JIKWI    VARCHAR2(15) NOT NULL
, BASICPAY NUMBER(10)   NOT NULL
, SUDANG   NUMBER(10)   NOT NULL
, CONSTRAINT TBL_INSA_NUM_PK PRIMARY KEY(NUM)
);
--==>Table TBL_INSA��(��) �����Ǿ����ϴ�.


--�� ���� �⺻�� ����
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD';


--�� ������ �Է�
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1001, 'ȫ�浿', '771212-1022432', '1998-10-11', '����', '011-2356-4528', '��ȹ��', '����', 2610000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1002, '�̼���', '801007-1544236', '2000-11-29', '���', '010-4758-6532', '�ѹ���', '���', 1320000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1003, '�̼���', '770922-2312547', '1999-02-25', '��õ', '010-4231-1236', '���ߺ�', '����', 2550000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1004, '������', '790304-1788896', '2000-10-01', '����', '019-5236-4221', '������', '�븮', 1954200, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1005, '�Ѽ���', '811112-1566789', '2004-08-13', '����', '018-5211-3542', '�ѹ���', '���', 1420000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1006, '�̱���', '780505-2978541', '2002-02-11', '��õ', '010-3214-5357', '���ߺ�', '����', 2265000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1007, '����ö', '780506-1625148', '1998-03-16', '����', '011-2345-2525', '���ߺ�', '�븮', 1250000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1008, '�迵��', '821011-2362514', '2002-04-30', '����', '016-2222-4444', 'ȫ����', '���', 950000 , 145000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1009, '������', '810810-1552147', '2003-10-10', '���', '019-1111-2222', '�λ��', '���', 840000 , 220400);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1010, '������', '751010-1122233', '1997-08-08', '�λ�', '011-3214-5555', '������', '����', 2540000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1011, '������', '801010-2987897', '2000-07-07', '����', '010-8888-4422', '������', '���', 1020000, 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1012, '���ѱ�', '760909-1333333', '1999-10-16', '����', '018-2222-4242', 'ȫ����', '���', 880000 , 114000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1013, '���̼�', '790102-2777777', '1998-06-07', '���', '019-6666-4444', 'ȫ����', '�븮', 1601000, 103000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1014, 'Ȳ����', '810707-2574812', '2002-02-15', '��õ', '010-3214-5467', '���ߺ�', '���', 1100000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1015, '������', '800606-2954687', '1999-07-26', '���', '016-2548-3365', '�ѹ���', '���', 1050000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1016, '�̻���', '781010-1666678', '2001-11-29', '���', '010-4526-1234', '���ߺ�', '����', 2350000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1017, '�����', '820507-1452365', '2000-08-28', '��õ', '010-3254-2542', '���ߺ�', '���', 950000 , 210000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1018, '�̼���', '801028-1849534', '2004-08-08', '����', '018-1333-3333', '���ߺ�', '���', 880000 , 123000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1019, '�ڹ���', '780710-1985632', '1999-12-10', '����', '017-4747-4848', '�λ��', '����', 2300000, 165000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1020, '������', '800304-2741258', '2003-10-10', '����', '011-9595-8585', '�����', '���', 880000 , 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1021, 'ȫ�泲', '801010-1111111', '2001-09-07', '���', '011-9999-7575', '���ߺ�', '���', 875000 , 120000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1022, '�̿���', '800501-2312456', '2003-02-25', '����', '017-5214-5282', '��ȹ��', '�븮', 1960000, 180000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1023, '���μ�', '731211-1214576', '1995-02-23', '����', NULL           , '������', '����', 2500000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1024, '�踻��', '830225-2633334', '1999-08-28', '����', '011-5248-7789', '��ȹ��', '�븮', 1900000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1025, '�����', '801103-1654442', '2000-10-01', '����', '010-4563-2587', '������', '���', 1100000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1026, '�����', '810907-2015457', '2002-08-28', '���', '010-2112-5225', '������', '���', 1050000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1027, '�迵��', '801216-1898752', '2000-10-18', '����', '019-8523-1478', '�ѹ���', '����', 2340000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1028, '�̳���', '810101-1010101', '2001-09-07', '����', '016-1818-4848', '�λ��', '���', 892000 , 110000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1029, '�踻��', '800301-2020202', '2000-09-08', '����', '016-3535-3636', '�ѹ���', '���', 920000 , 124000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1030, '������', '790210-2101010', '1999-10-17', '�λ�', '019-6564-6752', '�ѹ���', '����', 2304000, 124000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1031, '����ȯ', '771115-1687988', '2001-01-21', '����', '019-5552-7511', '��ȹ��', '����', 2450000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1032, '�ɽ���', '810206-2222222', '2000-05-05', '����', '016-8888-7474', '�����', '���', 880000 , 108000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1033, '��̳�', '780505-2999999', '1998-06-07', '����', '011-2444-4444', '������', '���', 1020000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1034, '������', '820505-1325468', '2005-09-26', '���', '011-3697-7412', '��ȹ��', '���', 1100000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1035, '������', '831010-2153252', '2002-05-16', '��õ', NULL           , '���ߺ�', '���', 1050000, 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1036, '���翵', '701126-2852147', '2003-08-10', '����', '011-9999-9999', '�����', '���', 960400 , 190000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1037, '�ּ���', '770129-1456987', '1998-10-15', '��õ', '011-7777-7777', 'ȫ����', '����', 2350000, 187000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1038, '���μ�', '791009-2321456', '1999-11-15', '�λ�', '010-6542-7412', '������', '�븮', 2000000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1039, '�����', '800504-2000032', '2003-12-28', '���', '010-2587-7895', '������', '�븮', 2010000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1040, '�ڼ���', '790509-1635214', '2000-09-10', '���', '016-4444-7777', '�λ��', '�븮', 2100000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1041, '�����', '721217-1951357', '2001-12-10', '�泲', '016-4444-5555', '�����', '����', 2300000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1042, 'ä����', '810709-2000054', '2003-10-17', '���', '011-5125-5511', '���ߺ�', '���', 1020000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1043, '��̿�', '830504-2471523', '2003-09-24', '����', '016-8548-6547', '������', '���', 1100000, 210000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1044, '����ȯ', '820305-1475286', '2004-01-21', '����', '011-5555-7548', '������', '���', 1060000, 220000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1045, 'ȫ����', '690906-1985214', '2003-03-16', '����', '011-7777-7777', '������', '���', 960000 , 152000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1046, '����', '760105-1458752', '1999-05-04', '�泲', '017-3333-3333', '�ѹ���', '����', 2650000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1047, '�긶��', '780505-1234567', '2001-07-15', '����', '018-0505-0505', '������', '�븮', 2100000, 112000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1048, '�̱��', '790604-1415141', '2001-06-07', '����', NULL           , '���ߺ�', '�븮', 2050000, 106000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1049, '�̹̼�', '830908-2456548', '2000-04-07', '��õ', '010-6654-8854', '���ߺ�', '���', 1300000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1050, '�̹���', '810403-2828287', '2003-06-07', '���', '011-8585-5252', 'ȫ����', '�븮', 1950000, 103000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1051, '�ǿ���', '790303-2155554', '2000-06-04', '����', '011-5555-7548', '������', '����', 2260000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1052, '�ǿ���', '820406-2000456', '2000-10-10', '���', '010-3644-5577', '��ȹ��', '���', 1020000, 105000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1053, '��̽�', '800715-1313131', '1999-12-12', '����', '011-7585-7474', '�����', '���', 960000 , 108000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1054, '����ȣ', '810705-1212141', '1999-10-16', '����', '016-1919-4242', 'ȫ����', '���', 980000 , 114000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1055, '���ѳ�', '820506-2425153', '2004-06-07', '����', '016-2424-4242', '������', '���', 1000000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1056, '������', '800605-1456987', '2004-08-13', '��õ', '010-7549-8654', '������', '�븮', 1950000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1057, '�̹̰�', '780406-2003214', '1998-02-11', '���', '016-6542-7546', '�����', '����', 2520000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1058, '�����', '800709-1321456', '2003-08-08', '��õ', '010-2415-5444', '��ȹ��', '�븮', 1950000, 180000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1059, '�Ӽ���', '810809-2121244', '2001-10-10', '����', '011-4151-4154', '���ߺ�', '���', 890000 , 102000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1060, '��ž�', '810809-2111111', '2001-10-10', '����', '011-4151-4444', '���ߺ�', '���', 900000 , 102000);
--=>60��

--�� Ŀ��
COMMIT;


SELECT *
FROM TBL_INSA;
 

------------------------------------------------------------------------------------------------------------
--1��_������

01. TBL_INSA ���̺� ��ü�ڷ� ��ȸ


02. SCOTT ����� ���� ���̺� ��� Ȯ��(2���� ���� Ȱ��)    

03. TBL_INSA ���̺� ���� Ȯ��


04. TBL_INSA ���̺��� �̸�(NAME), �⺻��(BASICPAY) ��ȸ
    


05. TBL_INSA ���̺��� �̸�(NAME), �⺻��(BASICPAY), ����(SUDANG), �⺻��+���� ��ȸ


06. TBL_INSA ���̺��� �̸�(NAME), ��ŵ�(CITY), �μ���(BUSEO) ��ȸ. ��Ī(ALIAS) ���.



07. ���� ����� �̸�(NAME), ��ŵ�(CITY), �μ���(BUSEO), ����(JIKWI) ��ȸ



08. ��ŵ��� ���� ����̸鼭       --> WHERE ����
    �⺻���� 150���� �̻��� ���   --> WHERE ����
    ��ȸ (NAME, CITY, BASICPAY, SSN)
    
    SELECT NAME"�̸�",CITY"��ŵ�",BASICPAY,SSN FROM TBL_INSA
    WHERE BASICPAY>=1500000 AND CITY='����';

09. ��ŵ��� '��õ' �̸鼭, �⺻���� 100�����̻� ~ 200���� �̸��� ��츸 ������� ��ȸ.
        
      

10. ��ŵ��� ���� ����̰ų� �μ��� ���ߺ��� �ڷ� ��ȸ (NAME, CITY, BUSEO)


11. ��ŵ��� ����, ����� ����� ��ȸ (NAME, CITY, BUSEO). IN ������ ���.


12. �μ��� '���ߺ�' �̰ų� '������'�� ����� ������� ��ȸ. IN ������ ���.


13. �޿�(BASICPAY + SUDANG)�� 250���� �̻��� ��� ��ȸ. --> WHERE ����
    ��, �ʵ���� �ѱ۷� ���. --> ��Ī(ALIAS)
    
    


14. �ֹι�ȣ�� �������� ����(���� �ڸ����� 1, 3)�� ��ȸ. 
    ( �̸�(NAME), �ֹι�ȣ(SSN) )
    ��, SUBSTR() �Լ� �̿�.
    


15. �ֹι�ȣ�� �������� 80��� �¾ ����� ��ȸ. 
    ( �̸�(NAME), �ֹι�ȣ(SSN) )
    


16. ���� ��� �߿��� 70��� �¾ ����� ��ȸ. SUBSTR() �Լ� �̿�.


17. ���� ��� �߿��� 70��� �¾ ���ڸ� ��ȸ. SUBSTR() �Լ� �̿�.


18. ���� ����̸鼭 �达�� ��ȸ
    ��, ������ �� ���ڶ�� ����. 
    ( �̸�, ��ŵ� )
    SUBSTR() �Լ� �̿�.
   
    SELECT NAME,CITY FROM TBL_INSA  
    WHERE  CITY='����' AND SUBSTR(NAME,1,1)='��' ; */

/*19. 2000�⵵�� �Ի��� ��� ��ȸ. (�̸�, ��ŵ�, �Ի���).

    SELECT NAME,CITY,IBSADATE FROM TBL_INSA  
    WHERE  TO_CHAR(IBSADATE,'YYYY')='2000' ;    */

/*20. 2000�� 10���� �Ի��� ��� ��ȸ. (�̸�, ��ŵ�, �Ի���).

    SELECT NAME,CITY,IBSADATE FROM TBL_INSA  
    WHERE  TO_CHAR(IBSADATE,'YYYY-MM')='2000-10' ; */

/*21. �ֹι�ȣ�� �������� ������ ���� ��ȸ.
    ��, ��� ������ 1900��뿡 �¾�ٴ� ����. (�̸�, �ֹι�ȣ, ����)
     SELECT * FROM TBL_INSA;
     
     SELECT SYSDATE FROM DUAL;
     
     SELECT NAME,SSN,TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR('19'||SUBSTR(SSN,1,2)))+1"����" FROM TBL_INSA;
     
  */  

/*22. �ֹι�ȣ �������� ���� ���̴밡 20���� ����� ��ȸ.
    SELECT * FROM TBL_INSA
    WHERE SUBSTR(SSN,8,1) IN ('3','4');*/

/*23. �ֹι�ȣ �������� 5�� ���� ��ȸ. 
    ��, SUBSTR() �Լ� �̿�.
    
    SELECT * FROM TBL_INSA
    WHERE SUBSTR(SSN,3,2)='05';
*/
/*24. �ֹι�ȣ �������� 5�� ���� ��ȸ. 
    ��, TO_CHAR() �Լ� �̿�.
    
    SELECT * FROM TBL_INSA
    WHERE TO_CHAR(SUBSTR(SSN,3,2))='05';*/

/*25. ��ŵ� ������������ �����ϰ�, ��ŵ��� ������ �⺻�� �������� ���� ��ȸ
    
    SELECT * 
    FROM TBL_INSA
    ORDER BY CITY DESC,BASICPAY DESC;
*/

/*26. ���� ��� �߿��� �⺻��+����(��޿�) ������������ ����.
    ( �̸�, ��ŵ�, �⺻��+���� )
    
    SELECT NAME,CITY,BASICPAY+SUDANG"�޿�"
    FROM TBL_INSA
    WHERE CITY='����'
    ORDER BY "�޿�" DESC;
*/
/*27. ���� �� �μ� ������������ �����ϰ�, �μ��� ������ �⺻�� �������� ����. 
    ( �̸�, �ֹι�ȣ, �μ�, �⺻�� )
    
     SELECT NAME,ssn,buseo,Basicpay
    FROM TBL_INSA
    WHERE SUBSTR(SSN,8,1) IN(2,4)
    ORDER BY BUSEO,BASICPAY DESC;
*/

/*28. ���� �� ���̸� �������� �������� �����Ͽ� ��ȸ.

    SELECT * FROM TBL_INSA
    WHERE SUBSTR(SSN,8,1) IN (1,3)
    
    ORDER BY TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR('19'||SUBSTR(SSN,1,2)))+1 ;
*/


/*
29. ���� ���� ����� �߿��� �Ի����� ���� ����� ���� �� �� �ֵ��� ��ȸ.

    SELECT *
    FROM TBL_INSA
    WHERE CITY ='����'
    ORDER BY IBSADATE ;
*/
/*
30. ������ �达�� �ƴ� ��� ��ȸ. 
    ��, ������ �� ���ڶ�� ����.
    ( �̸�, ��ŵ�, �⺻�� ).
    SELECT NAME,CITY,BASICPAY
    FROM TBL_INSA
    WHERE SUBSTR(NAME,1,1) !='��';
*/
/*31. ��ŵ��� ����, �λ�, �뱸 �̸鼭
    ��ȭ��ȣ�� 5 �Ǵ� 7�� ���Ե� �����͸� ��ȸ�ϵ�
    �μ����� ������ �δ� ��µ��� �ʵ�����. (���ߺ� �� ����)
    ( �̸�, ��ŵ�, �μ���, ��ȭ��ȣ )*/

    => Ǯ���� �ߴµ� ���� �ȵ�
    
   /* SELECT NAME,CITY,SUBSTR(BUSEO,1,2)"�μ���",TEL
    FROM TBL_INSA
    WHERE (CITY='����' OR CITY='�λ�' OR CITY='�뱸') AND (TEL LIKE '%5%' OR TEL LIKE '%7%') ;*/

/*32. ��ȭ��ȣ�� ������ '-'�� �����Ͽ� ��ȸ�ϰ�, 
    ������ '��ȭ��ȣ����'���� ��ȸ.
    
    SELECT NAME,CASE WHEN TEL IS NOT NULL
                THEN CONCAT( CONCAT(SUBSTR(TEL,1,3),SUBSTR(TEL,5,4)),SUBSTR(TEL,10,4))
                ELSE '��ȭ��ȣ����'
                END"��ȭ��ȣ" 
    FROM TBL_INSA;
  */   ==>Ǯ�����ߴµ� ���� �ȵ�


/*


�߰�����. (�⺻ ���� Ǯ�̰� ��� ���� �� �ۼ��Ѵ�.)
          HR������ EMPLOYEES ���̺��� Ŀ�̼� �޴� ����� ����
          �ȹ޴� ����� ���� ��ȸ�Ѵ�.
          ������� ---------------
              ����        �ο���
          Ŀ�̼ǹ޴»��    XXX
          Ŀ�̼Ǿ��»��    XXX
          �����          XXX

     
    SELECT CASE GROUPING(T.Ŀ�̼�) WHEN 0 THEN T.Ŀ�̼�
                     ELSE '�����'
                        END"����"

     ,COUNT(*)"�ο���"
     FROM
     (SELECT CASE  WHEN COMMISSION_PCT IS NOT NULL
                                 THEN 'Ŀ�̼ǹ޴»��' 
                                 ELSE 'Ŀ�̼Ǿ��»��'  
                                 END "Ŀ�̼�"

     FROM employees) T

     GROUP BY ROLLUP(T.Ŀ�̼�);
*/

select * from TBL_INSA;
   
 /*   33. TBL_INSA ���̺��� BASICPAY + SUDANG �� 
    100���� �̸�, 100���� �̻�~200���� �̸�, 
    200���� �̻��� �������� �� ��ȸ.

    SELECT DECODE(T.����,'1','100�����̸�','2','100~200����','3','200�����̻�','�˼����°�')"���ޱ���",COUNT(*)"������"
    FROM 
    (SELECT CASE WHEN BASICPAY + SUDANG <1000000 THEN '1'
                 WHEN (BASICPAY + SUDANG >=1000000) AND (BASICPAY + SUDANG <2000000) THEN '2'
                 WHEN BASICPAY + SUDANG >=2000000 THEN '3'
                 ELSE '4'
            END"����"
    
    from TBL_INSA) T
    GROUP BY T.����;
    
   
*/
    
   
  


/*34. TBL_INSA ���̺��� �ֹι�ȣ�� ������ ��������� �⵵�� ������ ��ȸ.
    
    SELECT TRUNC(TO_CHAR(SUBSTR(SSN,1,2)))"����" ,COUNT(*)"������"
    FROM TBL_INSA
    GROUP BY TRUNC(TO_CHAR(SUBSTR(SSN,1,2)))
    ;
*/ 


/*35. �ֹι�ȣ�� �������� ���� ��������, ���� ������ �⵵ �������� ��ȸ.
    (�̸�, �ֹι�ȣ)

    SELECT *
    FROM TBL_INSA
    ORDER BY SSN;
    
    SELECT NAME,SSN
    FROM TBL_INSA
    ORDER BY SUBSTR(SSN,3,2) , SUBSTR(SSN,1,2) DESC;
*/    

/*36. �Ի����� ��������  ���� ��������, ���� ������ �⵵ �������� ��ȸ.
    ��, ��� ���� ��ȸ.
    (����. �Ի����� �ڷ����� DATE�̴�.)
    SELECT *
    FROM TBL_INSA
    ORDER BY TO_CHAR(IBSADATE,'MM') ,TO_CHAR(IBSADATE,'YYYY') DESC; */


/*37. ��ü�ο���, �����ο���, �����ο����� ���� ��ȸ.

select * from TBL_INSA;
        
        SELECT CASE GROUPING(T.����) WHEN 0 THEN T.���� 
                                    ELSE '��ü�ο���'
                                    END "����"
                ,COUNT(*)"�ο���"
        FROM
        (SELECT NAME,SSN,CASE WHEN SUBSTR(SSN,8,1) IN('1','3') THEN '����' 
                    WHEN SUBSTR(SSN,8,1) IN('2','4') THEN '����'
                ELSE '��������'
                END"����"
        FROM TBL_INSA
        )T
        GROUP BY ROLLUP(T.����);
*/        

/*
    38. ���ߺ�, ������, �ѹ��� �ο��� ��ȸ.  COUNT(), DECODE() �Լ� �̿�.

        SELECT BUSEO "�μ�����",COUNT(*)
        FROM TBL_INSA
        WHERE DECODE(BUSEO,'���ߺ�','1','������','1','�ѹ���','1','2')='1'
        GROUP BY BUSEO;
*/
/*39. ���� ����� ���� �ο��� ��ȸ.
select city,count(*) "�ο���"
from TBL_INSA
where substr(ssn,8,1) in ('1','3')
GROUP BY CITY
having city='����';
*/

/*40. �μ��� �������̰�, ���� �ο���, ���� �ο��� ��ȸ.  COUNT(), DECODE() �Լ� �̿�.
    select T.����, count(*)"�ο���"
    FROM
    (   SELECT NAME,BUSEO,SSN ,
        DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
        WHERE BUSEO='������'
    )T
    GROUP BY T.����
    ;
*/
/*41. ���ߺ�, ������, �ѹ��� �ο��� ��ȸ. ��, ������ '����'�� ����.

    SELECT BUSEO "�μ�����",COUNT(*)"�ο���"
        FROM TBL_INSA
        WHERE DECODE(BUSEO,'���ߺ�','1','������','1','�ѹ���','1','2')='1'and city='����'
        GROUP BY BUSEO;
*/
/*42. ���� ����� ���ڿ� ������ �⺻���� ��ȸ.
   
 select T.����, sum(T.�⺻��)"�⺻����"
    FROM
    (   SELECT BASICPAY"�⺻��",
        DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
        WHERE CITY='����'
    )T
    GROUP BY T.����;
*/
/*43. ���ڿ� ������ �⺻�� ��հ� ��ȸ. AVG(), DECODE() �Լ� �̿�.

select T.����, ROUND(AVG(T.�⺻��),2)"�⺻����"
    FROM
    (   SELECT BASICPAY"�⺻��",
        DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
        
    )T
GROUP BY T.����;
*/

/*44. ���ߺ��� ����, ���� �⺻�� ��հ� ��ȸ.

select T.����, ROUND(AVG(T.�⺻��),2)"��հ�"
    FROM
    (   SELECT BASICPAY"�⺻��",
        DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
        WHERE BUSEO='���ߺ�'
    )T
GROUP BY T.����;
*/

SELECT * FROM TBL_INSA;

45. �μ��� ���ڿ� ���� �ο��� ���ϱ�
 /*   
    SELECT T.����,COUNT(*)
    FROM
     (
        SELECT  DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
     )T
    GROUP BY T.����;
        
*/


/*46. ������ ���ڿ� ���� �ο��� ���ϱ�

    SELECT T.����,T.����,COUNT(*)
    FROM
     (
        SELECT  CITY"����",DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
     )T
    GROUP BY T.����, T.����
    ;
 */   
    /*
    ����	����	2
    ���	����	5
    ���	����	8
    �泲	����	1
    ���	����	1
    �λ�	����	1
    �λ�	����	2
    ����	����	9
    ����	����	11
    ��õ	����	4
    ��õ	����	5
    ����	����	1
    ����	����	2
    ����	����	4
    ����	����	1
    ����	����	2
    �泲	����	1
    
    */
--SELECT * FROM TBL_INSA;
/*47. �Ի�⵵�� ���ڿ� ���� �ο��� ���ϱ�
    
    SELECT T.�Ի�⵵,T.����,COUNT(*)"�ο���"
    FROM
     (
        SELECT  EXTRACT(YEAR FROM IBSADATE)"�Ի�⵵" ,DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
     )T
    GROUP BY T.�Ի�⵵, T.����
    ;
*/
/*48. ������, �ѹ��� �ο����� ������ �Ի�⵵�� ���ڿ� ���� �ο��� ���ϱ�
 SELECT T.�Ի�⵵,T.����,COUNT(*)"�ο���"
    FROM
     (
        SELECT  EXTRACT(YEAR FROM IBSADATE)"�Ի�⵵" ,DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
        FROM TBL_INSA
        WHERE BUSEO= '������' OR BUSEO='�ѹ���'
     )T
    GROUP BY T.�Ի�⵵, T.����;
*/
/*
2003	����	2
2004	����	1
1998	����	1
2000	����	3
1999	����	3
2002	����	1
*/
 /*49. ���� ����� �μ��� ���ڿ� �����ο���, ���ڿ� ���� �޿��� ��ȸ.

   SELECT T.�μ�,T.����,COUNT(*)"�ο���",SUM(T.�޿�)
        FROM
         (
            SELECT  BUSEO"�μ�" ,DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����','��������')"����"
                    ,BASICPAY+SUDANG"�޿�"
            FROM TBL_INSA
            WHERE CITY='����'
         )T
        GROUP BY T.�μ�, T.����;
*/
    /*
    ������	����	5	7062000
    �ѹ���	����	1	1044000
    �ѹ���	����	2	4090000
    �λ��	����	1	2465000
    ��ȹ��	����	2	5420000
    ������	����	4	7422000
    ��ȹ��	����	1	2070000
    ���ߺ�	����	2	1994000
    ȫ����	����	1	1095000
    �����	����	1	1150400
    */
    SELECT * FROM TBL_INSA;

/*50. �μ��� �ο��� ���. �ο����� 10 �̻��� ��츸.

 SELECT T.�μ�,COUNT(*)"�ο���"
 FROM
         (
            SELECT  BUSEO"�μ�" 
            FROM TBL_INSA
         )T
 GROUP BY T.�μ�
 HAVING COUNT(*)>=10;
*/      
/*
���ߺ�	14
������	16
*/

/*51. �μ��� ��,�� �ο��� ���. �����ο����� 5�� �̻��� �μ��� ��ȸ.

    SELECT  BUSEO "�μ�" 
            ,COUNT(DECODE(SUBSTR(SSN,8,1),'1','����','3','����'))"����"
            ,COUNT(DECODE(SUBSTR(SSN,8,1),'2','����','4','����'))"����"
    FROM TBL_INSA  
    GROUP BY BUSEO
    HAVING COUNT(DECODE(SUBSTR(SSN,8,1),'2','����','4','����'))>=5;       
*/  
 
/*52. �̸�, ����, ���� ��ȸ
    ����: �ֹι�ȣ Ȱ�� 1,3 �� ����, 2,4 �� ���� (DECODE() ���)
    ����: �ֹι�ȣ Ȱ��
    
    SELECT NAME, DECODE(SUBSTR(SSN,8,1),'1','����','2','����','3','����','4','����')"����"
    ,EXTRACT(YEAR FROM SYSDATE)- TO_NUMBER(DECODE(SUBSTR(SSN,8,1),'1','19'||SUBSTR(SSN,1,2),'2','19'||SUBSTR(SSN,1,2)
    ,'3','20'||SUBSTR(SSN,1,2),'4','20'||SUBSTR(SSN,1,2)))+1"����"
    FROM TBL_INSA ; 
    */
   

/*53. ���� ��� �߿��� �⺻���� 200���� �̻��� ��� ��ȸ. 
    ( �̸�, �⺻�� )
    
    SELECT NAME,BASICPAY
    FROM TBL_INSA
    WHERE CITY ='����' AND BASICPAY>=2000000;*/

/*54. �Ի���� �ο��� ���ϱ�. (��, �ο���)   COUNT, GROUP BY, TO_CHAR ���
    ������� ----------
     ��  �ο���
    1��    10��
    2��    25��


SELECT TO_CHAR(EXTRACT(MONTH FROM IBSADATE)||'��')"�Ի��",COUNT(*)"�ο���"
FROM TBL_INSA
GROUP BY EXTRACT(MONTH FROM IBSADATE);
*/
/*55. �̸�, �������, �⺻��, ������ ��ȸ.
    ��������� �ֹι�ȣ ���� (2000-10-10 �������� ���)
    �⺻���� \1,000,000 �������� ���
    SELECT * FROM TBL_INSA;
    
    SELECT NAME,
        TO_CHAR(TO_DATE(DECODE(SUBSTR(SSN,8,1),'1',19||SUBSTR(SSN,1,6),'2',19||SUBSTR(SSN,1,6)
    ,'3',20||SUBSTR(SSN,1,6),'4',20||SUBSTR(SSN,1,6)),'YYYY-MM-DD'),'YYYY-MM-DD')"�������",
        TO_CHAR(BASICPAY,'L999,999,999') "�⺻��",TO_CHAR(SUDANG,'L999,999')"����"
    FROM TBL_INSA;
*/
/*56. �̸�, ��ŵ�, �⺻���� ��ȸ�ϵ� ��ŵ� �������� ���(1�� ���� ����).
    ��ŵ��� ������ �⺻�� �������� ���(2�� ���� ����).
    
    SELECT NAME,CITY,BASICPAY FROM TBL_INSA
    ORDER BY CITY DESC, BASICPAY;
*/
/*57. ��ȭ��ȣ�� NULL�� �ƴѰ͸� ��ȸ. (�̸�, ��ȭ��ȣ)

    SELECT NAME,TEL FROM TBL_INSA
    WHERE TEL IS NOT NULL;
*/
/*58. �ٹ������ 10�� �̻��� ��� ��ȸ. (�̸�, �Ի���)
    SELECT NAME, IBSADATE
    FROM TBL_INSA
    WHERE TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(IBSADATE,'YYYY'))>=10;
*/
   
/*59. �ֹι�ȣ�� �������� 75~82��� ��ȸ. (�̸�, �ֹι�ȣ, ��ŵ�).
    SUBSTR() �Լ�, BEWTEEN AND ����, TO_NUMBER() �Լ� �̿�.
    
    SELECT NAME,SSN,CITY 
    FROM TBL_INSA
    WHERE TO_NUMBER(SUBSTR(SSN,1,2)) BETWEEN 75 AND 82; */

/*60. �ٹ������ 5~10���� ��� ��ȸ. (�̸�, �Ի���)
    SELECT * FROM TBL_INSA;

    SELECT NAME, IBSADATE
    FROM TBL_INSA
    WHERE TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(IBSADATE,'YYYY')) BETWEEN 5 AND 10;*/
/*61. �达, �̾�, �ھ��� ��ȸ (�̸�, �μ�). SUBSTR() �Լ� �̿�.

    SELECT NAME, BUSEO
    FROM TBL_INSA
    WHERE SUBSTR(NAME,1,1) IN ('��','��','��');
*/
/*62. �Ի����� "��-��-�� ����" �������� ���ڸ� ��ȸ (�̸�, �ֹι�ȣ, �Ի���)

    SELECT NAME,SSN,TO_CHAR(IBSADATE,'YYYY-MM-DD DAY')
    FROM TBL_INSA
    where SUBSTR(SSN,8,1) in ('1','3');
 */   

/*63. �μ��� ������ �޿��� ���ϱ�. (�μ�, ����, �޿���)

    select * from  TBL_INSA;
    
    SELECT BUSEO"�μ�",JIKWI"����",SUM(BASICPAY+SUDANG)"�޿���"
    FROM 
    TBL_INSA
    GROUP BY BUSEO,JIKWI;
*/
/*64. �μ��� ������ �ο���, �޿���, �޿���� ���ϱ�. (�μ�, ����, �޿���)
    
    select * from  TBL_INSA;
    
    SELECT BUSEO"�μ�",JIKWI"����",COUNT(*)"�ο���",SUM(BASICPAY+SUDANG)"�޿���",ROUND(AVG(BASICPAY+SUDANG),1)"�޿����"
    FROM 
    TBL_INSA
    GROUP BY BUSEO,JIKWI;
*/


/*65. �μ��� ������ �ο����� ���ϵ� �ο����� 5�� �̻��� ��츸 ��ȸ.

    SELECT BUSEO"�μ�",JIKWI"����",COUNT(*)"�ο���"
    FROM TBL_INSA
    GROUP BY BUSEO,JIKWI
    HAVING COUNT(*)>=5;
*/
/*66. 2000�⿡ �Ի��� ����� ��ȸ. (�̸�, �ֹι�ȣ, �Ի���)
    
    SELECT NAME,SSN,IBSADATE FROM TBL_INSA
    WHERE TO_CHAR(IBSADATE,'YYYY')='2000';
*/
/*67. ������ �� ����(��, ��, �� ��)��� �����Ͽ� ������ �ο��� ��ȸ (����, �ο���)

        select substr(name,1,1)"����",count(*)"�ο���"
        from tbl_insa
        group by substr(name,1,1);
 */       

/*68. ��ŵ�(CITY)�� ���� �ο��� ��ȸ.

        select * from  TBL_INSA;

        select CITY"��ŵ�",DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����')"����"
        ,count(*)"�հ�"
        from tbl_insa
        group by CITY,DECODE(SUBSTR(SSN,8,1),'1','����','3','����','2','����','4','����');
*/
/*69. �μ��� �����ο����� 5�� �̻��� �μ��� �����ο��� ��ȸ.
    
    select t.�μ�, count(t.����)"�����ο���"
    from

    (select buseo"�μ�",DECODE(SUBSTR(SSN,8,1),'1','����','3','����')"����"
        from tbl_insa
    )t
    group by t.�μ�
    having count(t.����)>=5;
    
   
*/        

/*70. �Ի�⵵�� �ο��� ��ȸ.
select * from tbl_insa;

select extract(year from ibsadate)"�Ի�⵵",count(*)"�ο���"
from tbl_insa
group by extract(year from ibsadate);
*/
/*71. ��ü�ο���, 2000��, 1999��, 1998�⵵�� �Ի��� �ο��� ������ �������� ��ȸ.
    ������� ---------------    
    ��ü 2000 1999 1998
      60    x    x    x
      
      select count(*)"��ü"

      ,count(decode(to_char(ibsadate,'yyyy'),'2000',1))"2000" 

      ,count(decode(to_char(ibsadate,'yyyy'),'1999',1))"1999" 

      ,count(decode(to_char(ibsadate,'yyyy'),'1998',1))"1998" 

        from tbl_insa;


*/
/*72. �Ʒ� �������� ������ �ο��� ��ȸ.
    ������� -----------------
    ��ü ����  ��õ  ���
      60    x     x     x
      
      SELECT COUNT(*)"��ü",
      COUNT(DECODE(CITY,'����','1'))"����"
      ,COUNT(DECODE(CITY,'��õ','1'))"��õ"
      ,COUNT(DECODE(CITY,'���','1'))"���"
      ,COUNT(DECODE(CITY,'�泲','1'))"�泲"
      ,COUNT(DECODE(CITY,'���','1'))"���"
      ,COUNT(DECODE(CITY,'����','1'))"����"
      ,COUNT(DECODE(CITY,'����','1'))"����"
      ,COUNT(DECODE(CITY,'����','1'))"����"
      ,COUNT(DECODE(CITY,'�泲','1'))"�泲"
      ,COUNT(DECODE(CITY,'���','1'))"���"
      ,COUNT(DECODE(CITY,'�λ�','1'))"�λ�"
      ,COUNT(DECODE(CITY,'����','1'))"����"
      
      FROM TBL_INSA;
      
      SELECT * FROM TBL_INSA;
      
      
  */    
      


/*73. �⺻��(BASICPAY)�� ��� ������ ��� ��ȸ. (�̸�, �⺻��). AVG() �Լ�. ��������.

    SELECT NAME,BASICPAY
        
    FROM TBL_INSA
    
    WHERE BASICPAY<=(SELECT AVG(BASICPAY)"��ձ�"
        FROM TBL_INSA
        );
  */  

/*74. �⺻�� ���� 10%�� ��ȸ. (�̸�, �⺻��)



SELECT NAME,BASICPAY
FROM
(SELECT NAME,BASICPAY, DENSE_RANK() OVER(ORDER BY BASICPAY DESC)"��������"
FROM TBL_INSA
)T
WHERE T.��������<=TRUNC((
SELECT COUNT(*)
FROM 
TBL_INSA
)*0.1)
;
*/
/*
����	2650000
ȫ�浿	2610000
�̼���	2550000
������	2540000
�̹̰�	2520000
���μ�	2500000
*/



/*75. �⺻�� ������ 5���������� ��ȸ. (��� ����)
SELECT * FROM TBL_INSA;
SELECT T.*
FROM
(SELECT NUM,NAME,SSN,IBSADATE,CITY,TEL,BUSEO,JIKWI,BASICPAY,SUDANG,DENSE_RANK() OVER(ORDER BY BASICPAY DESC)"��������"
FROM TBL_INSA
)T
WHERE T.�������� BETWEEN 1 AND 5
;
*/
 
/*76. �Ի����� ���� ������ 5���������� ��ȸ. (��� ����)

SELECT * FROM TBL_INSA;
SELECT T.*
FROM
(SELECT NUM,NAME,SSN,IBSADATE,CITY,TEL,BUSEO,JIKWI,BASICPAY,SUDANG,DENSE_RANK() OVER( ORDER BY IBSADATE )"�Ի����"
FROM TBL_INSA
)T
WHERE T.�Ի���� BETWEEN 1 AND 5
;
*/
/*77. ��� �޿����� ���� �޿��� �޴� ���� ���� ��ȸ. (��� ����)

    SELECT * FROM TBL_INSA
    WHERE SUDANG+BASICPAY > (
         SELECT ROUND(AVG(SUDANG+BASICPAY),1)"��ձ޿�"
        FROM TBL_INSA
    )
    
    ;
   --1703916.7

*/

/*78. '�̼���' ������ �޿����� �� ���� �޿��� �޴� ���� ��ȸ. (��� ����)
    ��, �̼��� ������ �޿��� ���ϴ��� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
    SELECT * FROM TBL_INSA
    WHERE SUDANG+BASICPAY > (
         SELECT SUDANG+BASICPAY "�޿�"
        FROM TBL_INSA
        WHERE NAME ='�̼���'
    )
    
    ;

*/

/*79. �ѹ����� ��� �޿����� ���� �޿��� �޴� �������� �̸�, �μ��� ��ȸ.

    SELECT NAME,BUSEO 
    FROM TBL_INSA
    WHERE BASICPAY+SUDANG >
        (
            SELECT AVG(BASICPAY+SUDANG)
            FROM TBL_INSA
            WHERE BUSEO='�ѹ���'        
        );
*/
/*80. �ѹ��� �������� ��� ���纸�� �� ���� ������ �޴� ���� ���� ��ȸ.

     SELECT *
    FROM TBL_INSA
    WHERE BASICPAY+SUDANG >
        (
            SELECT AVG(BASICPAY+SUDANG)
            FROM TBL_INSA
            WHERE BUSEO='�ѹ���'        
        );
*/
/*81. ���� ��ü ��� �޿����� ���� �޿��� �޴� ������ �� ��ȸ.

   SELECT COUNT(*)
    FROM TBL_INSA
    WHERE BASICPAY+SUDANG >
        (
            SELECT AVG(BASICPAY+SUDANG)
            FROM TBL_INSA
                 
        );
*/
/*82. 'ȫ�浿' ������ ���� �μ��� ���� ���� ��ȸ.
    ��, ȫ�浿 ������ �μ��� �ٲ���� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
    SELECT *
    FROM TBL_INSA
    WHERE BUSEO =
        (
            SELECT BUSEO
            FROM TBL_INSA
            WHERE NAME='ȫ�浿'
                 
        );
*/

/*83. '��ž�' ������ ���� �μ�, ������ ���� ���� ���� ��ȸ.
    ��, ��ž� ������ �μ� �� ������ �ٲ���� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
    
    SELECT * FROM TBL_INSA
    WHERE BUSEO||JIKWI=
    (
    SELECT BUSEO||JIKWI
    FROM TBL_INSA
    WHERE NAME='��ž�'
    );
*/
/*84. �μ��� �⺻���� ���� ���� ��� ��ȸ. (�̸�, �μ�, �⺻��)
    ��, ������� �⺻���� ����Ǵ��� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
    
    SELECT T.�̸�,T.�μ�,T.�⺻��
    FROM
    (
        SELECT NAME"�̸�",BUSEO"�μ�",BASICPAY"�⺻��",DENSE_RANK()OVER(PARTITION BY BUSEO ORDER BY BASICPAY DESC)"��ũ"
        FROM TBL_INSA
    
    )T 
    WHERE T.��ũ =1;
*/
85. ��, ���� �⺻�� ���� ��ȸ.

86. ����(CITY)���� �޿�(�⺻��+����) 1���� ������ ��ȸ.
        
        select t.����,t.����
        from
        (select city"����",BASICPAY+SUDANG"�޿�",rank() over(order by BASICPAY+SUDANG)"����"
        from TBL_INSA
        )t
        group by t.����;


87. �μ��� �ο����� ���� ���� �μ� �� �ο��� ��ȸ.

88. ����(CITY)�� �ο����� ���� ���� ���� �� �ο��� ��ȸ.

89. ����(CITY)�� ��� �޿�(BASICPAY + SUDANG)��
    ���� ���� ���� �� ��ձ޿� ��ȸ.

90. ���� �ο����� ���� ���� �μ� �� �ο��� ��ȸ.

91. ������ �ο��� ���� ��ȸ.

92. ������ �ο��� ���� ��ȸ�ϵ� 5���������� ���.

/*93. �̸�, �μ�, ��ŵ�, �⺻��, ����, �⺻��+����, ����, �Ǽ��ɾ� ��ȸ
    ��, ����: �ѱ޿��� 250���� �̻��̸� 2%, 200���� �̻��̸� 1%, ������ 0.
    �Ǽ��ɾ�: �ѱ޿�-����
    
    SELECT T.�̸�,T.�μ�,T.��ŵ�,T.�⺻��,T.����,T.�ѱ޿�,T.����,T.�ѱ޿�-T.���� "�Ǽ��ɾ�"
    FROM
    (SELECT NAME "�̸�", BUSEO "�μ�", CITY "��ŵ�" , BASICPAY "�⺻��", SUDANG "����", BASICPAY+SUDANG "�ѱ޿�"
            
           , CASE  WHEN BASICPAY+SUDANG >=2500000 THEN  0.02 *(BASICPAY+SUDANG)
                 WHEN BASICPAY+SUDANG >=2000000 THEN  0.01 *(BASICPAY+SUDANG)
                 ELSE 0
            END"����"
     FROM TBL_INSA
    )T;
           
*/         
            

94. �μ��� ��� �޿��� ��ȸ�ϵ�, A, B, C ������� ������ ���.
    200���� �ʰ� - A���
    150~200����  - B���
    150���� �̸� - C���

95. �⺻��+������ ���� ���� ����� �̸�, �⺻��+���� ��ȸ.
    MAX() �Լ�, ���� ���� �̿�.


----------------------------------------------------------------------------


