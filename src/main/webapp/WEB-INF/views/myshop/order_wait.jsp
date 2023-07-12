<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/myshop_left-look.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="./css/member/order_list.css">
 <h2>주문조회</h2>
 <label class="info-text">현재 주문한 상품 목록을 볼 수 있는 공간입니다.</label>
 </div>
 <div class="select-state">
  <a href="/myshop_orderlist?m_id=${m_id}&order_state=0" class="now-order-state">주문목록</a> <a href="/myshop_orderlist?m_id=${m_id}&order_state=-1">반품목록</a> <a href="/myshop_orderlist?m_id=${m_id}&order_state=1">과거주문내역</a>
 </div>
 <div class="orderlist-table-area">
  <table class="order_list-table" border="1">
		 <colgroup>
		  <col style="width:250px">
		  <col style="width:250px">
		  <col style="width:250px">
		  <col style="width:250px">
		 </colgroup>
		 <thead>
		  <tr>
		   <th scope="col">주문번호</th>
		   <th scope="col">상품이름</th>
		   <th scope="col">결제금액</th>
		   <th scope="col">구매/환불</th>
		  </tr>
		 </thead>
		 <c:if test="${!empty ovo}">
		  <tbody>
		   <c:forEach var="o" items="${ovo}">
		    <tr>
		     <td>
		      <a href="order_detail?order_no=${o.order_no}">${o.order_no}</a>
		     </td>
		     <td>
		      ${o.order_name}
		     </td>
		     <td>
		      <b><fmt:formatNumber value="${o.order_price}" type="number"/></b>원
		     </td>
		     <td class="Btn-area">
		      <input type="button" class="confirmBtn" value="구매확정" data-no="${o.order_no}">
		      
		      <input type="button" class="returnBtn" value="반품요청" data-no="${o.order_no}">
		     </td>
		    </tr>
		   </c:forEach>
		  </tbody>
		 </c:if>
		 
</table>
	<script>
		 $(".confirmBtn").on("click", function(){
			
			   var order_check = $(this).parent(".Btn-area").find(".confirmBtn").val();
		       var order_no = $(this).parent(".Btn-area").find(".confirmBtn").data('no');
		       
		       $.ajax({
		   		type:'post',
		   		url:'/order_check',
		   		headers:{
		   			"Content-Type" :"application/json",
		   			"X-HTTP-Method-Override":"POST"
		   		},
		   		dataType:'text',
		   		data: JSON.stringify({
		   			order_check : order_check,
		   			order_no : order_no
		   		}),
		   		success:function(result){
		   			if(result == 'CONFIRM_OK'){
		   				alert('구매확정 완료');
		   				location.reload();
		   			}
		   		}
		 });
		});
		 
		$(".returnBtn").on("click", function(){
				
			   var order_check = $(this).parent(".Btn-area").find(".returnBtn").val();
		       var order_no = $(this).parent(".Btn-area").find(".confirmBtn").data('no');
		       
		       $.ajax({
		   		type:'post',
		   		url:'/order_check',
		   		headers:{
		   			"Content-Type" :"application/json",
		   			"X-HTTP-Method-Override":"POST"
		   		},
		   		dataType:'text',
		   		data: JSON.stringify({
		   			order_check : order_check,
		   			order_no : order_no
		   		}),
		   		success:function(result){
		   			if(result == 'RETURN_OK'){
		   				alert('반품요청이 처리되었습니다.');
		   				location.reload();
		   			}
		   		}
		 });
		});
	</script>
 </div>
</div>
</div>
<jsp:include page="../include/footer.jsp" />