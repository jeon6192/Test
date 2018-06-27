<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<c:choose>
		<c:when test="${id!=null }">
			<c:choose>
			<c:when test="${id=='admin' }">
				<button class="btn" id="list_btn" type="button">회원 리스트</button>
			</c:when>
			</c:choose>
			<button class="btn" id="update_btn" type="button">정보수정</button>
			<button class="btn" id="logout_btn" type="button" onclick="javascript:location.href='./logout.net';">로그아웃</button>
		</c:when>
		<c:otherwise>
			<button class="btn" type="button" onclick="javascript:location.href='./loginForm.net';">로그인</button>
		</c:otherwise>
	</c:choose>
</div>