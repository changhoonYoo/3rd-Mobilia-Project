/**
 * 
 */
 
 function open_delwindow(m_no){
	
	 var m_no = $('#m_no').val();
	var _left = Math.ceil(( window.screen.width - 600 )/2);
    var _top = Math.ceil(( window.screen.height - 500 )/2); 
	$url="/admin_mDel_info?m_no="+m_no;
	window.open($url, "회원삭제 정보", "width=600px, height=500px, left = "+_left+", top = "+_top);
}