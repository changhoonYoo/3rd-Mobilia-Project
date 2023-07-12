package net.mobilia.vo;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {

	private String order_no;
	private String m_id;
	private String order_name;
	private int order_price;
	private int order_state;
	@Getter(AccessLevel.NONE)
	private String order_date;
	
	//주문조회에서 처리할 변수
	private String order_check;

	public String getOrder_date() {
		return order_date.substring(0, 4)+"년 "+order_date.substring(5, 7)+"월 "+order_date.substring(8, 10)+"일";
	}
	
	
}
