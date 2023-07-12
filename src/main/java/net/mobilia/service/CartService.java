package net.mobilia.service;

import java.util.List;

import net.mobilia.vo.CartVO;
import net.mobilia.vo.OrderVO;

public interface CartService {

	int addCart(CartVO cvo);

	int getCartData(CartVO cvo);

	List<CartVO> getCartList(String m_id);

	void delCartData(CartVO cvo);

	void countModifyCart(CartVO cvo);

	CartVO change_getP_No(CartVO cvo);
	
	void p_CountDown(CartVO getcvo);

	void addOrder(OrderVO ovo);

}
