<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="./css/board_write.css" rel="stylesheet" type="text/css">
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
		<nav>
			<%@ include file="../member/header.jsp" %>
		</nav>
	   <form action="./BoardDeleteAction.bo" method="post" name="deleteForm">
	   <input type="hidden" name="num" value="${param.num }">
	      <table>
	         <tr class="center">
	            <th colspan="2">MVC게시판 - Delete 페이지</th>
	         </tr>
	         <tr>
	            <td><div>글 비밀번호</div></td>
	            <td>
	               <input name="BOARD_PASS" id="board_pass" type="password">
	            </td>
	         </tr>
	         <tr class="center">
	            <td colspan="2" class="h30 lime">
	               <input type="submit" value="삭제">
	               <input type="button" value="취소" onClick="history.go(-1)">
	            </td>
	         </tr>
	      </table>
	   </form>
	</body>
</html>