-- 조인
-- 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT *
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하시오.
SELECT *
FROM CUSTOMER C, ORDERS O 
WHERE C.CUSTID = O.CUSTID
ORDER BY C.CUSTID;
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객 별로 정렬하시오.
SELECT C.NAME, SUM(O.SALEPRICE) 
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;
-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C, BOOK B, ORDERS O 
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID;
-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C, BOOK B, ORDERS O
WHERE B.PRICE = 20000 AND B.BOOKID = O.BOOKID AND O.CUSTID = C.CUSTID; 
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
-- 가장 비싼 도서의 이름을 보이시오.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK);
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
-- 대한 미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
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
        WHERE PUBLISHER = '대한미디어'
));
-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT B1.BOOKNAME
FROM BOOK B1
WHERE B1.PRICE > 
(
    SELECT AVG(B2.PRICE)
    FROM BOOK B2
    WHERE B2.PUBLISHER = B1.PUBLISHER
);
-- 도서를 주문하지 않은 고객의 이름을 보이시오. 
SELECT NAME
FROM CUSTOMER
MINUS
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
-- 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT NAME, ADDRESS
FROM CUSTOMER C
WHERE EXISTS 
(
    SELECT *
    FROM ORDERS O
    WHERE C.CUSTID = O.CUSTID
);
-- 마당 서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- 박지성이 구매한 도서의 출판사 수 
SELECT COUNT(*) "출판사 수"
FROM (
SELECT C.NAME, B.PUBLISHER
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID AND C.NAME = '박지성')
GROUP BY NAME;
-- 답
SELECT count(distinct publisher)
FROM customer, orders, book
WHERE customer.custid = orders.custid and orders.bookid = book.bookid and name like '박지성';
-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매 가격의 차이 
SELECT C.NAME, B.BOOKNAME, (B.PRICE-O.SALEPRICE) "정가와 판매 가격 차이" 
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID AND C.NAME = '박지성';
-- 답
SELECT bookname, price, price-saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid and orders.bookid = book.bookid and name like '박지성';
-- 박지성이 구매하지 않은 도서의 이름 (EXIST, NOT EXIST, IN, MINUS)
SELECT BOOKNAME
FROM BOOK
MINUS
SELECT BOOKNAME
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID AND C.NAME = '박지성';
-- 답 minus
SELECT bookname
FROM book
minus
SELECT bookname
FROM customer, orders, book
WHERE customer.custid = orders;
-- 답 not in 
SELECT bookname
FROM book
WHERE bookname not in 
                (select bookname 
                from customer, orders, book 
                where customer.custid = orders.custid
                    and orders.bookid = book.bookid 
                    and name like '박지성');
-- 답 not exists
SELECT bookname
FROM book
WHERE not exists
                (select bookname 
                from customer, orders
                where customer.custid = orders.custid
                    and orders.bookid = book.bookid 
                    and name like '박지성');
-- 마당 서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- 주문하지 않은 고객의 이름 (조인 사용)
SELECT C.NAME
FROM CUSTOMER C
MINUS
SELECT C.NAME
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- 주문 금액의 총액과 주문의 평균 금액
SELECT SUM(SALEPRICE) "총액", AVG(SALEPRICE) "평균"
FROM ORDERS;
-- 고객의 이름과 고객별 구매액
SELECT C.NAME, SUM(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME;
-- 고객의 이름과 고객이 구매한 도서 목록
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID;
-- 도서의 가격(BOOK 테이블)과 판매가격(ORDERS 테이블)의 차이가 가장 많은 주문
SELECT *
FROM ORDERS O, BOOK B
WHERE O.BOOKID = B.BOOKID AND (B.PRICE-O.SALEPRICE) =
(
    SELECT MAX(B.PRICE-O.SALEPRICE) 
    FROM ORDERS O, BOOK B
    WHERE O.BOOKID = B.BOOKID
);
-- 답 
SELECT *
FROM book, orders
WHERE book.bookid = orders.bookid
    and price-saleprice = (select max(price-salesprice) from book, orders where book.bookid = orders.bookid);
-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT C.NAME, AVG(SALEPRICE)
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
GROUP BY C.NAME
HAVING AVG(SALEPRICE) > (SELECT AVG(SALEPRICE) FROM ORDERS);
-- 실패 쿼리
SELECT C.NAME, AVG(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.SALEPRICE >
(
    SELECT AVG(SALEPRICE)
    FROM ORDERS
)
GROUP BY C.NAME;

-- DDL (CREATE, ALTER, DROP)
-- NewBook 테이블 생성하기. 정수형은 NUMBER를, 문자형은VARCHAR2 사용
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
-- NeWBook 테이블에 VARCHART2(13)의 자료형을 가진 isbn 속성을 추가하시오.
ALTER TABLE NewBook ADD isbn VARCHAR2(13);
-- NewBook 테이블에 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오.
ALTER TABLE NewBook MODIFY isbn NUMBER;
-- NewBook 테이블의 isbn 속성을 삭제하시오.
ALTER TABLE NewBook DROP COLUMN isbn;
-- NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오.
ALTER TABLE NewBook MODIFY bookid NUMBER NOT NULL;
-- NewBook 테이블의 bookid 속성을 기본키로 변경하시오.
ALTER TABLE NewBook ADD PRIMARY KEY (bookid);

-- NewBook 테이블을 삭제하시오.
DROP TABLE NewBook;
-- NewCustomer 테이블을 삭제하시오. 만약 삭제가 거절된다면 원인을 파악하고 관련된 테이블을 같이 삭제하시오. 
DROP TABLE NewOrders;
DROP TABLE NewCustomer;


-- DML (SELECT, INSERT, DELETE, UPDATE)
-- Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 9만원
INSERT INTO Book(bookid, bookname, publisher, price) VALUES(11, '스포츠 의학', '한솔의학서적', 90000);
-- Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하십시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정
INSERT INTO Book(bookid, bookname, publisher, price) VALUES(14, '스포츠 의학', '한솔의학서적', null);
-- 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오. 
INSERT INTO Book(bookid, bookname, price, publisher)
        SELECT bookid, bookname, price, publisher
        FROM Imported_book;
-- Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오. 
UPDATE Customer
SET address = '대한민국 부산'
WHERE custid = 5;
-- Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오. 
UPDATE Customer
SET address = (SELECT address FROM Customer WHERE name = '김연아')
WHERE name LIKE '박세리';
-- Customer 테이블에서 고객번호가 5인 고객을 삭제하시오. 
DELETE FROM Customer
WHERE custid = 5;
-- 모든 고객을 삭제하시오.
DELETE FROM Customer;

-- 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT DISTINCT c.name
FROM ORDERS O, CUSTOMER C, BOOK B 
WHERE o.custid = c.custid AND b.bookid = o.bookid AND B.PUBLISHER IN 
(SELECT B.PUBLISHER
FROM ORDERS O, CUSTOMER C, BOOK B
WHERE o.custid = c.custid AND b.bookid = o.bookid AND NAME LIKE '박지성')
MINUS
SELECT C.NAME
FROM CUSTOMER C 
WHERE NAME LIKE '박지성';
-- 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름 
-- 1. GROUP BY 
SELECT C.NAME
FROM ORDERS O, CUSTOMER C, BOOK B
WHERE o.custid = c.custid AND b.bookid = o.bookid 
GROUP BY C.NAME
HAVING COUNT(distinct PUBLISHER) >= 2;
-- 2. 상관쿼리 
SELECT name
FROM customer c1
WHERE 2 <= 
(SELECT count(distinct publisher)
FROM ORDERS, CUSTOMER, BOOK
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid AND name like c1.name);
-- 전체 고객의 30% 이상이 구매한 도서
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
-- 2. 상관쿼리
SELECT bookname
FROM book b1
WHERE (SELECT count(book.bookid)
        FROM book, orders
        WHERE book.bookid = orders.bookid 
        AND book.bookid = b1.bookid) >= 
        0.3 * (SELECT count(*) FROM customer);
-- 새로운 도서('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 
-- 상입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자. 
INSERT INTO Book(bookid, bookname, publisher, price) VALUES(15,'스포츠 세계', '대한 미디어', 10000);
-- '삼성당'에서 출판한 도서를 삭제해야 한다. 
DELETE FROM Book
WHERE publisher = '삼성당';
-- '이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
DELETE FROM Book
WHERE publisher = '이상미디어';
-- 출판사 '대한미디어'가 '대한출판사'로 이름을 바꾸었다. 
UPDATE Book
SET publisher = '대한출판사'
WHERE publisher = '대한미디어';