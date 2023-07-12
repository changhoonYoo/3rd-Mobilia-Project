package net.mobilia.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.mobilia.vo.CartVO;
import net.mobilia.vo.HeartVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO m) {
	
		this.sqlSession.insert("m_in",m);
	}

	@Override
	public MemberVO loginCheck(String m_id) {
	
		return this.sqlSession.selectOne("m_data", m_id);
	}

	@Override
	public MemberVO getMemData(String m_id) {
		
		return this.sqlSession.selectOne("m_data", m_id);
	}
	
	
	@Override
	public void updateMember(MemberVO m) {
		
		this.sqlSession.update("m_edit", m);
	}

	@Override
	public void changePwd(MemberVO mvo) {
		
		this.sqlSession.update("changePwd", mvo);
	}

	@Override
	public void delMemData(MemberVO m) {
		
		this.sqlSession.update("m_del", m);
	}

	@Override
	public MemberVO idCheck(String id) {
		
		return this.sqlSession.selectOne("m_idcheck",id);
	}

	@Override
	public MemberVO idMember(MemberVO m) {
		
		return this.sqlSession.selectOne("get_id", m);
	}

	@Override
	public void updatePassword(MemberVO mv) {
		this.sqlSession.update("m_updatePassword",mv);
	}

	@Override
	public int searchMember(MemberVO m) {
		return this.sqlSession.selectOne("search_m",m);
	}

	
	
	
	
	@Override
	public int getOrderCount(OrderVO ovo) {
		
		return this.sqlSession.selectOne("getOrderCount", ovo);
	}

	@Override
	public List<OrderVO> getOrderList(OrderVO getovo) {
		
		return this.sqlSession.selectList("getOrderList", getovo);
	}

	@Override
	public void orderConfirm(String order_no) {
		
		this.sqlSession.update("orderConfirm", order_no);
	}

	@Override
	public void reviewAuthority(String order_no) {
		
		this.sqlSession.update("reviewAuthority", order_no);
	}

	@Override
	public List<CartVO> getReturnList(String order_no) {
		
		return this.sqlSession.selectList("getReturnList", order_no);
	}

	@Override
	public void pCountReturn(CartVO cvo) {

		this.sqlSession.update("pCountReturn", cvo);
	}

	@Override
	public void orderReturn(String order_no) {
		
		this.sqlSession.update("orderReturn", order_no);
	}

	@Override
	public List<CartVO> getOrderDetailList(String order_no) {
		
		return this.sqlSession.selectList("getOrderDetailList", order_no);
	}


	@Override
	public List<HeartVO> getHeartList(int m_no) {
		
		return this.sqlSession.selectList("getHeartList",m_no);
	}


	@Override
	public void addHeart(HeartVO gethvo) {
		this.sqlSession.insert("addHeart",gethvo);
		
	}

	@Override
	public int selectHeart(HeartVO gethvo) {
		
		return this.sqlSession.selectOne("selectHeart", gethvo);
	}

	@Override
	public void delHeart(HeartVO gethvo) {
		this.sqlSession.selectOne("delHeart",gethvo);
		
	}

	@Override
	public int getHeartCount(HeartVO hvo) {
		
		return this.sqlSession.selectOne("getHeartCount", hvo);
	}

}
