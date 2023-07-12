package net.mobilia.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {

	private int p_no;
	private String m_id;
	private String p_img1;
	private String p_name;
	private int re_no;
	private String re_cont;
	private int re_star;
	private String re_date;
	
	//페이징(쪽나누기) 관련 변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호

	//검색 기능 관련변수
	private String find_field; //검색필드
	private String find_name; //검색어
}
