<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    	<link href="./css/login.css" rel="stylesheet" type="text/css">
    	<script>
    		$(document).ready(function(){
    			$('.join').click(function(){
    				location.href = './joinForm.net';
    			});
    		});
    	</script>
	</head>
	
	<body>
		<form action="./loginpro.net" id="login_form" method="post">
			<b>아이디</b>
			<input type="text" name="id" placeholder="Enter id" required="required">
			
			<b>Password</b>
			<input type="password" name="password" placeholder="Enter password" required="required">
			
			<div class="clearfix">
				<button type="submit" class="submitbtn">로그인</button>
				<button type="button" class="join">회원가입</button>
			</div>
		</form>
	</body>
</html>