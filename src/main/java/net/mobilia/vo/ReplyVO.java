package net.mobilia.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {

	private int reply_no; //댓글번호
	private int board_no; //댓글이 속하는 게시물 번호
	private String reply_id; // 댓글 작성 아이디
	private String reply_cont; //댓글 내용
	private int reply_class; //댓글과 대댓글 구분
	private int reply_group; //댓글 그룹번호
	private String reply_date; //댓글 등록날짜
	private String reply_update; //댓글 수정날짜
}
