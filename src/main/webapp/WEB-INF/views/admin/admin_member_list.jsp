<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/admin_header.jsp"/>
<script src="./js/admin/admin_m_del.js"></script>
<script>
function selectState(){
	var value = $('#find_field').val();
	if(value == 'm_state'){
		$('#find_text').empty();
		$('#find_text').append("<input name='find_name' id='find_name' size='14' value='${find_name}' placeholder='가입 or 탈퇴 입력'>");
	}else{
		$('#find_text').empty();
		$('#find_text').append('<input name="find_name" id="find_name" size="14" value="${find_name}">');
	}
}
</script>
<div id="cate">
	<ul>
		<li id="cate_li_a"><a href="admin_member_list" id="cate_b">회원 관리</a></li>
		<li id="cate_li"><a href="admin_product_list" id="cate_a">상품 관리</a></li>
		<li id="cate_li"><a href="admin_qna_list" id="cate_a">Q&A 관리</a></li>
		<li id="cate_li"><a href="admin_review_list" id="cate_a">후기 관리</a></li>
		<li id="cate_li"><a href="#" id="cate_a">문의 관리</a></li>
	</ul>
</div>
<div id="list_m">
	<h2 id="ad_title">회원 관리</h2>
	<div style="float:left;margin-left:30px;color:#999">TOTAL <b style="color:#333;">${listcount}</b> MEMBERS</div>
	
	<form action="admin_member_list" method="get">
		<div id="find_wrap" style="float:right;margin-right:35px;">
			<select name="find_field" id="find_field" onchange="selectState()">
				<option value="m_id"
					<c:if test="${find_field=='m_id'}">
	   					${'selected'}</c:if>>아이디</option>
				<option value="m_name"
					<c:if test="${find_field=='m_name'}">
	   					${'selected'}</c:if>>이름</option>
	   			<option value="m_state"
					<c:if test="${find_field=='m_state'}">
	   					${'selected'}</c:if>>회원 상태</option>
			</select>
			<span id="find_text">
			<input name="find_name" id="find_name" size="14" value="${find_name}" />
			</span>
			<input id="btn" type="submit" value="검색" />
			<c:if test="${!empty find_name}"><input type="button" value="전체보기" id="btn"
			onclick="location='/admin_member_list'"></c:if>
		</div>
	</form>
	<ul id="title_m">
		<li>번호</li>
		<li>아이디</li>
		<li>비밀번호</li>
		<li>이름</li>
		<li>우편번호</li>
		<li>도로명 주소</li>
		<li>지번 주소</li>
		<li>상세 주소</li>
		<li>연락처</li>
		<li>이메일</li>
		<li>가입 날짜</li>
		<li>상태</li>
		<li>탈퇴 사유</li>
		<li>탈퇴 날짜</li>
		<li>회원 탈퇴</li>
		
	</ul>
	<c:if test="${!empty mlist}">
		<c:forEach var="m" items="${mlist}">
			<ul id="list_ul">
				<li>
				${m.m_no}
				<input type="hidden" value="${m.m_no}" id="m_no">
				</li>
				<li>${m.m_id}</li>
				<li>${m.m_pwd}</li>
				<li>${m.m_name}</li>
				<li>${m.m_post}</li>
				<li>${m.m_roadAddr}</li>
				<li>${m.m_jibunAddr}</li>
				<li>${m.m_detailAddr}</li>
				<li>${m.m_phone01}-${m.m_phone02}-${m.m_phone03}</li>
				<li>${m.mail_id}<br>@${m.mail_domain}</li>
				<li>${fn:substring(m.m_date,0,10)}</li>
				<li><c:if test="${m.m_state == 2}">탈퇴</c:if>
				<c:if test="${m.m_state == 1}">가입</c:if></li>
				<li><c:if test="${m.m_delcont != null}">${m.m_delcont}</c:if>
				<c:if test="${m.m_delcont == null}">&nbsp;</c:if></li>
				<li><c:if test="${m.m_deldate != null}">${fn:substring(m.m_deldate,0,10)}</c:if>
				<c:if test="${m.m_deldate == null}">&nbsp;</c:if></li>
				
				<li>
					<c:if test="${m.m_state == 1}">
					<input id="del_btn"type="button" value="탈퇴" onclick="window.open('/admin_mDel_info?m_no=${m.m_no}','Mobilia','width=600px,height=500px,scrollbars=no');" >
					</c:if>
				</li>
			</ul>
		</c:forEach>
	</c:if>
	<div style="clear:both;"></div>
	<c:if test="${empty mlist}">
		<h3 style="color:#999;">검색된 회원정보가 없습니다.</h3>
	</c:if>
	<div id="paging" style="margin:30px 0px 50px 0px;">
		<%-- 검색전 페이징 --%>
		<c:if test="${(empty find_field) && (empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_member_list?page=${page-1}">[이전]</a>&nbsp;
    		</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">
					<%--현재 페이지가 선택되었다면--%>
     			<span id="span_b"><${a}></span>
    			</c:if>
				<c:if test="${a != page}">
					<%--현재 페이지가 선택되지 않았다면 --%>
				<a href="admin_member_list?page=${a}">[${a}]</a>&nbsp;
     			</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    		<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_member_list?page=${page+1}">[다음]</a>
			</c:if>
		</c:if>

		<%-- 검색후 페이징 --%>
		<c:if test="${(!empty find_field) || (!empty find_name)}">
			<c:if test="${page<=1}">
     			<span id="span_a">[이전]&nbsp;</span>
    		</c:if>
			<c:if test="${page>1}">
				<a href="admin_member_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
				[이전]</a>&nbsp;
    		</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">
					<%--현재 페이지가 선택되었다면--%>
     				<span id="span_b"><${a}></span>
     			</c:if>
				<c:if test="${a != page}">
					<%--현재 페이지가 선택되지 않았다면 --%>
					<a href="admin_member_list?page=${a}&find_field=${find_field}&find_name=${find_name}">
						[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
    			<span id="span_a">[다음]</span>
    		</c:if>
			<c:if test="${page<maxpage}">
				<a href="admin_member_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
					[다음]</a>
			</c:if>
		</c:if>
	</div>
	<div style="clear:both;"></div>
	
</div>
</body>
</html>