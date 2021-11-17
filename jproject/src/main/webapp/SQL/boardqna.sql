create table qboard(
  qno number primary key, 		/*게시판번호*/
  qsub varchar2(200) not null,	/*제목*/
  qcont varchar2(2000) not null,	/*내용*/
  qreg date,					/*작성일*/
  qdel varchar2(1),           	/*삭제 */
  qfile varchar2(100),			/*첨부파일*/
  qreadcount number  	/*조회수 */
);

create sequence qboard_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;

select * from qboard

insert into qboard values(qboard_seq.nextval,'test11','test cont11',sysdate,'n','',0);

drop table qboard;