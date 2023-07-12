package net.mobilia.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {

	private int p_no;
	private String p_name;
	private int p_before_price;
	private int p_price;
	private int p_amount;
	private int p_sold;
	private String p_img1;
	private String p_img2;
	private int p_choice;
	private String p_class;
	private String p_category;
	private String p_date;
	private String p_info;
	private String p_color;
	private String p_size;
	
	
	private String c; //class값 get으로 받을 변수
	private String state; //카테고리값 get으로 받을 변수
	private String m; //정렬방법값 get으로 받을 변수
	
	private String find_field; //검색필드
	private String find_name; //검색어
	private int startrow;
	private int endrow;
	
	
	private String heart;
}
