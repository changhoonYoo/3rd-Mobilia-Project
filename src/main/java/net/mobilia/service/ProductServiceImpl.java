package net.mobilia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import net.mobilia.dao.ProductDAO;
import net.mobilia.vo.CartVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.RecentlyViewedVO;
import net.mobilia.vo.ReviewVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;

	@Override
	public List<ProductVO> getNewItem(ProductVO pv) {
		return productDao.getNewItem(pv);
	}

	@Override
	public List<ProductVO> getMdChoice(ProductVO pv) {
		return productDao.getMdChoice(pv);
	}

	@Override
	public int getListCount(ProductVO pv) {
		return productDao.getListCount(pv);
	}

	@Override
	public List<ProductVO> getProductList(ProductVO pv) {
		return productDao.getProductList(pv);
	}

	@Override
	public int getListCount2(ProductVO pv) {
		return productDao.getListCount2(pv);
	}

	@Override
	public List<ProductVO> getProductList2(ProductVO pv) {
		return productDao.getProductList2(pv);
	}

	@Override
	public List<ProductVO> getProductListMod(ProductVO pv) {
		return productDao.getProductListMod(pv);
	}

	@Override
	public List<ProductVO> getProductListMod2(ProductVO pv) {
		return productDao.getProductListMod2(pv);
	}

	@Override
	public ProductVO getProductInfo(int p_no) {
		return productDao.getProductInfo(p_no);
	}

	@Override
	public int getReviewCount(int p_no) {
		return productDao.getReviewCount(p_no);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO rv) {
		return productDao.getReviewList(rv);
	}

	@Override
	public int insertReview(ReviewVO rv) {
		return productDao.insertReview(rv);
	}

	@Override
	public ReviewVO getReviewCont(int re_no) {
		return productDao.getReviewCont(re_no);
	}

	@Override
	public int updateReview(ReviewVO rv) {
		return productDao.updateReview(rv);
	}

	@Override
	public int delReview(int re_no) {
		return productDao.delReview(re_no);
	}

	@Override
	public List<ProductVO> searchProductList(ProductVO pvo) {
		return productDao.searchProductList(pvo);
	}

	@Override
	public List<ProductVO> getBestSeller(ProductVO pv) {
		return productDao.getBestSeller(pv);
	}

	@Override
	public MemberVO getMemberNo(String id) {
		return productDao.getMemberNo(id);
	}

	@Override
	public void insertRecentlyViewed(RecentlyViewedVO rvo) {
		this.productDao.insertRecentlyViewed(rvo);
	}

	@Override
	public int getCountRV(int m_no) {
		return productDao.getCountRV(m_no);
	}

	@Override
	public void delRecentlyViewed(int m_no) {
		productDao.delRecentlyViewed(m_no);
	}

	@Override
	public int findRv(RecentlyViewedVO rvo) {
		return productDao.findRv(rvo);
	}

	@Override
	public void updateRecentlyViewed(RecentlyViewedVO rvo) {
		productDao.updateRecentlyViewed(rvo);
	}

	@Override
	public List<RecentlyViewedVO> getRvProductNum(int m_no) {
		return productDao.getRvProductNum(m_no);
	}

	@Override
	public CartVO getReviewAuth(CartVO cv) {
		return productDao.getReviewAuth(cv);
	}

	@Override
	public int purchaseHistory(CartVO cv) {
		return productDao.purchaseHistory(cv);
	}

	@Override
	public OrderVO getOrderState(String order_no) {
		return productDao.getOrderState(order_no);
	}

	@Override
	public int getReviewAuths(CartVO cv) {
		return productDao.getReviewAuths(cv);
	}

}
