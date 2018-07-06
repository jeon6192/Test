<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>비밀번호 찾기</title>
	</head>
	<body>
		<form method="post" action="pwd_find_ok.nhn" id="pwdform">
			<table class="bg">
				<tr>
					<td>
						<strong>이름</strong>
					</td>
					<td>
						<input type="text" name="join_name" class="input_box">
					</td>
				</tr>
				
				<tr>
					<td>
						<strong>아이디</strong>
					</td>
					<td>
						<input type="text" name="join_id" class="input_box">
					</td>
				</tr>
				
				<tr>
					<td colspan=2 class="center">
						<input type="image" src="./resources/images/m-i02.gif"
				                    width="69" height="19">
					</td>
				</tr>
				
				<tr>
					<td colspan=2>
						<c:if test="${!empty join_pwd}">
							<c:choose>
								<c:when test="${join_pwd eq ' '}">
									일치하는 정보가 없습니다.
								</c:when>
								<c:otherwise>
									비밀번호는 <b style="color:blue;">${join_pwd}</b> 입니다
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
			</table>
			
		</form>
	</body>
</html>