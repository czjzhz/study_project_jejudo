-- joinMember.sql
select * from tab;
select * from seq;
select * from joinMember;

drop table joinMember purge;

create table joinMember(
  	join_code number(38) unique not null 
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

/***** joinMember 테이블의 joinCode 시퀀스 생성 *****/
create sequence join_member_joincode_seq 
increment by 1 start with 1 nocache;

--drop sequence join_member_joincode_seq; 

insert into join_member (join_code,join_id,join_pwd,join_name,join_zip1,
join_zip2,join_addr1,join_addr2,join_tel,join_phone,join_email,join_regdate,
join_state)
values(join_member_joincode_seq.nextval,'aaaaa',
'77777','홍길동','745','850','서울시 마포구 대흥동','중앙정보 처리학원',
'02-7777-7777','010-9999-9999','hong@naver.com',sysdate,1);

select * from join_member;

--delete from join_member where join_code=21;

--update join_member set join_tel='032-999-9999' where join_id='bbbbb';


