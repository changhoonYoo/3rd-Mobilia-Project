<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="./css/cart/cart_list.css">
<div class="cart-area">
	

	<div class="title-area">
		<h2>장바구니</h2>
	</div>
	<div class="cart-main-area">
		
		<table class="cart-table" border="1">
		 <colgroup>
		  <col style="width:45px">
		  <col style="width:150px">
		  <col style="width:140px">
		  <col style="width:350px">
		  <col style="width:130px">
		  <col style="width:120px">
		  <col style="width:120px">
		  <col style="width:140px">
		 </colgroup>
		 <thead>
		  <tr>
		   <th scope="col">
		    <input type="checkbox" class="all_check_input" checked="checked">
		   </th>
		   <th scope="col">이미지</th>
		   <th scope="col">분류</th>
		   <th scope="col">상품정보</th>
		   <th scope="col">판매가</th>
		   <th scope="col">수량</th>
		   <th scope="col">합계</th>
		   <th scope="col">선택</th>
		  </tr>
		 </thead>
		 <c:if test="${!empty cvo}">
		 <tbody>
		 
		<c:forEach var="c" items="${cvo}">
		  <tr>
		   <td class="cart_info" style="width:1px;">
		    <input type="checkbox" class="cart_checkbox" name="cart_checkbox" data-no="${c.cart_no}" data-name="${c.p_name}" checked="checked">
		    <input type="hidden" class="total_before_price_input" value="${c.p_before_price * c.amount_count}">
		    <input type="hidden" class="cart_sale_price_input" value="${c.cart_sale_price}">
		   </td>
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
		     
		      <li class="product-name"><a href="/product_info?p_no=${c.p_no}" class="view_product"><b>${c.p_name}</b> </a></li>
		      <li class="product-option">[ 옵션 ]</li>
		      <li class="product-option">색상 : ${c.cart_color}</li>
		      <li class="product-option">사이즈 : ${c.cart_size}</li>
		     </ul>
		     
		   </td>
		   <td>
		    <ul class="price-info-area">
		     <li><span class ="before_price"><fmt:formatNumber value="${c.p_before_price}" type="number"/></span>원</li>
		     <li><span class = "p_price"><b><fmt:formatNumber value="${c.p_price}" type="number"/></b></span>원</li>
		    </ul>
		   </td>
		   <td>
		    <span class="count-select-area">
		     <input type="button" class="minusBtn" value="-">
		     <input class="amount_count" name="amount_count" value="${c.amount_count}" readonly>
		     <input type="button" class="plusBtn" value="+">
		     <br>
		     <input type="button" class="count_modifyBtn" value="변경" data-pno="${c.p_no}" data-no="${c.cart_no}" data-price="${c.p_price}" data-saleprice="${c.p_before_price - c.p_price}">
		    </span>
		   </td>
		   <td>
		    <span class="each_price_span"><fmt:formatNumber value="${c.cart_price}" type="number"/></span>원
		   </td>
		   <td>
		    <span class="each-Btn-area">
		     <input type="button" class="orderBtn" value="주문하기" data-no="${c.cart_no}" data-name="${c.p_name}" data-price="${c.cart_price}">
		     <br>
		     <input type="button" class="deleteBtn" value="X 삭제" data-no="${c.cart_no}">
		    </span>
		   </td>
		  </tr>
		  </c:forEach> 
		 </tbody>
		 </c:if>
		 <c:if test="${empty cvo}">
		  <tbody>
		  <tr>
		   <th colspan="8" style="height:100px; color:grey; font-size:20px;">
		   	 장바구니에 담긴 상품이 없습니다.
		   </th>
		  </tr>
		  </tbody>
		 </c:if>
		 <tfoot>
		  <tr>
		   <td colspan="8">
		        상품구매금액(<span class="allPrice_span"></span>)원
		     - 상품할인금액(<span class="allSalePrice_span"></span>)원
		     = 합계 : <b><span class="finalPrice_span"></span></b>원
		   </td>
		  </tr>
		 </tfoot>
		</table>
	</div>
	<div class="cart-allBtn-area">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	 <input type="button" class="select-orderBtn" value="선택상품 주문하기">
	 <script>
	 $(".orderBtn").click(function(){
		var cart_no = parseInt($(this).parent(".each-Btn-area").find('.orderBtn').data('no'));
		var order_name = $(this).parent(".each-Btn-area").find('.orderBtn').data('name');
		var amount = '' + $(this).parent(".each-Btn-area").find('.orderBtn').data('price');
		amount = amount.replace(/[^0-9]/g, "");
		
		var amount_pay = amount.substring(0,2);
		
	 	var m_id = '<c:out value="${m_id}"/>';
		var name = '<c:out value="${mvo.m_name}"/>';
		var email = '<c:out value="${email}"/>';
		var addr = '<c:out value="${mvo.m_jibunAddr}"/>';
		var post = '<c:out value="${mvo.m_post}"/>';
		var order_no = parseInt(new Date().getTime());
		var merchant_id = 'merchant_'+order_no;
		
		 IMP.init('imp53454156');
		  
		  IMP.request_pay({
		    pg: 'html5_inicis',
		    pay_method: 'card',
		    merchant_uid : merchant_id,
		    name : order_name,
		    amount : amount_pay,
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : '010-1234-5678',
		    buyer_addr : addr,
		    buyer_postcode : post
		  }, function (rsp) { // callback
			 console.log(rsp);
		     if(rsp.success){
		    	 $.ajax({
		 			type:'post',
		 			url:'/cart/each_order_ok',
		 			traditional:true, //ajax 배열 넘기기 옵션
		 			data: {
		 				cart_no : cart_no,
		 				order_no : order_no,
		 				m_id : m_id,
		 				order_name : order_name,
		 				order_price : amount
		 			},
		 			dataType: "text",
		 			success:function(result){
		 				if(result == 'SUCCESS'){
		 					alert('결제가 완료 되었습니다.');
		 					location.reload();
		 				}
		 			}
		 		});
		     }else{
		    	 var msg = '결제에 실패하였습니다.';
		    	 msg += '에러내용 : ' + rsp.error_msg;
		     }	  
		  }); 
		 });	 
	 
	 $(".select-orderBtn").click(function(){
			
			var amount = $('.finalPrice_span').text();
			amount = amount.replace(/[^0-9]/g, "");
			var amount_pay = '';
			var change_cart_noArr = [];
			let kind = -1;
			var order_name = '';
			$(".cart_info").each(function(index, element){
		 		if($(element).find(".cart_checkbox").is(":checked") == true){
		 			
		 			change_cart_noArr.push($(element).find(".cart_checkbox").data('no'));
			 		order_name = ($(element).find(".cart_checkbox").data('name'))
			 		kind ++;
		 		}
		 		
			});
			
			if(kind != 0){
			 	order_name = order_name.substring(0,5)+'...외 '+kind+'종';
			 	amount_pay = amount.substring(0,3);
			}else{
				amount_pay = amount.substring(0,2);
			}
			
			var m_id = '<c:out value="${m_id}"/>';
			var name = '<c:out value="${mvo.m_name}"/>';
			var email = '<c:out value="${email}"/>';
			var addr = '<c:out value="${mvo.m_jibunAddr}"/>';
			var post = '<c:out value="${mvo.m_post}"/>';
			var order_no = parseInt(new Date().getTime());
			var merchant_id = 'merchant_'+order_no;
			
			 IMP.init('imp53454156');
			  
			  IMP.request_pay({
			    pg: 'html5_inicis',
			    pay_method: 'card',
			    merchant_uid : merchant_id,
			    name : order_name,
			    amount : amount_pay,
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : '010-1234-5678',
			    buyer_addr : addr,
			    buyer_postcode : post
			  }, function (rsp) { // callback
				 console.log(rsp);
			     if(rsp.success){
			    	 $.ajax({
			 			type:'post',
			 			url:'/cart/select_order_ok',
			 			traditional:true, //ajax 배열 넘기기 옵션
			 			data: {
			 				change_cart_noArr : change_cart_noArr,
			 				order_no : order_no,
			 				m_id : m_id,
			 				order_name : order_name,
			 				order_price : amount
			 			},
			 			dataType: "text",
			 			success:function(result){
			 				if(result == 'SUCCESS'){
			 					alert('결제가 완료 되었습니다.');
			 					location.reload();
			 				}
			 			}
			 		});
			     }else{
			    	 var msg = '결제에 실패하였습니다.';
			    	 msg += '에러내용 : ' + rsp.error_msg;
			     }	  
			  }); 
			 });	 
	</script>
	 <input type="button" class="select-deleteBtn" value="선택상품 삭제">
	</div>
	<!-------------------- 장바구니 리스트 관련 기능과 아작스 불러오기 -------------------->
	<script src="./js/cart/cart_list.js"></script>
	
	
</div>
<jsp:include page="../include/footer.jsp" />