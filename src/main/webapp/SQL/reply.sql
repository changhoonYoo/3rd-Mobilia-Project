create table reply(
    reply_no number(38) primary key --댓글 번호
    ,board_no number(38) not null --댓글이 속하는 게시물 번호
    ,FOREIGN KEY(board_no) REFERENCES board(board_no) on delete cascade --댓글이 속한 게시물 삭제시 댓글도 삭제 됨
    ,reply_id varchar2(30) not null --댓글 작성자
    ,reply_cont varchar2(4000) not null --댓글 내용
    ,reply_class number(38) default 0 --댓글과 대댓글을 구분 계층
    ,reply_group number(38) --댓글 그룹번호
    ,reply_date date --댓글 등록날짜
    ,reply_update date --댓글 수정날짜
);

insert into reply (reply_no, board_no, reply_id, reply_cont, reply_group, reply_date)
  values(reply_no_seq.nextval, 18, '테스트 댓글', '테스트 내용', reply_no_seq.nextval, sysdate);
  
commit;
delete reply;
select * from reply;

create sequence reply_no_seq
start with 1
increment by 1
nocache;
drop table reply;
drop sequence reply_no_seq;