/**
 *  modify.js
 */
function open_delwindow(){
	
	
	var _left = Math.ceil(( window.screen.width - 600 )/2);
    var _top = Math.ceil(( window.screen.height - 500 )/2); 
	$url="/member_del_info"
	window.open($url, "회원삭제 정보", "width=600px, height=500px, left = "+_left+", top = "+_top);
}

function pwd_change_check(){
	
	if($.trim($("#before_pwd").val())==""){
		alert("현재 비밀번호를 입력하세요!");
		$("#before_pwd").val("").focus();
		return false;
	}
	if($.trim($("#change_pwd").val())==""){
		alert("변경 비밀번호를 입력하세요!");
		$("#change_pwd").val("").focus();
		return false;
	}
	if($.trim($("#pwd_check").val())==""){
		alert("변경할 비밀번호 확인을 해주세요!");
		$("#pwd_check").val("").focus();
		return false;
	}
	if($.trim($("#pwd_check").val()) != $.trim($("#change_pwd").val())){
	
		alert('변경할 비밀번호가 일치하지 않습니다!');
		return false;
	}
	
	var m_pwd = document.getElementById('change_pwd').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;
 
    if(m_pwd.length < 6 || m_pwd.length>16){
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('change_pwd').value='';
            return false;
    }
    for(var i=0;i<SC.length;i++){
            if(m_pwd.indexOf(SC[i]) != -1){
                  check_SC = 1;
            }
    }
    if(check_SC == 0){
            alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            document.getElementById('change_pwd').value='';
            return false;
    }
}

$(document).ready(function(){
	$('#change_pwd').focusout(function(){
		var change_pwd = $("#change_pwd").val();
		var pwd_check = $("#pwd_check").val();
		
		if(change_pwd != '' && pwd_check == ''){
		 	$("#pwd_false").hide();
		 	$("#pwd_success").hide();
		}else if(change_pwd != "" || pwd_check != ""){
			if(change_pwd == pwd_check){
				$("#pwd_false").hide();
				$("#pwd_success").show();
			}else{
				$("#pwd_success").hide();
				$("#pwd_false").show();
			}
		}
	});

	$('#pwd_check').focusout(function(){
		var change_pwd = $("#change_pwd").val();
		var pwd_check = $("#pwd_check").val();
		
		if(change_pwd != '' && pwd_check == ''){
		 	$("#pwd_false").hide();
		 	$("#pwd_success").hide();
		}else if(change_pwd != "" || pwd_check != ""){
			if(change_pwd == pwd_check){
				$("#pwd_false").hide();
				$("#pwd_success").show();
			}else{
				$("#pwd_success").hide();
				$("#pwd_false").show();
			}
		}
	});
	
	
});

function domain_list(){
	var num=m.mail_list.selectedIndex;//콤보박스 선택한 목록 항목번호를 반환
	
	if(num == -1){//목록이 선택되지 않았다면
		return true;
	}
	
	if(m.mail_list.value == "직접 입력"){
		m.mail_domain.value = "";
		m.mail_domain.readOnly = false;//쓰기가 가능
		m.mail_domain.focus();//메일 주소 입력 박스로 포커스이동
	}else{//콤보박스 목록항목에서 메일 주소를 선택한 경우
		m.mail_domain.value = m.mail_list.options[num].value;
		m.mail_domain.readOnly = true;//읽기만 가능
	}
}//domain_list()
