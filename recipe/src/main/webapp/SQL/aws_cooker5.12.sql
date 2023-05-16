select * from seq;
select * from board;
drop table member purge;

drop table boardcook purge;

DROP SEQUENCE boardcook_num_seq

create sequence boardcook_num_seq
increment by 1 start with 1 nocache;

create table boardcook(
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

insert into boardcook(board_num,board_name,board_pass,board_subject,board_content,board_re_ref,board_re_lev,
     board_re_seq,board_readcount,board_date)
      values(board_seq.nextval,'1','김김','1234','게시판','게시판1','0','0','0',sysdate,1);     


-- ������ ���̺�
create sequence recipe_seq  start with 1 increment by 1 NOCACHE;
-- ������ ��� ���̺�
create sequence recipe_re_seq  start with 1 increment by 1 NOCACHE;
-- ������ ��õ ���̺�
create sequence recipe_recom_seq  start with 1 increment by 1 NOCACHE;
-- Ŀ�´�Ƽ ���̺�
create sequence comm_seq  start with 1 increment by 1 NOCACHE;
-- Ŀ�´�Ƽ ��� ���̺�
create sequence comm_re_seq  start with 1 increment by 1 NOCACHE;

-- �Ű��� ���̺�
create sequence maga_seq  start with 1 increment by 1 NOCACHE;
-- �Ű��� ��� ���̺�
create sequence mega_re_seq  start with 1 increment by 1 NOCACHE;
-- �Ű��� ��õ ���̺�
create sequence mega_recom_seq  start with 1 increment by 1 NOCACHE;
-- �������� ���̺�
create sequence announce_seq  start with 1 increment by 1 NOCACHE;
-- �̺�Ʈ ���̺�
create sequence event_seq  start with 1 increment by 1 NOCACHE;



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

create sequence board_seq
increment by 1 start with 1 nocache;

insert into board(board_num,board_name,board_pass,board_subject,board_content,board_re_ref,board_re_lev,
     board_re_seq,board_readcount,board_date)
      values(board_seq.nextval,'1','김김','1234','게시판','게시판1','0','0','0',sysdate);
  
       insert into board values ('1','게시판','1234','게시판1','게시판내용','1','1','1','0',sysdate);



