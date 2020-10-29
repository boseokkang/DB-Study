create sequence num increment by 1 start with 1 maxvalue 99999 cycle;

create table UserContent (
    idNumber number(5) NOT NULL PRIMARY Key,  
    IDNAME varchar2(40), -- ID �г��� 10�ڸ� 
    password varchar2(40), -- ��й�ȣ �ִ� 16�ڸ�
    name varchar2(10) -- �̸�
);

create table Room (
    roomId number(4) NOT NULL PRIMARY Key, -- �� ��ȣ
    title varchar2(100), -- �� �̸�
    password varchar2(30), -- �ִ� 16�ڸ�
    userCount varchar2(10), -- �ִ� 8�� ����
    admin varchar2(100) -- ���� �̸�
);

select *
from user_sequences;