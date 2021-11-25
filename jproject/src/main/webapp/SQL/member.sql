<<<<<<< HEAD
-- joinMember.sql
select * from tab;
select * from seq;
select * from Member;

drop table Member purge;

create table joinMember(
  	member_seq number(38) unique not null 
  	/*unique 제약 조건은 중복값을 허용하지 않고 null은 허용*/
  	
  , id varchar2(20) primary key  	 /*아이디*/
  , passwd varchar2(20) not null     /*비밀번호*/
  , name varchar2(50) not null       /*이름*/
  , nickname varchar2(50) not null   /*닉네임*/
  , zip1 varchar2(5) not null        /*첫번째 우편번호 */
  , zip2 varchar2(5)                 /*두번째 우편번호 */
  , address1 varchar2(100) not null  /*주소*/
  , address2 varchar2(100) not null  /*상세 주소 */
  , phone varchar2(20) not null      /*핸드폰번호 */
  , email varchar2(100) not null     /*이메일 주소*/
  , profile varchar2(100)            /*프로필 첨부파일명*/
  , regdate date                     /*가입 날짜*/
  , state number(10)                 /*가입회원 1, 탈퇴회원 2*/
  , delcont varchar2(4000)           /*탈퇴 이유*/
  , deldate date                     /*탈퇴일*/
);

/***** Member 테이블의 mem_seq 시퀀스 생성 *****/
create sequence Member_mem_seq_seq 
increment by 1 start with 1 nocache;

/*** Member 테이블의 mem_seq 시퀀스 생성***/
create sequence member_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;

--drop sequence Member_mem_seq_seq; 
-- drop table member_seq

=======
select * from tab;

alter table member add domain varchar2()

alter table member drop column phone3;
>>>>>>> bba230d2293b6d7445e002106de8f9bf533cc9ca
