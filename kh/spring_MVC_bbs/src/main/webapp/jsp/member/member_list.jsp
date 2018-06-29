<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>나이</td>
		<td>성별</td>
		<td>이메일</td>
		<td style='background-color: #2286c3;'>삭제</td>
	</tr>
	<c:forEach var="m" items="${totallist }">
		<tr>
			<td>${m.id}</td>
			<td>${m.password}</td>
			<td>${m.name}</td>
			<td>${m.age}</td>
			<td>${m.gender}</td>
			<td>${m.email}</td>
			<td style='background-color: #9be7ff;'><a
				href="member_delete.net?id=${m.id}">삭제</a></td>
		</tr>
	</c:forEach>
</table>