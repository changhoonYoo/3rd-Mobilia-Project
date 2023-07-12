<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/board/board_write.css">
<link rel="stylesheet" type="text/css" href="./css/board/board_view.css">

<script src="./js/jquery.js"></script>

<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<script src="./js/board/board_write.js"></script>

<div id="board-wrap">
<div class="title-area">
	<h2>자유게시판</h2>
	<label class="write-info-text">자유게시판 게시물 내용을 수정하는 공간입니다.</label>
	
</div>

<form method="post" action="community_edit_ok"
         onsubmit="return edit_check();">
	<div class="board-write-area">
         <input type="hidden" id="board_type" name="board_type" value="free">
         <input type="hidden" id="board_no" name="board_no" value="${bvo.board_no}">
		 <input type="hidden" id="page" name="page" value="${page}">
			<table>
				<tr>
					<th>글쓴이</th>
					<td><label><input name="board_name" value="${bvo.board_name}" readonly></label></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><label><input name="board_title" id="board_title" value="${bvo.board_title}"></label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="board_cont" name="board_cont">${board_cont}</textarea></td>
				</tr>
			</table>
		</div>
			<div class="write-button-area">
	 			<input type=submit id="write-submit-button" value="수정하기">
	 			<input type="reset" id="write-list-button" value="수정취소" onclick="location='/community_view?board_no=${bvo.board_no}&board_type=free&page=${page}&state=cont&boart_type=free';">
			</div>
		</form>
	
</div>

<jsp:include page="../../include/footer.jsp" />