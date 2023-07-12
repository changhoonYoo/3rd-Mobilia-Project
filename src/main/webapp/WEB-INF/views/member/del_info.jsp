<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 정보 입력</title>
</head>
<style>
 #del-info-area{
 	float:center;
 	text-align:center;
 }
 #m_delcont{
 	width:400px;
 	height:100px;
 	font-size:15px;
 }
 input{
 	width:230px; height:25px;
 	font-size:15px;
 }
 select{
 	width:240px; height:25px;
 	font-size:15px;
 }
 #del-submit{
 	width:120px;
 	height:30px;
 	margin-top:20px;
 	margin-right:30px;
 	font-size:15px;
 	background-color:black;
 	color:white;
 	cursor:pointer;
 }
 #del-cancle{
 	width:120px;
 	height:30px;
 	margin-top:20px;
 	font-size:15px;
 	background-color:grey;
 	color:white;
 	border:none;
 	cursor:pointer;
 }
</style>
<script src="./js/jquery.js"></script>
<%
 String[] deltext = {"선택", "없음", "이용이 불편하고 장애가 많아서", "다른사이트가 더 좋아서",
		 "사용빈도가 낮아서", "콘텐츠 불만","직접입력"};

 request.setAttribute("deltext", deltext);
%>
<script>


 function deltext_list(){
	 var num=m.del_text.selectedIndex;
	 
	 if(num == -1){//목록이 선택되지 않았다면
			return true;
	 }
	 
	 if(m.del_text.value == "직접입력"){
			m.m_delcont.value = "";
			m.m_delcont.readOnly = false;
			m.m_delcont.focus();
		}else if(m.del_text.value == "선택"){
			m.m_delcont.value = "";
			m.m_delcont.readOnly = true;
		}else{
			m.m_delcont.value = m.del_text.options[num].value;
			m.m_delcont.readOnly = true;
		}
 }
 
 function del_check(){
	 
	 if($.trim($("#del_pwd").val()) == ""){
			alert("비밀번호를 입력하세요!");
			$("#del_pwd").val("").focus();
			return false;
	 }else if($.trim($("#m_delcont").val()) == ""){
		 alert("탈퇴사유를 선택해주세요!");
		 $("#del-text").focus();
		 return false;
	 }
	 
 }
</script>
<body>
<div id="del-info-area">
 <div id="del-info-title">
  <img src="./images/main/main_logo.png" alt="main_logo">
  <h4>MOBILIA 회원탈퇴를 하시겠습니까?</h4>
 </div>
 <form name="m" method="post" action="member_del_ok" onsubmit="return del_check();">
 <div id="del-info-input">
  <label>비밀번호입력</label>&nbsp;&nbsp;<input type="password" id="del_pwd" name="del_pwd"><br><br>
  <label>탈퇴사유입력</label>&nbsp;&nbsp;
  <select id="del-text" name="del_text" onchange="deltext_list();">
  <c:forEach var="d" items="${deltext}">
   <option value="${d}">${d}</option>
  </c:forEach>
  </select><br><br>
  <textarea id="m_delcont" name="m_delcont" readonly>
  </textarea>
 </div>
 <div id="del-info-button">
  <input type="submit" id="del-submit" value="회원탈퇴"> <input type="button" id="del-cancle" value="취소" onclick="self.close();">
 </div>
 </form>
</div>
</body>
</html>