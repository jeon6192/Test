<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.div_rememId{
		margin-top: 20px;
		height: 20px !important;
    	padding-left: 23%;
   	    width: auto !important;
	}
	.div_id{
		margin-top: 10px;
	}
	.div_password{
		margin-top: 10px;
	}
	.div_id div, .div_password div{
		display: inline-block;
		height: 100%;
   		float: left;
	}
	.div_id_text, .div_password_text{
		font-weight: bold;
		width: 30% !important;
		padding-left: 30px;
	}
	.div_input_id, .div_input_password{
		position: relative;
		width: 55% !important;
		padding-right: 20px;
	}
	.div_chk{
		height: 15%;
		color: red;
	}
	.id, .password{
		border: none;
	    border-bottom: 1px solid rgba(2, 81, 255, 0.75);
	    background: aliceblue;
	    outline-width: 0;
	    height: 20px;
	}
	.span_id, .span_password{
		position: absolute;
		font-size: 0.8em;
		pointer-events : none;
		color: gray;
	}
	.btn_login, .btn_signup{
		width: 70px;
		height: 26px;
		padding: 0;
		color: black;
		border: 1px solid black;
		background-color: white;
		transition: all 0.6s;
		font-weight: bold;
	}
	.btn_login:hover, .btn_signup:hover{
		color: white;
		background-color: black;
	}
	
	
	.checks {position: relative;}

	.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip:rect(0,0,0,0);
	  border: 0
	}
	.checks input[type="checkbox"] + label {
	  display: inline-block;
	  position: relative;
	  cursor: pointer;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	}
	.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
	  content: ' ';
	  display: inline-block;
	  width: 15px;  /* 체크박스의 너비를 지정 */
	  height: 15px;  /* 체크박스의 높이를 지정 */
	  line-height: 15px; /* 세로정렬을 위해 높이값과 일치 */
	  margin: -2px 8px 0 0;
	  text-align: center; 
	  vertical-align: middle;
	  background: #fafafa;
	  border: 1px solid #cacece;
	  border-radius : 3px;
	  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
	}
	.checks input[type="checkbox"] + label:active:before,
	.checks input[type="checkbox"]:checked + label:active:before {
	  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
	}
	
	.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
	  content: '\2714';  /* 체크표시 유니코드 사용 */
	  color: #99a1a7;
	  text-shadow: 1px 1px #fff;
	  background: #e9ecee;
	  border-color: #adb8c0;
	  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
	}
	
	.checks.etrans input[type="checkbox"] + label {
	  padding-left: 30px;
	}
	.checks.etrans input[type="checkbox"] + label:before {
	  position: absolute;
	  left: 0;
	  top: 0;
	  margin-top: 0;
	  opacity: .6;
	  box-shadow: none;
	  border-color: #6cc0e5;
	  -webkit-transition: all .12s, border-color .08s;
	  transition: all .12s, border-color .08s;
	}
	
	.checks.etrans input[type="checkbox"]:checked + label:before {
	  position: absolute;
	  content: "";
	  width: 10px;
	  top: -5px;
	  left: 5px;
	  border-radius: 0;
	  opacity:1; 
	  background: transparent;
	  border-color:transparent #6cc0e5 #6cc0e5 transparent;
	  border-top-color:transparent;
	  border-left-color:transparent;
	  -ms-transform:rotate(45deg);
	  -webkit-transform:rotate(45deg);
	  transform:rotate(45deg);
	}
	
	.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
	  /*content:"\2713";*/
	  content: "\2714";
	  top: 0;
	  left: 0;
	  width: 21px;
	  line-height: 21px;
	  color: #6cc0e5;
	  text-align: center;
	  border: 1px solid #6cc0e5;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function chk_msg(msg){
		$('.div_chk').empty().append(msg).hide().fadeIn(800);
	    setTimeout(function() {
	        $('.div_chk').fadeOut(800, function() {
	            $(this).empty().show();
	        });
	      }, 3000);
	}
	
	$(document).ready(function(){
		var leng = $('.id').val().length;
		console.log(leng);
		if (leng > 0) {
    		$('.span_id').css({
    			'color' : 'darkcyan', 
    			'top' : '-11px',
    			'font-size' : '0.5em'
    			}).text('ID');
    	}
		
		$('.span_x').click(function(){
	        $('#div_mask').hide();
	        $('.div_login').hide();
	    });
		 
		$('.btn_login').click(function () {
			if($('.id').val().length == 0) {
				chk_msg('ID를 입력해주세요.');
				return false;
			}
			if($('.password').val().length == 0){
				chk_msg('PASSWORD를 입력해주세요.');
				return false;
			}
			
	        var id = $('.id').val();
	        var pass = $('.password').val();
	        var idChk = $('#rememId').is(':checked');
	        
	        $.ajax({
				type : "POST",
				data : {"join_id" : id, "join_pwd" : pass},
				url : "./login.nhn",
				cache : false,
				success: function(data){
					if (data == 1) {
						location.href='./member_login_ok.nhn?join_id='+id+"&rememId="+idChk;
					} else if (data == 0) {
						var msg = '비밀번호가 틀렸습니다.';
						chk_msg(msg);
					} else {
						var msg = 'ID가 존재하지 않습니다.';
						chk_msg(msg);
					}
				},
				error: function(request,status,error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			}); // ajax
	        
	        
	        
	       /*  if(pass != inputPass) {
	            $('.div_chk').empty().append('비밀번호가 틀렸습니다.').hide().fadeIn(800);
	            setTimeout(function() {
	                $('.div_chk').fadeOut(800, function() {
	                    $(this).empty().show();
	                });
	              }, 3000);
	        } else {
	            $('#div_mask, .div_login').hide();  
	            location.href='./bbs_delete.nhn?num='+num+'&page='+page;
	        } */
	    }); // btn click
	    
	    $('.id, .password').keyup(function(){
        	var leng = $(this).val().length;
        	var className = $(this).attr('class');
        	console.log(leng +'  '+className);
        	if (leng > 0) {
        		$('.span_'+className).animate({
        			'top' : '-11px',
        			'font-size' : '0.5em'
        		}, 200).css('color','darkcyan').text(className.toUpperCase());
        		
        	} else {
        		$('.span_'+className).animate({
        			'top' : '0px',
        			'font-size' : '0.8em'
        		}, 200).css('color','gray').text(className.toUpperCase()+'를 입력해주세요.');
        	}
        });
	});
</script>
<html>
	<body>
		<span class="span_x">X</span>
		<div class="div_rememId">
			<div class="checks etrans">
				<input type="checkbox" id="rememId" name="rememId" 
					<c:if test="${!empty saveid}">checked="checked"</c:if>
				> 
				<label for="rememId">Remember ID</label> 
			</div>
		</div>
		<div class="div_id">
			<div class="div_id_text">ID</div>
			<div class="div_input_id">
				<span class="span_id">ID를 입력해주세요</span>
				<input type="text" name="id" class="id" 
					<c:if test="${!empty saveid}">value="${saveid}"</c:if>
				>
					
			</div>
		</div>
		<div class="div_password">
			<div class="div_password_text">PASSWORD</div>
			<div class="div_input_password">
				<span class="span_password">PASSWORD를 입력해주세요</span>
				<input type="password" name="password" class="password">
			</div>
		</div>
		<div class="div_chk"></div>
		<div class="div_input">
			<button type="button" class="btn_login">로그인</button>
		</div>
	</body>
</html>
