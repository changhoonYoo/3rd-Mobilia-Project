package net.mobilia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import net.mobilia.dao.MemberDAO;
import net.mobilia.vo.CartVO;
import net.mobilia.vo.HeartVO;
import net.mobilia.vo.MailVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDao;
	
	@Autowired
	private MailSender mailSender;

	@Override
	public void insertMember(MemberVO m) {
		
		this.mDao.insertMember(m);
	}

	@Override
	public MemberVO loginCheck(String m_id) {
		
		return this.mDao.loginCheck(m_id);
	}

	@Override
	public MemberVO getMemData(String m_id) {
		
		return this.mDao.getMemData(m_id);
	}

	@Override
	public void updateMember(MemberVO m) {
	
		this.mDao.updateMember(m);
	}

	@Override
	public void changePwd(MemberVO mvo) {
		
		this.mDao.changePwd(mvo);
	}
	
	@Override
	public void delMemData(MemberVO m) {
		
		this.mDao.delMemData(m);
	}

	@Override
	public MemberVO idCheck(String id) {
		
		return this.mDao.idCheck(id);
	}

	@Override
	public MemberVO idMember(MemberVO m) {
		
		return this.mDao.idMember(m);
	}
	//메일 생성, 임시비번으로 회원비번 변경
	@Override
	public MailVO createMailAndChangePassword(String memberEmail, String m_id) {
		String str = getTempPassword();
		MailVO mv = new MailVO();
		mv.setAddress(memberEmail);
		mv.setTitle("mobilia 임시비밀번호 안내 이메일 입니다.");
		mv.setMessage("안녕하세요. mobilia 임시비밀번호 안내 관련 이메일 입니다.\n" + " 회원님의 임시 비밀번호는\n "
				+ str + "\n 입니다." + " 로그인 후에 비밀번호를 변경을 해주세요");
		updatePassword(str,m_id);
		return mv;
	}
	//임시 비밀번호로 회원 비밀번호 변경
	private void updatePassword(String str, String m_id) {
		String memberPassword = str;
        String memberId = m_id;
        MemberVO mv=new MemberVO();
        mv.setM_id(memberId);
        mv.setM_pwd(memberPassword);
        mDao.updatePassword(mv);
	}
	//메일보내기
	@Override
	public void mailSend(MailVO mv) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mv.getAddress());
        message.setSubject(mv.getTitle());
        message.setText(mv.getMessage());
        message.setFrom("@naver.com");
        message.setReplyTo("@naver.com");
        mailSender.send(message);
	}
	//랜덤함수로 임시비밀번호 구문 만들기
	public String getTempPassword(){
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		// 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	@Override
	public int searchMember(MemberVO m) {
		return this.mDao.searchMember(m);
	}
	
	@Override
	public int getOrderCount(OrderVO ovo) {
		
		return this.mDao.getOrderCount(ovo);
	}

	@Override
	public List<OrderVO> getOrderList(OrderVO getovo) {
		
		return this.mDao.getOrderList(getovo);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public void orderConfirm(String order_no) {
		this.mDao.orderConfirm(order_no);
		this.mDao.reviewAuthority(order_no);
	}

	@Override
	public List<CartVO> getReturnList(String order_no) {
		
		return this.mDao.getReturnList(order_no);
	}

	@Override
	public void pCountReturn(CartVO cvo) {
		
		this.mDao.pCountReturn(cvo);
	}

	@Override
	public void orderReturn(String order_no) {
		
		this.mDao.orderReturn(order_no);
	}

	@Override
	public List<CartVO> getOrderDetailList(String order_no) {
		
		return this.mDao.getOrderDetailList(order_no);
	}

	@Override
	public List<HeartVO> getHeartList(int m_no) {
		
		return this.mDao.getHeartList(m_no);
	}

	@Override
	public void addHeart(HeartVO gethvo) {
		
		this.mDao.addHeart(gethvo);
	}

	@Override
	public int selectHeart(HeartVO gethvo) {
		
		return this.mDao.selectHeart(gethvo);
	}

	@Override
	public void delHeart(HeartVO gethvo) {
		this.mDao.delHeart(gethvo);
	}

	@Override
	public int getHeartCount(HeartVO hvo) {
		
		return this.mDao.getHeartCount(hvo);
	}



	

}
