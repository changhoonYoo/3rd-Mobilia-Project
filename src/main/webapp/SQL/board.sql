create table board(
 board_no number(38) primary key --게시물 번호
 ,board_name varchar2(30) not null --글쓴이(가입 아이디)
 ,board_type varchar2(30) not null --게시물 종류
 ,board_title varchar2(200) not null --글제목
 ,board_cont varchar2(4000) not null --글내용
 ,board_pwd varchar2(30) --게시글 비밀번호
 ,board_hit number(38) default 0 --조회수
 ,reply_cnt number(38) default 0 --게시글에 해당하는 댓글수
 ,board_date date --글쓴 날짜
 ,update_date date --수정 날짜
);
delete from board;

insert into board (board_no, board_name, board_type, board_title, board_cont) values (10000, 'admin', 'question', '자주질문', '내용없음');
insert into board (board_no, board_name, board_type, board_title, board_cont) values (10001, 'admin', 'question', '테스트 용도', '내용');

update board b
set b.reply_cnt = (select count(*) from reply r where r.board_no = b.board_no) ;

select * from board order by board_no desc;

drop table board;

create sequence board_no_seq
start with 1
increment by 1
nocache;

drop sequence qna_board_no_seq;

commit;