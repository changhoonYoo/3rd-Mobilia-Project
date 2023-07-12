<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css"
	href="./css/about-us/aboutus_location.css">
<script src="./js/about-us/aboutus_location.js"></script>
<div class="about-us-location">
	<div class="title-area">
		<h2>찾아오시는길</h2>
	</div>
	<div class="shop-info-area">
		<div id="top">
			<b class="jm-font" id="shop-info">Shop Info.</b>
		</div>
		<div id="bottom">
			<label class="jm-font"> TEL : 02-2222-2222~4 </label><br> <label
				class="jm-font"> E-MAIL : mobilia@naver.com </label><br>
			<br> <label class="jm-font"> Monday - Friday : 09:00 ~
				19:00 </label><br> <label class="jm-font"> Holiday : 13:00 ~
				19:00 </label><br> <label class="jm-font"> (Sat & Sunday : OFF)
			</label><br>
			<br> <label class="jm-font"> ADDRESS : 06222 서울특별시 강남구
				강남대로 84길 16(역삼동) 11F </label>
		</div>
		<div id="road-img-area">
			<label class="jm-font">로드뷰로 본 매장건물 사진</label><br> <img
				src="./images/aboutus/aboutus_roadview.png" id="road-view" />
		</div>
		<div id="map" style="width: 1000px; height: 400px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00bfca532ad27e0aac06a495902ca5ef&libraries=services"></script>
		<script>
	 var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	 var mapOption = { //지도를 생성할 때 필요한 기본 옵션
	 	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	 	level: 2 //지도의 레벨(확대, 축소 정도)
	 };

	// 지도를 생성합니다    
	 var map = new kakao.maps.Map(mapContainer, mapOption); 

	 // 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new kakao.maps.services.Geocoder();

	 // 주소로 좌표를 검색합니다
	 geocoder.addressSearch('서울특별시 강남구 강남대로 84길 16', function(result, status) {

	     // 정상적으로 검색이 완료됐으면 
	      if (status === kakao.maps.services.Status.OK) {

	         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	         // 결과값으로 받은 위치를 마커로 표시합니다
	         var marker = new kakao.maps.Marker({
	             map: map,
	             position: coords
	         });

	         // 인포윈도우로 장소에 대한 설명을 표시합니다
	         var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:150px;text-align:center;padding:6px 0;color:black;">주식회사 모빌리아</div>'
	         });
	         infowindow.open(map, marker);

	         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	         map.setCenter(coords);
	     } 
	 });    
	 </script>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />