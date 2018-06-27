<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    	<link href="./css/login.css" rel="stylesheet" type="text/css">
    	<script>
    		$(document).ready(function(){
    			$('.join').click(function(){
    				location.href = './joinForm.do';
    			});
    		});
    	</script>
	</head>
	
	<body>
		<form action="./login_ok3.do" id="login_form" method="post" name="myform">
			<b>ID3</b>
			<input type="text" name="id" placeholder="Enter id" required="required">
			
			<b>Password3</b>
			<input type="password" name="pass" placeholder="Enter password" required="required">
			
			<div class="clearfix">
				<button type="submit" class="submitbtn">로그인</button>
				<button type="button" class="join">회원가입</button>
			</div>
		</form>
	</body>
</html>