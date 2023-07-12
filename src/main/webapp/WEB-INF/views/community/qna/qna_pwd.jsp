<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/board/board.css">
<link rel="stylesheet" type="text/css" href="./css/board/board_write.css">
<link rel="stylesheet" type="text/css" href="./css/board/qna_pwd.css">
<script src="/js/board/board_main.js"></script>
<div class="community-board-area">
	<div class="title-area">
		<h2>Q&A</h2>
		
	</div>
	<div class="pwd-write-area">
	 <h2>비밀글 보기</h2>
	 <p>이 글을 확인하시려면 비밀번호를 입력해주세요</p>
	 <p><b>관리자이거나 기존작성 아이디로 로그인 하신분은 확인버튼만 누르시면 됩니다.</b>
	 <form method="post" action="community_pwdcheck_ok"><br>
	  <div class="pwd-text-area"><label style="font-size:18px;">비밀번호 입력</label> &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="pwd_text" name="pwd_text"  style="height:25px;"></div> 
	  
	   <input type="hidden" id="board_pwd" name="board_pwd" value="${board_pwd}">
	   <input type="hidden" id="board_no" name="board_no" value="${board_no}">
	   <input type="hidden" id="page" name="page" value="${page}">
	  <div class="write-button-area">
	 	<input type=submit id="write-submit-button" onclick="return pwd()" value="확인">
	 	<input type="reset" id="write-list-button" value="게시글목록" onclick="location='/community_main?board_type=qna';">
	  </div>
	 </form>
	</div>
</div>
	
<jsp:include page="../../include/footer.jsp" />