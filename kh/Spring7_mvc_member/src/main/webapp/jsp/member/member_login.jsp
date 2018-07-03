<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="./resources/css/login.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="./resources/js/login.js"></script>
	</head>
	<body>
		<!-- <form action="./member_login_ok.nhn" method="post">
			<table id="login_t">
				<tr>
					<th>아이디</th>
					<td><input name="id" id="id" size="20" class="input_box"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" id="password" size="20" class="input_box"></td>
				</tr>
			</table> -->
			
			<div id="login_menu">
				<c:if test="${!empty id}">
					<input type="button" id="input_logout" value="Sign Out" onclick="location.href='./member_logout.nhn'">
				</c:if>
				<c:if test="${empty id}">
					<input type="button" value="Sign In" class="input_button" id="btn_login">
				</c:if>
				<input type="button" value="Sign Up" class="input_button" onclick="location='member_join.nhn'">
				<input type="button" value="Forgot Password?" class="input_button" onclick="pwd_find()">
			</div>
		<!-- </form> -->
		
		<div id="div_mask"></div>
		<div class="div_login">
		</div>
	</body>
</html>