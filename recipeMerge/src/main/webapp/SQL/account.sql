-- 1차 프로젝트용 DB 계정 생성 및 권한 부여
create user cooker identified by cooker123;
grant connect, resource to cooker;