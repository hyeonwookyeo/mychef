select * from tab;
select * from seq;
select * from member;
drop table member purge;


create table member(           
  id varchar2(30) primary key       
  , pwd varchar2(50) not null          
  , name varchar2(50) not null       
  , bitrh varchar2(20) not null   
  , profile varchar2(100) not null   
  , nickname varchar2(50) unique not null          
  , zip varchar2(5) not null          
  , addr1 varchar2(100) not null       
  , addr2 varchar2(100) not null        
  , tel1 varchar2(20) not null       
  , tel2 varchar2(20) not null    
  , tel3 varchar2(20) not null    
  , email varchar2(100) not null    
  , domain varchar2(100) not null       
  , joindate date                               
  , deldate date                
  , state number(10)    
);

insert into member ( id , pwd , name , bitrh, profile , nickname, zip , addr1 , addr2 , tel1 , tel2 , tel3    
  , email , domain , joindate  , state) 
  values( 'master', 'master000', 'master' , '00', '1234','master', '12345', '서울', '레시피', '02', '1234', '5678', 'recipe', 
  'naver.com',sysdate,1);
  
  
  select * from seq;


-- 레시피 테이블
create sequence recipe_seq  start with 1 increment by 1 NOCACHE;
-- 레시피 댓글 테이블
create sequence recipe_re_seq  start with 1 increment by 1 NOCACHE;
-- 레시피 추천 테이블
create sequence recipe_recom_seq  start with 1 increment by 1 NOCACHE;
-- 커뮤니티 테이블
create sequence comm_seq  start with 1 increment by 1 NOCACHE;
-- 커뮤니티 댓글 테이블
create sequence comm_re_seq  start with 1 increment by 1 NOCACHE;

-- 매거진 테이블
create sequence maga_seq  start with 1 increment by 1 NOCACHE;
-- 매거진 댓글 테이블
create sequence mega_re_seq  start with 1 increment by 1 NOCACHE;
-- 매거진 추천 테이블
create sequence mega_recom_seq  start with 1 increment by 1 NOCACHE;
-- 공지사항 테이블
create sequence announce_seq  start with 1 increment by 1 NOCACHE;
-- 이벤트 테이블
create sequence event_seq  start with 1 increment by 1 NOCACHE;
  
  
  
