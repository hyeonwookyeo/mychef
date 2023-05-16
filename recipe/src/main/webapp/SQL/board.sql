--board53.sql
select * from tab;
select * from board; 

create table board(
    board_num number(38) primary key
  , board_name varchar2(50) not null
  , board_pass varchar2(30) not null
  , board_subject varchar2(100) not null
  , board_content varchar2(4000) not null
  , board_re_ref number 
  , board_re_lev number 
  , board_re_seq number 
  , board_readcount number 
  , board_date date 
);

create sequence board_num_seq
increment by 1 start with 1 nocache;
                

      
      insert into board values ('1','게시판','1234','게시판1','게시판내용','1','1','1','0',sysdate);
