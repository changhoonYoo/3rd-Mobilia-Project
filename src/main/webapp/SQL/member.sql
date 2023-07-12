--회원가입
create table m_member(
 m_no number(38) primary key
 ,m_id varchar2(50)  --아이디
 ,m_pwd varchar2(100) not null --비번
 ,m_name varchar2(30) not null --회원 이름
 ,m_post varchar2(10)  not null --우편번호
 ,m_roadAddr varchar2(100) not null  --도로명 주소
 ,m_jibunAddr varchar2(100) not null --지번 주소
 ,m_detailAddr varchar2(100) not null--상세 주소
 ,m_phone01 varchar2(10) --첫번째 자리 폰 번호
 ,m_phone02 varchar2(10) --두번째 자리
 ,m_phone03 varchar2(10) --세번째 자리
 ,mail_id varchar2(50) --메일 아이디
 ,mail_domain varchar2(100) --메일 주소
 ,m_birth01 varchar2(20)  --년
 ,m_birth02 varchar2(20) --월
 ,m_birth03 varchar2(20) --일
 ,m_date date --가입 날짜
 ,m_state number(38) --가입회원이면 1, 아니면 2
 ,m_delcont varchar2(4000) --탈퇴 사유
 ,m_deldate date --탈퇴 날짜
);

drop table m_member;

create sequence member_no_seq
start with 1 -- 1부터 시작
increment by 1 --1씩 증가
nocache;--임시 메모리 사용하지 않겠다는 뜻

drop sequence member_no_seq;

insert into m_member(m_id,m_pwd,m_name,m_post,m_roadAddr,m_jibunAddr,m_detailAddr,m_phone01,m_phone02,m_phone03,m_birth01,m_birth02,m_birth03,mail_id,mail_domain,m_date,m_state)
values('bbbbb','qwe123!','홍','07941','서울 양천구 국회대로 132','서울 양천구 신정동 938-1','101','010','1111','1111','1997','09','30','sungk97','naver.com',sysdate,1);

insert into m_member(m_id, m_pwd, m_name,m_post,m_roadAddr,m_jibunAddr,m_detailAddr,m_state) values('te','st','test계정','23','1231','123','15233',1);

update m_member set mail_id='rhb7772002' where m_id = 'test01';

select * from m_member order by m_id desc;

update m_member set m_no = 2 where m_id = 'test01';

select * from m_member where m_id='test02' and mail_id='boymail79' and mail_domain='naver.com';

delete from m_member where m_no=8;

commit;