package net.mobilia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import net.mobilia.dao.CartDAO;
import net.mobilia.vo.CartVO;
import net.mobilia.vo.OrderVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired CartDAO cartDao;

	@Override
	public int addCart(CartVO cvo) {
		
		return cartDao.addCart(cvo);
	}

	@Override
	public int getCartData(CartVO cvo) {
		
		return cartDao.getCartData(cvo);
	}

	@Override
	public List<CartVO> getCartList(String m_id) {
		
		return cartDao.getCartList(m_id);
	}

	@Override
	public void delCartData(CartVO cvo) {
		
		cartDao.delCartData(cvo);
	}

	@Override
	public void countModifyCart(CartVO cvo) {
		
		cartDao.countModifyCart(cvo);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public CartVO change_getP_No(CartVO cvo) {
		
		cartDao.changeOrderNo(cvo);
		return cartDao.get_P_No(cvo);
	}

	@Override
	public void p_CountDown(CartVO getcvo) {
		
		cartDao.p_CountDown(getcvo);
	}
	
	@Override
	public void addOrder(OrderVO ovo) {
		
		cartDao.addOrder(ovo);
	}

}
