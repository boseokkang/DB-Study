SELECT CUSTID, COUNT(*) AS ��������
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

-- ���� ������ ���� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- (1) ���� ��ȣ�� 1�� ������ �̸�
SELECT BOOKNAME
FROM BOOK
WHERE BOOKID = 1;
-- (2) ������ 20,000�� �̻��� ������ �̸�
SELECT BOOKNAME
FROM BOOK
WHERE PRICE >= 20000;
-- (3) �������� �� ���ž�
SELECT SUM(SALEPRICE) "�� ���ž�"
FROM ORDERS
WHERE CUSTID = 1;

SELECT C.NAME, SUM(O.SALEPRICE) "�� ���ž�" 
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID AND C.NAME = '������'
GROUP BY C.NAME;

SELECT SUM(SALEPRICE)
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND NAME LIKE '������';
-- (4) �������� ������ ������ ��
SELECT COUNT(*)
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND NAME LIKE '������';

-- 2. ���� ������ ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- (1) ���� ���� ������ �� ����
SELECT COUNT(*) "���� ����"
FROM BOOK;
-- (2) ���� ������ ������ ����ϴ� ���ǻ��� �� ����
SELECT COUNT(DISTINCT PUBLISHER) "���ǻ� �� ����" 
FROM BOOK;
-- (3) ��� ���� �̸�, �ּ�
SELECT NAME, ADDRESS
FROM CUSTOMER;
-- (4) 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
SELECT ORDERID, ORDERDATE
FROM ORDERS
WHERE ORDERDATE BETWEEN '14/07/04' AND '14/07/07';
-- (5) 2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
SELECT ORDERID, ORDERDATE
FROM ORDERS
WHERE ORDERDATE NOT BETWEEN '14/07/04' AND '14/07/07';
-- (6) ���� '��'���� ���� �̸��� �ּ�
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '��%';
-- (7) ���� '��'���̰� �̸��� '��' �� ������ ���� �̸��� �ּ� 
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '��%��';