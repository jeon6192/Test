$(document).ready(function(){
	idCheck = 0;
});
function id_check(){
	idCheck = 0;
	$('#idcheck').text('');
	
	var inputId = $('#join_id').val();
	var checkId = /^[a-z]{1}[a-z0-9_]{3,11}$/;
	var msg = '';
	
    if(!checkId.test(inputId)) {
        msg = '영어 소문자로 시작하는 영문자 + 숫자 4~12자리만 입력가능합니다.';
        $('#idcheck').css('color', 'gray');
        $('#idcheck').text(msg).hide().fadeIn(700);
    } else {
    	$.ajax({
			type : "POST",
			data : {"join_id" : inputId},
			url : "./checkMemberId.nhn",
			cache : false,
			success: function(data){
				if (data == 0) {
					msg = 'ID 사용가능';
					$('#idcheck').css('color', 'darkcyan');
					idCheck = 1;
				} else {
					msg = 'ID 중복';
					$('#idcheck').css('color', 'red');
				}
				$('#idcheck').text(msg).hide().fadeIn(700);
			    
			},
			error: function() {
				alert("error");
			}
		}); // ajax
    }

	
}

function onlyNumber(e){
	e = e || window.e;
	var keyID = (e.which) ? e.which : e.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(e) {
	e = e || window.e;
	var keyID = (e.which) ? e.which : e.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		e.target.value = e.target.value.replace(/[^0-9]/g, "");
}

function post_check() {
	window.open("zipcode_find.nhn", "우편번호검색",
			"width=430, height=500, left=500, top=350, scrollbars=yes");
	// 폭이 420이고 높이가 200, 스크롤바가 생성되는 새로운 공지창을 만듬
}

function post_search(){
	alert("우편번호 검색 버튼을 클릭하세요");
}

function domain_list(){
	if($('#mail_list').val() == '0'){
		$('#join_maildomain').val('').focus().attr('readOnly', false);
	} else {
		$('#join_maildomain').val($('#mail_list').val());
	}
}

function check(){
	if($('#join_id').val() == ''){
		alert('ID를 입력해주세요');
		return false;
	}
	if(idCheck == 0){
		alert('ID중복체크를 해주세요');
		return false;
	}
	if($('#join_pwd1').val() == ''){
		alert('비번을 입력해주세요');
		return false;
	}
	if($('#join_pwd2').val() == ''){
		alert('비번확인을 입력해주세요');
		return false;
	}
	if($('#join_pwd1').val() != $('#join_pwd2').val()){
		alert('비밀번호가 일치하지 않습니다');
		return false;
	}
	if($('#join_zip').val() == ''){
		alert('주소를 입력해주세요');
		return false;
	}
	if($('#join_addr2').val() == ''){
		alert('상세주소를 입력해주세요');
		return false;
	}
	if($('#join_tel2').val() == '' || $('#join_tel3').val() == ''){
		alert('전화번호를 입력해주세요');
		return false;
	}
	if($('#join_phone2').val() == '' || $('#join_phone3').val() == ''){
		alert('휴대번호를 입력해주세요');
		return false;
	}
	if($('#join_mailid').val() == '' || $('#join_maildomain').val() == ''){
		alert('이메일을 입력해주세요');
		return false;
	}
}