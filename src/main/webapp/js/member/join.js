/**
 * join.js
 */

function join_check(){
	if($.trim($("#m_id").val())==""){
		alert("회원아이디를 입력하세요!");
		$("#m_id").val("").focus();
		return false;
	}
	if($.trim($("#m_pwd").val())==""){
		alert("회원비밀번호를 입력하세요!");
		$("#m_pwd").val("").focus();
		return false;
	}
	if($.trim($("#pwd_chk").val())==""){
		alert("비밀번호 확인을 해주세요!");
		$("#pwd_chk").val("").focus();
		return false;
	}
	if($.trim($("#m_name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#m_name").val("").focus();
		return false;
	}
	
	if($.trim($("#m_post").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}
	
	if($.trim($("#m_detailAddr").val())==""){
		alert("상세주소를 입력하세요!");		
		return false;
	}
	
	if($.trim($("#m_phone02").val())==""){
		alert("폰번호를 입력하세요!");
		$("#m_phone02").val("").focus();
		return false;
	}
	if($.trim($("#m_phone03").val())==""){
		alert("폰번호를 입력하세요!");
		$("#m_phone03").val("").focus();
		return false;
	}
	if($.trim($("#mail_id").val())==""){
		alert("이메일을 입력하세요!");
		$("#mail_id").val("").focus();
		return false;
	}
	if($.trim($("#mail_domain").val())==""){
		alert("이메일을 입력하세요!");		
		return false;
	}
	
	var chk1=document.m.check_1.checked;
        var chk2=document.m.check_2.checked;
        
        if(!chk1){
            alert('이용약관에 동의해 주세요');
            return false;
        } 
        if(!chk2) {
            alert('개인정보 수집에 동의해 주세요');
            return false;
        }

}//join_check()

function edit_check(){
	
	if($.trim($("#m_pwd").val())==""){
		alert("회원비밀번호를 입력하세요!");
		$("#m_pwd").val("").focus();
		return false;
	}
	if($.trim($("#pwd_chk").val())==""){
		alert("비밀번호 확인을 해주세요!");
		$("#pwd_chk").val("").focus();
		return false;
	}
	if($.trim($("#m_name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#m_name").val("").focus();
		return false;
	}
	
	if($.trim($("#m_post").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}
	
	if($.trim($("#m_detailAddr").val())==""){
		alert("상세주소를 입력하세요!");		
		return false;
	}
	
	if($.trim($("#m_phone02").val())==""){
		alert("폰번호를 입력하세요!");
		$("#m_phone02").val("").focus();
		return false;
	}
	if($.trim($("#m_phone03").val())==""){
		alert("폰번호를 입력하세요!");
		$("#m_phone03").val("").focus();
		return false;
	}
	if($.trim($("#mail_id").val())==""){
		alert("이메일을 입력하세요!");
		$("#mail_id").val("").focus();
		return false;
	}
	if($.trim($("#mail_domain").val())==""){
		alert("이메일을 입력하세요!");		
		return false;
	}
}

//비밀번호 유효성 및 조건
 function check_pwd(){
            var m_pwd = document.getElementById('m_pwd').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(m_pwd.length < 6 || m_pwd.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('m_pwd').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(m_pwd.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('m_pwd').value='';
            }
            if(document.getElementById('m_pwd').value !='' && document.getElementById('pwd_chk').value!=''){
                if(document.getElementById('m_pwd').value==document.getElementById('pwd_chk').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }





//메일주소 선택과 직접입력
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



//아이디 중복검색
function id_check(){
	$("#idcheck").hide();//idcheck영역을 숨김
	$m_id=$.trim($('#m_id').val());
	if($m_id.length<6){
		$newtxt='<font color="red" size="2"><b>아이디는 6자 이상이어야 합니다.</b></font>';
		$('#idcheck').text('');//idcheck 아이디 영역 문자 초기화
		$('#idcheck').show();//idcheck 영역 보이게 함.
		$('#idcheck').append($newtxt);//idcheck영역 문자끝에 문자 추가
		$('#m_id').val('').focus();
		return false;
	}
	
	if($m_id.length > 12){
		$newtxt='<font color="red" size="2"><b>아이디는 12자 이하이어야 합니다.</b></font>';
		$('#idcheck').text('');//idcheck 아이디 영역 문자 초기화
		$('#idcheck').show();//idcheck 영역 보이게 함.
		$('#idcheck').append($newtxt);//idcheck영역 문자끝에 문자 추가
		$('#m_id').val('').focus();
		return false;
	}
	
	//아이디를 6자 이상 12자이하로 입력했을때 정규표현식으로 유효성 검증
	if(!(validate_userid($m_id))){
		$newtxt='<font color="red" size="2"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$('#idcheck').text('');//idcheck 아이디 영역 문자 초기화
		$('#idcheck').show();//idcheck 영역 보이게 함.
		$('#idcheck').append($newtxt);//idcheck영역 문자끝에 문자 추가
		$('#m_id').val('').focus();
		return false;
	}
	
	//아이디 중복확인
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법   
        url:"member_idcheck", //url 패턴 매핑주소 경로
        data: {"id":$m_id},  //좌측 id 피라미터 이름에 우측 $m_id변수값을 저장
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 자료형
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
        	//서버 데이터를 data변수에 저장
      	  if(data==1){//중복 아이디가 있다면
      		$newtext='<font color="red" size="2"><b>중복 아이디입니다.</b></font>';
      		$("#idcheck").text('');
        	$("#idcheck").show();
        	$("#idcheck").append($newtext);          		
          	$("#m_id").val('').focus();
          	return false;
	     
      	  }else{//중복 아이디가 아니면
      		$newtext='<font color="blue" size="2"><b>사용가능한 아이디입니다.</b></font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append($newtext);
      		$("#m_pwd").focus();
      	  }  	    	  
        },
    	  error:function(){//비동기식 아작스로 서버디비 데이터를
    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
    		  alert("data error");
    	  }
      });//$.ajax
}//id_check()

//아이디 정규표현식 
function validate_userid($m_id){
	var pattern=new RegExp(/^[a-z0-9_]+$/); //아이디를 영문소문자와 숫자,_조합만 가능하게 함.
	return pattern.test($m_id);//아이디 정규 표현식 검사
}


 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function post_check() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_post').value = data.zonecode;
                document.getElementById("m_roadAddr").value = roadAddr;
                document.getElementById("m_jibunAddr").value = data.jibunAddress;
                
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }