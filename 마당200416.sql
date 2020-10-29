-- ���� �Լ�
SELECT ABS(-78), ABS(+78)
FROM DUAL;

SELECT ROUND(4.875, 1)
FROM DUAL;

SELECT custid "����ȣ", ROUND(SUM(saleprice)/COUNT(*),-2) "��ձݾ�"
FROM Orders
GROUP BY custid;

-- ���� �Լ�
-- ���� ���� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�. 
SELECT bookid, REPLACE(bookname, '�߱�', '��') bookname, publisher, price
FROM Book;
-- �½��������� ������ ������ ����� ������ ���� ���� Ȯ���Ͻÿ�.
SELECT bookname "����", LENGTH(bookname) "���ڼ�", LENGTH(bookname) "����Ʈ��"
FROM Book
WHERE publisher = '�½�����';
-- ���缭���� �� �߿��� ���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
SELECT SUBSTR(name, 1, 1) "��", COUNT(*) "�ο�"
FROM Customer
GROUP BY SUBSTR(name, 1, 1);

-- ��¥ �Լ�
-- ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
FROM Orders;
-- ���缭���� 2014�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�.
-- �� �ֹ����� 'yyyy-mm-dd ����' ���·� ǥ���Ѵ�. 
SELECT orderid "�ֹ���ȣ", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "�ֹ���", custid "����ȣ", bookid "������ȣ"
FROM Orders
WHERE orderdate = TO_DATE('20140707', 'yyyymmdd');
-- DBMS ������ ������ ���� �ð��� ���� ��¥�� Ȯ���Ͻÿ�.
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1"
FROM DUAL;

-- ���� �Լ�
SELECT ABS(-15)
FROM DUAL; -- ���밪

SELECT CEIL(15.7)
FROM DUAL; -- �ø�

SELECT COS(3.14159)
FROM DUAL;

SELECT FLOOR(15.7)
FROM DUAL; -- ����

SELECT LOG(10,100)
FROM DUAL; 

SELECT MOD(11,4)
FROM DUAL; -- ������ ��

SELECT POWER(3,2)
FROM DUAL; -- 3�� 2��

SELECT ROUND(15.7)
FROM DUAL; -- �ݿø�

SELECT SIGN(-15)
FROM DUAL; -- ���ڰ� ������ -1, 0�̸� 0, ����� 1

SELECT TRUNC(15.7)
FROM DUAL; -- �Ҽ��� ����

SELECT CHR(67)
FROM DUAL; --  ���� �ƽ�Ű�ڵ带 ���ڷ� ��ȯ 

SELECT CONCAT('HAPPY', 'Birthday')
FROM DUAL; -- ���� ���̱�

SELECT LOWER('Birthday')
FROM DUAL; -- �ҹ��� ��ȯ 

SELECT LPAD('Page 1', 15, '*.')
FROM DUAL; -- ���ʺ��� ������ �ڸ� ������ ������ ���ڷ� ä���

SELECT LTRIM('Page 1', 'ae')
FROM DUAL; -- 

SELECT REPLACE('JACK', 'J', 'BL')
FROM DUAL; -- ���� �ٲٱ�

SELECT RPAD('Page 1', 15, '*.')
FROM DUAL; -- �����ʿ������� ������ �ڸ� ������ ������ ���ڷ� ä���

SELECT RTRIM('Page 1', 'ae')
FROM DUAL;

SELECT SUBSTR('ABCDEFG', 3, 4)
FROM DUAL; -- ���� �ڸ���

SELECT TRIM(LEADING 0 FROM '00AA00')
FROM DUAL;

SELECT UPPER('Birthday')
FROM DUAL; -- �빮�� ��ȯ

SELECT ASCII('A')
FROM DUAL; -- �ƽ�Ű�ڵ� 

SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2)
FROM DUAL;

SELECT LENGTH('Birthday')
FROM DUAL; -- ���� ����

SELECT ADD_MONTHS('14/05/21', 1)
FROM DUAL;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '������')
FROM DUAL; -- ���ƿ��� ������ ����?

SELECT ROUND(SYSDATE)
FROM DUAL;

SELECT SYSDATE
FROM DUAL;

SELECT TO_CHAR(SYSDATE)
FROM DUAL;

SELECT TO_CHAR(123)
FROM DUAL;

SELECT TO_DATE('12 05 2014', 'DD MM YYYY')
FROM DUAL;

SELECT TO_NUMBER('12.3')
FROM DUAL;

SELECT DECODE(1,1,'aa','bb')
FROM DUAL;

SELECT NULLIF(123, 345)
FROM DUAL;

SELECT NVL(NULL, 123)
FROM DUAL;