package net.mobilia.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.mobilia.service.CartService;
import net.mobilia.service.MemberService;
import net.mobilia.service.ProductService;
import net.mobilia.vo.CartVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.OrderVO;
import net.mobilia.vo.ProductVO;

@Controller
public class CartController {

	@Autowired CartService cartService;
	@Autowired MemberService memberService;
	@Autowired ProductService productService;
	
	@RequestMapping("/cart_main")
	public ModelAndView cart_list(HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String m_id = (String)session.getAttribute("id");

		if(m_id == null) {
			out.println("<script>");
			out.println("alert('장바구니는 로그인후 확인이 가능합니다');");
			out.println("location='member_login';");
			out.println("</script>");

			return null;
		}else {
			List<CartVO> cvo = cartService.getCartList(m_id);
			MemberVO mvo = memberService.getMemData(m_id);
			String email = mvo.getMail_id()+"@"+mvo.getMail_domain();
			ModelAndView mv = new ModelAndView();
			mv.addObject("m_id", m_id);
			mv.addObject("email", email);
			mv.addObject("mvo", mvo);
			mv.addObject("cvo", cvo);
			mv.setViewName("cart/cart_list");
			return mv;
		}
	}

	@RequestMapping(value="/cart/add")
	@ResponseBody
	ResponseEntity<String> addCart(@RequestBody CartVO cvo){
		ResponseEntity<String> entity = null;
		
		try {
			int data = cartService.getCartData(cvo);//상품이 등록되어있는지 확인한다.

			if(data == 1) {//만약 이미 상품이 등록되어있다면
				entity = new ResponseEntity<String>("ADDFALSE", HttpStatus.OK);
			}else {//상품이 등록되어있지 않다면
				ProductVO pvo = productService.getProductInfo(cvo.getP_no());
				if(pvo.getP_amount() >= cvo.getAmount_count()) {
					cartService.addCart(cvo);//장바구니에 상품을 추가
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}else {
					entity = new ResponseEntity<String>("COUNTFALSE", HttpStatus.OK);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
			e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/cart/count_modify")
	@ResponseBody
	ResponseEntity<String> count_modify(@RequestBody CartVO cvo, HttpSession session){
		ResponseEntity<String> entity = null;
		try {
				ProductVO pvo = productService.getProductInfo(cvo.getP_no());//개수 업데이트할 상품번호를 기준으로 재고수량을 가져온다.
				if(pvo.getP_amount() >= cvo.getAmount_count()) { //재고수량보다 업데이트할 수량이 작거나 같다면
					cartService.countModifyCart(cvo);//장바구니에 상품을 추가
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}else {
					entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
				}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/cart/delete")
	@ResponseBody
	ResponseEntity<String> deleteCart(@RequestBody CartVO cvo){
		ResponseEntity<String> entity = null;
		try {
			cartService.delCartData(cvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
			e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/cart/select_delete")
	@ResponseBody
	ResponseEntity<String> select_deleteCart(HttpServletRequest request){
		ResponseEntity<String> entity = null;
		
		try {
			
			CartVO cvo = new CartVO();
			String[] cart_noArr = request.getParameterValues("cart_noArr");
			
			for(int a = 0; a < cart_noArr.length; a++) {
				cvo.setCart_no(Integer.parseInt(cart_noArr[a]));
				cartService.delCartData(cvo);
			}
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
			e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/cart/select_order_ok")
	@ResponseBody
	ResponseEntity<String> select_order_ok(HttpServletRequest request, String order_no,
			String m_id, String order_name, String order_price){
		ResponseEntity<String> entity = null;
		
		try {
			CartVO cvo = new CartVO();
			String[] change_cart_noArr = request.getParameterValues("change_cart_noArr");
			cvo.setOrder_no("no."+order_no);
			
			for(int a = 0; a < change_cart_noArr.length; a++) {
				cvo.setCart_no(Integer.parseInt(change_cart_noArr[a]));
				CartVO getcvo = cartService.change_getP_No(cvo);// 장바구니 상품목록 같은 주문 번호로 변경하고 해당 상품번호와 개수 구하기
				cartService.p_CountDown(getcvo); //해당상품 수량감소
			}
			OrderVO ovo = new OrderVO();
			ovo.setM_id(m_id); ovo.setOrder_name(order_name);
			ovo.setOrder_no("no."+order_no); ovo.setOrder_price(Integer.parseInt(order_price));
			cartService.addOrder(ovo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
			e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/cart/each_order_ok")
	@ResponseBody
	ResponseEntity<String> each_order_ok(HttpServletRequest request, String order_no,
			String m_id, String order_name, String order_price, int cart_no){
		ResponseEntity<String> entity = null;
		
		try {
			CartVO cvo = new CartVO();
			cvo.setOrder_no("no."+order_no);
			
			cvo.setCart_no(cart_no);
			CartVO getcvo = cartService.change_getP_No(cvo);
			cartService.p_CountDown(getcvo); //해당상품 수량감소

			OrderVO ovo = new OrderVO();
			ovo.setM_id(m_id); ovo.setOrder_name(order_name);
			ovo.setOrder_no("no."+order_no); ovo.setOrder_price(Integer.parseInt(order_price));
			cartService.addOrder(ovo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
			e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
