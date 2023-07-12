/**
 * cart_add.js
 */
 
 //장바구니 추가
 m_id = $("#m_id").val();
 
 $("#cartBtn").on("click", function(){//장바구니 버튼을 클릭했다면
 if(m_id != ''){
	if($.trim($("#p_color").val())=="- [필수] 옵션을 선택해 주세요 -" || $.trim($("#p_color").val())=="-------------------" ){
		alert("색상을 선택해 주세요");
		$("#p_color").focus();
		return false;
	}
	if($.trim($("#p_size").val())=="- [필수] 옵션을 선택해 주세요 -" || $.trim($("#p_size").val())=="-------------------" ){
		alert("사이즈를 선택해 주세요");
		$("#p_size").focus();
		return false;
	}
	
		var p_no = $('#p_no').val();
		var cart_color = $('#p_color').val();
		var cart_size = $('#p_size').val();
		var amount_count = parseInt($('#amount_count').val());
							
		var p_price = parseInt($('#p_price').val());
		var cart_price = p_price * amount_count;
							
		var sale_price = parseInt($('#sale_price').val());
		var cart_sale_price = amount_count * sale_price;
							
		$.ajax({
			url : '/cart/add',
			type : 'post',
			headers:{
				"Content-Type" :"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			dataType:'text',
			data: JSON.stringify({
				m_id : m_id,	
				p_no : p_no,
				cart_color : cart_color,
				cart_size : cart_size,
				amount_count : amount_count,
				cart_price : cart_price,
				cart_sale_price : cart_sale_price
			}),
			success : function(result){
				if(result == 'ADDFALSE'){
					alert('장바구니에 이미 상품이 있습니다.');
					location.reload();
				}else if(result == 'COUNTFALSE'){
					alert('장바구니에 담으려는 수량이 재고 수량보다 많습니다.');
				}else if(result == 'SUCCESS'){
					alert('장바구니에 상품이 추가되었습니다.');
					location.reload();
				}
			}
		})
	}else{
		alert('로그인이 필요합니다');
	}
});