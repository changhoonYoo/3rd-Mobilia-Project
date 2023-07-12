/**
 * cart_list.js
 */
 
$(document).ready(function(){

 	setTotalInfo();
});

//체크박스 전체선택 또는 해제
$(".cart_checkbox").on("change", function(){

 	setTotalInfo($(".cart_info"));
});
 	
$(".all_check_input").on("click", function(){
 	if($(".all_check_input").prop("checked")){
 	
 		$(".cart_checkbox").prop("checked", true);
 	} else{
 	
 		$(".cart_checkbox").prop("checked", false);
 	}
 	setTotalInfo($(".cart_info"));	
});

//금액계산
function setTotalInfo(){

 	let allPrice = 0;
 	let allSalePrice = 0;
	let finalPrice = 0;
 		
	$(".cart_info").each(function(index, element){
 		if($(element).find(".cart_checkbox").is(":checked") == true){
	 		allPrice += parseInt($(element).find(".total_before_price_input").val());//할인전금액 더하기
	 		allSalePrice += parseInt($(element).find(".cart_sale_price_input").val()); //할인금액 더하기
 		}
	});
	 	
 	finalPrice = parseInt(allPrice - allSalePrice);
	 	
 	$(".allPrice_span").text(allPrice.toLocaleString('ko-KR'));
 	$(".allSalePrice_span").text(allSalePrice.toLocaleString('ko-KR'));
 	$(".finalPrice_span").text(finalPrice.toLocaleString('ko-KR'));
}
	
//수량 증가 기능
$(".plusBtn").on("click", function(){

	let count = $(this).parent(".count-select-area").find(".amount_count").val();
 	$(this).parent(".count-select-area").find(".amount_count").val(++count);
});

//수량 감소 기능
$(".minusBtn").on("click", function(){
 	let count = $(this).parent(".count-select-area").find(".amount_count").val();
 	if(count > 1){
 	
 		$(this).parent(".count-select-area").find(".amount_count").val(--count);
 	}else{
 		alert('수량은 한개이상만 설정이 가능합니다.');
 	}
});

//수량 업데이트 아작스 처리	
$('.count_modifyBtn').on("click", function(){
	var p_no = $(this).parent(".count-select-area").find('.count_modifyBtn').data('pno');
 	var cart_no = $(this).parent(".count-select-area").find('.count_modifyBtn').data('no');
 	var price = $(this).parent(".count-select-area").find('.count_modifyBtn').data('price');
 	var sale_price = $(this).parent(".count-select-area").find('.count_modifyBtn').data('saleprice');
 			
 	var amount_count = $(this).parent(".count-select-area").find(".amount_count").val();
 			
 	$.ajax({
		type:'post',
		url:'/cart/count_modify',
		headers:{
		
			"Content-Type" :"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:'text',
		data: JSON.stringify({

			p_no : p_no,
			cart_no : cart_no,
			price : price,
			sale_price : sale_price,
			amount_count : amount_count
		}),
		success:function(result){
			if(result == 'SUCCESS'){
				alert('수량변경 완료');
				location.reload();
			}else if(result == 'FALSE'){
				alert('변경하려는 수량이 상품 재고보다 많습니다.');
				location.reload();
			}
		}
	});
 			
});

//장바구니에서 제거 아작스 처리
//개별로 선택시	
$('.deleteBtn').on("click", function(){
	var cart_no = $(this).parent('.each-Btn-area').find('.deleteBtn').data('no');
	
	$.ajax({
		type:'post',
		url:'/cart/delete',
		headers:{
			"Content-Type" :"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:'text',
		data: JSON.stringify({
			cart_no : cart_no
		}),
		success:function(result){
			if(result == 'SUCCESS'){
				alert('상품삭제 완료');
				location.reload();
			}
		}
	});
});

//체크박스 선택상품 삭제시
$('.select-deleteBtn').on("click", function(){
	
 	var cart_noArr = [];
 	
 	$("input:checkbox[name='cart_checkbox']:checked").each(function(){
 		cart_noArr.push($(this).data('no'));
 	});
 	
 	if(cart_noArr == ''){
 		alert('선택된 항목이 없습니다');
	}else if(confirm('선택된 목록을 삭제하시겠습니까?')){
		$.ajax({
			type:'post',
			url:'/cart/select_delete',
			traditional:true, //ajax 배열 넘기기 옵션
			data: {
				"cart_noArr" : cart_noArr
			},
			dataType: "text",
			success:function(result){
				if(result == 'SUCCESS'){
					alert('선택 상품 삭제 완료');
					location.reload();
				}
			}
		});
	}
});