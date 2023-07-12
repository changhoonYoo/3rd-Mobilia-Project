
package net.mobilia.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.mobilia.service.BoardService;
import net.mobilia.service.MemberService;
import net.mobilia.vo.BoardVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.ReviewVO;

@Controller
public class CommunityController {

	@Autowired
	private BoardService boardService;
	
	//어바웃어스로 이동
	@RequestMapping("/aboutus_location")
	public ModelAndView mobilia(ProductVO pv) throws Exception{

		ModelAndView mv = new ModelAndView();
		mv.setViewName("about-us/location");
		return mv;
	}

	//커뮤니티 메인창 이동
	@RequestMapping("/community_main")
	public ModelAndView community_main(HttpSession session, HttpServletResponse response,
			HttpServletRequest request, String board_type) throws Exception{

		String id=(String)session.getAttribute("id");

		int page = 1;
		int maxview=10;

		String find_field = null;
		String find_name = null;

		if(request.getParameter("page") != null) {//get으로 전달된 페이지 번호가 있으면
			page = Integer.parseInt(request.getParameter("page"));//페이지 번호를 정수숫자로 변환
		}

		find_field = request.getParameter("find_field");
		if(request.getParameter("find_name") != null) {//검색어가 있다면
			find_name = request.getParameter("find_name").trim(); //양쪽 공백을 제거하고 검색어를 가져온다.
		}

		ModelAndView mv = new ModelAndView();
		ReviewVO findrvo = new ReviewVO();
		BoardVO findbvo = new BoardVO();
		int listcount = 0;

		if(board_type.equals("review")) {

			findrvo.setFind_field(find_field); findrvo.setFind_name("%"+find_name+"%");
			listcount = boardService.getReviewCount(findrvo);
			findrvo.setStartrow((page-1)*10+1);//시작행 번호
			findrvo.setEndrow(findrvo.getStartrow()+maxview-1);//끝행 번호
			List<ReviewVO> rlist = boardService.getReviewList(findrvo);
			mv.setViewName("community/review/review_main");
			mv.addObject("rlist", rlist);
		}else{

			findbvo.setFind_field(find_field); findbvo.setFind_name("%"+find_name+"%");//%는 sql 와일드 카드문자
			findbvo.setBoard_type(board_type);
			listcount = boardService.getListCount(findbvo);
			findbvo.setStartrow((page-1)*10+1);//시작행 번호
			findbvo.setEndrow(findbvo.getStartrow()+maxview-1);//끝행 번호
			List<BoardVO> blist = boardService.getBoardList(findbvo);

			mv.addObject("id", id);
			mv.addObject("blist", blist);
			mv.setViewName("community/"+board_type+"/"+board_type+"_main");
		}

		//총 페이지수
		int maxpage=(int)((double)listcount/maxview+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		mv.addObject("page", page);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("maxpage", maxpage);
		mv.addObject("listcount", listcount);
		mv.addObject("find_field", find_field);
		mv.addObject("find_name", find_name);

		return mv;
	}

	//커뮤니티 글쓰기로 이동
	@RequestMapping("/community_write")
	public ModelAndView community_main(HttpSession session, HttpServletResponse response
			,String board_type)throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");

		if(id == null && !board_type.equals("qna")) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {

			ModelAndView mv = new ModelAndView();
			mv.addObject("id", id);
			mv.addObject("board_type", board_type);
			mv.setViewName("community/"+board_type+"/"+board_type+"_write");
			return mv;
		}
		return null;
	}

	//커뮤니티 글쓰기 성공
	@RequestMapping("/community_write_ok")
	public String community_write_ok(HttpSession session, HttpServletResponse response,
			HttpServletRequest request, BoardVO bvo, String board_type) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");
		
		if(id == null && !board_type.equals("qna")) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			if(id != null && board_type.equals("qna")) {//로그인 상태 qna게시판 글쓰기라면
				bvo.setBoard_name(id);
				bvo.setBoard_pwd(boardService.getPwd(id));
			}
			boardService.insertBoard(bvo);

			out.println("<script>");
			out.println("alert('게시물이 등록되었습니다!');");
			out.println("location='community_main?board_type="+board_type+"';");
			out.println("</script>");
		}
		return null;
	}

	//게시물 보기
	@RequestMapping("/community_view")
	public ModelAndView community_view(HttpSession session, HttpServletResponse response, HttpServletRequest request, String state,
			String board_no, String board_type) 
					throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");

		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		ModelAndView mv = new ModelAndView();
		BoardVO bvo = new BoardVO();

		if(state.equals("cont")) {
			bvo = boardService.getBoardCont(board_no);
			if(board_type.equals("admin_qna")) {
				mv.setViewName("admin/admin_qna_cont");
				
			}else {
			mv.setViewName("community/"+board_type+"/"+board_type+"_cont");
			}
		}else if(state.equals("edit")) {//수정 폼일때
			bvo = boardService.getEditCont(board_no);
			mv.setViewName("community/"+board_type+"/"+board_type+"_edit");
		}else if(state.equals("del")) {//삭제 폼 일때

			boardService.delBoard(board_no);
			out.println("<script>");
			out.println("alert(\"게시물이 삭제되었습니다\");");
			out.println("location='community_main?board_type="+board_type+"'");
			out.println("</script>");

			return null;
		}

		String board_cont = bvo.getBoard_cont().replace("\n", "<br>");

		mv.addObject("board_no", board_no);
		mv.addObject("bvo", bvo);
		mv.addObject("board_cont", board_cont);
		mv.addObject("page", page);
		mv.addObject("board_type", board_type);
		mv.addObject("id", id);
		return mv;
	}

	//게시물 수정완료
	@RequestMapping("/community_edit_ok")
	public String community_edit_ok(HttpSession session, HttpServletResponse response, 
			HttpServletRequest request, BoardVO editbvo, int page, String board_no, String board_type) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");

		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='login.net';");
			out.println("</script>");
		}else {

			boardService.editBoard(editbvo);	

			out.println("<script>");
			out.println("alert('게시물이 수정되었습니다.');");
			out.println("location='community_view?board_no="+board_no+"&board_type="+board_type+"&page="+page+"&state=cont';");
			out.println("</script>");
		}
		return null;
	}

	//qna 게시물 비밀번호 입력창으로 이동
	@RequestMapping("/community_pwdcheck")
	public ModelAndView community_pwdcheck(HttpSession session, HttpServletResponse response, 
			HttpServletRequest request, String board_no) throws Exception{
		
		String id=(String)session.getAttribute("id");
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		ModelAndView mv = new ModelAndView();
		if(id != null) {//로그인된 상태라면
			BoardVO bvo = boardService.getQnaCheck(board_no);
			
			if((bvo.getBoard_name().equals(id))) {//로그인된 아이디와 작성자 아이디가 같고 게시물 번호가 서로 같다면																			  
				String board_pwd = bvo.getBoard_pwd();	
				mv.addObject("board_pwd", board_pwd);
			}
		}
		
		mv.addObject("page", page);
		mv.addObject("board_no", board_no);
		mv.setViewName("/community/qna/qna_pwd");
		return mv;
	}
	
	//qna 게시물 비밀번호 확인
	@RequestMapping("/community_pwdcheck_ok")
	public ModelAndView community_pwdcheck_ok(HttpSession session, HttpServletResponse response, 
			HttpServletRequest request) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String board_no = request.getParameter("board_no");
		BoardVO bvo = new BoardVO();
		
		String board_pwd = null;
		board_pwd = request.getParameter("board_pwd");
		String pwd_text = request.getParameter("pwd_text");
		if((board_pwd.equals("")) || (!pwd_text.equals(""))) {//로그인 정보를 기준으로 가져온 비밀번호가 없거나 비밀번호를 입력했다면
			board_pwd = pwd_text;
		}

		bvo = boardService.getBoardCont(board_no);
		
		if(!bvo.getBoard_pwd().equals(board_pwd)) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다!');");
			out.println("history.back();");
			out.println("</script>");
			
			return null;
		}else {
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:community_view?board_no="+board_no+"&board_type=qna&state=cont");
		return mv;
		}
	}
}
