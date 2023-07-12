<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/member/login.css">
<meta charset="UTF-8">

<title></title>
</head>
<body>

<div class="login1">
<div>
<h2>회원님의 아이디는</h2>
<h1 class="find">${pm2.m_id}</h1>
<h2>입니다.</h2>
<div class="login4">
<button class="btn1" onclick="location='/member_login'"> 로그인 하기</button>
<button class="btn1" onclick="location='/find_pwd'"> 비밀번호 찾기</button>
</div>

</div>

</div>



</body>
</html>
<jsp:include page="../include/footer.jsp" />