create table admin(
    admin_id varchar2(50) not null --회원아이디
    ,admin_pwd varchar2(100) not null
);

insert into admin values('admin','admin');
commit;
select * from admin;