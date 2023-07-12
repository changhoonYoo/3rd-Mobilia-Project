<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/myshop_left-look.jsp" />
<script src="./js/member/modify.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <h2>회원 정보 수정</h2>
  </div>
  <div class="myshop-welcome">
   <img src="./images/myshop/member_image.gif"/>
   <div id="welcome-text">
    <p>
         저희 쇼핑몰을 이용해 주셔서 감사합니다. <b>${mvo.m_name}</b> 님은 <b>일반</b> 회원입니다.
    </p>
   </div>
   </div>
   <form name="m" method="post" action="modify_ok" onsubmit="return edit_check();">
   <div class="modifying-information-area">
    <table border="1">
    <caption><b class="star">*</b>는 필수항목</caption>
    <colgroup>
     <col style="width:150px;">
     <col style="width:auto;">
    </colgroup>
    <tbody>
    <tr>
     <th scope="row" class="edit-th">아이디</th>
     <td>
      <input id="m_id" name="m_id" value="${mvo.m_id}" onclick="show_edit-id-text();" readonly>
	  <span id="edit-id-text">아이디는 수정이 불가능합니다.</span>
     </td>
    </tr>
    
    
    <tr>
     <th class="edit-th">비밀번호 확인<b class="star">*</b></th>
     <td>
      <input type="password" id="m_pwd" name="m_pwd">
      &nbsp;<span id="check"></span>
     </td>
    </tr>
    
    <tr>
     <th class="edit-th">이름<b class="star">*</b></th>
     <td><input id="m_name" name="m_name" value="${mvo.m_name}"></td>
    </tr>
    
    <tr>
     <th id="post-th">주소<b class="star">*</b></th>
     <td>
     <input type="text" id="m_post" name="m_post" placeholder="우편번호" value="${mvo.m_post}" style="width:80px;" readonly>
	<input type="button" id="post" onclick="post_check()" value="우편번호 찾기"><br><br>
	<input type="text" id="m_roadAddr" name="m_roadAddr" placeholder="도로명주소" value="${mvo.m_roadAddr}" style="width:260px;" readonly>
	<input type="text" id="m_jibunAddr" name="m_jibunAddr" placeholder="지번주소" value="${mvo.m_jibunAddr}" style="width:260px;" readonly>
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" id="m_detailAddr" name="m_detailAddr" placeholder="상세주소" value="${mvo.m_detailAddr}" style="width:200px;">
     </td>
    </tr>
    
    <tr>
     <th class="edit-th">휴대전화<b class="star">*</b></th>
     <td>
      <select id="m_phone01" name="m_phone01" style="width:80px; height:30px; margin-left:12px; margin-right:12px;">
       <c:forEach var="p" items="${phone}">
        <option value="${p}"
        <c:if test="${mvo.m_phone01 == p}">selected</c:if>>${p}</option>
       </c:forEach>
      </select>
      -
      <input id="m_phone02" name="m_phone02" value="${mvo.m_phone02}" size="4" maxlength="4">-
      <input id="m_phone03" name="m_phone03" value="${mvo.m_phone03}" size="4" maxlength="4">
     </td>
    </tr>
    
    <tr>
     <th class="edit-th">이메일<b class="star">*</b></th>
     <td>
      <input id="mail_id" name="mail_id" value="${mvo.mail_id}">
      &nbsp;@&nbsp;<input id="mail_domain" name="mail_domain"  value="${mvo.mail_domain}" readonly>&nbsp;
      <select id="mail_list" onchange="domain_list();" style="width:85px; height:30px;">
       <c:forEach var="mail" items="${email}">
        <option value="${mail}" <c:if test="${mvo.mail_domain == mail}">selected</c:if>>${mail}</option>
       </c:forEach>
      </select>
     </td>
    </tr>
    
    
    </tbody>
    </table>
    <input type="submit" id="edit-submit" value="회원정보수정">
    <input type="reset" id="edit-reset" value="수정취소">
    <input type="button" id="del-button" value="회원탈퇴" onclick="open_delwindow();">
   </div>
  </form>
  <div class="pwd-change-area">
  	<h2>비밀번호 변경</h2>
  	<label style="font-size:14px">&nbsp;(영문 대소문자/숫자/특수문자 조합 6~16자)</label>
  	<form method="post" action="member_pwd_change" onsubmit="return pwd_change_check();">
  	<ul style="list-style:none; margin-top:40px;">
  	<li class="now-pwd">
  	<label>현재 비밀번호</label><input class="pwd-input" type="password" id="before_pwd" name="before_pwd" style="margin-left:100px;"/>
  	</li>
  	<li style="margin-top:15px; margin-bottom:10px;">
  	<label>변경 비밀번호</label><input class="pwd-input" type="password" id="change_pwd" name="change_pwd" style="margin-left:100px;"/>
  	</li>
  	<li>
  	<label style="margin-left:160px;">변경 비밀번호 확인</label><input class="pwd-input" type="password" id="pwd_check" name="pwd_check" style="margin-left:100px;"/>
  	<div style="display:inline-block; width:240px; height:30px; margin-right:-42px; margin-top:5px;">
  		<label>&nbsp;</label>
  		<label id="pwd_false" style="font-size:14px; color:red; font-weight:bold; display:none;">비밀번호가 일치하지 않습니다.</label>
  		<label id="pwd_success" style="font-size:14px; color:blue; font-weight:bold; margin-right:45px; display:none;">비밀번호가 일치 합니다.</label>
  	</div>
  	
  	</li>
  	</ul>
  	
  	<div class="pwd-submit-div"><input type="submit" class="pwd-submit" value="비밀번호 변경하기"/></div>
  	</form>
  </div>
  </div>
 </div>
 <jsp:include page="../include/footer.jsp" />