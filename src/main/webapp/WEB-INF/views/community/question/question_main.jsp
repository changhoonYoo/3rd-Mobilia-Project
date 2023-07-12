<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/board/board.css">


<style>
        .collapsible {
            background-color: #777;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            margin-top:10px;
        }
        .active,
        .collapsible:hover {
            background-color: #555;
        }
        .content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            background-color: #f1f1f1;
            margin-bottom:20px;
        }
        .collapsible:after {
            content: '\002B';
            color: white;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }
        .active:after {
            content: "\2212";
        }
        
    </style>
    
    <script>
        function collapse(element) {
            var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
        }
    </script>


<div class="community-board-area">
	<div class="title-area">
		<h2>자주묻는질문</h2>
		<label class="info-te">자주묻는 질문에 관한 답변을 볼수있는 공간입니다.</label>
			
		
	</div>
	<div class="community-select-area">
	
	 <a href="community_main?board_type=question" class="now-board-type">자주묻는질문</a>
	|
	 
	 <a href="community_main?board_type=review">상품후기</a>
	|
	 
	 <a href="community_main?board_type=qna">Q&A</a>
	|
	
	 <a href="community_main?board_type=free">자유게시판</a>
	|
	
	 <a href="#">공지사항</a>
	
    
	 
      </div>
      <button type="button" class="collapsible" onclick="collapse(this);">※ 회원정보를 변경하고 싶습니다.어떻게 해야 하나요?</button>
    <div class="content">
        <p>로그인 후 우측 상단에 Modify 클릭 후 변경 가능합니다.</p>
    </div>
    <button type="button" class="collapsible" onclick="collapse(this);">※ 반품 완료 후, 환불금은 언제 받을 수 있나요?</button>
    <div class="content">
        <p>반품 완료 후 금일 12시 이전에 환불금이 들어옵니다.</p>
    </div>
    <button type="button" class="collapsible" onclick="collapse(this);">※ 주문 조회는 어디서 확인하나요?</button>
    <div class="content">
        <p>로그인 후 우측 상단에 Myshop 클릭 후 주문 조회에서 확인 가능합니다.</p>
    </div>
    <button type="button" class="collapsible" onclick="collapse(this);">※ 결제가 되지 않아요.</button>
    <div class="content">
        <p>결제 오류 메시지 중, '카드사무응답/지연응답' 이라는 메시지가 발생하는 경우가 있습니다.<br>
               해당 메시지는 카드사의 네트워크 연결에 일시적인 문제가 발생하였을 때 노출됩니다.<br>
               잠시 후 다시 시도하시고, 그래도 결제가 되지 않으면 카드사 고객센터에 문의하시기 바랍니다.</p>
    </div>
    <button type="button" class="collapsible" onclick="collapse(this);">※ 회원 탈퇴는 어디서 하나요?</button>
    <div class="content">
        <p>로그인 후 우측 상단에 Modify 클릭 후 회원 탈퇴를 할 수 있습니다.</p>
    </div>
       </div>
<jsp:include page="../../include/footer.jsp" />