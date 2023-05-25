
drop table admin purge;
create table admin(
	admin_id varchar2(20),
	admin_pwd varchar2(20));

select * from admin;
select * from ANNOUNCE;

insert into ANNOUNCE values (ANNOUNCE_seq.nextval,0,'게시판내용','zip',sysdate,0,'게시판','admin');
insert into ANNOUNCE values (ANNOUNCE_seq.nextval,0,'게시판내용','zip',sysdate,0,'게시판','admin_pwd');

INSERT INTO authorities (admin_id,admin_pwd, authority)
VALUES ('admin', '1234',''ROLE_ADMIN')

GRANT ROLE_ADMIN TO admin;

insert into admin values ('admin', '1234');
insert into admin values ('admin2', '1234');
insert into admin values ('admin3', '1234');
