<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="./resources/css/del.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
		</script>
	</head>
	<body>
		<form action="./member_del_ok.nhn" method="post">
			<ul class="del_ul">
				<li class="del_li_title">
					<div class="del_div_title">
						회원탈퇴요~
					</div>
				</li>
				
				<li class="del_li_id">
					<div class="del_div_idtag">
						아이디
					</div>
					<div class="del_div_id">
						${d_id}
					</div>
				</li>
				
				<li class="del_li_name">
					<div class="del_div_nametag">
						이름
					</div>
					<div class="del_div_name">
						${d_name}
					</div>
				</li>
				
				<li class="del_li_password">
					<div class="del_div_passwordtag">
						비밀번호
					</div>
					<div class="del_div_password">
						<input type="password" name="pwd" class="del_password">
					</div>
				</li>
				
				<li class="del_li_content">
					<div class="del_div_contenttag">
						탈퇴사유
					</div>
					<div class="del_div_content">
						<textarea rows="10" cols="10" name="del_cont" class="del_textarea"></textarea>
					</div>
				</li>
				
				<li class="del_li_btn">
					<button type="submit" class="del_btn">탈퇴</button>
				</li>
			</ul>
		</form>
	</body>
</html>