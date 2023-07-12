package net.mobilia.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	
	private int cart_no;
	private String m_id;
	private int p_no;
	private String cart_color;
	private String cart_size;
	private int amount_count;
	private int cart_price;
	private int cart_sale_price;
	private String order_no;
	private String cart_date;
	private int review_authority;
	
	private int price;
	private int sale_price;
	
	//상품테이블 변수
	private String p_name;
	private int p_before_price;
	private int p_price;
	private String p_img1;
	private String p_class;
	private String p_category;
	
}
