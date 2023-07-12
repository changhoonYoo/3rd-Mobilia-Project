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
	<h2 id="ad_title">상품 수정</h2>
	<form method="post" action="admin_product_edit_ok"
	onsubmit="return product_join_check();" enctype="multipart/form-data">
		<input type="hidden" value="${pv.p_no}" name="p_no">
		<input type="hidden" value="${page}" name="page">
			<table style="margin-left: auto;margin-right: auto;border: 1px solid black;">
				<tr>
					<th>상품명</th>
					<td>
						<input name="p_name" id="p_name" size="14" value="${pv.p_name}">&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><input name="p_before_price" id="p_before_price" size="14"
					value="${pv.p_before_price}" 
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원</td>
				</tr>
				<tr>
					<th>할인가</th>
					<td><input name="p_price" id="p_price" size="14"
					value="${pv.p_price}"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원</td>
				</tr>
				<tr>
					<th>상품 수량</th>
					<td><input name="p_amount" id="p_amount" size="14"
					value="${pv.p_amount}"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">개</td>
				</tr>
				
				<tr>
					<th>상품 이미지1</th>
					<td style="padding-left:60px;">
					<input type="file" name="p_img1" id="p_img2">
					<br>${pv.p_img1}</td>
				</tr>
				
				<tr>
					<th>상품 이미지2</th>
					<td style="padding-left:60px;">
					<input type="file" name="p_img2" id="p_img2">
					<br>${pv.p_img2}</td>
				</tr>
				
				<tr>
					<th>MD's Choice</th>
					<td><input type="checkbox" name="p_choice" id="p_choice" value="1"
					<c:if test="${pv.p_choice == 1}">checked</c:if>>등록</td>
				</tr>
				
				<tr>
					<th>상품 분류</th>
					<td>
						<select name="p_class" id="p_class" onchange="categoryChange(this)">
							<option value="">선택</option>
							<option value="bed" <c:if test="${pv.p_class == 'bed'}">selected</c:if>>Bed</option>
							<option value="sofa" <c:if test="${pv.p_class == 'sofa'}">selected</c:if>>Sofa</option>
							<option value="table" <c:if test="${pv.p_class == 'table'}">selected</c:if>>Table</option>
							<option value="chair" <c:if test="${pv.p_class == 'chair'}">selected</c:if>>Chair</option>
							<option value="cabinet" <c:if test="${pv.p_class == 'cabinet'}">selected</c:if>>Cabinet</option>
						</select>
				</tr>
				<tr>	
					<th>카테고리</th>
					<td>
						<select name="p_category" id="p_category">
							<option value="${pv.p_category}" selected>${pv.p_category}</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td><textarea rows="4" cols="34" id="p_info" name="p_info" 
					style="resize: none;">${pv.p_info}</textarea></td>
				</tr>
				<tr>
					<th>색상</th>
					<td>
					<select name="color_count" id="color_count">
						<option value="">선택</option>
						<option value="1" <c:if test="${colorCount == 1}">selected</c:if>>1개</option>
						<option value="2" <c:if test="${colorCount == 2}">selected</c:if>>2개</option>
						<option value="3" <c:if test="${colorCount == 3}">selected</c:if>>3개</option>
						<option value="4" <c:if test="${colorCount == 4}">selected</c:if>>4개</option>
						<option value="5" <c:if test="${colorCount == 5}">selected</c:if>>5개</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>색상 입력</th>
					<td><div id="demo">
						<c:set var="i" value="0"/>
						<c:forEach var="p" items="${colorList}" begin="0" end="${colorCount}">
							<input id="p_color${i}" name="p_color${i}" size="12" value="${p}"><br>
							<c:set var="i" value="${i+1}"/>
						</c:forEach>
						</div>
					<input type="hidden" name="p_color" id="p_color">
					</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>
					<select name="size_count" id="size_count">
						<option value="">선택</option>
						<option value="1" <c:if test="${sizeCount == 1}">selected</c:if>>1개</option>
						<option value="2" <c:if test="${sizeCount == 2}">selected</c:if>>2개</option>
						<option value="3" <c:if test="${sizeCount == 3}">selected</c:if>>3개</option>
						<option value="4" <c:if test="${sizeCount == 4}">selected</c:if>>4개</option>
						<option value="5" <c:if test="${sizeCount == 5}">selected</c:if>>5개</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>사이즈 입력</th>
					<td><div id="demo1">
						<c:set var="i" value="0"/>
						<c:forEach var="p" items="${sizeList}" begin="0" end="${sizeCount}">
							<input id="p_size${i}" name="p_size${i}" size="24" value="${p}"><br>
							<c:set var="i" value="${i+1}"/>
						</c:forEach>
						</div>
					<input type="hidden" value="" name="p_size" id="p_size">
					</td>
				</tr>
			</table>
			
			<div>
				<input type="submit" value="등록" id="submit_btn">
				<input type="reset" value="취소" id="reset_btn" onclick="location='admin_product_list?page=${page}'">
			</div>
		</form>
	</div>
</body>
</html>