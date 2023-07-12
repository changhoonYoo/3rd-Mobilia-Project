<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/admin_header.jsp"/>
<script>
function confirm_r(re_no){
	if(confirm("후기를 삭제하시겠습니까?")){
		location='/admin_review_del?re_no='+re_no+'&page=${page}';
	}else{
		return false;
	}
}
function selectStar(){
	var value = $('#find_field').val();
	if(value == 're_star'){
		$('#find_text').empty();
		$('#find_text').append("<input name='find_name' id='find_name' size='14' value='${find_name}' placeholder='1~5 숫자만 입력'>");
	}else{
		$('#find_text').empty();
		$('#find_text').append('<input name="find_name" id="find_name" size="14" value="${find_name}">');
	}
}
</script>
<div id="cate">
	<ul>
		<li id="cate_li"><a href="admin_member_list" id="cate_a">회원 관리</a></li>
		<li id="cate_li"><a href="admin_product_list" id="cate_a">상품 관리</a></li>
		<li id="cate_li"><a href="admin_qna_list" id="cate_a">Q&A 관리</a></li>
		<li id="cate_li_a"><a href="admin_review_list" id="cate_b">후기 관리</a></li>
		<li id="cate_li"><a href="#" id="cate_a">문의 관리</a></li>
	</ul>
</div>
<div id="list_re">
	<h2 id="ad_title">후기 관리</h2>
	<div style="float:left;margin-left:30px;color:#999">TOTAL <b style="color:#333;">${listcount}</b> REVIEWS</div>
	<form action="admin_review_list" method="get">
		<div id="find_wrap" style="float:right;margin-right:20px;">
			<select name="find_field" id="find_field" onchange="selectStar()">
				<option value="p_name"
					<c:if test="${find_field=='p_name'}">
	   					${'selected'}</c:if>>상품명</option>
				<option value="m_id"
					<c:if test="${find_field=='m_id'}">
	   					${'selected'}</c:if>>아이디</option>
	   			<option value="re_star"
					<c:if test="${find_field=='re_star'}">
	   					${'selected'}</c:if>>별점</option>
			</select>
			<span id="find_text">
				<input name="find_name" id="find_name" size="14" value="${find_name}">
			</span>
			<input id="btn" type="submit" value="검색" />
			<c:if test="${!empty find_name}"><input type="button" value="전체보기" id="btn"
			onclick="location='/admin_review_list'"></c:if>
		</div>
	</form>
	<ul id="title_re">
		<li>후기번호</li>
		<li>이미지</li>
		<li>상품명</li>
		<li>아이디</li>
		<li>별점</li>
		<li>후기내용</li>
		<li>등록날짜</li>
		<li>삭제</li>
	</ul>
	<c:if test="${!empty rlist}">
		<c:forEach var="r" items="${rlist}">
			<ul>
				<li>${r.re_no}
					<input type="hidden" value="${r.re_no}" id="re_no">
				</li>
				<li><a href="product_info?p_no=${r.p_no}">
					<img src="./upload${r.p_img1}" width="50" height="50"></a></li>
				<li><a href="product_info?p_no=${r.p_no}" id="href">${r.p_name}</a></li>
				<li><a href="admin_member_list?find_field=m_id&find_name=${r.m_id}" id="href">
					${r.m_id}</a></li>
				<li><c:forEach begin="1" end="${r.re_star}" step="1">
						<img src="./images/product/star1.png" width="13">
					</c:forEach>
					<c:forEach begin="1" end="${5 - r.re_star}">
						<img src="./images/product/star0.png" width="13">
					</c:forEach></li>
				<li>${fn:replace(r.re_cont,n,'<br>')}</li>
				<li>${fn:substring(r.re_date,0,10)}</li>
				<li>
					<input id="del_btn"type="button" value="삭제"onclick="return confirm_r(${r.re_no});">
				</li>
			</ul>
		</c:forEach>
	</c:if>
	<div style="clear:both;"></div>
	<c:if test="${empty rlist}">
		<h3 style="color:#999;">검색된 상품정보가 없습니다.</h3>
	</c:if>
	<div id="paging" style="margin:30px 0px 50px 0px;">
		<%-- 검색전 페이징 --%>
		<c:if test="${(empty find_field) && (empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_review_list?page=${page-1}">[이전]</a>&nbsp;
    		</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">
					<%--현재 페이지가 선택되었다면--%>
				<span id="span_b"><${a}></span>
    			</c:if>
				<c:if test="${a != page}">
					<%--현재 페이지가 선택되지 않았다면 --%>
				<a href="admin_review_list?page=${a}">[${a}]</a>&nbsp;
     			</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    		<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_review_list?page=${page+1}">[다음]</a>
			</c:if>
		</c:if>

		<%-- 검색후 페이징 --%>
		<c:if test="${(!empty find_field) || (!empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_review_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
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
					<a href="admin_review_list?page=${a}&find_field=${find_field}&find_name=${find_name}">
						[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    			<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_review_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
					[다음]</a>
			</c:if>
		</c:if>
	</div>
	<div style="clear:both;"></div>
	
</div>
</body>
</html>