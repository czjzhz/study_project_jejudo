select * from map;

create sequence map_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;

insert into map values(
[연결게시글 번호],
map_seq.nextval,
[목적지수],
[좌표],
[메모]
);
insert into map values(
999,
map_seq.nextval,
4,
'CHR(40)||'33.502944263831004'||CHR(44)||' 126.54920252654237'||CHR(41)',
'제주시'
);
insert into map values(
999,
map_seq.nextval,
4,
(33.507216997549726, 126.95143940221003),
우
);
insert into map values(
999,
map_seq.nextval,
4,
(33.25697246353839, 126.50788687568674),
서귀포
);
insert into map values(
999,
map_seq.nextval,
4,
(33.37937091508972, 126.52508094512962),
한라
);

delete from map where ano=[숫자]