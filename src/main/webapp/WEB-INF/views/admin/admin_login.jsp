<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mobilia 관리자</title>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css" />
<script src="./js/jquery.js"></script>
<script src="./js/admin/admin.js"></script>
</head>
<body>
<div id="wrap">
	<div id="Login_wrap">
		<h2 class="Login_title">mobilia 관리자</h2>
		<form method="post" action="admin_login_ok" onsubmit="return admin_check();">
			<table id="Login_t">
				<tr>
					<th>아이디</th>
					<td>
						<input name="admin_id" id="admin_id" size="14" tabindex="1" /> 
					</td>
					<th rowspan="2">
						<input type="submit" value="로그인" id="login_btn"/>
					</th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="admin_pwd" id="admin_pwd" size="14" tabindex="2" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>