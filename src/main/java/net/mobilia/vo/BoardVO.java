package net.mobilia.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private int board_no; //게시물 번호
	private String board_name; //글쓴이
	private String board_type; //게시물 종류
	private String board_title; //글제목
	private String board_cont; //글내용
	private String board_pwd; // 게시글 비밀번호
	private int board_hit; //조회수
	private int reply_cnt; //개시글에 해당하는 댓글개수
	private String board_date; //등록날짜
	private String update_date; //수정 날짜
	
	private String pwd_text; //qna에서 입력한 비밀번호를 가져오기 위한 변수
	
	//페이징 관련변수
	private int startrow;//시작 번호
	private int endrow;//끝 번호
	
	//검색 기능 관련변수
	private String find_field; //검색필드
	private String find_name; //검색어
}
