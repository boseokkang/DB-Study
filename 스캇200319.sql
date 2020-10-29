-- Describe (설명)

DESC emp;


SELECT EMPNO, ENAME, SAL
FROM emp;

SELECT * 
FROM EMP;

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM EMP;

SELECT *
FROM emp
WHERE sal = 1250;

SELECT * 
FROM emp
WHERE sal = 1250 and comm > 1000;

SELECT * 
FROM emp
WHERE sal = 1250 or comm > 1000;

--ENAME 이 WARD인 사람을 검색하시오.
SELECT *
FROM emp
WHERE ename = 'WARD';

--JOB 이 SALESMAN인 사람을 검색하시오.
SELECT *
FROM emp
WHERE job = 'SALESMAN';

--JOB 이 SALESMAN이고 DEPTNO가 30인 사람을 검색하시오.
SELECT *
FROM emp 
WHERE job = 'SALESMAN' and deptno = 30;

--총무과 : 우리 회사에 job이 뭐가 있는지 보고 싶어!
SELECT DISTINCT job
FROM emp;

--총무과 : 우리 회사에 부서번호(deptno)가 뭐가 있는지 보고 싶어! 
SELECT DISTINCT deptno 부서번호
FROM emp;

DESC student;

SELECT *
FROM student
WHERE height > 169; -- ( = , > , < , >= , <= )

-- STUDENT 테이블에서 GRADE(학년)이 2학년이거나 3학년인 학생을 검색하시오. 
SELECT *
FROM student
WHERE grade = 2 or grade = 3;

-- 쿼리(query) -> 파싱(parsing) : 분석하다 = 컴파일하다
SELECT *
FROM student
WHERE grade in (2,3);

-- EMP 테이블에서 job이 SALESMAN 이거나 MANAGER 이거나 CLERK인 사람을 찾으시오.
SELECT *
FROM emp
WHERE job in ('SALESMAN', 'MANAGER', 'CLERK');

-- EMP 테이블에서 이름이 M으로 시작되는 사람을 찾으시오.
SELECT SUBSTR ('CRIS',1,1)
FROM DUAL; 

SELECT *
FROM emp
WHERE SUBSTR (ENAME,1,1) = 'M';

-- STUDENT 76년생 찾기 
SELECT *
FROM STUDENT
WHERE SUBSTR (JUMIN,1,2) = '76';

-- STUDENT에서 부산에 사는 사람을 찾으시오.
SELECT *
FROM STUDENT
WHERE SUBSTR (TEL, 1,3) = '051';

-- STUDENT에서 2월에 태어난 사람을 찾으시오.
SELECT *
FROM STUDENT 
WHERE SUBSTR (BIRTHDAY, 4,2) = '02';

SELECT SUBSTR(TEL,INSTR(TEL, ')')+1,INSTR(TEL,'-') - INSTR(TEL,')') -1), TEL, INSTR(TEL, ')')+1
FROM STUDENT;

SELECT INSTR(TEL,'-') - INSTR(TEL,')') -1, TEL
FROM STUDENT;


-- SUBSTR() 함수 예시 
-- STUDENT 테이블에서 jumin 칼럼을 사용해 1전공이 101번인 학생들의 이름과 태어난 월일, 생일 하루 전 날짜를 출력하시오.
SELECT name, SUBSTR(jumin, 3,4) "Birthday", SUBSTR(jumin,3,4)-1 "Birthday-1"
FROM STUDENT
WHERE deptno1 = 101;

-- INSTR() 함수 예시 1
-- STUDENT 테이블의 tel 컬럼을 사용하여 1 전공번호(deptno1)가 201번인 학생의 이름과 전화번호, ')'가 나오는 위치를 출력하시오.
SELECT name, tel, INSTR(tel,')')
FROM STUDENT
WHERE deptno1 = 201;


-- INSTR() 함수 예시 2
-- STUDENT 테이블에서 1 전공이 101번인 학생들의 tel 컬럼을 조회하여 3이 첫 번째로 나오는 위치를 이름과 전화번호와 함께 출력하시오.
SELECT name, tel, INSTR(tel, '3')
FROM STUDENT
WHERE deptno1 = 101;


-- INSTR() 함수 퀴즈 
-- STUDENT 테이블을 참조해서 1 전공이(deptno1) 201번인 학생의 이름과 전화번호와 지역번호를 출력하시오. 단, 지역번호는 숫자만 나오게 하기 
SELECT name, tel, 
SUBSTR
(
    TEL,
    1,
    INSTR(TEL,')')-1
) "Area Code"
FROM STUDENT
WHERE deptno1 = 201;

-- REPLACE 함수 사용해보기
SELECT REPLACE('ABC', 'AB', 'F')
FROM DUAL;


SELECT *
FROM STUDENT;


SELECT RPAD(SUBSTR(JUMIN,1,7), 13, '*')
FROM STUDENT;


SELECT REPLACE (JUMIN, SUBSTR(JUMIN, 8), '******')
FROM STUDENT;


SELECT REPLACE (JUMIN, '901813', '*******')
FROM STUDENT;

SELECT SUBSTR (JUMIN, 1,6) "주민번호 앞자리"
FROM STUDENT;

-- 전화번호의 지역번호를 별로 출력하라
SELECT TEL, REPLACE(
    TEL, 
    SUBSTR(TEL,1,INSTR(TEL,')')-1), 
    SUBSTR('***',1, INSTR(TEL, ')')-1)
    )
FROM STUDENT;


SELECT ename, sal || '$'
FROM emp;


DESC emp;
-- REPLACE() 함수 퀴즈 1
-- EMP 테이블에서 20번 부서에 소속된 직원들의 이름과 3~4번째 글자만 '-'으로 변경해서 출력하시오.
SELECT ename, REPLACE(ename, SUBSTR(ename,2,2),'--') "REPLACE"
FROM emp
WHERE deptno = 20;


DESC student;
-- REPLACE() 함수 퀴즈 2
-- STUDENT 테이블에서 1 전공(deptno1)이 101번인 학생들의 이름과 주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 '-'과 '/'로 표시되게 출력하시오.
SELECT name, jumin, REPLACE(
    JUMIN, 
    SUBSTR(JUMIN,7), '-/-/-/-') "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;

-- REPLACE() 함수 퀴즈 3
-- STUDENT 테이블에서 1 전공이 102번인 학생들의 이름과 전화번호, 전화번호에서 국번 부분만 '*' 처리하여 출력하시오. 단, 모든 국번은 3자리로 간주합니다.
SELECT name, tel, REPLACE(TEL, SUBSTR(TEL, 5,3), '***') "REPLACE"
FROM STUDENT
WHERE deptno1 = 102;

-- REPLACE() 함수 퀴즈 4
-- STUDENT 테이블에서 DEPTNO1이 101번인 학과 학생들의 이름과 전화번호와 전화번호에서 지역번호와 국번을 제외한 나머지 번호를 *로 표시해서 출력하시오.
SELECT NAME, TEL, REPLACE(
    TEL, 
    SUBSTR(TEL,INSTR(TEL,'-')+1),
    SUBSTR('****',1, INSTR(TEL,'-')+1)) "REPLACE"
FROM STUDENT
WHERE DEPTNO1 = 101;



-- INITCAP() 함수 : 입력되는 값의 첫 글자만 대문자, 나머지는 소문자로 변경하여 출력함 
SELECT ENAME, INITCAP(ENAME) "INITCAP"
FROM EMP
WHERE DEPTNO = 10;
-- LOWER() 함수 : 입력되는 값을 모두 소문자로 변경하여 출력함 
SELECT ENAME, LOWER(ENAME) "LOWER"
FROM EMP
WHERE DEPTNO = 10;
-- UPPER() 함수 : 입력되는 값을 모두 대문자로 변경하여 출력함 
SELECT ENAME, UPPER(ENAME) "UPPER"
FROM EMP
WHERE DEPTNO = 10;

-- LPAD() 함수
-- STUDENT 테이블에서 1 전공이 201번인 학과 학생들의 ID를 총 10자리로 출력하되 왼쪽 빈자리는 '*'기호로 채우시오.
SELECT NAME, ID, LPAD(ID,10,'*')
FROM STUDENT
WHERE DEPTNO1 = 201;
-- LPAD() 함수 퀴즈 
-- EMP 테이블을 사용하여 DEPTNO가 10번인 사원들의 사원 이름을 총 9바이트로 출력하되 빈자리에는 해당 자리의 숫자로 채우시오.
SELECT ENAME, LPAD(ENAME,9,'*')
FROM EMP
WHERE DEPTNO = 10;