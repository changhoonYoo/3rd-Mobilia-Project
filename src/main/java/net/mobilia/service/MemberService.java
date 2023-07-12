package net.mobilia.service;

import java.util.List;

import net.mobilia.vo.CartVO;
import net.mobilia.vo.HeartVO;
import net.mobilia.vo.MailVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;

public interface MemberService {

	void insertMember(MemberVO m);

	MemberVO loginCheck(String m_id);

	MemberVO getMemData(String m_id);

	void updateMember(MemberVO m);
	
	void changePwd(MemberVO mvo);

	void delMemData(MemberVO m);

	MemberVO idCheck(String id);

	MemberVO idMember(MemberVO m);
	
	MailVO createMailAndChangePassword(String memberEmail, String m_id);

	void mailSend(MailVO mv);

	int searchMember(MemberVO m);
	
	int getOrderCount(OrderVO ovo);

	List<OrderVO> getOrderList(OrderVO getovo);

	void orderConfirm(String order_no);

	List<CartVO> getReturnList(String order_no);

	void pCountReturn(CartVO cvo);

	void orderReturn(String order_no);

	List<CartVO> getOrderDetailList(String order_no);

	List<HeartVO> getHeartList(int m_no);

	void addHeart(HeartVO gethvo);

	int selectHeart(HeartVO gethvo);

	void delHeart(HeartVO gethvo);

	int getHeartCount(HeartVO hvo);

}
