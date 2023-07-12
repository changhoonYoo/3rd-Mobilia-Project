create table heart(
    like_no number(5) PRIMARY KEY,
    p_no number(38) NOT NULL, 
    m_no   number(38)   NOT NULL  
);

select p_no from heart where m_no = 2 and p_no = 41;

create sequence heart_no_seq
start with 1
increment by 1
nocache;

drop table heart;
select * from heart;


	 select  from heart h left outer join product_list p on h.p_no = p.p_no where m_no = 2 ;

select *  from heart;

