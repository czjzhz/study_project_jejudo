create table qboard(
  qno number primary key, 		/*게시판번호*/
  qsub varchar2(200) not null,	/*제목*/
  qcont varchar2(2000) not null,	/*내용*/
  qreg date,					/*작성일*/
  qdel varchar2(1),           	/*삭제 */
  qfile varchar2(100),			/*첨부파일*/
  qreadcount number  	/*조회수 */
);

create sequence boardqna_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;

select * from boardqna

insert into boardqna values(boardqna_seq.nextval,'test11','test cont11',sysdate,'n','aaa','',0);

drop table qboard;

insert into member values('aaa','1234','1234','홍길동','길동이','20','1','111','111','111','22@22.com','010-1111-1111','','',sysdate,'0')