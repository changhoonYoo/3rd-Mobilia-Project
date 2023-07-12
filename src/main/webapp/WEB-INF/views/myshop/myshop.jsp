<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/myshop_left-look.jsp" />

   <h2>마이 쇼핑</h2>
  </div>
  <div class="myshop-welcome">
   <img src="./images/myshop/member_image.gif"/>
   <div id="welcome-text">
    <p>
         저희 쇼핑몰을 이용해 주셔서 감사합니다. <b>${mvo.m_name}</b> 님은 <b>일반</b> 회원입니다.
    </p>
   </div>
  </div>
  <%-------- 주문처리 현황 영역 시작--------%>
  <div class="order-processing-area">
   <div id="top">
    <b>주문처리 현황</b>
   </div>
   <div id="bottom">
      <div><b>주문조회</b><a href="/myshop_orderlist?m_id=${m_id}&order_state=0">${order_wait}</a></div>
      <div><b>반품내역</b><a href="/myshop_orderlist?m_id=${m_id}&order_state=-1">${order_return}</a></div>
      <div><b>과거주문내역</b><a href="/myshop_orderlist?m_id=${m_id}&order_state=1">${order_past}</a></div>
   </div>
  </div>
  <%-------- 주문처리 현황 영역 끝--------%>
  <div class="category-views">
   <div id="top-div">
    <div>
     <img src="./images/myshop/order.png" alt="주문내역 조회"/><br>
     <a href="/myshop_orderlist?m_id=${m_id}&order_state=0" class=top-a>
      <b>Order</b><br>
      <label>주문조회</label><br><br>
     </a>
     <a href="/myshop_orderlist?m_id=${m_id}&order_state=0" class="bottom-a">
      <label>고객님께서 주문하신 상품의</label><br>
 	  <label>주문내역을 확인하실 수 있습니다.</label>
     </a>
    </div>
    <div class="revision">
     <img src="./images/myshop/profile.png" alt="회원 정보"/><br>
     <a href="/modify" class="top-a">
      <b>Profile</b><br>
      <label>회원 정보</label><br><br>
     </a>
     <a href="/modify" class="bottom-a">
      <label>회원이신 고객님의 개인정보를</label><br>
      <label>관리하는 공간입니다.</label>
     </a>
    </div>
    <div class="revision">
     <a href="/myshop_heart"><img src="./images/myshop/wishlist.png" alt="관심 상품"/></a><br>
     <a href="/myshop_heart" class="top-a">
      <b>Wishlist</b><br>
      <label>관심 상품</label><br><br>
     </a>
     <a href="/myshop_heart" class="bottom-a">
      <label>관심상품으로 등록하신</label><br>
      <label>상품의 목록을 보여드립니다.</label>
     </a>
    </div>
   </div>
   <div id="bottom-div">
    <div class="revision">
     <img src="./images/myshop/mileage.png" alt="적립금"/><br>
     <a href="#"  class="top-a">
      <b>Mileage</b><br>
      <label>적립금</label><br><br>
     </a>
     <a href="#" class="bottom-a">
      <label>적립금은 상품 구매 시</label><br>
      <label>사용하실 수 있습니다.</label>
     </a>
    </div>   
    <div>
     <img src="./images/myshop/board.png" alt="게시물 관리"/><br>
     <a href="#" class="top-a">
      <b>Board</b><br>
      <label>게시물 관리</label><br><br>
     </a>
     <a href="#" class="bottom-a">
      <label>고객님께서 작성하신 게시물을</label><br>
      <label>관리하는 공간입니다.</label>
     </a>
    </div>
    <div class="revision">
    <a href="/recently_viewed"><img src="./images/myshop/recently.png" alt="최근 본 상품"/></a><br>
     <a href="/recently_viewed" class="top-a"> 
      <b>Recently Viewed</b><br>
      <label>최근 본 상품</label><br><br>
     </a>
     <a href="/recently_viewed" class="bottom-a">
      <label>최근에 봤던 상품들을</label><br>
      <label>모아보실 수 있습니다.</label>
     </a>
    </div>
   </div>
  </div>
 </div>
</div>
<jsp:include page="../include/footer.jsp" />