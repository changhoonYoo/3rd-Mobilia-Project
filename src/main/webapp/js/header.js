/**
 *  header.js
 */

$(document).ready(function() {
	$('.menu>li').mouseover(function() { //메뉴 마우스 오버 시 서브메뉴 슬라이드
		$(this).find('.sub_menu').stop().slideDown();
	}).mouseout(function() {
		$(this).find('.sub_menu').stop().slideUp();
	});
	
	$(".all_menu").click(function(){
		if($("#all_menu_div").css('display')=="none"){
			$("#all_menu_div").css('display','block');
		}else{
			$("#all_menu_div").css('display','none');
		}
	});
	$('#all_menu_close').click(function(){
		$("#all_menu_div").css('display','none');
	});
	$('#up_btn').click(function(){
		window.scrollTo({top : 0, behavior:"smooth"});
	});
	$('#down_btn').click(function(){
		window.scrollTo({top: document.body.scrollHeight, behavior: "smooth"})
	});
});