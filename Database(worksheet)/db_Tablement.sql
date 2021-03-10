create table tablement (
    id number(10,0) not null enable,
    name varchar2(20) not null enable,
    content varchar2(4000) not null enable,
    constraint "tablement_pk" primary key(id) enable);
    
create sequence "tablement_seq"
minvalue 1
maxvalue 9999999
increment by 1 
start with 60
nocache
noorder
nocycle;
    
commit;