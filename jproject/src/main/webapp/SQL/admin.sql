select * from admin;
insert into admin values('admin','1234')
delete from admin where adminid='admin'

select * from MEMBER;





select * from adminnotice;

create sequence adminnotice_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;

create sequence adminad_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;

insert into adminnotice values(
adminnotice_seq.nextval,
'공지제목',
'공지내용',
sysdate,
0
);

insert into adminad values(
adminad_seq.nextval,
'더미 제목',
'더미 내용',
sysdate
);


