-- Describe (����)

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

--ENAME �� WARD�� ����� �˻��Ͻÿ�.
SELECT *
FROM emp
WHERE ename = 'WARD';

--JOB �� SALESMAN�� ����� �˻��Ͻÿ�.
SELECT *
FROM emp
WHERE job = 'SALESMAN';

--JOB �� SALESMAN�̰� DEPTNO�� 30�� ����� �˻��Ͻÿ�.
SELECT *
FROM emp 
WHERE job = 'SALESMAN' and deptno = 30;

--�ѹ��� : �츮 ȸ�翡 job�� ���� �ִ��� ���� �;�!
SELECT DISTINCT job
FROM emp;

--�ѹ��� : �츮 ȸ�翡 �μ���ȣ(deptno)�� ���� �ִ��� ���� �;�! 
SELECT DISTINCT deptno �μ���ȣ
FROM emp;

DESC student;

SELECT *
FROM student
WHERE height > 169; -- ( = , > , < , >= , <= )

-- STUDENT ���̺��� GRADE(�г�)�� 2�г��̰ų� 3�г��� �л��� �˻��Ͻÿ�. 
SELECT *
FROM student
WHERE grade = 2 or grade = 3;

-- ����(query) -> �Ľ�(parsing) : �м��ϴ� = �������ϴ�
SELECT *
FROM student
WHERE grade in (2,3);

-- EMP ���̺��� job�� SALESMAN �̰ų� MANAGER �̰ų� CLERK�� ����� ã���ÿ�.
SELECT *
FROM emp
WHERE job in ('SALESMAN', 'MANAGER', 'CLERK');

-- EMP ���̺��� �̸��� M���� ���۵Ǵ� ����� ã���ÿ�.
SELECT SUBSTR ('CRIS',1,1)
FROM DUAL; 

SELECT *
FROM emp
WHERE SUBSTR (ENAME,1,1) = 'M';

-- STUDENT 76��� ã�� 
SELECT *
FROM STUDENT
WHERE SUBSTR (JUMIN,1,2) = '76';

-- STUDENT���� �λ꿡 ��� ����� ã���ÿ�.
SELECT *
FROM STUDENT
WHERE SUBSTR (TEL, 1,3) = '051';

-- STUDENT���� 2���� �¾ ����� ã���ÿ�.
SELECT *
FROM STUDENT 
WHERE SUBSTR (BIRTHDAY, 4,2) = '02';

SELECT SUBSTR(TEL,INSTR(TEL, ')')+1,INSTR(TEL,'-') - INSTR(TEL,')') -1), TEL, INSTR(TEL, ')')+1
FROM STUDENT;

SELECT INSTR(TEL,'-') - INSTR(TEL,')') -1, TEL
FROM STUDENT;


-- SUBSTR() �Լ� ���� 
-- STUDENT ���̺��� jumin Į���� ����� 1������ 101���� �л����� �̸��� �¾ ����, ���� �Ϸ� �� ��¥�� ����Ͻÿ�.
SELECT name, SUBSTR(jumin, 3,4) "Birthday", SUBSTR(jumin,3,4)-1 "Birthday-1"
FROM STUDENT
WHERE deptno1 = 101;

-- INSTR() �Լ� ���� 1
-- STUDENT ���̺��� tel �÷��� ����Ͽ� 1 ������ȣ(deptno1)�� 201���� �л��� �̸��� ��ȭ��ȣ, ')'�� ������ ��ġ�� ����Ͻÿ�.
SELECT name, tel, INSTR(tel,')')
FROM STUDENT
WHERE deptno1 = 201;


-- INSTR() �Լ� ���� 2
-- STUDENT ���̺��� 1 ������ 101���� �л����� tel �÷��� ��ȸ�Ͽ� 3�� ù ��°�� ������ ��ġ�� �̸��� ��ȭ��ȣ�� �Բ� ����Ͻÿ�.
SELECT name, tel, INSTR(tel, '3')
FROM STUDENT
WHERE deptno1 = 101;


-- INSTR() �Լ� ���� 
-- STUDENT ���̺��� �����ؼ� 1 ������(deptno1) 201���� �л��� �̸��� ��ȭ��ȣ�� ������ȣ�� ����Ͻÿ�. ��, ������ȣ�� ���ڸ� ������ �ϱ� 
SELECT name, tel, 
SUBSTR
(
    TEL,
    1,
    INSTR(TEL,')')-1
) "Area Code"
FROM STUDENT
WHERE deptno1 = 201;

-- REPLACE �Լ� ����غ���
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

SELECT SUBSTR (JUMIN, 1,6) "�ֹι�ȣ ���ڸ�"
FROM STUDENT;

-- ��ȭ��ȣ�� ������ȣ�� ���� ����϶�
SELECT TEL, REPLACE(
    TEL, 
    SUBSTR(TEL,1,INSTR(TEL,')')-1), 
    SUBSTR('***',1, INSTR(TEL, ')')-1)
    )
FROM STUDENT;


SELECT ename, sal || '$'
FROM emp;


DESC emp;
-- REPLACE() �Լ� ���� 1
-- EMP ���̺��� 20�� �μ��� �Ҽӵ� �������� �̸��� 3~4��° ���ڸ� '-'���� �����ؼ� ����Ͻÿ�.
SELECT ename, REPLACE(ename, SUBSTR(ename,2,2),'--') "REPLACE"
FROM emp
WHERE deptno = 20;


DESC student;
-- REPLACE() �Լ� ���� 2
-- STUDENT ���̺��� 1 ����(deptno1)�� 101���� �л����� �̸��� �ֹε�Ϲ�ȣ�� ����ϵ� �ֹε�Ϲ�ȣ�� �� 7�ڸ��� '-'�� '/'�� ǥ�õǰ� ����Ͻÿ�.
SELECT name, jumin, REPLACE(
    JUMIN, 
    SUBSTR(JUMIN,7), '-/-/-/-') "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;

-- REPLACE() �Լ� ���� 3
-- STUDENT ���̺��� 1 ������ 102���� �л����� �̸��� ��ȭ��ȣ, ��ȭ��ȣ���� ���� �κи� '*' ó���Ͽ� ����Ͻÿ�. ��, ��� ������ 3�ڸ��� �����մϴ�.
SELECT name, tel, REPLACE(TEL, SUBSTR(TEL, 5,3), '***') "REPLACE"
FROM STUDENT
WHERE deptno1 = 102;

-- REPLACE() �Լ� ���� 4
-- STUDENT ���̺��� DEPTNO1�� 101���� �а� �л����� �̸��� ��ȭ��ȣ�� ��ȭ��ȣ���� ������ȣ�� ������ ������ ������ ��ȣ�� *�� ǥ���ؼ� ����Ͻÿ�.
SELECT NAME, TEL, REPLACE(
    TEL, 
    SUBSTR(TEL,INSTR(TEL,'-')+1),
    SUBSTR('****',1, INSTR(TEL,'-')+1)) "REPLACE"
FROM STUDENT
WHERE DEPTNO1 = 101;



-- INITCAP() �Լ� : �ԷµǴ� ���� ù ���ڸ� �빮��, �������� �ҹ��ڷ� �����Ͽ� ����� 
SELECT ENAME, INITCAP(ENAME) "INITCAP"
FROM EMP
WHERE DEPTNO = 10;
-- LOWER() �Լ� : �ԷµǴ� ���� ��� �ҹ��ڷ� �����Ͽ� ����� 
SELECT ENAME, LOWER(ENAME) "LOWER"
FROM EMP
WHERE DEPTNO = 10;
-- UPPER() �Լ� : �ԷµǴ� ���� ��� �빮�ڷ� �����Ͽ� ����� 
SELECT ENAME, UPPER(ENAME) "UPPER"
FROM EMP
WHERE DEPTNO = 10;

-- LPAD() �Լ�
-- STUDENT ���̺��� 1 ������ 201���� �а� �л����� ID�� �� 10�ڸ��� ����ϵ� ���� ���ڸ��� '*'��ȣ�� ä��ÿ�.
SELECT NAME, ID, LPAD(ID,10,'*')
FROM STUDENT
WHERE DEPTNO1 = 201;
-- LPAD() �Լ� ���� 
-- EMP ���̺��� ����Ͽ� DEPTNO�� 10���� ������� ��� �̸��� �� 9����Ʈ�� ����ϵ� ���ڸ����� �ش� �ڸ��� ���ڷ� ä��ÿ�.
SELECT ENAME, LPAD(ENAME,9,'*')
FROM EMP
WHERE DEPTNO = 10;