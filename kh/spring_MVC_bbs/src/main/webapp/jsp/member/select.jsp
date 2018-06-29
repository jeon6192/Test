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
	</tr>
	<tr>
		<td>${member.getId()}</td>
		<td>${member.getPassword() }</td>
		<td>${member.getName() }</td>
		<td>${member.getAge() }</td>
		<td>${member.getGender() }</td>
		<td>${member.getEmail() }</td>
	</tr>
</table>