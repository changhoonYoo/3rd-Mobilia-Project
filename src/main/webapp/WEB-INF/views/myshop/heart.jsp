<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/myshop_left-look.jsp" />
<script src="./js/consultation.js"></script>

<h2>관심상품</h2>
</div>
<div>
<c:if test="${!empty hlist}">
		<div id="product_rv">
			<c:forEach var="h" items="${hlist}">
				<ul id="list_ul">
					<li id="list">
						<div id="list_img" style="position: relative;">
							<a href="product_info?p_no=${h.p_no}"><img
								src="./upload${h.p_img1}" width="250" height="250"
								onmouseover="this.src='./upload${h.p_img2}'"
								onmouseout="this.src='./upload${h.p_img1}'"
								<c:if test="${h.p_amount == 0}">
								style="opacity:0.5; z-index:1 position:absolute;"</c:if>>
								<c:if test="${h.p_amount == 0}">
									<img src="./images/product/soldout.png" width="190" height="80"
										style="position: absolute; z-index: 2; left: 30px; top: 90px;">
								</c:if></a>
						</div>
						<ul id="list_info">
							<li id="list_name"><a href="#"><span id="p_before_price"
									style="font-size: 15px; color: #333333; font-weight: bold;">${h.p_name}
								</span></a></li>
							<li id="list_price"><span
								style="font-size: 14px; color: #a1a1a1; font-weight: bold; text-decoration: line-through;">
									<fmt:formatNumber value="${h.p_before_price}"
										pattern="###,###,###" />원
							</span></li>
							<li id="list_price"><span
								style="font-size: 14px; color: #971215; font-weight: bold;"><fmt:formatNumber
										value="${h.p_price}" pattern="##,###,###" />원</span> <span
								id="discount_rate"
								style="font-size: 14px; color: #045443; font-weight: bold;">${fn:split((h.p_before_price - h.p_price)*100/h.p_before_price,'.')[0]}%</span></li>
						</ul>
					</li>
				</ul>

			</c:forEach>
		</div>
	</c:if>

<c:if test="${empty hlist}">
		<div style="margin-top: 120px;">
			<p style="font-size: 24px; font-weight: 700; color: #a3a3a3; text-align: center;">
				등록된 상품이 없습니다.
			</p>
		</div>
	</c:if>
</div>

</div>
</div>
<jsp:include page="../include/footer.jsp" />