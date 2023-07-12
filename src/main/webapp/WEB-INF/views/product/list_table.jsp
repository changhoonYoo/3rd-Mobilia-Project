<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp" />
<div>
	<span id="sidebar_03">
			<input type="button" class= "side_btn_02" id="up_btn">
			<input type="button" class= "side_btn_02" id="down_btn">
	</span>
	<div class="list_wrap">
	<%-------------------------타이틀,카테고리-------------------------%>
	
		<div id="list_title">
			<h1 style="color:#333; font-size:32px;">Table</h1><span>
			< ${state.substring(0,1).toUpperCase()}${state.substring(1)} ></span>
			<div id="list_category">
				<a href="product?c=table&state=all">All</a> |
				<a href="product?c=table&state=주방용 테이블">주방용 테이블</a> |
				<a href="product?c=table&state=사무용 테이블">사무용 테이블</a> |
				<a href="product?c=table&state=거실용 테이블">거실용 테이블</a> |
				<a href="product?c=table&state=H형 책상">H형 책상</a> |
				<a href="product?c=table&state=좌식 책상">좌식 책상</a>
			</div>
		</div>
		<%-------------------------상품총개수,상품분류-------------------------%>
		<div id="product_class">
			<p>TOTAL <strong style="color:#333">${listCount}</strong> PRODUCTS</p>
					<ul>
						<li><a href="product?c=table&state=${state}&m=new" id="product_class_a">신상품</a></li>
						<li><a href="product?c=table&state=${state}&m=low" id="product_class_a">낮은가격</a></li>
						<li><a href="product?c=table&state=${state}&m=high" id="product_class_a">높은가격</a></li>
						<li><a href="product?c=table&state=${state}&m=best" id="product_class_al">인기상품</a></li>
					</ul>
		</div>
		
		
			<div id="product_list">
			<c:if test="${!empty plist}">
				<c:forEach var="p" items="${plist}">
					<ul id="list_ul">
						<li id="list">
							<div id="list_img" style="position:relative;">
								<a href="product_info?p_no=${p.p_no}">
								<img src="./upload${p.p_img1}" width="300" height="300"
								onmouseover="this.src='./upload${p.p_img2}'"
								onmouseout="this.src='./upload${p.p_img1}'"
								<c:if test="${p.p_amount == 0}">
									style="opacity:0.5; z-index:1 position:absolute;"</c:if>>
								<c:if test="${p.p_amount == 0}">
									<img src="./images/product/soldout.png" width="210" height="90"
									style="position: absolute; z-index: 2; left:45px; top:105px;">
								</c:if>
								</a>
							</div>
							<ul id="list_info">
								<li id="list_name"><a href="product_info?p_no=${p.p_no}"><span id="p_before_price"style="font-size:15px;color:#333333;font-weight:bold;"
								>${p.p_name}
								</span></a>
								</li>
								<li id="list_price"><span style="font-size:14px;color:#a1a1a1;font-weight:bold;text-decoration:line-through;"
								>
								 <fmt:formatNumber value="${p.p_before_price}" pattern="###,###,###"/>원</span></li>
								<li id="list_price"><span style="font-size:14px;color:#971215;font-weight:bold;"
								><fmt:formatNumber value="${p.p_price}" pattern="##,###,###"/>원</span>
								<span id="discount_rate"style="font-size:14px;color:#045443;font-weight:bold;"
								>${fn:split((p.p_before_price - p.p_price)*100/p.p_before_price,'.')[0]}%</span></li>
							</ul>
						</li>
					</ul>
				</c:forEach>
			</c:if>
			<c:if test="${empty plist}">
				<div><p style="font-size:24px;font-weight:700;color:#a3a3a3;text-align:center;">
				등록된 상품이 없습니다.</p></div>
			</c:if>
			</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />