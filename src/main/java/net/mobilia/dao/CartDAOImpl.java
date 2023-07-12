package net.mobilia.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.mobilia.vo.CartVO;
import net.mobilia.vo.OrderVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired SqlSession sqlSession;

	@Override
	public int addCart(CartVO cvo) {
		
		return sqlSession.insert("addCart", cvo);
	}

	@Override
	public int getCartData(CartVO cvo) {
		
		return sqlSession.selectOne("getCartData", cvo);
	}

	@Override
	public List<CartVO> getCartList(String m_id) {
		
		return sqlSession.selectList("getCartList", m_id);
	}

	@Override
	public void delCartData(CartVO cvo) {
		
		sqlSession.delete("delCartData", cvo);
	}

	@Override
	public void countModifyCart(CartVO cvo) {
		
		sqlSession.update("countModifyCart", cvo);
	}

	@Override
	public void changeOrderNo(CartVO cvo) {
		
		sqlSession.update("changeOrderNo", cvo);
	}

	@Override
	public CartVO get_P_No(CartVO cvo) {
		
		return sqlSession.selectOne("get_P_No", cvo);
	}
	
	@Override
	public void p_CountDown(CartVO getcvo) {
		
		sqlSession.update("p_CountDown", getcvo);
	}

	@Override
	public void addOrder(OrderVO ovo) {
		
		sqlSession.update("addOrder", ovo);
	}

}
