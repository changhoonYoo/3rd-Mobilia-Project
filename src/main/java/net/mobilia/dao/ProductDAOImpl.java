package net.mobilia.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.mobilia.vo.CartVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.RecentlyViewedVO;
import net.mobilia.vo.ReviewVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> getNewItem(ProductVO pv) {
		return sqlSession.selectList("list_new",pv);
	}//메인 NewItem 상품 불러오기

	@Override
	public List<ProductVO> getMdChoice(ProductVO pv) {
		return sqlSession.selectList("list_md",pv);
	}//메인 Md's Choice 상품 불러오기

	@Override
	public int getListCount(ProductVO pv) {
		return sqlSession.selectOne("list_count",pv);
	}//상품리스트창 상품 개수

	@Override
	public List<ProductVO> getProductList(ProductVO pv) {
		return sqlSession.selectList("p_list",pv);
	}//상품리스트창 상품

	@Override
	public int getListCount2(ProductVO pv) {
		return sqlSession.selectOne("list_count2",pv);
	}//카테고리 선택 상품 개수

	@Override
	public List<ProductVO> getProductList2(ProductVO pv) {
		return sqlSession.selectList("p_list2",pv);
	}//카테고리 선택 상품

	@Override
	public List<ProductVO> getProductListMod(ProductVO pv) {
		return sqlSession.selectList("p_list_m",pv);
	}//정렬순서 선택 상품 

	@Override
	public List<ProductVO> getProductListMod2(ProductVO pv) {
		return sqlSession.selectList("p_list_m2",pv);
	}//카테고리+정렬순서 선택 상품

	@Override
	public ProductVO getProductInfo(int p_no) {
		return sqlSession.selectOne("p_info", p_no);
	}//상품정보

	@Override
	public int getReviewCount(int p_no) {
		return sqlSession.selectOne("r_count",p_no);
	}//리뷰 개수

	@Override
	public List<ReviewVO> getReviewList(ReviewVO rv) {
		return sqlSession.selectList("r_list",rv);
	}//리뷰 목록

	@Override
	public int insertReview(ReviewVO rv) {
		return sqlSession.insert("r_in",rv);
	}//리뷰 저장

	@Override
	public ReviewVO getReviewCont(int re_no) {
		return sqlSession.selectOne("r_info",re_no);
	}//리뷰 정보

	@Override
	public int updateReview(ReviewVO rv) {
		return sqlSession.update("r_edit",rv);
	}//리뷰 수정

	@Override
	public int delReview(int re_no) {
		return sqlSession.delete("r_del",re_no);
	}//리뷰 삭제

	@Override
	public List<ProductVO> searchProductList(ProductVO pvo) {
		return sqlSession.selectList("s_list", pvo);
	}//검색한 상품 찾기

	@Override
	public List<ProductVO> getBestSeller(ProductVO pv) {
		return sqlSession.selectList("list_best",pv);
	}//메인 BestSeller 상품 불러오기

	@Override
	public MemberVO getMemberNo(String id) {
		return sqlSession.selectOne("getMemberNo",id);
	}//세션 아이디값 기준 회원번호 불러오기

	@Override
	public void insertRecentlyViewed(RecentlyViewedVO rvo) {
		this.sqlSession.insert("insert_rv", rvo);
	}//최근 본 상품 등록

	@Override
	public int getCountRV(int m_no) {
		return sqlSession.selectOne("count_rv",m_no);
	}//최근 본 상품 개수 검색

	@Override
	public void delRecentlyViewed(int m_no) {
		this.sqlSession.delete("del_rv",m_no);
	}//가장 오래된 최근 본 상품 삭제

	@Override
	public int findRv(RecentlyViewedVO rvo) {
		return sqlSession.selectOne("findRv",rvo);
	}//최근 본 상품 중복 확인

	@Override
	public void updateRecentlyViewed(RecentlyViewedVO rvo) {
		this.sqlSession.update("update_rv",rvo);
	}//최근 본 상품 중복이 있을 경우 rv_no만 수정

	@Override
	public List<RecentlyViewedVO> getRvProductNum(int m_no) {
		return sqlSession.selectList("getRv_list",m_no);
	}//최근본 상품 불러오기

	@Override
	public CartVO getReviewAuth(CartVO cv) {
		return sqlSession.selectOne("rv_auth",cv);
	}//작성 권한 가져오기

	@Override
	public int purchaseHistory(CartVO cv) {
		return sqlSession.selectOne("purchase_his",cv);
	}//구매 이력 검색

	@Override
	public OrderVO getOrderState(String order_no) {
		return sqlSession.selectOne("getOrderState",order_no);
	}

	@Override
	public int getReviewAuths(CartVO cv) {
		return sqlSession.selectOne("rv_auths",cv);
	}

}
