package net.mobilia.service;

import java.util.List;

import net.mobilia.vo.CartVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.RecentlyViewedVO;
import net.mobilia.vo.ReviewVO;

public interface ProductService {

	List<ProductVO> getNewItem(ProductVO pv);
	List<ProductVO> getMdChoice(ProductVO pv);
	int getListCount(ProductVO pv);
	List<ProductVO> getProductList(ProductVO pv);
	int getListCount2(ProductVO pv);
	List<ProductVO> getProductList2(ProductVO pv);
	List<ProductVO> getProductListMod(ProductVO pv);
	List<ProductVO> getProductListMod2(ProductVO pv);
	ProductVO getProductInfo(int p_no);
	int getReviewCount(int p_no);
	List<ReviewVO> getReviewList(ReviewVO rv);
	int insertReview(ReviewVO rv);
	ReviewVO getReviewCont(int re_no);
	int updateReview(ReviewVO rv);
	int delReview(int re_no);
	List<ProductVO> searchProductList(ProductVO pvo);
	List<ProductVO> getBestSeller(ProductVO pv);
	MemberVO getMemberNo(String id);
	void insertRecentlyViewed(RecentlyViewedVO rvo);
	int getCountRV(int m_no);
	void delRecentlyViewed(int m_no);
	int findRv(RecentlyViewedVO rvo);
	void updateRecentlyViewed(RecentlyViewedVO rvo);
	List<RecentlyViewedVO> getRvProductNum(int m_no);
	CartVO getReviewAuth(CartVO cv);
	int purchaseHistory(CartVO cv);
	OrderVO getOrderState(String order_no);
	int getReviewAuths(CartVO cv);
}
