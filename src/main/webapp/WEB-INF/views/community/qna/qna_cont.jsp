<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/board/board_write.css">
<link rel="stylesheet" type="text/css" href="./css/board/board_view.css">
<script src="./js/jquery.js"></script>
<script src="./js/board/board_cont.js"></script>
<div id="board-wrap">
<div class="title-area">
	<h2>Q&A</h2>
	<label class="write-info-text">문의한 내용과 답변을 볼 수 있는 공간입니다.</label>
	
</div>
<div class="board-state-button-area">
<c:if test="${bvo.board_name == id}">
 <span id="state-left">
  
  <a href="community_view?board_no=${bvo.board_no}&page=${page}&state=edit&board_type=qna" class="edit">수정</a>
  /
  <a href="#" class="del" onclick="return boardDel(${bvo.board_no}, ${page}, 'qna')">삭제</a>
 </span>
</c:if>
 <span id="state-right">
  <input type="button" value="목록" onclick="location='community_main?board_type=${board_type}&page=${page}';"/>
 </span>
</div>
	<div class="board-write-area">
			<table>
				<tr>
					<th>글쓴이</th>
					<td><label>${bvo.board_name}</label></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><label>${bvo.board_title}</label></td>
				</tr>
				<tr>
				 <th colspan="2">
				  글내용
				 </th>
				<tr>
				<tr>
					<td colspan="2">
					 <label>${board_cont}</label>
					</td>
				</tr>
			</table>
	</div>
	<div class="reply-area">
	<div class="reply-view-area" style="width:auto; height:auto;">
	  <ul id="replyList">
	  </ul>
	 </div>
	  
	   <script>
	  var board_no=${board_no};
	  
	  getReplyList(); //댓글 목록 가져오는 함수 호출
	  
	  //댓글 목록
	  function getReplyList(){
		  $.getJSON("/reply/all/"+board_no,function(data){//get방식으로 json데이터를 읽어오는 jQuery 아작스 함수 값들은 data매개변수에 저장됨
			  var str="";
		  		$(data).each(function(){//반복
		  			str += "<li> <label id=\"name-label\">"+this.reply_id+"</label>&nbsp;&nbsp;&nbsp;&nbsp;<label id=\"day-label\">"+this.reply_date+"</label>"
		  			+"<p>"+this.reply_cont.replaceAll("\n", "<br>")+"</p>"
		  			
		  		});
		  		$('#replyList').html(str);
		  });
	  }
	  </script>
</div>
</div>
<jsp:include page="../../include/footer.jsp" />