<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../include/header.jsp" />
<div class="clear"></div>

<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<script src="./js/board/board_write.js"></script>
<link rel="stylesheet" type="text/css" href="./css/board/board_write.css">

<div id="board-wrap">
<div class="title-area">
	<h2>Q&A</h2>
	<label class="write-info-text">Q&A 게시글을 작성하는 공간입니다.</label>
	
</div>
<form name="b" method="post" action="/community_write_ok">
	<div class="board-write-area">
	<input type="hidden" id="board_type" name="board_type" value="${board_type}">	
			<table>
				<tr>
					<th>글쓴이</th>
					<c:if test="${!empty id}"> <td><label id="board_name">${id}</label></td> </c:if>
					<c:if test="${empty id}"> <td><input id="board_name" name="board_name"></td> </c:if>
				</tr>
				<tr>
					<th>제목</th>
					<td>
					<select class="title-select" id="board_title" name="board_title">
					  <option selected>상품 문의드립니다</option>
					  <option>배송 문의드립니다</option>
					  <option>견적 문의드립니다</option>
				  	  <option>기타 문의드립니다</option>
					 </select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="board_cont" id="board_cont" ></textarea>
					</td>
				</tr>
				<c:if test="${empty id}">
				<tr>
				 <th>비밀번호</th>
				 <td><input id="board_pwd" name="board_pwd"></td>
				</tr>
				</c:if>
				</table>
	</div>
	
	<div class="write-button-area">
	 <input type=submit id="write-submit-button" onclick="return writeSubmit()" value="게시글등록">
	 <input type="reset" id="write-list-button" value="게시글목록" onclick="location='/community_main?board_type=free';">
	</div>
</form>
</div>
<div class="clear"></div>
<jsp:include page="../../include/footer.jsp" />