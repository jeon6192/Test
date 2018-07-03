<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		<div id="modify_wrap">
			<h2 class="modify_title">회원정보수정</h2>
			
			<form name="f" method="post" action="./member_modify_ok.nhn" onsubmit="return check()"  enctype="multipart/form-data"> 
				<table id="join_t">
					<tr>
						<th>회원아이디</th>
						<td>
							<input name="join_id" id="join_id" size="14" class="input_box" readonly="readonly">
						</td>
					</tr>
					
					<tr>	
						<th>회원비번</th>
						<td>
							<input type="password" name="join_pwd" id="join_pwd1" size="14" class="input_box">
						</td>
					</tr>
					
					<tr>
						<th>회원비번확인</th>
						<td>
							<input type="password" name="join_pwd2" id="join_pwd2" size="14" class="input_box">
						</td>
					</tr>
					
					<tr>
						<th>회원이름</th>
						<td>
							<input name="join_name" id="join_name" size="14" class="input_box">
						</td>
					</tr>
					
					<tr>
						<th>우편번호</th>
						<td>
							<input name="join_zip" id="join_zip" size="3" class="input_box" readonly onclick="post_search()">
							<input type="button" value="우편번호검색" class="input_button" onclick="post_check()">
						</td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td>
							<input name="join_addr1" id="join_addr1" size="50" class="input_box" readonly onclick="post_search()">
						</td>
					</tr>
					
					<tr>
						<th>나머지 주소</th>
						<td>
							<input name="join_addr2" id="join_addr2" size="37" class="input_box">
						</td>
					</tr>
					
					<tr>
						<th>집전화번호</th>
						<td>
							<%@ include file="/jsp/include/tel_number.jsp" %>
							<select name="join_tel1" >
								<c:forEach var="t" items="${tel}">
									<option value="${t}">${t}</option>
								</c:forEach>
							</select>
							- <input name="join_tel2" id="join_tel2" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
							- <input name="join_tel3" id="join_tel3" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						</td>
					</tr>
					
					<tr>
						<th>휴대전화번호</th>
						<td>
							<%@ include file="/jsp/include/phone_number.jsp" %>
							<select name="join_phone1" >
								<c:forEach var="p" items="${phone}">
									<option value="${p}">${p}</option>
								</c:forEach>
							</select>
							- <input name="join_phone2" id="join_phone2" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
							- <input name="join_phone3" id="join_phone3" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						</td>
					</tr>
					
					<tr>
						<th>전자우편</th>
						<td>
							<input name="join_mailid" id="join_mailid" size="10" class="input_box">
							@ <input name="join_maildomain" id="join_maildomain" size="20" class="input_box" readonly>
							
							<select name="mail_list" id="mail_list" onchange="domain_list()">
								<option value="">- 이메일 선택 -</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="naver.com">naver.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="0">직접입력</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>프로필사진</th>
						<td>
							<input type="file" name="join_profile">
						</td>
					</tr>
					
				</table>
				
				<div id="join_menu">
					<input type="submit" value="Sign Up" class="input_button">
					<input type="reset" value="Cancel" class="input_button" onclick="history.back()">
				</div>
			</form>
			
		</div>
	</body>
</html>