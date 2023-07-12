package net.mobilia.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.mobilia.service.MemberService;
import net.mobilia.vo.MailVO;
import net.mobilia.vo.MemberVO;


@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	//회원가입 창으로 이동
	@RequestMapping("/member_join")
	public ModelAndView member_join() throws Exception {

		String[] phone= {"010","011","016"};
		String[] email= {"----선택----","naver.com","daum.net","gmail.com","nate.com","직접 입력"};

		ModelAndView m=new ModelAndView();
		
		m.addObject("phone",phone);
		m.addObject("email",email);
		m.setViewName("member/join");

		return m;
	}

	
	//아이디 중복 검색
	@RequestMapping("/member_idcheck")
	public ModelAndView member_idcheck(String id,HttpServletResponse response)
		throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
			
		MemberVO db_id=this.memberService.idCheck(id);
			
		int re=-1;
			
		if(db_id != null) { 
			re=1;			
		}
		out.println(re);
			
		return null;
		}
	
	
	//회원가입 완료
	@RequestMapping("/member_join_ok")
	public ModelAndView member_join_ok(MemberVO m,HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		this.memberService.insertMember(m);

		out.println("<script>");
		out.println("alert('회원 가입을 축하드립니다!');");
		out.println("location='member_login';");
		out.println("</script>");
		
		return null;
	}

	//로그인 창
	@RequestMapping("/member_login")
	public ModelAndView member_login(){
		return new ModelAndView("member/login");
	}

	//로그인 완료
	@RequestMapping("/member_login_ok")
	public String member_login_ok( HttpServletResponse response,
			HttpServletRequest request, HttpSession session,
			@RequestParam("m_id") String m_id,
			@RequestParam("m_pwd") String m_pwd
			) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		MemberVO m = this.memberService.loginCheck(m_id);

		if(m == null) {
			out.println("<script>");
			out.println("alert('가입 안된 회원입니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!m.getM_pwd().equals(m_pwd)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.go(-1);");
				out.println("</script>");
			}else {
				session.setAttribute("id", m_id);
				return "redirect:/mobilia";
			}
		}
		return null;
	}

	//로그아웃
	@RequestMapping("/member_logout")
	public String member_logout(HttpServletResponse response, HttpSession session) 
			throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		session.invalidate();//세션 만료 => 로그아웃

		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='/mobilia';");
		out.println("</script>");
		
		return null;
	}
	
	//아이디 찾기
	@RequestMapping("/find_id")
	public ModelAndView find_id(HttpSession session, HttpServletResponse response) 
			throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("find_account/find_id");
		
		return mv;
	
	}
	
	//비밀번호 찾기
	@RequestMapping("/find_pwd")
	public ModelAndView find_pwd(HttpSession session, HttpServletResponse response) 
			throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id = (String)session.getAttribute("id");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("find_account/find_pwd");
		
		return mv;
	
	}
	//아이디 찾기완료 
	@RequestMapping("/find_id_ok")
	public ModelAndView find_id_ok(HttpSession session, HttpServletResponse response,
			HttpServletRequest request, MemberVO m) 
					throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id_email = request.getParameter("m_email");
		
		String[] email = id_email.split("@");
		
		m.setMail_id(email[0]); m.setMail_domain(email[1]);
		
		MemberVO pm2=memberService.idMember(m);//아이디와 회원이름을 기준으로 오라클로 부터 회원정보를 검색
		
		if(pm2 == null) {
			out.println("<script>");
			out.println("alert('회원정보를 찾을 수 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("pm2", pm2);
			mv.setViewName("find_account/find_id_ok");
			
			return mv;
		}
		return null;
	}
	//비밀번호 찾기완료
    @Transactional
	@RequestMapping(value="/sendEmail")
	public ResponseEntity<String> sendEmail(@RequestParam("m_email") String memberEmail,
			@RequestParam("m_id") String m_id) throws Exception{

    	ResponseEntity<String> entity=null;
    	String[] email = memberEmail.split("@");
    	MemberVO m=new MemberVO();
    	m.setM_id(m_id); m.setMail_id(email[0]); m.setMail_domain(email[1]);
    	try {
    		int re=memberService.searchMember(m);
    		if(re==1) {
    			MailVO mv = memberService.createMailAndChangePassword(memberEmail,m_id);
    			memberService.mailSend(mv);
    			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    		}else {
    			entity = new ResponseEntity<String>("NOUSER", HttpStatus.OK);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    		entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
    	}
        return entity;
    }
	//회원정보 수정 창
	@RequestMapping("/modify")
	public ModelAndView modify(HttpSession session, HttpServletResponse response) 
			throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String m_id = (String)session.getAttribute("id");

		if(m_id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {

			MemberVO mvo = memberService.getMemData(m_id);

			String[] phone = {"010", "011", "016", "017", "018", "019"};
			String[] email = {"naver.com", "daum.net", "gmail.com", "nate.com", "직접 입력"};

			ModelAndView mv = new ModelAndView();
			mv.addObject("phone", phone);
			mv.addObject("email", email);
			mv.addObject("mvo", mvo);
			mv.setViewName("member/modify");

			return mv;
		}

		return null;
	}

	//회원정보 수정 완료
	@RequestMapping("/modify_ok")
	public String modify(HttpSession session, HttpServletResponse response,
			HttpServletRequest request, MemberVO m) 
					throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String m_id = (String)session.getAttribute("id");
		
		MemberVO pwdvo = memberService.getMemData(m_id);//회원정보에서 비밀번호를 pwdvo로 저장

		if(!pwdvo.getM_pwd().equals(m.getM_pwd())) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {

			m.setM_id(m_id);
			this.memberService.updateMember(m);

			out.println("<script>");
			out.println("alert('회원정보 수정 성공!');");
			out.println("location='/modify';");
			out.println("</script>");
		}
		return null;
	}

	@RequestMapping("/member_pwd_change")
	public String member_pwd_change(HttpSession session, HttpServletResponse response,
			HttpServletRequest request, String before_pwd, String change_pwd) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String m_id = (String)session.getAttribute("id");
		
		MemberVO pwdvo = memberService.getMemData(m_id);
		if(!pwdvo.getM_pwd().equals(before_pwd)) {
			out.println("<script>");
			out.println("alert('현재 비밀번호가 일치하지 않습니다');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			MemberVO mvo = new MemberVO();
			mvo.setM_pwd(change_pwd); mvo.setM_no(pwdvo.getM_no());
			memberService.changePwd(mvo);
			
			out.println("<script>");
			out.println("alert('비밀번호 변경 성공!');");
			out.println("location='/modify';");
			out.println("</script>");
		}
		return null;
	}
	
	//회원탈퇴 안내창
	@RequestMapping("/member_del_info")
	public ModelAndView member_del(HttpSession session, HttpServletResponse response) 
			throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id = (String)session.getAttribute("id");

		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			return new ModelAndView("member/del_info");
		}
		return null;
	}

	//회원탈퇴 완료
	@RequestMapping("/member_del_ok")
	public String member_del_ok(HttpSession session, HttpServletResponse response,
			HttpServletRequest request, MemberVO m) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String m_id=(String)session.getAttribute("id");

		if(m_id==null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			request.setCharacterEncoding("UTF-8");

			String del_pwd = request.getParameter("del_pwd");

			MemberVO mvo = memberService.getMemData(m_id);

			if(!mvo.getM_pwd().equals(del_pwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다!');");
				out.println("window.location = document.referrer;");//이전 페이지로 이동하면서 새로고침 하기(탈퇴사유 선택된거 리셋)
				out.println("</script>");
			}else {
				m.setM_id(m_id);
				memberService.delMemData(m);

				session.invalidate();

				out.println("<script>");
				out.println("alert('회원탈퇴가 처리되었습니다.');");
				out.println("opener.parent.location.reload();");//공지창을 부른 부모창을 새로고침함
				out.println("window.close();");//공지창 닫음
				out.println("</script>");
			}
		}
		return null;
	}
	
}
