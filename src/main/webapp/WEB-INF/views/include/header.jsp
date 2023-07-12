<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>mobilia</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/list.css">
<script src="./js/jquery.js"></script>
<script src="./js/header.js"></script>
</head>
<body>
	<div id="wrap">
	<%-------------------------------------- 헤더 영역 --------------------------------------%>
		<header class="header"> 
	<%-------------------------------------- 로그인쪽 메뉴 ------------------------------------%>
			<div id="login"> 
			<c:if test="${empty id}">
				<a href="/member_login">Login</a> <a href="/member_join">Join</a>
			</c:if>
			<c:if test="${!empty id}">
			 	<a href="/member_logout">Logout</a> <a href="/modify">Modify</a>
			</c:if>
			<c:if test="${id != 'admin'}">
				<a href="/cart_main">Cart</a>
			</c:if> 
			<c:if test="${id == 'admin'}">
				<a href="admin_product.net">Admin</a>
			</c:if>
			<c:if test="${id != 'admin'}">
				<a href="/myshop_main">Myshop</a>
			</c:if>
			<a href="/community_main?board_type=free">Community</a>
			</div>
			<%-------------------------------------- 로고 ------------------------------------%>
			<div id="logo">
				<a href="/mobilia"><img id="logo_img" src="./images/main/main_logo.png"></a>
			</div>
			<%-------------------------------------- sns쪽 메뉴 -------------------------------%>
			
			<div id="sns"> 
				<a href="#" id="face">
					<img src="./images/main/facebook_off.png" width="30" height="30"
					onmouseover="this.src='./images/main/facebook_on.png'"
					onmouseout="this.src='./images/main/facebook_off.png'"></a> 
				<a href="https://instagram.com/mobilia2023_03?igshid=YmMyMTA2M2Y=" id="instar">
					<img src="./images/main/instargram_off.png" width="31" height="31"
					onmouseover="this.src='./images/main/instargram_on.png'"
					onmouseout="this.src='./images/main/instargram_off.png'"></a> 
				<a href="https://blog.naver.com/mobilia2023" id="naver">
					<img src="./images/main/naver_off.png" width="30" height="30"
					onmouseover="this.src='./images/main/naver_on.png'"
					onmouseout="this.src='./images/main/naver_off.png'"></a>
				<a href="#" id="kakao">
					<img src="./images/main/kakao_off.png" width="30" height="30" 
					onmouseover="this.src='./images/main/kakao_on.png'"
					onmouseout="this.src='./images/main/kakao_off.png'"></a>
			<%--------------------------------------검색필드 ---------------------------------%>
			<form method="get" action="/mobilia_search" id="search_form">
				<input type="text" id="search_text" name="search_text">
				<input type="submit" id="search_btn" value="">
			</form>
			</div>
			
			<div class="clear"></div>
			<%-------------------------------------- 메인 메뉴 --------------------------------%>
			<nav>	
				<ul class="menu">
					<%------------------------- 전체 메뉴 ---------------------------%>
					<li>
						<button class="all_menu">〓</button>
						<div id="all_menu_div">
							<ul id="info_ul">

								<li ><p id="info">All Category</p></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
							<ul>
								<li><a href="product?c=bed&state=single">싱글 사이즈</a></li>
							<li><a href="product?c=bed&state=super single">슈퍼싱글</a></li>
								<li><a href="product?c=bed&state=double">더블 사이즈</a></li>
								<li><a href="product?c=bed&state=queen">퀸 사이즈</a></li>
								<li><a href="product?c=bed&state=king">킹 사이즈</a></li>
							</ul>
							<ul>
								<li><a href="product?c=sofa&state=1인용 소파">1인용 소파</a></li>
								<li><a href="product?c=sofa&state=2~3인용 소파">2~3인용 소파</a></li>
								<li><a href="product?c=sofa&state=카우치형 소파">카우치형 소파</a></li>
								<li><a href="product?c=sofa&state=리클라이너 소파">리클라이너 소파</a></li>
							</ul>
							<ul>
								<li><a href="product?c=table&state=주방용 테이블">주방용 테이블</a></li>
								<li><a href="product?c=table&state=사무용 테이블">사무용 테이블</a></li>
								<li><a href="product?c=table&state=거실용 테이블">거실용 테이블</a></li>
								<li><a href="product?c=table&state=H형 책상">H형 책상</a></li>
								<li><a href="product?c=table&state=좌식 책상">좌식 책상</a></li>
							</ul>
							<ul>
								<li><a href="product?c=chair&state=식탁 의자">식탁 의자</a></li>
								<li><a href="product?c=chair&state=책상 의자">책상 의자</a></li>
								<li><a href="product?c=chair&state=서재/사무용 의자">서재/사무용 의자</a></li>
								<li><a href="product?c=chair&state=침대형 의자">침대형 의자</a></li>
								<li><a href="product?c=chair&state=게이밍 체어">게이밍 체어</a></li>
							</ul>
							<ul>
								<li><a href="product?c=cabinet&state=옷장">옷장</a></li>
								<li><a href="product?c=cabinet&state=드레스룸">드레스룸</a></li>
								<li><a href="product?c=cabinet&state=수납장">수납장</a></li>
								<li><a href="product?c=cabinet&state=붙박이장">붙박이장</a></li>
								<li><a href="product?c=cabinet&state=신발장">신발장</a></li>
							</ul>
							<ul>
								<li><a href="/aboutus_location">찾아오시는 길</a></li>
							</ul>
							<button type="button" id="all_menu_close">X</button>
						</div>
					</li>
					<%-------------------------- 상단 메뉴--------------------------%>
					<li><a href="product?c=bed&state=all">Bed</a>
						<ul class="sub_menu">
							<li><a href="product?c=bed&state=single">싱글 사이즈</a></li>
							<li><a href="product?c=bed&state=super single">슈퍼싱글</a></li>
							<li><a href="product?c=bed&state=double">더블 사이즈</a></li>
							<li><a href="product?c=bed&state=queen">퀸 사이즈</a></li>
							<li><a href="product?c=bed&state=king">킹 사이즈</a></li>
						</ul>
					</li>
					<li><a href="product?c=sofa&state=all">Sofa</a>
						<ul class="sub_menu">
							<li><a href="product?c=sofa&state=1인용 소파">1인용 소파</a></li>
							<li><a href="product?c=sofa&state=2~3인용 소파">2~3인용 소파</a></li>
							<li><a href="product?c=sofa&state=카우치형 소파">카우치형 소파</a></li>
							<li><a href="product?c=sofa&state=리클라이너 소파">리클라이너 소파</a></li>
						</ul>
					</li>
					<li><a href="product?c=table&state=all">Table</a>
						<ul class="sub_menu">
							<li><a href="product?c=table&state=주방용 테이블">주방용 테이블</a></li>
							<li><a href="product?c=table&state=사무용 테이블">사무용 테이블</a></li>
							<li><a href="product?c=table&state=거실용 테이블">거실용 테이블</a></li>
							<li><a href="product?c=table&state=H형 책상">H형 책상</a></li>
							<li><a href="product?c=table&state=좌식 책상">좌식 책상</a></li>
						</ul>
					</li>
					<li><a href="product?c=chair&state=all">Chair</a>
						<ul class="sub_menu">
							<li><a href="product?c=chair&state=식탁 의자">식탁 의자</a></li>
							<li><a href="product?c=chair&state=책상 의자">책상 의자</a></li>
							<li><a href="product?c=chair&state=서재/사무용 의자">서재/사무용 의자</a></li>
							<li><a href="product?c=chair&state=침대형 의자">침대형 의자</a></li>
							<li><a href="product?c=chair&state=게이밍 체어">게이밍 체어</a></li>
						</ul>
					</li>
					<li><a href="product?c=cabinet&state=all">Cabinet</a>
						<ul class="sub_menu">
							<li><a href="product?c=cabinet&state=옷장">옷장</a></li>
							<li><a href="product?c=cabinet&state=드레스룸">드레스룸</a></li>
							<li><a href="product?c=cabinet&state=수납장">수납장</a></li>
							<li><a href="product?c=cabinet&state=붙박이장">붙박이장</a></li>
							<li><a href="product?c=cabinet&state=신발장">신발장</a></li>
						</ul>
					</li>
					<li><a href="/aboutus_location">About us</a>
						<ul class="sub_menu">
							<li><a href="/aboutus_location">찾아오시는 길</a>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="clear"></div>
		</header>
	</div>