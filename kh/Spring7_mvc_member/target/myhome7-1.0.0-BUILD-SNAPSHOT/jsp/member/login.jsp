<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.div_id{
		margin-top: 50px;
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
	        
	        $.ajax({
				type : "POST",
				data : {"join_id" : id, "join_pwd" : pass},
				url : "./login.nhn",
				cache : false,
				success: function(data){
					if (data == 1) {
						location.href='./member_login_ok.nhn?id=' + id;
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
		<div class="div_id">
			<div class="div_id_text">ID</div>
			<div class="div_input_id">
				<span class="span_id">ID를 입력해주세요</span>
				<input type="text" name="id" class="id">
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
