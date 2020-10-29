create sequence num increment by 1 start with 1 maxvalue 99999 cycle;

create table UserContent (
    idNumber number(5) NOT NULL PRIMARY Key,  
    IDNAME varchar2(40), -- ID 닉네임 10자리 
    password varchar2(40), -- 비밀번호 최대 16자리
    name varchar2(10) -- 이름
);

create table Room (
    roomId number(4) NOT NULL PRIMARY Key, -- 방 번호
    title varchar2(100), -- 방 이름
    password varchar2(30), -- 최대 16자리
    userCount varchar2(10), -- 최대 8명 입장
    admin varchar2(100) -- 방장 이름
);

select *
from user_sequences;