select * from MAGA
select * from seq
insert into maga values(maga_seq.nextval,'제목테스트','0','0','내용테스트','0',sysdate,'1')

select count(*) from maga
delete from MAGA

update MAGA set state='0' where maga_num = '115'