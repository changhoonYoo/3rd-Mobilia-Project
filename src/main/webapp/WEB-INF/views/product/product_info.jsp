<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/product_info.css">
<script src="./js/jquery.js"></script>
<script src="./js/product_info.js"></script>
<div>
<%-------------------------- 사이드 버튼 2 ------------------------%>
		<span id="sidebar_02">
			<input type="button" class= "side_btn_02" id="up_btn">
			<input type="button" class= "side_btn_02" id="down_btn">
		</span>
</div>
	<div id="contents">
		<div id="detail">
			<div id="keyImg">
				<div id="thum" style="position:relative;">
					<a href="#" onclick="return false;">
						<img src="./upload${pv.p_img1}" width="470" height="470"
						onmouseover="this.src='./upload${pv.p_img2}'"
						onmouseout="this.src='./upload${pv.p_img1}'" style="z-index:1">
						<c:if test="${pv.p_amount == 0}">
							<img src="./images/product/soldout_info.png" width="150" height="150"
								style="position: absolute; z-index: 2; left:0px; top:0px;">
						</c:if>
					</a>
				</div>
			</div>
			<div id="infoArea">
				<span style="float:right; padding-right:5px;">
				  <c:if test="${empty hre || hre == 0}">
					<a id="wish" style="cursor:pointer;"><img src="./images/product/wish.png" id="wish_img" width="30"></a>
				  </c:if>
				  <c:if test="${!empty hre && hre != 0}">
				    <a id="wish" style="cursor:pointer;"><img src="./images/product/wish_on.png" id="wish_img" width="30"></a>
				  </c:if>
					<script>
						$("#wish").on("click", function(){
							
							var m_no = '<c:out value="${m_no}"/>';
							if(m_no != ''){
							var p_no = '<c:out value="${pv.p_no}"/>';
							
							
							$.ajax({
								url : '/myshop_heart_ok',
								type : 'post',
								headers:{
									"Content-Type" :"application/json",
									"X-HTTP-Method-Override":"POST"
								},
								dataType:'text',
								data: JSON.stringify({
									m_no : m_no,	
									p_no : p_no
								}),
								success : function(result){
									if(result == 'SUCCESS'){
										alert('관심상품에 추가 되었습니다.');
										document.getElementById("wish_img").src="./images/product/wish_on.png";
									}else if(result == 'DELETE'){
										alert('관심상품에서 제거되었습니다.');
										document.getElementById("wish_img").src="./images/product/wish.png";
									}
								}
							});
							}else{
								alert('로그인 후 관심상품 등록이 가능합니다.')
							}
						});
					</script>
				</span>
				<table id="info_table" border="1">
					<tr>
						<th colspan="2"><span
							style="font-size: 16px; color: #333333; font-weight: bold;">${pv.p_name}</span>
						
						</th>
					</tr>
					<tr>
						<th><span
							style="font-size: 15px; color: #333333; font-weight: bold;">판매가</span>
						</th>
						<td><span
							style="font-size: 13px; color: #a1a1a1; font-weight: bold; text-decoration: line-through;">
								<fmt:formatNumber value="${pv.p_before_price}" pattern="###,###,###"/>원</span>
						</td>
					</tr>
					<tr>
						<th><span
							style="font-size: 15px; color: #333333; font-weight: bold;">할인가</span>
						</th>
						<td><span
							style="font-size: 13px; color: #971215; font-weight: bold;">
								<span>
									<fmt:formatNumber value="${pv.p_price}" pattern="###,###,###"/>
									<input type="hidden" value="${pv.p_price}" id="p_price">
								</span>	
								<strong>원</strong>
							</span>
						</td>
					</tr>
					<tr>
						<th><span style="font-size: 15px; color: #333333;">상품설명</span>
						</th>
						<td><span style="font-size: 13px; color: #333333;">
								${p_info}<br>
						</span></td>
					</tr>
					<tr>
						<th>색상</th>
						<td><select name="p_color" id="p_color">
								<option>- [필수] 옵션을 선택해 주세요 -</option>
								<option>-------------------</option>
								<c:forEach var="color" items="${colorList}">
       								<option value="${color}">${color}</option>
        						</c:forEach>
						</select>
					</tr>
					<tr>
						<th>사이즈</th>
						<td><select name="p_size" id="p_size">
								<option>- [필수] 옵션을 선택해 주세요 -</option>
								<option>-------------------</option>
								<c:forEach var="size" items="${sizeList}">
       								<option value="${size}">${size}</option>
        						</c:forEach>
						</select>
					</tr>
					<tr>
						<th>수량</th>
						<td>
							<c:if test="${pv.p_amount != 0}">
								<input type='button' id="amount_minus" class="a_btn"onclick='count("minus");' value="-"/>
								<input type="text" id="amount_count" size="1"  value="1" readonly>
								<input type='button' id="amount_plus" class="a_btn" onclick='count("plus");' value="+"/>
								<span id="amount_info">(최대 : <b><span id="p_amount">${pv.p_amount}</span></b>개)</span>
							</c:if>
							<c:if test="${pv.p_amount == 0}">
								<span style="color:red; font-weight: 600;">SOLD OUT</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<div id="result_price">
								<h1><fmt:formatNumber value="${pv.p_price}" pattern="###,###,###"/>원</h1>
							</div>
						</th>
					</tr>
				</table>
			</div>
			<div id="bottom_tep">
				<input type="hidden" id="p_price" value="${pv.p_price}">
				<input type="hidden" id="cart_price">
				<input type="hidden" id="sale_price" value="${sale_price}">
				<input type="hidden" id="m_id" value="${m_id}">
				<input type="hidden" id="p_no" value="${pv.p_no}">
			<c:if test="${pv.p_amount != 0}">
				<div id="buyBtn"><a href="#" class="orderBtn">구매하기</a></div>
				<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
				<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
				<script>
					var m_id = $("#m_id").val();
				
					$(".orderBtn").on('click', function(){
						if(m_id != ''){
						var cart_no = parseInt($('.orderBtn').data('no'));
						var order_name = $('.orderBtn').data('name');
						var amount = '' + $('.orderBtn').data('price');
						var amount_pay = amount.substring(0,2);
	
						var m_id = '<c:out value="${m_id}"/>';
						var name = '<c:out value="${mvo.m_name}"/>';
						var email = '<c:out value="${email}"/>';
						var addr = '<c:out value="${mvo.m_jibunAddr}"/>';
						var post = '<c:out value="${mvo.m_post}"/>';
						var order_no = parseInt(new Date().getTime());
						var merchant_id = 'merchant_'+order_no;
	
	 					IMP.init('imp53454156');
	  
	  					IMP.request_pay({
	    				pg: 'html5_inicis',
	    				pay_method: 'card',
	    				merchant_uid : merchant_id,
	    				name : order_name,
	    				amount : amount_pay,
	    				buyer_email : email,
	    				buyer_name : name,
	    				buyer_tel : '010-1234-5678',
	    				buyer_addr : addr,
	    				buyer_postcode : post
	  				}, function (rsp) { // callback
						console.log(rsp);
	     				if(rsp.success){
	    					$.ajax({
	 							type:'post',
	 							url:'/cart/each_order_ok',
	 							traditional:true, //ajax 배열 넘기기 옵션
	 							data: {
	 								cart_no : cart_no,
	 								order_no : order_no,
	 								m_id : m_id,
	 								order_name : order_name,
	 								order_price : amount
	 							},
	 							dataType: "text",
	 							success:function(result){
	 								if(result == 'SUCCESS'){
	 									alert('결제가 완료 되었습니다.');
	 									location.reload();
	 								}
	 							}
	 						});
	     				}else{
	    	 				var msg = '결제에 실패하였습니다.';
	    	 				msg += '에러내용 : ' + rsp.error_msg;
	     				}	  
	  				});
				}else{
					alert('로그인후 상품구매가 가능합니다');
				}
	 			});	 
			</script>
			</c:if>
				<c:if test="${pv.p_amount == 0}">
					<div id="soldBtn"><a href="#" onclick="return false;">SOLD OUT</a></div> 
				</c:if>
				<c:if test="${pv.p_amount != 0}">
				<div id="cartBtn"><a href="#">장바구니</a></div>
				</c:if>
				<!-------------------- 장바구니 추가 아작스 불러오기 -------------------->
				<script src="./js/cart/cart_add.js"></script>
			</div>
		</div>
		<div id="sub_info">
			<div id="sub">
			<h2>- 상품 정보 -</h2>
				<img src="./images/product/size_info.jpg">
			</div>
			<div id="sub">
				<img src="./upload${pv.p_img1}">
				<img src="./upload${pv.p_img2}">
			</div>
			<div id="sub">
				<img src="./images/product/delivery_info.png" width="1100">
			</div>
			<div class="clear"></div>
			<div id="info_text">
				<p>교환안내</p>
				<ul>
					<li>교환/취소/반품/환불은 상품수령 후 7일 이내 가능합니다. 단, 고객님이 받으신 상품이 표시광고 및 계약내용과 다른 경우, 상품을 수령한 날로 부터 3개월, 그 사실을 안 날로부터 30일 이내 가능합니다.</li>
					<li>주문제작상품/설치배송상품은 제품의 특성상 설치 후 교환/환불이 불가합니다.</li>
					<li>교환/반품의 경우, 원활한 주문 확인을 위해 구매하신 쇼핑몰 고객센터로 접수해주시길 바랍니다.</li>
					<li>구매하신 사이트에서 제공하는 자동반품시스템에 의한 임의 반품 처리에 따른 발생비용은 고객님 부담입니다.</li>
					<li>매트리스 상품은 피부가 직접 닿는 제품으로, 위생 관리상 포장 개봉 및 사용 후에는 교환/환불이 불가합니다.</li>
					<li>고객님의 부주의 및 과실로 인해 제품 가치가 상실될 경우에는 교환/환불이 불가합니다.</li>
					<li>기사님 방문 시 제품에 이상이 없을 경우, 왕복 배송비는 고객 부담입니다.</li>
					<li>교환/환불/피해보상은 공정거래 위원회에서 고시한 소비자 분쟁해결기준에 따릅니다.</li>
					<li>구입후 교환 및 반품에 관한 비용은 고객센터로 연락하셔서 꼭 확인해주세요.</li>
					<li>반품비가 발생하는 경우가 있습니다. <구매전 유의사항>을 꼭 필독해주세요.</li>
				</ul>
				<p>환불안내</p>
				<ul>
					<li>교환/취소/반품/환불은 상품수령 후 7일 이내 가능합니다. 단, 고객님이 받으신 상품이 표시광고 및 계약내용과 다른 경우, 상품을 수령한 날로 부터 3개월, 그 사실을 안 날로부터 30일 이내 가능합니다.</li>
					<li>주문제작상품/설치배송상품은 제품의 특성상 설치 후 교환/환불이 불가합니다.</li>
					<li>교환/반품의 경우, 원활한 주문 확인을 위해 구매하신 쇼핑몰 고객센터로 접수해주시길 바랍니다.</li>
					<li>구매하신 사이트에서 제공하는 자동반품시스템에 의한 임의 반품 처리에 따른 발생비용은 고객님 부담입니다.</li>
					<li>매트리스 상품은 피부가 직접 닿는 제품으로, 위생 관리상 포장 개봉 및 사용 후에는 교환/환불이 불가합니다.</li>
					<li>고객님의 부주의 및 과실로 인해 제품 가치가 상실될 경우에는 교환/환불이 불가합니다.</li>
					<li>기사님 방문 시 제품에 이상이 없을 경우, 왕복 배송비는 고객 부담입니다.</li>
					<li>교환/환불/피해보상은 공정거래 위원회에서 고시한 소비자 분쟁해결기준에 따릅니다.</li>
					<li>구입후 교환 및 반품에 관한 비용은 고객센터로 연락하셔서 꼭 확인해주세요.</li>
					<li>반품비가 발생하는 경우가 있습니다. <구매전 유의사항>을 꼭 필독해주세요.</li>
				</ul>
				<p>AS안내</p>
				<ul>
					<li>소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</li>
					<li>A/S는 판매자에게 문의하시기 바랍니다.</li>
				</ul>
			</div>
		</div>
		<div id="contents">
			<div class="replyArea">
				<ul id="replybar">
					<li id="infoP_scroll">상품정보</li>
					<li id="infoB_scroll">구매안내</li>
					<li id="review_scroll">상품후기</li>
					<li id="inquiry_scroll">상품문의</li>
					<li id="buy_scroll">구매하기</li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="review_container">
				<div id="titleCon">	
					<div id="review_title">상품후기 <span>(${listcount})</span></div>
					<input type="hidden" id="p_no" value="${pv.p_no}">
					<input type="button" id="reviewBtn" onclick="review_check();" value="후기 작성">
					<p>상품과 무관한 사진 및 욕설/비속어가 포함된 리뷰는 고지 없이 삭제될 수 있습니다.<br>
						구매하신 상품을 직접 촬영한 사진만 리뷰 등록 및 마일리지 지급이 가능합니다.<br>
						위의 사유들로 인해 고지 없이 사진 및 리뷰가 삭제된 경우, 지급된 마일리지 일부 또는 전액이 회수될 수 있습니다.<br>
						작성하신 리뷰의 사진 및 글은 마케팅에 활용될 수 있습니다.</p>
				</div>
				<c:if test="${!empty rlist}">
					<c:forEach var="r" items="${rlist}">
						<div id="review">
						<ul>	
							<li id="p_img1">
								<img src="./upload${r.p_img1}" width="50" height="50" id="re_img">
								<c:forEach begin="1" end="${r.re_star}" step="1">
									<img src="./images/product/star1.png" width="13">
								</c:forEach>
								<c:forEach begin="1" end="${5 - r.re_star}">
									<img src="./images/product/star0.png" width="13">
								</c:forEach>
								<c:if test="${id == r.m_id}">
									<a href="review_edit?re_no=${r.re_no}&page=${page}" id="re_edit"
									onclick="window.open(this.href,'','width=600,height=600'); return false">수정</a>
									<a href="review_del_ok?p_no=${r.p_no}&page=${page}&re_no=${r.re_no}" id="re_del">삭제</a>
								</c:if>
							</li>
							<li id="m_id"><span>${r.m_id.substring(0,4)}**** | ${r.re_date}</span>
							<li id="m_review"><span>${fn:replace(r.re_cont,n,'<br>')}</span>
							</ul>
						</div>
						<div class="clear"></div>
					</c:forEach>
				</c:if>
				<div id="contents2">
					<c:if test="${page <= 1}">
						<span id="span_a">[이전]&nbsp;</span>
					</c:if>
					<c:if test="${page > 1}">
						<a href="product_info?p_no=${pv.p_no}&page=${page-1}">[이전]</a>&nbsp;
					</c:if>
					
					<%-- 현재 쪽번호 출력 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
							<span id="span_b"><${a}></span>
						</c:if>
						<c:if test="${a != page}"> <%-- 현재 페이지가 선택 안된 경우 --%>
							<a href="product_info?p_no=${pv.p_no}&page=${a}">[${a}]</a>&nbsp;
						</c:if>
					</c:forEach>
				
					<c:if test="${page >= maxpage}">
						<span id="span_a">[다음]</span>
					</c:if>
					<c:if test="${page < maxpage}">
						<a href="product_info?p_no=${pv.p_no}&page=${page+1}">[다음]</a>
					</c:if>
				</div>
			<div id="consult_container">
				<div id="titleCon">	
					<div id="review_title">상품문의 <span>(1)</span></div>
					<input type="button" id="reviewBtn"onclick="inquiry_check();" value="문의 작성">
					<p>상품과 무관한 질문 및 욕설/비속어가 포함된 문의는 고지 없이 삭제될 수 있습니다.<br>
						선택하신 상품과 관련된 문의를 부탁 드립니다.<br>
						전화 문의 : 02-2222-2222~4 <br>
						Monday - Friday : 09:00 ~ 19:00 Sat &amp; Sunday : OFF <br>
						Holiday : 13:00 ~ 19:00<br>
				</div>
				
				<div id="review">
					<ul>
						<li id="p_img1"><img src="./images/bed/bed01.png" width="50" height="50"></li>
						<li id="m_id"><span>kuil**** | 2023-04-14</span>
						<li id="m_review"><span>비공개 문의입니다.</span>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />