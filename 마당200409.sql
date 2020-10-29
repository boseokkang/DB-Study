-- ����
-- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
SELECT *
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- ���� ���� �ֹ��� ���� �����͸� ����ȣ ������ �����Ͻÿ�.
SELECT *
FROM CUSTOMER C, ORDERS O 
WHERE C.CUSTID = O.CUSTID
ORDER BY C.CUSTID;
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, �� ���� �����Ͻÿ�.
SELECT C.NAME, SUM(O.SALEPRICE) 
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;
-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C, BOOK B, ORDERS O 
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID;
-- ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C, BOOK B, ORDERS O
WHERE B.PRICE = 20000 AND B.BOOKID = O.BOOKID AND O.CUSTID = C.CUSTID; 
-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
-- ���� ��� ������ �̸��� ���̽ÿ�.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK);
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
-- ���� �̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN 
(
    SELECT CUSTID
    FROM ORDERS
    WHERE BOOKID IN 
(
        SELECT BOOKID
        FROM BOOK
        WHERE PUBLISHER = '���ѹ̵��'
));
-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
SELECT B1.BOOKNAME
FROM BOOK B1
WHERE B1.PRICE > 
(
    SELECT AVG(B2.PRICE)
    FROM BOOK B2
    WHERE B2.PUBLISHER = B1.PUBLISHER
);
-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�. 
SELECT NAME
FROM CUSTOMER
MINUS
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
SELECT NAME, ADDRESS
FROM CUSTOMER C
WHERE EXISTS 
(
    SELECT *
    FROM ORDERS O
    WHERE C.CUSTID = O.CUSTID
);
-- ���� ������ ���� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- �������� ������ ������ ���ǻ� �� 
SELECT COUNT(*) "���ǻ� ��"
FROM (
SELECT C.NAME, B.PUBLISHER
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID AND C.NAME = '������')
GROUP BY NAME;
-- ��
SELECT count(distinct publisher)
FROM customer, orders, book
WHERE customer.custid = orders.custid and orders.bookid = book.bookid and name like '������';
-- �������� ������ ������ �̸�, ����, ������ �Ǹ� ������ ���� 
SELECT C.NAME, B.BOOKNAME, (B.PRICE-O.SALEPRICE) "������ �Ǹ� ���� ����" 
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID AND C.NAME = '������';
-- ��
SELECT bookname, price, price-saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid and orders.bookid = book.bookid and name like '������';
-- �������� �������� ���� ������ �̸� (EXIST, NOT EXIST, IN, MINUS)
SELECT BOOKNAME
FROM BOOK
MINUS
SELECT BOOKNAME
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID AND C.NAME = '������';
-- �� minus
SELECT bookname
FROM book
minus
SELECT bookname
FROM customer, orders, book
WHERE customer.custid = orders;
-- �� not in 
SELECT bookname
FROM book
WHERE bookname not in 
                (select bookname 
                from customer, orders, book 
                where customer.custid = orders.custid
                    and orders.bookid = book.bookid 
                    and name like '������');
-- �� not exists
SELECT bookname
FROM book
WHERE not exists
                (select bookname 
                from customer, orders
                where customer.custid = orders.custid
                    and orders.bookid = book.bookid 
                    and name like '������');
-- ���� ������ ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- �ֹ����� ���� ���� �̸� (���� ���)
SELECT C.NAME
FROM CUSTOMER C
MINUS
SELECT C.NAME
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT SUM(SALEPRICE) "�Ѿ�", AVG(SALEPRICE) "���"
FROM ORDERS;
-- ���� �̸��� ���� ���ž�
SELECT C.NAME, SUM(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME;
-- ���� �̸��� ���� ������ ���� ���
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID;
-- ������ ����(BOOK ���̺�)�� �ǸŰ���(ORDERS ���̺�)�� ���̰� ���� ���� �ֹ�
SELECT *
FROM ORDERS O, BOOK B
WHERE O.BOOKID = B.BOOKID AND (B.PRICE-O.SALEPRICE) =
(
    SELECT MAX(B.PRICE-O.SALEPRICE) 
    FROM ORDERS O, BOOK B
    WHERE O.BOOKID = B.BOOKID
);
-- �� 
SELECT *
FROM book, orders
WHERE book.bookid = orders.bookid
    and price-saleprice = (select max(price-salesprice) from book, orders where book.bookid = orders.bookid);
-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT C.NAME, AVG(SALEPRICE)
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
GROUP BY C.NAME
HAVING AVG(SALEPRICE) > (SELECT AVG(SALEPRICE) FROM ORDERS);
-- ���� ����
SELECT C.NAME, AVG(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.SALEPRICE >
(
    SELECT AVG(SALEPRICE)
    FROM ORDERS
)
GROUP BY C.NAME;

-- DDL (CREATE, ALTER, DROP)
-- NewBook ���̺� �����ϱ�. �������� NUMBER��, ��������VARCHAR2 ���
CREATE TABLE NewBook
(
    bookid NUMBER, 
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price NUMBER
);

CREATE TABLE NewCustomer
(
    custid NUMBER PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(40),
    phone VARCHAR2(30)
);

CREATE TABLE NewOrders
(
    orderid NUMBER PRIMARY KEY,
    custid NUMBER NOT NULL, 
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);
-- NeWBook ���̺� VARCHART2(13)�� �ڷ����� ���� isbn �Ӽ��� �߰��Ͻÿ�.
ALTER TABLE NewBook ADD isbn VARCHAR2(13);
-- NewBook ���̺� isbn �Ӽ��� ������ Ÿ���� NUMBER������ �����Ͻÿ�.
ALTER TABLE NewBook MODIFY isbn NUMBER;
-- NewBook ���̺��� isbn �Ӽ��� �����Ͻÿ�.
ALTER TABLE NewBook DROP COLUMN isbn;
-- NewBook ���̺��� bookid �Ӽ��� NOT NULL ���������� �����Ͻÿ�.
ALTER TABLE NewBook MODIFY bookid NUMBER NOT NULL;
-- NewBook ���̺��� bookid �Ӽ��� �⺻Ű�� �����Ͻÿ�.
ALTER TABLE NewBook ADD PRIMARY KEY (bookid);

-- NewBook ���̺��� �����Ͻÿ�.
DROP TABLE NewBook;
-- NewCustomer ���̺��� �����Ͻÿ�. ���� ������ �����ȴٸ� ������ �ľ��ϰ� ���õ� ���̺��� ���� �����Ͻÿ�. 
DROP TABLE NewOrders;
DROP TABLE NewCustomer;


-- DML (SELECT, INSERT, DELETE, UPDATE)
-- Book ���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�. ������ ������ �Ѽ����м������� �Ⱓ������ ������ 9����
INSERT INTO Book(bookid, bookname, publisher, price) VALUES(11, '������ ����', '�Ѽ����м���', 90000);
-- Book ���̺� ���ο� ���� '������ ����'�� �����Ͻʽÿ�. ������ ������ �Ѽ����м������� �Ⱓ������ ������ ����
INSERT INTO Book(bookid, bookname, publisher, price) VALUES(14, '������ ����', '�Ѽ����м���', null);
-- ���Ե��� ���(Imported_book)�� Book ���̺� ��� �����Ͻÿ�. 
INSERT INTO Book(bookid, bookname, price, publisher)
        SELECT bookid, bookname, price, publisher
        FROM Imported_book;
-- Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����Ͻÿ�. 
UPDATE Customer
SET address = '���ѹα� �λ�'
WHERE custid = 5;
-- Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�. 
UPDATE Customer
SET address = (SELECT address FROM Customer WHERE name = '�迬��')
WHERE name LIKE '�ڼ���';
-- Customer ���̺��� ����ȣ�� 5�� ���� �����Ͻÿ�. 
DELETE FROM Customer
WHERE custid = 5;
-- ��� ���� �����Ͻÿ�.
DELETE FROM Customer;

-- ���缭������ ������ ��ȭ�� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT DISTINCT c.name
FROM ORDERS O, CUSTOMER C, BOOK B 
WHERE o.custid = c.custid AND b.bookid = o.bookid AND B.PUBLISHER IN 
(SELECT B.PUBLISHER
FROM ORDERS O, CUSTOMER C, BOOK B
WHERE o.custid = c.custid AND b.bookid = o.bookid AND NAME LIKE '������')
MINUS
SELECT C.NAME
FROM CUSTOMER C 
WHERE NAME LIKE '������';
-- �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸� 
-- 1. GROUP BY 
SELECT C.NAME
FROM ORDERS O, CUSTOMER C, BOOK B
WHERE o.custid = c.custid AND b.bookid = o.bookid 
GROUP BY C.NAME
HAVING COUNT(distinct PUBLISHER) >= 2;
-- 2. ������� 
SELECT name
FROM customer c1
WHERE 2 <= 
(SELECT count(distinct publisher)
FROM ORDERS, CUSTOMER, BOOK
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid AND name like c1.name);
-- ��ü ���� 30% �̻��� ������ ����
SELECT b.bookname
FROM BOOK B, CUSTOMER C, ORDERS O 
WHERE o.custid = c.custid AND o.bookid = b.bookid 
GROUP BY b.bookname
HAVING COUNT(NAME) >= (SELECT count(name)*0.3 FROM customer);

-- 1. GROUP BY
SELECT bookname, count(book.bookid)
FROM book, orders
WHERE book.bookid = orders.bookid 
GROUP BY bookname
HAVING count(orders.bookid) >= 0.3 * (SELECT count(*) FROM customer);
-- 2. �������
SELECT bookname
FROM book b1
WHERE (SELECT count(book.bookid)
        FROM book, orders
        WHERE book.bookid = orders.bookid 
        AND book.bookid = b1.bookid) >= 
        0.3 * (SELECT count(*) FROM customer);
-- ���ο� ����('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. 
-- ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���. 
INSERT INTO Book(bookid, bookname, publisher, price) VALUES(15,'������ ����', '���� �̵��', 10000);
-- '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�. 
DELETE FROM Book
WHERE publisher = '�Ｚ��';
-- '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
DELETE FROM Book
WHERE publisher = '�̻�̵��';
-- ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲپ���. 
UPDATE Book
SET publisher = '�������ǻ�'
WHERE publisher = '���ѹ̵��';