package net.mobilia.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import net.mobilia.service.AdminService;
import net.mobilia.vo.AdminVO;
import net.mobilia.vo.BoardVO;
import net.mobilia.vo.MemberVO;
import net.mobilia.vo.ProductVO;
import net.mobilia.vo.ReviewVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 로그인
	@RequestMapping("/admin_login")
	public ModelAndView admin_login() {
		
		ModelAndView am=new ModelAndView();
		am.setViewName("admin/admin_login");
		return am;
	}
	//관리자 로그인 완료
	@RequestMapping("/admin_login_ok")
	public String member_login_ok( HttpServletResponse response,
			HttpSession session,String admin_id, String admin_pwd) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		AdminVO av = this.adminService.adminCheck(admin_id);

		if(av == null) {
			out.println("<script>");
			out.println("alert('관리자 정보가 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!av.getAdmin_pwd().equals(admin_pwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다!');");
				out.println("history.go(-1);");
				out.println("</script>");
			}else {
				session.setAttribute("admin", admin_id);
				return "redirect:/admin_main";
			}
		}
		return null;
	}
	//관리자 메인
	@RequestMapping("/admin_main")
	public ModelAndView admin_main(HttpSession session,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			ModelAndView am=new ModelAndView();
			am.setViewName("admin/admin_main");
			return am;
		}
		return null;
	}
	//관리자 로그아웃
	@RequestMapping("/admin_logout")
	public String admin_logout(HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		session.invalidate();
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='admin_login';");
		out.println("</script>");
		
		return null;
	}
	//상품 리스트
	@RequestMapping("/admin_product_list")
	public ModelAndView admin_product_list(ProductVO pv,HttpServletRequest request
			,HttpSession session,HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));         
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색 필드
			pv.setFind_field(find_field);
			pv.setFind_name("%"+find_name+"%");

			int listcount= adminService.getListCount(pv);

			pv.setStartrow((page-1)*10+1);//시작행번호
			pv.setEndrow(pv.getStartrow()+limit-1);//끝행번호

			List<ProductVO> plist=adminService.getProductList(pv);

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			ModelAndView am=new ModelAndView();
			
			am.addObject("plist",plist);
			am.addObject("page",page);
			am.addObject("startpage",startpage);
			am.addObject("endpage",endpage);
			am.addObject("maxpage",maxpage);
			am.addObject("listcount",listcount);
			am.addObject("find_field",find_field);
			am.addObject("find_name", find_name);
			am.setViewName("admin/admin_product_list");
			return am;
		}
		return null;
	}
	

	//회원 리스트
	@RequestMapping("/admin_member_list")
	public ModelAndView admin_member_list(MemberVO mv,HttpServletRequest request
			,HttpSession session,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));         
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색 필드
			mv.setFind_field(find_field);
			mv.setFind_name("%"+find_name+"%");
			
			if(request.getParameter("find_name") != null) {
				if(find_field.equals("m_state")&&find_name.equals("가입")) {
					mv.setFind_name("1");
				}
				if(find_field.equals("m_state")&&find_name.equals("탈퇴")) {
					mv.setFind_name("2");
				}
			}

			int listcount= adminService.getMemberCount(mv);

			mv.setStartrow((page-1)*10+1);//시작행번호
			mv.setEndrow(mv.getStartrow()+limit-1);//끝행번호

			List<MemberVO> mlist=adminService.getMemberList(mv);

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			ModelAndView mm=new ModelAndView();
			
			mm.addObject("mlist",mlist);
			mm.addObject("page",page);
			mm.addObject("startpage",startpage);
			mm.addObject("endpage",endpage);
			mm.addObject("maxpage",maxpage);
			mm.addObject("listcount",listcount);
			mm.addObject("find_field",find_field);
			mm.addObject("find_name", find_name);
			mm.setViewName("admin/admin_member_list");
			
			return mm;
		}
		return null;
	}

	//상품 등록창
	@RequestMapping("/admin_product")
	public ModelAndView admin_product(HttpServletRequest request
			,HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			int page=1;//쪽번호
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));         
			}
			ModelAndView pm= new ModelAndView();
			pm.addObject("page",page);
			pm.setViewName("admin/admin_product");
			return pm;
		}
		return null;
	}
	
	//상품 등록
	@RequestMapping("/admin_product_ok")
	public ModelAndView admin_product_ok(ProductVO pv,HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			PrintWriter out=response.getWriter();
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));         
			}
			String saveFolder=request.getRealPath("upload");
			//이진파일 업로드 실제 경로
			
			int fileSize=5*1024*1024;//이진파일 업로드 최대 크기 => 5메가 바이트
			
			MultipartRequest multi=null;
			//cos.jar에 있는 파일 첨부 라이브러리 api
			
			multi=new MultipartRequest(request, saveFolder, fileSize, "UTF-8");
					
			String p_name=multi.getParameter("p_name");
			int p_before_price=Integer.parseInt(multi.getParameter("p_before_price"));
			int p_price=Integer.parseInt(multi.getParameter("p_price"));
			int p_amount=Integer.parseInt(multi.getParameter("p_amount"));
			File upFile1=multi.getFile("p_img1");
			File upFile2=multi.getFile("p_img2");
			String p_class=multi.getParameter("p_class");
			String p_category=multi.getParameter("p_category");
			String p_info=multi.getParameter("p_info");
			
			int color_count=Integer.parseInt(multi.getParameter("color_count"));
			int size_count=Integer.parseInt(multi.getParameter("size_count"));
			
			String p_color =multi.getParameter("p_color0");
			pv.setP_color(p_color);
			if(multi.getParameter("p_color1") != null) {
				for(int i=1;i<color_count;i++) {
					if(multi.getParameter("p_color"+i)!= null) {
						p_color+=","+multi.getParameter("p_color"+i);
					}
					pv.setP_color(p_color);
				}
			}
			String p_size=multi.getParameter("p_size0");
			pv.setP_size(p_size);
			if(multi.getParameter("p_size1") != null) {
				for(int i=1;i<size_count;i++) {
					if(multi.getParameter("p_size"+i) != null) {
						p_size=p_size+","+multi.getParameter("p_size"+i);
					}
					pv.setP_size(p_size);
				}
			}
			if(multi.getParameter("p_choice") != null) {
				int p_choice=Integer.parseInt(multi.getParameter("p_choice"));
				 pv.setP_choice(p_choice);
			}
			//첨부된 파일을 가져옴.
			
			if(upFile1 != null && upFile2 != null) {//첨부된 파일이 있는 경우
				String fileName1=upFile1.getName();//첨부된 파일명을 가져온다.
				String fileName2=upFile2.getName();//첨부된 파일명을 가져온다.
				
				Calendar cal=Calendar.getInstance();
				int year=cal.get(Calendar.YEAR);
				int month=cal.get(Calendar.MONTH)+1;
				//+1을 한 이유는 1월이 0으로 반환되기 때문에
				int date=cal.get(Calendar.DATE);
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				//오늘 날짜 폴더 경로를 저장
				
				File path01=new File(homedir);
				if(!(path01.exists())) {//오늘 날짜 폴더 경로가 없다면
					path01.mkdir();//오늘 날짜 폴더를 생성
				}
				
				Random r=new Random();
				int random=r.nextInt(100000000);//0이상 1억 미만 사이의 정수 숫자 난수 발생
				
				/* 첨부된 파일에서 파일 확장자만 구하기 */
				int index1=fileName1.lastIndexOf(".");
				int index2=fileName2.lastIndexOf(".");
				//첨부된 파일에서 .를 맨 오른쪽 부터 찾아서 위치번호를 왼쪽부터 카운터 해서 구함. 첫 문자를 0부터 시작
				
				String fileExtenSion1=fileName1.substring(index1+1);
				String fileExtenSion2=fileName2.substring(index2+1);
				//첨부파일에서 .이후부터 마지막 문자까지 구함. 즉 첨부파일 확장자를 구함
				
				String refileName1="product"+year+month+date+random+"."+fileExtenSion1;
				String refileName2="product"+year+month+date+random+"_on."+fileExtenSion2;
				//새로운 첨부파일명을 저장
				
				String fileDBName1="/"+year+"-"+month+"-"+date+"/"+refileName1;
				String fileDBName2="/"+year+"-"+month+"-"+date+"/"+refileName2;
				//DB에 저장될 레코드 값
				
				upFile1.renameTo(new File(homedir+"/"+refileName1));
				upFile2.renameTo(new File(homedir+"/"+refileName2));
				//오늘 날짜 생성된 폴더 경로에 변경된 첨부파일로 실제 업로드 한다.
				
				pv.setP_img1(fileDBName1);
				pv.setP_img2(fileDBName2);
				
			}
			pv.setP_name(p_name); pv.setP_price(p_price); pv.setP_before_price(p_before_price);
			pv.setP_amount(p_amount);
			pv.setP_class(p_class); pv.setP_category(p_category); 
			pv.setP_info(p_info);
			
			int re=this.adminService.insertProduct(pv);
			if(re==1) {
				out.println("<script>");
				out.println("alert('상품을 등록했습니다!');");
				out.println("location='admin_product_list?page="+page+"'");
				out.println("</script>");
			}
		}
		return null;
	}
	//상품 수정창
	@RequestMapping("admin_product_edit")
	public ModelAndView admin_product_edit(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,ProductVO pv,int p_no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			pv=this.adminService.getProduct(p_no);
			
			String colorList[] = pv.getP_color().split(",");
			String sizeList[] = pv.getP_size().split(",");
			int colorCount= colorList.length;
			int sizeCount=sizeList.length;
			ModelAndView pm=new ModelAndView();
			pm.addObject("pv", pv);
			pm.addObject("page", page);
			pm.addObject("colorList",colorList);
			pm.addObject("colorCount",colorCount);
			pm.addObject("sizeList",sizeList);
			pm.addObject("sizeCount",sizeCount);
			pm.setViewName("admin/admin_product_edit");
			return pm;
		}
		return null;
	}
	//상품 수정
	@RequestMapping("admin_product_edit_ok")
	public ModelAndView admin_product_edit_ok(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,ProductVO pv) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			PrintWriter out=response.getWriter();
			
			String saveFolder=request.getRealPath("upload");
			int fileSize=5*1024*1024;
			
			MultipartRequest multi=null;
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");

			int page=1;
			if(multi.getParameter("page") != null) {
				page=Integer.parseInt(multi.getParameter("page"));
			}
			String p_name=multi.getParameter("p_name");
			int p_no=Integer.parseInt(multi.getParameter("p_no"));
			int p_before_price=Integer.parseInt(multi.getParameter("p_before_price"));
			int p_price=Integer.parseInt(multi.getParameter("p_price"));
			int p_amount=Integer.parseInt(multi.getParameter("p_amount"));
			File upFile1=multi.getFile("p_img1");
			File upFile2=multi.getFile("p_img2");
			String p_class=multi.getParameter("p_class");
			String p_category=multi.getParameter("p_category");
			String p_info=multi.getParameter("p_info");
			
			int color_count=Integer.parseInt(multi.getParameter("color_count"));
			int size_count=Integer.parseInt(multi.getParameter("size_count"));
			
			String p_color =multi.getParameter("p_color0");
			pv.setP_color(p_color);
			if(multi.getParameter("p_color1") != null) {
				for(int i=1;i<color_count;i++) {
					if(multi.getParameter("p_color"+i)!= null) {
						p_color+=","+multi.getParameter("p_color"+i);
					}
					pv.setP_color(p_color);
				}
			}
			String p_size=multi.getParameter("p_size0");
			pv.setP_size(p_size);
			if(multi.getParameter("p_size1") != null) {
				for(int i=1;i<size_count;i++) {
					if(multi.getParameter("p_size"+i) != null) {
						p_size=p_size+","+multi.getParameter("p_size"+i);
					}
					pv.setP_size(p_size);
				}
			}
			if(multi.getParameter("p_choice") != null) {
				int p_choice=Integer.parseInt(multi.getParameter("p_choice"));
				 pv.setP_choice(p_choice);
			}
			pv.setP_no(p_no);
			pv.setP_name(p_name); pv.setP_price(p_price); pv.setP_before_price(p_before_price);
			pv.setP_amount(p_amount);
			pv.setP_class(p_class); pv.setP_category(p_category); 
			pv.setP_info(p_info);
			
			ProductVO db_File1=this.adminService.getProduct(p_no);
			ProductVO db_File2=this.adminService.getProduct(p_no);
			
			if(upFile1 != null) {
				String fileName1=upFile1.getName();
				File delFile1=new File(saveFolder+db_File1.getP_img1());
				if(delFile1.exists()){
					delFile1.delete();
				}
				Calendar cal=Calendar.getInstance();
				int year=cal.get(Calendar.YEAR);//년도값
				int month=cal.get(Calendar.MONTH)+1;//월값
				int date=cal.get(Calendar.DATE);//일값
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				File path01=new File(homedir);
				if(!(path01.exists())) {
					path01.mkdir();
				}
				Random r=new Random();
				int random=r.nextInt(100000000);
				
				/*첨부 파일 확장자를 구함*/
				int index1=fileName1.lastIndexOf(".");
				String fileExtendsion1=fileName1.substring(index1+1);
				String refileName1="product"+year+month+date+random+"."+fileExtendsion1;
				String fileDBName1="/"+year+"-"+month+"-"+date+"/"+refileName1;
				upFile1.renameTo(new File(homedir+"/"+refileName1));
				pv.setP_img1(fileDBName1);
			}else if(upFile1 == null) {
				pv.setP_img1(db_File1.getP_img1());
			}
			if(upFile2 != null) {
				String fileName2=upFile2.getName();
				File delFile2=new File(saveFolder+db_File1.getP_img2());
				if(delFile2.exists()) { 
					delFile2.delete();			
				}
				Calendar cal=Calendar.getInstance();
				int year=cal.get(Calendar.YEAR);//년도값
				int month=cal.get(Calendar.MONTH)+1;//월값
				int date=cal.get(Calendar.DATE);//일값
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				File path01=new File(homedir);
				if(!(path01.exists())) {
					path01.mkdir();
				}
				Random r=new Random();
				int random=r.nextInt(100000000);
				
				/*첨부 파일 확장자를 구함*/
				int index2=fileName2.lastIndexOf(".");
				String fileExtendsion2=fileName2.substring(index2+1);
				String refileName2="product"+year+month+date+random+"_on."+fileExtendsion2;
				String fileDBName2="/"+year+"-"+month+"-"+date+"/"+refileName2;
				upFile2.renameTo(new File(homedir+"/"+refileName2));
				pv.setP_img2(fileDBName2);
			}else if(upFile2 == null) { //안바뀌었다면, 그대로유지
				pv.setP_img2(db_File2.getP_img2());
			}
			
			int re=this.adminService.updateProduct(pv);
			if(re==1) {
				out.println("<script>");
				out.println("alert('상품을 수정했습니다!');");
				out.println("location='admin_product_list?page="+page+"'");
				out.println("</script>");
			}
		}
		return null;
	}
	//상품 삭제
	@RequestMapping("admin_product_del")
	public ModelAndView admin_product_del(int p_no,HttpServletRequest request
			,HttpServletResponse response,HttpSession session) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			PrintWriter out=response.getWriter();
			String saveFolder = request.getRealPath("upload");
			ProductVO db_file = this.adminService.getProduct(p_no);
			
			if(db_file.getP_img1() != null && db_file.getP_img2() != null) {
				File delFile1=new File(saveFolder+db_file.getP_img1());
				File delFile2=new File(saveFolder+db_file.getP_img2());
				delFile1.delete();
				delFile2.delete();
			}
			int re=this.adminService.delProduct(p_no);
			
			if(re==1) {
				out.println("<script>");
				out.println("alert('상품을 삭제했습니다!');");
				out.println("location='admin_product_list?page="+page+"'");
				out.println("</script>");
			}
		}
		return null;
	}
	
	//회원 탈퇴
	@RequestMapping("/admin_member_del")
	public ModelAndView admin_member_del(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,MemberVO m) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			int page=1;
			int limit=10;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			PrintWriter out=response.getWriter();
			adminService.delMember(m);
							
			out.println("<script>");
			out.println("alert('회원을 탈퇴시켰습니다!');");
			out.println("opener.parent.location.reload();");//공지창을 부른 부모창을 새로고침함
			out.println("window.close();");//공지창 닫음
			out.println("</script>");
		}
		return null;
	}
	
    //회원탈퇴 안내창
	@RequestMapping("/admin_mDel_info")
	public ModelAndView member_del(HttpSession session, HttpServletResponse response, int m_no) 
			throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		if(isAdminLogin(session, response)) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("m_no", m_no);
			mv.setViewName("admin/admin_mDel_info");
			return mv;
		}
		return null;
	}
	//후기 관리창
	@RequestMapping("/admin_review_list")
	public ModelAndView admin_review_list(HttpServletRequest request,ReviewVO rv
			,HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		if(isAdminLogin(session, response)) {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));         
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색 필드
			rv.setFind_field(find_field);
			rv.setFind_name("%"+find_name+"%");

			int listcount=adminService.getReviewCount(rv);//리뷰 개수

			rv.setStartrow((page-1)*10+1);//시작행번호
			rv.setEndrow(rv.getStartrow()+limit-1);//끝행번호

			List<ReviewVO> rlist=adminService.getReviewList(rv);
			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			String n="\n";
			ModelAndView rm=new ModelAndView();
			rm.addObject("page",page);
			rm.addObject("startpage",startpage);
			rm.addObject("endpage",endpage);
			rm.addObject("maxpage",maxpage);
			rm.addObject("listcount",listcount);
			rm.addObject("rlist", rlist);
			rm.addObject("find_field",find_field);
			rm.addObject("find_name", find_name);
			rm.addObject("n",n);
			rm.setViewName("admin/admin_review_list");
			return rm;
		}
		return null;
	}
	//후기 삭제
	@RequestMapping("/admin_review_del")
	public ModelAndView admin_review_del(int re_no,HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		if(isAdminLogin(session, response)) {
			int page=1;
			int limit=10;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			int re= this.adminService.delReview(re_no);
			if(re==1) {
				out.println("<script>");
				out.println("alert('후기를 삭제했습니다!');");
				out.println("location='admin_review_list?page="+page+"'");
				out.println("</script>");
			}
		}
		return null;
	}
	public static boolean isAdminLogin(HttpSession session,HttpServletResponse response)
			throws Exception{
		PrintWriter out=response.getWriter();
		String admin = (String)session.getAttribute("admin");//세션 아이디를 구함.
		
		if(admin == null) {//관리자 로그아웃 되었을때 즉 세션 만료 된 경우
			out.println("<script>");
			out.println("alert('관리자로 다시 로그인 하세요!');");
			out.println("location='admin_login';");
			out.println("</script>");
			
			return false;
		}
		return true;
	}
	
	//Q&A 리스트
	@RequestMapping("/admin_qna_list")
	public ModelAndView admin_qna_list(HttpServletRequest request,BoardVO bv
			,HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		if(isAdminLogin(session, response)) {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));         
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색 필드
			bv.setFind_field(find_field);
			bv.setFind_name("%"+find_name+"%");

			int listcount=adminService.getQnaCount(bv);//qna 개수

			bv.setStartrow((page-1)*10+1);//시작행번호
			bv.setEndrow(bv.getStartrow()+limit-1);//끝행번호

			List<BoardVO> qlist=adminService.getQnaList(bv);
			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			String n="\n";
			ModelAndView qm=new ModelAndView();
			qm.addObject("page",page);
			qm.addObject("startpage",startpage);
			qm.addObject("endpage",endpage);
			qm.addObject("maxpage",maxpage);
			qm.addObject("listcount",listcount);
			qm.addObject("qlist", qlist);
			qm.addObject("find_field",find_field);
			qm.addObject("find_name", find_name);
			qm.addObject("n",n);
			qm.setViewName("admin/admin_qna_list");
			return qm;
		}
		return null;
	}
}
