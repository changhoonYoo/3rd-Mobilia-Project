package net.mobilia.dao;

import java.util.List;

import net.mobilia.vo.AdminVO;
import net.mobilia.vo.BoardVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.ReviewVO;

public interface AdminDAO {

	int getListCount(ProductVO pv);
	List<ProductVO> getProductList(ProductVO pv);
	int getMemberCount(MemberVO mv);
	List<MemberVO> getMemberList(MemberVO mv);
	int insertProduct(ProductVO pv);
	ProductVO getProduct(int p_no);
	int updateProduct(ProductVO pv);
	int delProduct(int p_no);
	int getMember(String m_id);
	void delMember(MemberVO m);
	int getReviewCount(ReviewVO rv);
	List<ReviewVO> getReviewList(ReviewVO rv);
	int delReview(int re_no);
	AdminVO adminCheck(String admin_id);
	int getQnaCount(BoardVO bv);
	List<BoardVO> getQnaList(BoardVO bv);
}
