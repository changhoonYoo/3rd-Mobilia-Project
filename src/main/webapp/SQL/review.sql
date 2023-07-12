create table review_p(
	p_no number(38) not null		--리뷰 상품 번호
    ,FOREIGN KEY(p_no) REFERENCES product_list(p_no) on delete cascade 
	,m_id varchar2(50) not null		--아이디
	,p_img1 varchar2(150) not null	--리뷰 상품 이미지
	,p_name varchar2(50) not null	--리뷰 상품 이름
	,re_no number(38) primary key	--리뷰 번호
	,re_cont varchar2(4000) not null--리뷰 내용
	,re_star number(38) not null	--별점
	,re_date date					--등록 날짜
);

create sequence re_no_seq
start with 1 -- 1부터 시작
increment by 1 --1씩 증가
nocache; --임시 메모리 사용하지 않겠다는 뜻

---------------------------------------------------

select * from review_p order by re_no desc;
select * from (select rownum rnum,p_no,m_id,p_img1,p_name,re_no,re_cont,re_star,re_date 
from (select * from review_p order by re_no desc)) where rNum>=6 and rNum<=10 and p_no=28;
drop table review_p;

delete  review_p;
commit;
drop sequence re_no_seq;

select * from (select * from product_list where p_choice=1 order by p_no desc) where ROWNUM <= 8;