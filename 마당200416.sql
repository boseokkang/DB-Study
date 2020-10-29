-- 수학 함수
SELECT ABS(-78), ABS(+78)
FROM DUAL;

SELECT ROUND(4.875, 1)
FROM DUAL;

SELECT custid "고객번호", ROUND(SUM(saleprice)/COUNT(*),-2) "평균금액"
FROM Orders
GROUP BY custid;

-- 문자 함수
-- 도서 제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오. 
SELECT bookid, REPLACE(bookname, '야구', '농구') bookname, publisher, price
FROM Book;
-- 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수를 확인하시오.
SELECT bookname "제목", LENGTH(bookname) "글자수", LENGTH(bookname) "바이트수"
FROM Book
WHERE publisher = '굿스포츠';
-- 마당서점의 고객 중에서 같은 성을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
SELECT SUBSTR(name, 1, 1) "성", COUNT(*) "인원"
FROM Customer
GROUP BY SUBSTR(name, 1, 1);

-- 날짜 함수
-- 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM Orders;
-- 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오.
-- 단 주문일은 'yyyy-mm-dd 요일' 형태로 표시한다. 
SELECT orderid "주문번호", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "주문일", custid "고객번호", bookid "도서번호"
FROM Orders
WHERE orderdate = TO_DATE('20140707', 'yyyymmdd');
-- DBMS 서버에 설정된 현재 시간과 오늘 날짜를 확인하시오.
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1"
FROM DUAL;

-- 내장 함수
SELECT ABS(-15)
FROM DUAL; -- 절대값

SELECT CEIL(15.7)
FROM DUAL; -- 올림

SELECT COS(3.14159)
FROM DUAL;

SELECT FLOOR(15.7)
FROM DUAL; -- 내림

SELECT LOG(10,100)
FROM DUAL; 

SELECT MOD(11,4)
FROM DUAL; -- 나누기 몫

SELECT POWER(3,2)
FROM DUAL; -- 3의 2승

SELECT ROUND(15.7)
FROM DUAL; -- 반올림

SELECT SIGN(-15)
FROM DUAL; -- 숫자가 음수면 -1, 0이면 0, 양수면 1

SELECT TRUNC(15.7)
FROM DUAL; -- 소수점 절삭

SELECT CHR(67)
FROM DUAL; --  정수 아스키코드를 문자로 반환 

SELECT CONCAT('HAPPY', 'Birthday')
FROM DUAL; -- 문자 붙이기

SELECT LOWER('Birthday')
FROM DUAL; -- 소문자 전환 

SELECT LPAD('Page 1', 15, '*.')
FROM DUAL; -- 왼쪽부터 지정한 자리 수까지 지정한 문자로 채우기

SELECT LTRIM('Page 1', 'ae')
FROM DUAL; -- 

SELECT REPLACE('JACK', 'J', 'BL')
FROM DUAL; -- 문자 바꾸기

SELECT RPAD('Page 1', 15, '*.')
FROM DUAL; -- 오른쪽에서부터 지정한 자리 수까지 지정한 문자로 채우기

SELECT RTRIM('Page 1', 'ae')
FROM DUAL;

SELECT SUBSTR('ABCDEFG', 3, 4)
FROM DUAL; -- 길이 자르기

SELECT TRIM(LEADING 0 FROM '00AA00')
FROM DUAL;

SELECT UPPER('Birthday')
FROM DUAL; -- 대문자 전환

SELECT ASCII('A')
FROM DUAL; -- 아스키코드 

SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2)
FROM DUAL;

SELECT LENGTH('Birthday')
FROM DUAL; -- 문자 길이

SELECT ADD_MONTHS('14/05/21', 1)
FROM DUAL;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '월요일')
FROM DUAL; -- 돌아오는 요일이 언제?

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