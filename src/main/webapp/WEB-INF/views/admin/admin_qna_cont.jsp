<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="./css/board/board_write.css">
<link rel="stylesheet" type="text/css" href="./css/board/board_view.css">
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css" />
<script src="./js/jquery.js"></script>
<script src="./js/board/board_cont.js"></script>
<jsp:include page="../include/admin_header.jsp"/>

<div id="cate">
	<ul>
		<li id="cate_li"><a href="admin_member_list" id="cate_a">회원 관리</a></li>
		<li id="cate_li"><a href="admin_product_list" id="cate_a">상품 관리</a></li>
		<li id="cate_li_a"><a href="admin_qna_list" id="cate_b">Q&A 관리</a></li>
		<li id="cate_li"><a href="admin_review_list" id="cate_a">후기 관리</a></li>
		<li id="cate_li"><a href="#" id="cate_a">문의 관리</a></li>
	</ul>
</div>

	
<div id="board-wrap">
<div class="title-area">
	<h2>Q&A 관리자 답변</h2>
	
	
</div>

  <input type="button" class="list" value="목록" onclick="location='admin_qna_list?page=${page}';"/>
 
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
	<input type="hidden" id="reply_id" value="Mobilia 관리자">
	<div class="reply-area">
	 <div class="reply-title">
	  <b>댓글작성</b>
	 </div>
	 <div class="clear"></div>
	 <div class="reply-write-area">
	 
	  <textarea id="reply_cont" name="reply_cont" placeholder="답변내용 입력"></textarea>&nbsp;<button id="replySubmit" name="replySubmit" onclick="return replySubmit()">답변 등록</button>
	
	 </div>
	 
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
	  
	  //댓글 등록
	  $('#replySubmit').on("click", function(){
		  var reply_id=$('#reply_id').val();
		  var reply_cont=$('#reply_cont').val();
		  
		  $.ajax({
			  type:'post',
			  url:'/reply',
			  headers:{
				  "Content-Type" :"application/json",
				  "X-HTTP-Method-Override":"POST"
			  },
			  dataType:'text',
			  data: JSON.stringify({
				  
				  board_no : board_no,
				  reply_id : reply_id,
				  reply_cont : reply_cont
			  }),
			  success:function(result){
				  if(result == 'SUCCESS'){
					  alert('댓글 등록완료');
					  location.reload();
					  getReplyList();
				  }
			  }
		  });
	  });
	 </script>
	 <div class="clear"></div>
	</div>
</div>
