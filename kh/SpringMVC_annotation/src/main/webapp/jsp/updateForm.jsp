<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<title>joinForm.jsp</title>
	 	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	    
	</head>
	
	<body>
		<h2 style="text-align: center;">회원정보 수정</h2>
		<div class="update_div">
			<div class="update_id">
				<div class="b_div"><b>아이디</b></div>
				<div class="input_div"><input type="text" name="id" disabled="disabled" value="${member.id}"></div>
			</div>
			
			<div class="update_password">
				<div class="b_div"><b>Password</b></div>
				<div class="input_div"><input type="password" name="password" value="${member.password}" required="required"></div>
			</div>
			
			<div class="clearfix">
				<button type="submit" class="update_btn2">수정</button>
				<button type="reset" class="reset_btn">취소</button>
			</div>
		</div>
	</body>
</html>
