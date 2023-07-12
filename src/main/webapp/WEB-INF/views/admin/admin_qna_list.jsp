<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/admin_header.jsp"/>

<div id="cate">
	<ul>
		<li id="cate_li"><a href="admin_member_list" id="cate_a">회원 관리</a></li>
		<li id="cate_li"><a href="admin_product_list" id="cate_a">상품 관리</a></li>
		<li id="cate_li_a"><a href="admin_qna_list" id="cate_b">Q&A 관리</a></li>
		<li id="cate_li"><a href="admin_review_list" id="cate_a">후기 관리</a></li>
		<li id="cate_li"><a href="#" id="cate_a">문의 관리</a></li>
	</ul>
</div>
<div id="list_q">
	<h2 id="ad_title">Q&A 관리</h2>
	<div style="float:left;margin-left:30px;color:#999">TOTAL <b style="color:#333;">${listcount}</b> QUESTION</div>
	<div id="stand_line">
		<a href="admin_qna_list?find_field=reply_cnt" id="need_reply">답변 필요</a>
	</div>
	<form action="admin_qna_list" method="get">
		<div id="find_wrap" style="float:right;margin-right:35px;">
			<select name="find_field" id="find_field" onchange="selectState()">
				<option value="board_name"
					<c:if test="${find_field=='board_name'}">
	   					${'selected'}</c:if>>글쓴이</option>
				<option value="board_cont"
					<c:if test="${find_field=='board_cont'}">
	   					${'selected'}</c:if>>Q&A 내용</option>
	   			<option value="board_title"
					<c:if test="${find_field=='board_title'}">
	   					${'selected'}</c:if>>Q&A 제목</option>
	   			
			</select>
			<span id="find_text">
			<input name="find_name" id="find_name" size="14" value="${find_name}" />
			</span>
			<input id="btn" type="submit" value="검색" />
			<c:if test="${!empty find_field}"><input type="button" value="전체보기" id="btn"
			onclick="location='/admin_qna_list'"></c:if>
		</div>
	</form>
	<ul id="title_q">
		<li>번호</li>
		<li>글쓴이</li>
		<li>Q&A 제목</li>
		<li>Q&A 내용</li>
		<li>답변 수</li>
		<li>답변 여부</li>
		<li>등록 날짜</li>
		<li>답변</li>
		
	</ul>
	<c:if test="${!empty qlist}">
		<c:forEach var="q" items="${qlist}">
			<ul id="list_ul">
			 <li>${q.board_no}</li>	
			 <li>${q.board_name}</li>
			 <li>${q.board_title}</li>
			 <li>${fn:replace(q.board_cont,n,'<br>')}</li>
			 <li>${q.reply_cnt}</li>
			 <li>&nbsp;&nbsp;<c:if test="${q.reply_cnt != 0}"><img src="./images/board/re.png" width="29px" height="27px" id="re-img"></c:if></li>
			 <li>${fn:substring(q.board_date,0,10)}</li>
			 <li>
			  <input type="button" value="답변" id="q_btn" onclick="location='/community_view?board_no=${q.board_no}&board_type=admin_qna&state=cont'">
			 </li>
			</ul>
		</c:forEach>
	</c:if>
	<div style="clear:both;"></div>
	<c:if test="${empty qlist}">
		<h3 style="color:#999;">검색된 Q&A정보가 없습니다.</h3>
	</c:if>
	<div id="paging" style="margin:30px 0px 50px 0px;">
		<%-- 검색전 페이징 --%>
		<c:if test="${(empty find_field) && (empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_qna_list?page=${page-1}">[이전]</a>&nbsp;
    		</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">
					<%--현재 페이지가 선택되었다면--%>
     			<span id="span_b"><${a}></span>
    			</c:if>
				<c:if test="${a != page}">
					<%--현재 페이지가 선택되지 않았다면 --%>
				<a href="admin_qna_list?page=${a}">[${a}]</a>&nbsp;
     			</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    		<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_qna_list?page=${page+1}">[다음]</a>
			</c:if>
		</c:if>

		<%-- 검색후 페이징 --%>
		<c:if test="${(!empty find_field) || (!empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_qna_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
				[이전]</a>&nbsp;
    		</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">
					<%--현재 페이지가 선택되었다면--%>
     				<span id="span_b"><${a}></span>
     			</c:if>
				<c:if test="${a != page}">
					<%--현재 페이지가 선택되지 않았다면 --%>
					<a href="admin_qna_list?page=${a}&find_field=${find_field}&find_name=${find_name}">
						[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    			<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_qna_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
					[다음]</a>
			</c:if>
		</c:if>
	</div>
	<div style="clear:both;"></div>
	
</div>
</body>
</html>