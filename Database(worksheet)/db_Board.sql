--board table
create table board (
     num number(7,0) not null enable,
     writer varchar2(12) not null enable,
     email varchar2(30) not null enable,
     subject varchar2(50) not null enable,
     pass varchar2(10) not null enable,
     readcount number(5,0) default 0 not null enable,
     ref number(5,0) default 0 not null enable,
     step number(3,0) default 0 not null enable,
     depth number(3,0) default 0 not null enable,
     regdate timestamp (6) default sysdate not null enable,
     content varchar2(4000) not null enable,
     ip varchar2(20) not null enable,
     constraint "board_pk" primary key (num) enable
);
commit;

--board_seq ½ÃÄö½º
create sequence board_seq
start with 1
increment by 1
nomaxvalue
nocache
nocycle;


select * from board;
desc board;













