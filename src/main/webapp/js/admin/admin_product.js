/**
 * admin_product.js
 */

function categoryChange(e) {
	var opt_a = ["선택","single", "super single", "double", "queen", "king"];
	var opt_b = ["선택","1인용 소파", "2~3인용 소파", "카우치형 소파", "리클라이너 소파"];
	var opt_c = ["선택","주방용 테이블", "사무용 테이블", "거실용 테이블", "H형 책상", "좌식 책상"];
	var opt_d = ["선택","식탁 의자", "책상 의자", "서재/사무용 의자", "침대형 의자", "게이밍 체어"];
	var opt_e = ["선택","옷장", "드레스룸", "수납장", "붙박이장", "신발장"];
	var target = document.getElementById("p_category");

	if(e.value == "bed") var d = opt_a;
	else if(e.value == "sofa") var d = opt_b;
	else if(e.value == "table") var d = opt_c;
	else if(e.value == "chair") var d = opt_d;
	else if(e.value == "cabinet") var d = opt_e;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}	
}
$(document).ready(function(){
	$("#color_count").change(function(event) {
		var cnt = $(this).val();
		
		$("#demo").empty();
		for (var i = 0; i < cnt; i++) {

			 var $txtbox ='<input id="p_color'+i+'" name="p_color'+i+'" size="12"placeholder="색상 '+(i+1)+'"><br>'
			$("#demo").append($txtbox);
		}
	});
	$("#size_count").change(function(event) {
		var cnt = $(this).val();
		
		$("#demo1").empty();
		for (var i = 0; i < cnt; i++) {
			 var $txtbox = '<input id="p_size'+i+'" name="p_size'+i+'" size="24" placeholder="사이즈 '+(i+1)+'"><br>'
			$("#demo1").append($txtbox);
		}
	});
});

function product_join_check(){
	if($.trim($("#p_name").val())==""){
		alert("상품명을 입력하세요!");
		$("#p_name").val("").focus();
		return false;
	}
	if($.trim($("#p_before_price").val())==""){
		alert("판매가를 입력하세요!");
		$("#p_before_price").val("").focus();
		return false;
	}
	if($.trim($("#p_price").val())==""){
		alert("할인가를 입력하세요!");
		$("#p_price").val("").focus();
		return false;
	}
	if($.trim($("#p_amount").val())==""){
		alert("상품 수량을 입력하세요!");
		$("#p_amount").val("").focus();
		return false;
	}
/*	var p_img1 = $("#p_img1").val();
	if(!p_img1){
		alert("첫번째 상품이미지를 등록하세요!");
		$("#p_img1").val("").focus();
		return false;
	}
	var p_img2 = $("#p_img2").val();
	if(!p_img2){
		alert("두번째 상품이미지를 등록하세요!");
		$("#p_img2").val("").focus();
		return false;
	}*/
	if($.trim($("#p_class").val())==""){
		alert("상품 분류를 선택하세요!");
		$("#p_class").val("").focus();
		return false;
	}
	if($.trim($("#p_category").val())=="선택"){
		alert("카테고리를 선택하세요!");
		$("#p_category").val("선택").focus();
		return false;
	}
	if($.trim($("#p_info").val())==""){
		alert("상품 설명을 입력하세요!");
		$("#p_info").val("").focus();
		return false;
	}
	if($.trim($("#color_count").val())==""){
		alert("색상을 선택하세요!");
		$("#color_count").val("").focus();
		return false;
	}
	
	var color_count= $("#color_count").val();
	for(var i=0;i<color_count;i++){
		if($.trim($("#p_color"+i).val())==""){
			alert("색상"+(i+1)+"을 입력하세요!");
			$("#p_color"+i).val("").focus();
			return false;		
		}
	}
	if($.trim($("#size_count").val())==""){
		alert("사이즈를 선택하세요!");
		$("#size_count").val("선택").focus();
		return false;
	}
	
	var size_count= $('#size_count').val();
	for(var i=0;i<size_count;i++){
		if($.trim($("#p_size"+i).val())==""){
		alert("사이즈"+(i+1)+"을 입력하세요!");
		$("#p_size"+i).val("").focus();
		return false;
		}
	}
}