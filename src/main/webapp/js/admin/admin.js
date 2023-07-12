/**
 * admin.js
 */

$(function(){
	
});

function admin_check(){
	if($.trim($("#admin_id").val()) == ""){
		alert("아이디를 입력하세요!");
		$("#admin_id").val("").focus();
		return false;
	}
	if($.trim($("#admin_pwd").val()) == ""){
		alert("비밀번호를 입력하세요!");
		$("#admin_pwd").val("").focus();
		return false;
	}
}