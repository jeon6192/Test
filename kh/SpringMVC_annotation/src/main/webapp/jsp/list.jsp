<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="list_ul">
	<c:if test="${!empty memberList}">
		<li class="list_li_head">
			<div class="id_div">ID</div>
			<div class="password_div">Password</div>
		</li>
	</c:if>
	<c:forEach var="list" items="${memberList}">
		<li class="list_li">
			<div class="id_div">${list.id}</div>
			<div class="password_div">${list.password}</div>
			<div class="btn_div">
				<button type="button" class="update_btn" id="${list.id}">수정</button>
				<button type="button" class="delete_btn" id="${list.id}">삭제</button>
			</div>
		</li>
	</c:forEach>
</ul>