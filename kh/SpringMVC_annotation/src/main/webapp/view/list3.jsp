<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<link href="css/list.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<ul class="list_ul">
			<li class="list_li_head">
				<div class="head_id_div">
					ID3
				</div>
				<div class="head_password_div">
					Password3
				</div>
			</li>
			<li class="list_li_body">
				<div class="body_id_div">
					${hoho.id }
				</div>
				<div class="body_password_div">
					${hoho.pass }
				</div>
			</li>
		</ul>
	</body>
</html>