<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/board/board.css">
<link rel="stylesheet" type="text/css" href="./css/board/review_main.css">
<div class="community-board-area">
	<div class="title-area">
		<h2>상품후기</h2>
		<label class="info-te">상품후기를 볼수있는 공간입니다.</label>
		
	</div>
	<div class="community-select-area">
	
	 <a href="community_main?board_type=question">자주묻는질문</a>
	|
	 
	 <a href="community_main?board_type=review" class="now-board-type">상품후기</a>
	|
	 
	 <a href="community_main?board_type=qna">Q&A</a>
	|
	
	 <a href="community_main?board_type=free">자유게시판</a>
	|
	
	 <a href="#">공지사항</a>
	
	 </div>
	<form method="get" action="/community_main">
	<div class="community-find-area">
	 <select name="find_field">
	  <option value="m_id"
	  <c:if test="${find_field =='m_id'}">${'selected'}</c:if>>작성자</option>
	  <option value="p_name"
	  <c:if test="${find_field =='p_name'}">${'selected'}</c:if>>상품명</option>
	  <option value="re_cont"
	  <c:if test="${find_field =='re_cont'}">${'selected'}</c:if>>내용</option>
	 </select>
	 <input type="search" id="find_name" name="find_name">
	 <input type="hidden" id="board_type" name="board_type" value="review">
	 <input type="submit" id="find_button" value="검색">
	</div>
	</form>
	<c:if test="${!empty rlist}">
	 <c:forEach var="r" items="${rlist}">
	 <div class="review-data-area">
	 <div class="review-image-area">
	 <img src="./upload${r.p_img1}" width="100" height="100" id="re_img">
	  <a href="/product_info?p_no=${r.p_no}" class="view_product">상품 보러가기</a>
	 </div>
	 <div class="review-left-area">
	 <div class="review-data-top"><label><b>${r.m_id}</b>&nbsp;&nbsp;&nbsp;&nbsp;${r.re_date}</label>
	 <c:forEach begin="1" end="${r.re_star}" step="1">
		<img src="./images/product/star1.png" width="13">
	</c:forEach>
	<c:forEach begin="1" end="${5 - r.re_star}">
		<img src="./images/product/star0.png" width="13">
	</c:forEach>
	</div>
	<div class="review-data-cont">
	 <p>${r.re_cont}</p>
	 </div>
	 </div>
	
	 </div>
	 
	 </c:forEach>
	</c:if>
</div>
<c:if test="${!empty blist}">
 <c:forEach var="b" items="${blist}">
	<div class="write-list-area">
		<div id="board-title-area">
			<label><a href="community_view?board_no=${b.board_no}&board_type=free&page=${page}&state=cont">${b.board_title} (${b.reply_cnt})</a></label><br>
		</div>
		<div id="board-data-area">
			<label>${b.board_name}</label> | <label>${b.board_date.substring(0,10)}</label> | <label>조회수 ${b.board_hit}</label>
		</div>
	</div>
 </c:forEach>
</c:if>
<div style="clear:both;"></div>
	<c:if test="${empty rlist}">
		<h3 style="color:#999;">등록된 내용이 없습니다.</h3>
	</c:if>
   <%--검색전후 페이징(쪽나누기) --%>
   <div id="bList_paging">
    <%--검색 전 페이징 --%>
    <c:if test="${(empty find_field) && (empty find_name)}"> <%--검색필드와 검색어가 없는 경우 --%>
     <c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
     <c:if test="${page>1}">
      <a href="community_main.net?page=${page-1}" class="next-button">[이전]</a>&nbsp;
     </c:if>
     
     <%--현재 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
        [ ${a} ]
       </c:if>
       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
        <a href="community_main?page=${a}">[ ${a} ]</a>&nbsp;
       </c:if>
     </c:forEach>
       
    
    <c:if test="${page >= maxpage}">
      [다음]
    </c:if>
    <c:if test="${page < maxpage}">
     <a href="community_main?page=${page+1}" class="next-button">[다음]</a>
    </c:if>
   </c:if>
    
    <%--검색이후 페이징(쪽나누기) --%>
    <c:if test="${(!empty find_field) && (!empty find_name)}"> <%--검색필드와 검색어가 있는 경우 --%>
     <c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
     <c:if test="${page>1}">
      <a href="community_main?page=${page-1}&find_field=${find_field}&find_name=${find_name}" class="next-button">[이전]</a>&nbsp;
                                             <%-- &(엠퍼센트) 구분기호로 구분하면서 find_field=검색필드&find_name=
                                             검색어를 get방식으로 전달해야 검색 이후 페이징 목록을 유지한다. 그렇지 않으면 검색전 전체 페이징 목록으로 이동해서
                                             검색 효과가 사라진다. --%>
     </c:if>
     
     <%--현재 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
        [ ${a} ]
       </c:if>
       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
        <a href="community_main?page=${a}&find_field=${find_field}&find_name=${find_name}">[ ${a} ]</a>&nbsp;
       </c:if>
     </c:forEach>      
    
    <c:if test="${page >= maxpage}">
      [다음]
    </c:if>
    <c:if test="${page < maxpage}">
     <a href="community_main?page=${page+1}&find_field=${find_field}&find_name=${find_name}" class="next-button">[다음]</a>
    </c:if>
   </c:if> 
   </div>

<jsp:include page="../../include/footer.jsp" />