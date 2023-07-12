<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./css/review_write.css">
</head>
<body>
<div id="reviewArea">
	<form action="inquiry_write_ok.net?p_no=${pv.p_no}" method="post" name="reviewform">
		<h2>상품 문의 작성</h2>

		<div id="reviewArea">
			<div id="pr_info2">
				<div><img src="./upload${pv.p_img1}" 
					style="width:100px;height:auto;"></div>
				<span id="pr_name2">${pv.p_name}</span>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div id="reviewArea">
			<table id="reviewTable">
				<tr>
					<th>아이디</th><td>${id}</td>
				</tr>
			</table>
			<div>
				<textarea rows="15" cols="40" placeholder="문의를 입력하세요."></textarea>
			</div>
			<div>
				<input id="reviewBtn" type="submit" value="등록" >
				<input id="cancelBtn" type="button" value="취소" onclick="self.close();">
			</div>
		</div>
	</form>
</div>
</body>
</html>