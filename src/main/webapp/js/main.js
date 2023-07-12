/**
 *    main.js
 */

$(document).ready(function() {
   $("#product_img>a>img").hover(function(){//이미지 마우스 오버 시 _on.png로 변경
      $(this).attr("src", $(this).attr("src").replace(".png", "_on.png")); 
   }, function(){ 
        $(this).attr("src", $(this).attr("src").replace("_on.png", ".png"));
    });

   var header = document.querySelector(".header");
   
   window.onscroll = function(){
      var windowTop = window.scrollY;
        // 스크롤 세로값이 750보다 크거나 같으면 
      // 헤더에 클래스 'drop'을 추가한다
     if (windowTop >= 750) { //윈도우스크롤Y값이 헤더 높이보다 낮다면
       header.classList.add("drop");
       $('#logo_img').attr("src",'./images/main/main_logo_02.png'); //logo 변경
       $('#sns').css("margin","10px 0px 0px 30px"); //sns margin값 변경
       $('#login').css("margin","15px 50px 0px 0px"); //login margin값 변경
       $('#sidebar_02').css("display","block"); //up,down 버튼 보이게
	   $('#search_btn').css("top","12px");
	   $('#search_text').css("top","10px");
	   $('.menu').css("margin-top","0px");
     } 
     // 아니면 클래스 'drop'을 제거
     else {
       header.classList.remove("drop");
       $('#logo_img').attr("src",'./images/main/main_logo.png'); // logo에 이미지 다시 추가
       $('#sns').css("margin","30px 0px 0px 30px"); //margin 초기치 변경
       $('#login').css("margin","35px 50px 0px 0px");  //margin 초기치 변경
       $('#sidebar_02').css("display","none");   //up,down 버튼 감춤
	   $('#search_text').css("top","38px");
	   $('#search_btn').css("top","40px");
	   $('.menu').css("margin-top","40px");
     }
   };
   $('#best_seller_btn').click(function(){
      var offset = $('#best_seller_p').offset(); //선택한 태그의 위치를 반환
            //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.8초 동안 부드럽게 해당 위치로 이동함 
        $('html').animate({scrollTop : offset.top}, 800);
   });
   $('#new_item_btn').click(function(){
      var offset = $('#new_item_p').offset(); //선택한 태그의 위치를 반환
            //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.8초 동안 부드럽게 해당 위치로 이동함 
        $('html').animate({scrollTop : offset.top}, 800);
   });
   $('#md_choice_btn').click(function(){
      var offset = $('#md_choice_p').offset(); //선택한 태그의 위치를 반환
            //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.8초 동안 부드럽게 해당 위치로 이동함 
        $('html').animate({scrollTop : offset.top}, 800);
   });
   $('#all_menu_close').click(function(){
      $("#all_menu_div").css('display','none');
   });
   
   $(".bxslider").bxSlider({ //슬라이드 이미지 (bx-slider)
      auto: true,
      stopAutoOnClick: true,
      pager: true,
      slideWidth: 1100
   });
});   