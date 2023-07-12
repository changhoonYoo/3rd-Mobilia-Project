create table cart(
    cart_no number(38) primary key
    ,m_id varchar2(30) not null --회원아이디
    ,p_no number(38)  REFERENCES product_list(p_no) on delete cascade --상품번호
    ,cart_color varchar2(1000) not null --선택한 상품 색상
    ,cart_size varchar2(2000) not null --선택한 상품 사이즈
    ,amount_count number(38) not null --선택한 개수
    ,cart_price number(38) not null --선택된 상품개수 만큼의 할인적용된 총가격
    ,cart_sale_price number(38) not null --총 할인금액
    ,order_no varchar2(50) default 0
    ,review_authority number(38) default 0 --리뷰권한
    ,cart_date date
);


select p_no, amount_count from cart where order_no = 'no.1684996411204';

select * from product_list order by p_no desc;

select * from cart;

create sequence cart_no_seq
start with 1
increment by 1
nocache;

create table order_list(
    order_no varchar2(50) primary key --주문번호
    ,m_id varchar2(30) not null --주문한 회원 아이디
    ,order_name varchar(100) not null -- 주문내역 이름
    ,order_price number(38) not null -- 주문한 가격
    ,order_state number(38) default 0 --주문현황 0이면 주문목록 1이면 구매확정 -1이면 반품
    ,order_date date
);

select * from order_list;

commit;