package net.mobilia.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.mobilia.service.MemberService;
import net.mobilia.service.ProductService;
import net.mobilia.vo.CartVO;
import net.mobilia.vo.HeartVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.RecentlyViewedVO;
import net.mobilia.vo.ReviewVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	
	//메인화면
	@RequestMapping("/mobilia")
	public ModelAndView mobilia(ProductVO pv) throws Exception{
		
		ModelAndView plist=new ModelAndView();
		
		List<ProductVO> blist=productService.getBestSeller(pv);
		List<ProductVO> nlist=productService.getNewItem(pv);
		List<ProductVO> mlist=productService.getMdChoice(pv);
		
		plist.addObject("blist", blist);
		plist.addObject("nlist", nlist);
		plist.addObject("mlist", mlist);
		plist.setViewName("./index");
		return plist;
	}
	
	//상품 리스트창
	@RequestMapping("/product")
	public ModelAndView product(ProductVO pv,String c,String state,String m
			) throws Exception{
		
		ModelAndView bm=new ModelAndView();
		
		if(state.equals("all")) { //전체 상품
			int listCount=productService.getListCount(pv);
			List<ProductVO> plist=productService.getProductList(pv);
			bm.addObject("listCount", listCount);
			bm.addObject("plist", plist);
		}else { //카테고리별 상품
			int listCount=productService.getListCount2(pv);
			List<ProductVO> plist=productService.getProductList2(pv);
			bm.addObject("listCount", listCount);
			bm.addObject("plist", plist);
		}
		if(state.equals("all") && m != null) { //전체상품 중 정렬순서 선택 시
			int listCount=productService.getListCount(pv);
			List<ProductVO> plist=productService.getProductListMod(pv);
			bm.addObject("listCount", listCount); 
			bm.addObject("plist", plist);
		}
		if(!state.equals("all") && m != null) { //카테고리 선택, 정렬순서 선택 시
			int listCount=productService.getListCount2(pv);
			List<ProductVO> plist=productService.getProductListMod2(pv);
			bm.addObject("listCount", listCount);
			bm.addObject("plist", plist);
		}
		if(c.equals("bed")){
			bm.setViewName("./product/list_bed");
		}else if(c.equals("sofa")) {
			bm.setViewName("./product/list_sofa");
		}else if(c.equals("table")) {
			bm.setViewName("./product/list_table");
		}else if(c.equals("chair")) {
			bm.setViewName("./product/list_chair");
		}else if(c.equals("cabinet")) {
			bm.setViewName("./product/list_cabinet");
		}
		bm.addObject("state", state);
		return bm;
	}
	
	//상품 정보창
	@RequestMapping("/product_info")
	public ModelAndView product_info(HttpSession session,HttpServletRequest request,ProductVO pv,
			int p_no,ReviewVO rv) throws Exception {
		
		String id=(String)session.getAttribute("id");
		
		ModelAndView pm=new ModelAndView();
		
		pv=this.productService.getProductInfo(p_no);

		int page=1;//쪽번호
		int limit=5;//한 페이지에 보여지는 목록개수
		
		if(request.getParameter("page") != null) {//get으로 전달된 페이지 번호가 있는경우 실행
			
			page=Integer.parseInt(request.getParameter("page"));
			//페이지 번호를 정수 숫자로 변경
		}
		int listcount=this.productService.getReviewCount(p_no);//리뷰 개수
		
		/* 페이징 연산 */
		int maxpage=(int)((double)listcount/limit+0.95);//총 페이지 수
		
		int startpage=(((int)((double)page/5+0.9))-1)*5+1;//시작 페이지
		
		int endpage=maxpage;//마지막 페이지
		
		if(endpage > startpage+5-1) endpage=startpage+5-1;
		
		rv.setStartrow((page-1)*5+1);//시작행번호
	    rv.setEndrow(rv.getStartrow()+limit-1);//끝행 번호
	    List<ReviewVO> rlist=productService.getReviewList(rv);//리뷰 목록    
	    String colorList[] = pv.getP_color().split(",");
		String sizeList[] = pv.getP_size().split(",");
		String p_info = pv.getP_info().replace("\n","<br>");
		int brCount = p_info.length() - p_info.replace("<br>","").length();
		if(brCount<4) {
			p_info= p_info+"<br><br><br>";
		}else if(brCount<8) {
			p_info= p_info+"<br><br>";
		}else if(brCount<12) {
			p_info= p_info+"<br>";
		}
		
		int sale_price = pv.getP_before_price() - pv.getP_price(); //할인가격 구함
		
		String n="\n";
		
		if(id != null) { //최근 본 상품 저장
			MemberVO m = this.productService.getMemberNo(id); //세션 아이디값 기준 회원번호 찾기
			int m_no = m.getM_no();
			pm.addObject("m_no", m_no);
			HeartVO hvo = new HeartVO();
			hvo.setM_no(m_no); hvo.setP_no(p_no);
			int hre = memberService.getHeartCount(hvo);
			pm.addObject("hre", hre);
			RecentlyViewedVO rvo=new RecentlyViewedVO();
			rvo.setM_no(m_no); rvo.setP_no(p_no);
			
			int re= this.productService.findRv(rvo); //중복된 상품 검색
			if(re==1) {
				this.productService.updateRecentlyViewed(rvo); //중복 상품 rv_no 업데이트
			}else {
				int count= this.productService.getCountRV(m_no); //회원번호 기준 저장된 상품 개수
				
				if(count == 8) {
					this.productService.delRecentlyViewed(m_no); //8개 유지를 위해 가장 전에 본 상품 삭제
				}
				this.productService.insertRecentlyViewed(rvo); // 최근 본 상품 추가
			}
		}
		
		
		
		
		pm.addObject("m_id", id);
		pm.addObject("sale_price", sale_price);
		pm.addObject("pv",pv);
		pm.addObject("colorList", colorList);
		pm.addObject("sizeList", sizeList);
		pm.addObject("p_info", p_info);
		pm.addObject("page", page);//쪽번호
		pm.addObject("startpage", startpage);//시작 페이지
		pm.addObject("endpage", endpage);//마지막 페이지
		pm.addObject("maxpage", maxpage);//총 페이지 수
		pm.addObject("listcount", listcount);
		pm.addObject("rlist", rlist);
		pm.addObject("n", n); //리뷰내용 줄바꿈 위한 \n값
		pm.setViewName("./product/product_info");
		
		return pm;
	}
	
	//후기 작성창
	@RequestMapping("/review_write")
	public ModelAndView review_write(HttpSession session,HttpServletResponse response,
			int p_no,ProductVO pv) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 후 작성해주세요!');");
			out.println("self.close();");
			out.println("opener.parent.location.href='member_login';");
			out.println("</script>");
		}else {
			CartVO cv=new CartVO();
			cv.setM_id(id); cv.setP_no(p_no);
			int re=this.productService.purchaseHistory(cv); //구매 이력 검색
			if(re == 0) { //구매이력이 없을 때
				out.println("<script>");
				out.println("alert('구매하신 상품에 한해 후기 작성이 가능합니다!');");
				out.println("self.close();");
				out.println("</script>");
			}else if(re >= 1){
				int result=this.productService.getReviewAuths(cv);
				System.out.println(result);
				if(result>=2) {
					pv=this.productService.getProductInfo(p_no);
					
					ModelAndView rm=new ModelAndView();
					rm.addObject("pv",pv);
					rm.setViewName("./product/review_write");
					return rm;
				}
				
				CartVO auth = this.productService.getReviewAuth(cv);
				if(auth.getReview_authority() == 0) { //후기 작성 권한이 없을 때
					if(auth.getOrder_no().equals("0")) { //장바구니에만 있을 때
						out.println("<script>");
						out.println("alert('구매하신 상품에 한해 후기 작성이 가능합니다!');");
						out.println("self.close();");
						out.println("</script>");
					}else if(!auth.getOrder_no().equals("0")) {
						OrderVO state=this.productService.getOrderState(auth.getOrder_no());
						if(state.getOrder_state() == 0) {
							out.println("<script>");
							out.println("alert('구매확정 후에 후기 작성이 가능합니다!');");
							out.println("self.close();");
							out.println("</script>");
						}else if(state.getOrder_state() == -1){
							out.println("<script>");
							out.println("alert('구매하신 상품에 한해 후기 작성이 가능합니다!');");
							out.println("self.close();");
							out.println("</script>");
						}else {
							out.println("<script>");
							out.println("alert(' 한해 후기 작성이 가능합니다!');");
							out.println("self.close();");
							out.println("</script>");
						}
					}
				}else { //후기 작성 권한이 있으면
					pv=this.productService.getProductInfo(p_no);
					
					ModelAndView rm=new ModelAndView();
					rm.addObject("pv",pv);
					rm.setViewName("./product/review_write");
					return rm;
				}
			}
		}
		return null;
	}
	
	//후기 저장
	@RequestMapping("/review_write_ok")
	public ModelAndView review_write_ok(HttpServletResponse response,
			int p_no,ReviewVO rv) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		int re=this.productService.insertReview(rv);
		if(re==1) {
			out.println("<script>");
			out.println("alert('후기가 등록 되었습니다.');");
			out.println("opener.parent.location.reload();");//공지창을 부른 부모창을 새로고침함
			out.println("window.close();");//공지창 닫음
			out.println("</script>");
		}
		return null;
	}
	
	//후기 정보 가져오기
	@RequestMapping("/review_edit")
	public ModelAndView review_edit(HttpSession session,HttpServletResponse response,
			ReviewVO rv,int page,int re_no) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String id=(String)session.getAttribute("id");
		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 후 작성해주세요!');");
			out.println("self.close();");
			out.println("opener.parent.location.href='member_login';");
			out.println("</script>");
		}else {
			ModelAndView r=new ModelAndView();
			rv=this.productService.getReviewCont(re_no);
			r.addObject("page",page);
			r.addObject("r",rv);
			r.setViewName("./product/review_edit");
			return r;
		}
		return null;
	}
	
	//후기 수정
	@RequestMapping("/review_edit_ok")
	public void review_edit_ok(HttpServletResponse response,int page,int re_no,
			ReviewVO rv,int p_no) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int re=this.productService.updateReview(rv);
		if(re==1) {
			out.println("<script>");
			out.println("alert('후기를 수정하였습니다.');");
			out.println("self.close();");
			out.println("opener.parent.location.reload();");
			out.println("</script>");
		}
	}
	//후기 삭제
	@RequestMapping("/review_del_ok")
	public void review_del_ok(HttpServletResponse response,int p_no,int page,
			int re_no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int re=this.productService.delReview(re_no);
		if(re==1) {
			out.println("<script>");
	    	out.println("alert('삭제 되었습니다!');");
	    	out.println("location='product_info?p_no="+p_no+"&page="+page+"';");
	    	out.println("</script>");
		}
	}
	
	//상품검색
	@RequestMapping("/mobilia_search")
	public ModelAndView mobilia_search(HttpServletRequest request) 
		throws Exception{
		
		String search_text = null;
		
		if(request.getParameter("search_text") != null) {//검색어가 있다면
			search_text = request.getParameter("search_text").trim(); //양쪽 공백을 제거하고 검색어를 가져온다.
		}
		
		ProductVO pvo = new ProductVO();
		pvo.setP_name("%"+search_text+"%");
		
		List<ProductVO> plist = productService.searchProductList(pvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("plist", plist);
		mv.setViewName("/product/search_List");
		return mv;
	}
	//상품 문의
	@RequestMapping("/inquiry_write")
	public ModelAndView inquiry_write(HttpSession session,HttpServletResponse response,
			int p_no,ProductVO pv) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 후 작성해주세요!');");
			out.println("self.close();");
			out.println("opener.parent.location.href='member_login';");
			out.println("</script>");
		}else {
			pv=this.productService.getProductInfo(p_no);
			
			ModelAndView rm=new ModelAndView();
			rm.addObject("pv",pv);
			rm.setViewName("./product/inquiry_write");
			return rm;
		}
		return null;
	}
	//최근 본 상품
	@RequestMapping("/recently_viewed")
	public ModelAndView recently_viewed(HttpSession session) throws Exception{
		String id = (String)session.getAttribute("id");
		
		MemberVO m = this.productService.getMemberNo(id); //세션 아이디값 기준 회원번호 찾기
		int m_no = m.getM_no(); 
		
		List<ProductVO> plist =new ArrayList<>();
		ProductVO rvProduct=new ProductVO();
		List <RecentlyViewedVO> rvo= this.productService.getRvProductNum(m_no);
		for(RecentlyViewedVO viewed : rvo) {
			rvProduct =productService.getProductInfo(viewed.getP_no());
			plist.add(rvProduct);
		}
		ModelAndView rv=new ModelAndView();
		rv.addObject("plist", plist);
		rv.setViewName("./myshop/recently_viewed");
		return rv;
	}
}
