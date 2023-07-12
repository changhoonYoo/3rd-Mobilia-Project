<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/admin_header.jsp"/>
<div id="cate">
	<ul>
		<li id="cate_li"><a href="admin_member_list" id="cate_a">회원 관리</a></li>
		<li id="cate_li_a"><a href="admin_product_list" id="cate_b">상품 관리</a></li>
		<li id="cate_li"><a href="admin_qna_list" id="cate_a">Q&A 관리</a></li>
		<li id="cate_li"><a href="admin_review_list" id="cate_a">후기 관리</a></li>
		<li id="cate_li"><a href="#" id="cate_a">문의 관리</a></li>
	</ul>
</div>
<style type="text/css">
th{
	background: lightgray;
}
th, td{
	border:1px solid black;
	padding: 10px;
}
#submit_btn{
	width:100px;height:50px;
	margin:30px 15px 50px 0px;
	color:white;
	background: #414A5B;
	border-radius:10px;
	font-size:14px;
	font-weight: 700;
	cursor: pointer;
}
#reset_btn{
	width:100px;height:50px;
	margin:30px 0px 50px 15px;
	background: #414A5B;
	color:white;
	border-radius:10px;
	font-size:14px;
	font-weight: 700;
	cursor: pointer;
}
#submit_btn:hover{
	color:#39d9c8;
	transition:all .3s ease;
}
#reset_btn:hover{
	color:#39d9c8;
	transition:all .3s ease;
}
}
</style>
<script src="./js/admin/admin_product.js"></script>
<div style="text-align: center;">
	<h2 id="ad_title">상품 등록</h2>
	<form method="post" action="admin_product_ok?page=${page}" 
	onsubmit="return product_join_check();" enctype="multipart/form-data">
			<table style="margin-left: auto;margin-right: auto;border: 1px solid black;">
				<tr>
					<th>상품명</th>
					<td>
						<input name="p_name" id="p_name" size="14">&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><input name="p_before_price" id="p_before_price" size="14"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원</td>
				</tr>
				<tr>
					<th>할인가</th>
					<td><input name="p_price" id="p_price" size="14"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원</td>
				</tr>
				<tr>
					<th>상품 수량</th>
					<td><input name="p_amount" id="p_amount" size="14"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">개</td>
				</tr>
				
				<tr>
					<th>상품 이미지1</th>
					<td style="padding-left:60px;">
					<input type="file" name="p_img1" id="p_img2" required="required"></td>
				</tr>
				
				<tr>
					<th>상품 이미지2</th>
					<td style="padding-left:60px;">
					<input type="file" name="p_img2" id="p_img2" required="required"></td>
				</tr>
				
				<tr>
					<th>MD's Choice</th>
					<td><input type="checkbox" name="p_choice" id="p_choice" value="1">등록</td>
				</tr>
				
				<tr>
					<th>상품 분류</th>
					<td>
						<select name="p_class" id="p_class" onchange="categoryChange(this)">
							<option value="">선택</option>
							<option value="bed">Bed</option>
							<option value="sofa">Sofa</option>
							<option value="table">Table</option>
							<option value="chair">Chair</option>
							<option value="cabinet">Cabinet</option>
						</select>
				</tr>
				<tr>	
					<th>카테고리</th>
					<td>
						<select name="p_category" id="p_category">
						</select>
					</td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td><textarea rows="4" cols="34" id="p_info" name="p_info" 
					style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<th>색상</th>
					<td>
					<select name="color_count" id="color_count">
						<option value="">선택</option>
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>색상 입력</th>
					<td><div id="demo"></div>
					<input type="hidden" name="p_color" id="p_color">
					</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>
					<select name="size_count" id="size_count">
						<option value="">선택</option>
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>사이즈 입력</th>
					<td><div id="demo1"></div>
					<input type="hidden" value="" name="p_size" id="p_size">
					</td>
				</tr>
			</table>
			
			<div>
				<input type="submit" value="등록" id="submit_btn">
				<input type="reset" value="취소" id="reset_btn" onclick="location='/admin_product_list?page=${page}'">
			</div>
		</form>
	</div>
</body>
</html>