select * from MAGA
select * from seq
insert into maga values(maga_seq.nextval,'제목테스트','0','0','내용테스트','0',sysdate,'1')

select count(*) from maga
delete from MAGA

update MAGA set state='0' where maga_num = '115'
select * from tab
select * from seq
select * from maga_recom
select * from maga_re

alter table maga_re drop column re_write

insert into maga_re values(maga_re_seq.nextval, 135, 'master', '댓글테스트2', sysdate, '0', 1, 1, 1)
