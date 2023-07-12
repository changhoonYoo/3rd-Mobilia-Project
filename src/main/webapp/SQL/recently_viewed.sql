create table recently_viewed(
    rv_no number(38) primary key
    ,p_no number(38)  REFERENCES product_list(p_no) on delete cascade
    ,m_no number(38) REFERENCES m_member(m_no) on delete cascade
);

create sequence rv_no_seq
start with 1 -- 1부터 시작
increment by 1 --1씩 증가
nocache; --임시 메모리 사용하지 않겠다는 뜻

select * from recently_viewed order by rv_no desc;
delete from recently_viewed;
drop table recently_viewed;
drop sequence rv_no_seq;

delete from recently_viewed where rv_no = (select min(rv_no) from recently_viewed where m_no=3); 

select min(rv_no) from recently_viewed where m_no=4;

