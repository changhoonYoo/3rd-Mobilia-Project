<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/admin_header.jsp"/>
<script>
function confirm_p(p_no){
	if(confirm("상품을 삭제하시겠습니까?")){
		location='/admin_product_del?p_no='+p_no+'&page=${page}';
	}else{
		return false;
	}
}
</script>
<div id="cate">
	<ul>
		<li id="cate_li"><a href="admin_member_list" id="cate_a">회원 관리</a></li>
		<li id="cate_li_a"><a href="admin_product_list" id="cate_b">상품 관리</a></li>
		<li id="cate_li"><a href="admin_qna_list" id="cate_a">Q&A 관리</a></li>
		<li id="cate_li"><a href="admin_review_list" id="cate_a">후기 관리</a></li>
		<li id="cate_li"><a href="#" id="cate_a">문의 관리</a></li>
	</ul>
</div>
<div id="list_w">
	<h2 id="ad_title">상품 관리</h2>
	<div style="float:left;margin-left:30px;color:#999">
		TOTAL <b style="color:#333;">${listcount}</b> PRODUCTS
	</div>
	<div id="stand_line">
		<a href="admin_product_list?find_field=p_amount" id="sold_out">SOLD OUT</a>
		<a href="admin_product_list?find_field=p_choice" id="mds_choice">MD's CHOICE</a>
	</div>
	<div id="addp">
		<a href="admin_product?page=${page}">상품 등록</a>
	</div>
	<form action="admin_product_list" method="get">
		<div id="find_wrap" style="float:right;margin-right:20px;">
			<select name="find_field" id="find_field">
				<option value="p_name"
					<c:if test="${find_field=='p_name'}">
	   					${'selected'}</c:if>>상품명</option>
				<option value="p_class"
					<c:if test="${find_field=='p_class'}">
	   					${'selected'}</c:if>>대분류</option>
	   			<option value="p_category"
					<c:if test="${find_field=='p_category'}">
	   					${'selected'}</c:if>>소분류</option>
			</select> 
			<input name="find_name" id="find_name" size="14" value="${find_name}" />
			<input id="btn" type="submit" value="검색" />
			<c:if test="${!empty find_field}"><input type="button" value="전체보기" id="btn"
			onclick="location='/admin_product_list'"></c:if>
		</div>
	</form>
	<ul id="title">
		<li>번호</li>
		<li>이미지</li>
		<li>상품명</li>
		<li>판매가</li>
		<li>할인가(%)</li>
		<li>상품 재고</li>
		<li>판매 수량</li>
		<li>MD Choice</li>
		<li>대분류</li>
		<li>소분류</li>
		<li>상품설명</li>
		<li>색상</li>
		<li>사이즈</li>
		<li>등록날짜</li>
		<li>수정/삭제</li>
	</ul>
	<c:if test="${!empty plist}">
		<c:forEach var="p" items="${plist}">
			<ul>
				<li>${p.p_no}
					<input type="hidden" value="${p.p_no}" id="p_no">
				</li>
				<li><a href="product_info?p_no=${p.p_no}"><img src="./upload${p.p_img1}" width="50" height="50"></a></li>
				<li><a href="product_info?p_no=${p.p_no}" id="href">${p.p_name}</a></li>
				<li><span style="font-size:12px;color:#a1a1a1;font-weight:bold;text-decoration:line-through;">
					<fmt:formatNumber value="${p.p_before_price}" pattern="###,###,###"/>원</span></li>
				<li><span style="font-size:12px;color:#971215;font-weight:bold;">
					<fmt:formatNumber value="${p.p_price}" pattern="##,###,###"/>원</span><br>
					<span id="discount_rate"style="font-size:12px;color:#045443;font-weight:bold;">
					${fn:split((p.p_before_price - p.p_price)*100/p.p_before_price,'.')[0]}%</span></li>
				<li><span <c:if test="${p.p_amount==0}">style="color:red;font-weight:700;"</c:if>>
					${p.p_amount}</span></li>
				<li>${p.p_sold}</li>
				<li><input type="checkbox" name="p_choice" id="p_choice" value="${p.p_choice}"
					<c:if test="${p.p_choice == 1}"> checked </c:if> onClick="return false;"></li>
				<li>${p.p_class}</li>
				<li>${p.p_category}</li>
				<li><c:if test="${fn:length(p.p_info)<=10}">${p.p_info}</c:if>
					<c:if test="${fn:length(p.p_info)>10}">${fn:substring(p.p_info,0,10)}...</c:if></li>
				<li><c:if test="${fn:length(p.p_color)<=8}">${p.p_color}</c:if>
					<c:if test="${fn:length(p.p_color)>8}">${fn:substring(p.p_color,0,8)}...</c:if></li>
				<li><c:if test="${fn:length(p.p_size)<=8}">${p.p_size}</c:if>
					<c:if test="${fn:length(p.p_size)>8}">${fn:substring(p.p_size,0,8)}...</c:if></li>
				<li>${fn:substring(p.p_date,0,10)}</li>
				<li>
					<input id="btn"type="button" value="수정"onclick="location='/admin_product_edit?p_no=${p.p_no}&page=${page}'">
					<input id="del_btn"type="button" value="삭제"onclick="return confirm_p(${p.p_no});">
				</li>
			</ul>
		</c:forEach>
	</c:if>
	<div style="clear:both;"></div>
	<c:if test="${empty plist}">
		<h3 style="color:#999;">검색된 상품정보가 없습니다.</h3>
	</c:if>
	<div id="paging" style="margin:30px 0px 50px 0px;">
		<%-- 검색전 페이징 --%>
		<c:if test="${(empty find_field) && (empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_product_list?page=${page-1}">[이전]</a>&nbsp;
    		</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">
					<%--현재 페이지가 선택되었다면--%>
				<span id="span_b"><${a}></span>
    			</c:if>
				<c:if test="${a != page}">
					<%--현재 페이지가 선택되지 않았다면 --%>
				<a href="admin_product_list?page=${a}">[${a}]</a>&nbsp;
     			</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    		<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_product_list?page=${page+1}">[다음]</a>
			</c:if>
		</c:if>

		<%-- 검색후 페이징 --%>
		<c:if test="${(!empty find_field) || (!empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_product_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
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
					<a href="admin_product_list?page=${a}&find_field=${find_field}&find_name=${find_name}">
						[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    			<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_product_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
					[다음]</a>
			</c:if>
		</c:if>
	</div>
	<div style="clear:both;"></div>
	
</div>
</body>
</html>