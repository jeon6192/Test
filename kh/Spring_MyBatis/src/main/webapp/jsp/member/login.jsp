<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="./css/login.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
			$(document).ready(function(){
		    	<%
		    		Cookie[] cookies=request.getCookies();
		    		if(cookies!=null&&cookies.length>0){
		    			for(int i=0;i<cookies.length;i++){
		    				if(cookies[i].getName().equals("remem")){
		    					%>
			    				$('[name="id"]').val("<%=cookies[i].getValue()%>");
			    				$('[name="idchk"]').attr('checked', 'checked');
			    				<%
		    				}
		    			}
		    		}
		    	%>
			});
		</script>
</head>
<body>
	<form action="loginProcess.net" method="post">
		<label>아이디 : </label><input type="text" name="id" id="id" required>
		<input type="checkbox" value="remem" name="idchk"> <b
			style="color: #ff3d00">ID 기억하기</b><br> <label>비밀번호 : </label><input
			type="password" name="pass" required><br> <input
			type="submit" value="전승우">
	</form>

</body>
</html>