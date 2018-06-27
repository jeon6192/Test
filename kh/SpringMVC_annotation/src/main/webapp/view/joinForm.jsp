<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
	<head>
		<title>joinForm.jsp</title>
	 	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	    <link href="./css/login.css" rel="stylesheet" type="text/css">
	    
	</head>
	
	<body>
		<h2 style="text-align: center;">회원가입</h2>
		<form action="./joinPro.net" id="join_form" method="post">
			<b>아이디</b>
			<input type="text" name="id" placeholder="Enter id" required="required">
			
			<b>Password</b>
			<input type="password" name="password" placeholder="Enter password" required="required">
			
			<div class="clearfix">
				<button type="submit" class="join">회원가입</button>
			</div>
		</form>
	</body>
</html>
