<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>MVC 게시판 글쓰기</title>
		<link href="./resources/css/board_write.css" rel="stylesheet" type="text/css">
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('input[type=reset]').click( function() {
					history.back();
				});
			});
		</script>
	</head>
	<body>
		<form action="./board_write_ok.nhn" method="post" name="boardform">
			<ul class="write_ul">
				<li class="name_li">
					<div>글쓴이</div>
					<div><input class="input_box" name="board_name" id="name" type="text" size="15" maxlength="30"></div>
				</li>
				<li class="pass_li">
					<div>비밀번호</div>
					<div><input class="input_box" name="board_pass" id="pass" type="password" size="15" maxlength="30"></div>
				</li>
				<li class="subject_li">
					<div>제목</div>
					<div><input class="input_box" name="board_subject" id="subject" type="text" size="50" maxlength="100"></div>
				</li>
				<li class="content_li">
					<div>내용</div>
					<div style="float:right;">
						<textarea rows="15" cols="60" name="board_content" id="content"></textarea>
					</div>
				</li>
				
				<li class="btn_li">
					<div>
						<button class="btn_submit" type="submit">작성</button>
						<button class="btn_reset" type="reset" onclick="history.back()">취소</button>
					</div>
				</li>
			</ul>
		</form>
		
	</body>
</html>