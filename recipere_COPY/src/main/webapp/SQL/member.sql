select * from tab;
select * from seq;
select * from member;
drop table member purge;


create table member(           
  id varchar2(30) primary key       
  , pwd varchar2(50) not null          
  , name varchar2(50) not null       
  , birth varchar2(20) not null   
  , profile varchar2(100) not null   
  , nickname varchar2(50) unique not null          
  , zip varchar2(5) not null          
  , addr1 varchar2(100) not null       
  , addr2 varchar2(100) not null        
  , phone1 varchar2(30) not null       
  , phone2 varchar2(30) not null    
  , phone3 varchar2(30) not null    
  , mailid varchar2(100) not null    
  , domain varchar2(100) not null       
  , joindate date                               
  , deldate date                
  , state number(10)    
);

insert into member ( id , pwd , name , birth, profile , nickname, zip , addr1 , addr2 , phone1 , phone2 , phone3    
  , mailid , domain , joindate  , state) 
  values( 'master', 'master000', 'master' , '00', '1234','master', '12345', '서울', '레시피', '02', '1234', '5678', 'recipe', 
  'naver.com',sysdate,1);
  
insert into member ( id , pwd , name , birth, profile , nickname, zip , addr1 , addr2 , phone1 , phone2 , phone3    
  , mailid , domain , joindate  , state) 
  values( 'ymj2677', '0000', '윤민정' , '1234', '1234','00', '12345', '서울', '레시피', '02', '1234', '5678', 'ymj2677', 
  'kakao.com',sysdate,1);
  
