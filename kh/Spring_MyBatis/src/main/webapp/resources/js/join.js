$(document).ready(function(){
	let idchk = 0;
	$('#id').on('change', function(){
		idchk = 0;
	});

    $('#sel').on('change', function () {
    	if($(this).val() != ''){
			$('#domain').val($(':selected').text());
			$('#domain').attr("disabled","disabled");
    	} else {
    		$('#domain').val('');
			$('#domain').removeAttr("disabled");
    	}
    });
    
    $('input[type=reset]').on('click', function() {
		location.href='main.net';
	});
    
    $('#idcheck').on('click', function(){
    	var id = $('#id').val();
		if(id.value=='') {
			alert('ID를 입력해주세요');
			id.focus;
		}else {
			$.ajax({
		         type : "POST",
		         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		         data : {
		        	 "id" : id
		         },
		         url : "./idcheck.net",
		         success: function(result){
		        	 let msg = '';
		        	 if (result == 0) {
		        		 msg = 'ID 사용가능';
		        		 idchk = 1;
		        		 $(".id_ajax").css('color', '#00c800');
		        	 } else {
		        		 msg = 'ID 중복';
		        		 $(".id_ajax").css('color', 'red');
		        	 }
		        	 $(".id_ajax").empty().append(msg);
		        	 
		         },
		         error: function() {
		            alert("error");
		         }
			});
		}		
		
    });
    
    $('form').submit(function () {
    	if (idchk != 1) {
    		alert('ID 중복체크를 해주세요');
    		$('#id').focus();
    		return false;
    	}
        if($('#id').val()==''){
            alert("ID를 입력해");
            $('#id').focus();
            return false;
        }
        if($('#password').val()==''){
            alert("비밀번호를 입력해");
            $('#pass').focus();
            return false;
        }
        if($('#age').val()==''){
            alert("나이를 입력해");
            $('#age').focus();
            return false;
        }
        if(isNaN($('#age').val())){
            alert("나이는 숫자로 입력해");
            $('#age').focus();
            $('#age').val('');
            return false;
        }
        if($('#email').val()==''){
            alert("이메일을 입력해");
            $('#email').focus();
            return false;
        }
        if($('#domain').val()==''||$("#domain").val()==""){
            alert("도메인을 입력해");
            $('#domain').focus();
            return false;
        }
        if($('input[type=radio]:checked').length<1){
            alert("성별 선택해");
            return false;
        }
    });

});