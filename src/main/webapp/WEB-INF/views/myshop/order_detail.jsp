<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="./css/cart/cart_list.css">
<div class="cart-area">
	

	<div class="title-area">
		<h2>구매내역</h2>
	</div>
	<div class="cart-main-area">
		
		<table class="cart-table" border="1" style="width:1200px;  margin-bottom:100px;">
		 <colgroup>
		  <col style="width:150px">
		  <col style="width:150px">
		  <col style="width:350px">
		  <col style="width:140px">
		  <col style="width:120px">
		  <col style="width:120px">
		 </colgroup>
		 <thead>
		  <tr>
		   <th scope="col">이미지</th>
		   <th scope="col">분류</th>
		   <th scope="col">상품정보</th>
		   <th scope="col">판매가</th>
		   <th scope="col">수량</th>
		   <th scope="col">합계</th>
		  </tr>
		 </thead>
		 <tbody>
		 
		<c:forEach var="c" items="${cvo}">
		  <tr>
		   <td>
		    <a href="/product_info?p_no=${c.p_no}" class="view_product">
		     <img src="/upload${c.p_img1}"/>
		    </a>
		   </td>
		   <td>
		    <ul class="classification-area">
		     <li>${c.p_class}</li>
		     <li>${c.p_category}</li>
		    </ul>
		   </td>
		   <td>
		     <ul class="product-info-area">
		      <li class="product-name"><a href="/product_info?p_no=${c.p_no}" class="view_product"><b>${c.p_name}</b></a></li>
		      <li class="product-option">[ 옵션 ]</li>
		      <li class="product-option">색상 : ${c.cart_color}</li>
		      <li class="product-option">사이즈 : ${c.cart_size}</li>
		     </ul>
		   </td>
		   <td>
		    <ul class="price-info-area">
		     <li><span class = "before_price"><fmt:formatNumber value="${c.p_before_price}" type="number"/>원</span></li>
		     <li><span class = "p_price"><b><fmt:formatNumber value="${c.p_price}" type="number"/></b></span>원</li>
		    </ul>
		   </td>
		   <td>
		     <label>${c.amount_count}개</label>
		   </td>
		   <td>
		    <span class="each_price_span"><fmt:formatNumber value="${c.cart_price}" type="number"/></span>원
		   </td>
		  </tr>
		  </c:forEach> 
		 </tbody>
		 <tfoot style="height:30px;">
		  <tr>
		   <td colspan="8" >
		       
		   </td>
		  </tr>
		 </tfoot>
		</table>
	</div>
	</div>

<jsp:include page="../include/footer.jsp" />