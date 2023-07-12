<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/member/login.css">
  <head>
 
  <title></title>
  </head>
  <body>
    <div class="login_containers">
        <h2>
            Login
        </h2>
        <div id='login_div'>
        <form method="post" action="member_login_ok">
            <h3>아이디</h3>
            <div class="loginID">
                <input type="text" class="input" placeholder="아이디" id="m_id" name="m_id" maxlength="20">
            </div>
            <h3>비밀번호</h3>
            <div class="loginPassword">
                <input type="password" class="input" placeholder="비밀번호" id="m_pwd" name="m_pwd" maxlength="20">
            </div>
            <div id='btn_login'>
            <input type="submit" class="bt_login" value="로그인">
            </div>
          </div>
            
           
        </form>
        <button type="button" class="findid" onclick="location='find_id'">아이디 찾기</button>
        <button type="button" class="findid"  onclick="location='find_pwd'" >비밀번호 찾기</button>
    </div>
</body>

<jsp:include page="../include/footer.jsp" />