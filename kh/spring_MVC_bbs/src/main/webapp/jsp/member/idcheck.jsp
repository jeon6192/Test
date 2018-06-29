<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="./css/idchk.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').on('click', function(){
			window.close();[]
		});
	});
</script>
<div>
	<h3>
		<c:choose>
			<c:when test="${chkId != 0}">
				아이디 중복<font color=red>!</font>
			</c:when>
			<c:otherwise>
				아이디 사용가능<font color=red>!</font>
			</c:otherwise>
		</c:choose>
	</h3>
	<button id=btn>확인</button>
</div>