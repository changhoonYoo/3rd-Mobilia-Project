/**
 * review.js
 */
function review_check(){
	if($.trim($("#re_star").val())==""){
		alert("별점을 선택해 주세요!");
		return false;
	}
	if($.trim($("#re_cont").val())==""){
		alert("상품 후기를 입력하세요!");
		$("#re_cont").val("").focus();
		return false;
	}
}
var locked=0;

function show(star){
	if(locked == 1){
		return;
	}
	var i;
	var image;
	var el;
	var e = document.getElementById('starText');
	var stateMsg;
	
	for(i=1;i<=star;i++){
		image = 'image'+i;
		el = document.getElementById(image);
		el.src="./images/product/star1.png";
	}
	
	switch(star){
	case 1:
		stateMsg="마음에 들지 않아요!";
		break;
	case 2:
		stateMsg="조금 아쉬워요!";
		break;
	case 3:
		stateMsg="괜찮아요!";
		break;
	case 4:
		stateMsg="만족해요!";
		break;
	case 5:
		stateMsg="너무 마음에 들어요!";
		break;
	default:
		stateMsg="";
	}
	e.innerHTML = stateMsg;
}
function noshow(star){
	if(locked == 1){
		return;
	}
	var i;
	var image;
	var el;
	
	for(i=1;i<=star;i++){
		image='image'+i;
		el = document.getElementById(image);
		el.src="./images/product/star0.png";
	}
}

function lock(star){
	if(locked == 0){
		show(star);
		locked =1;
	}else{
		locked =0;
		noshow(5);
		show(star);
		locked =1;
	}
	
	
}
function mark(star){
	lock(star);
	document.reviewform.re_star.value=star;
}