<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			$(document).ready(function(){
				
			});
			function id_check(){
	        	$('#idcheck').text('');
	        	
				var inputId = $('#join_id').val();
				var checkId = /^[a-z]{1}[a-z0-9_]{3,11}$/;
				var msg = '';
				
		        if(!checkId.test(inputId)) {
		            msg = '영어 소문자로 시작하는 영문자 + 숫자 4~12자리만 입력가능합니다.';
		            $('#idcheck').css('color', 'gray');
		            $('#idcheck').text(msg).hide().fadeIn(1000);
		        } else {
		        	$.ajax({
						type : "POST",
						data : {"join_id" : inputId},
						url : "./checkMemberId.nhn",
						cache : false,
						success: function(data){
							if (data == 0) {
								msg = 'ID 사용가능';
								$('#idcheck').css('color', 'darkcyan');
							} else {
								msg = 'ID 중복';
								$('#idcheck').css('color', 'red');
							}
							$('#idcheck').text(msg).hide().fadeIn(1000);
						    
						},
						error: function() {
							alert("error");
						}
					}); // ajax
		        }

				
			}
		</script>
		<style>
			#idcheck{
				position: absolute;
				left: 7em;
    			top: 2.7em;
			}
		</style>
	</head>
	<body>
		<div id="join_wrap">
			<h2 class="join_title">회원가입</h2>
			<form name="f" method="post" action="member_join_ok.nhn" onsubmit="return check()" 
				enctype="mulipart/form-data">
				<table id="join_t">
					<tr>
						<th>회원아이디</th>
						<td>
							<input name="join_id" id="join_id" size="14" class="input_box">
							<input type="button" value="아이디 중복체크" class="input_button" onclick="id_check()">
							<div id="idcheck"></div>
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
							<input name="join_addr2" id="join_addr2" size="37" class="input_box" readonly onclick="post_search()">
						</td>
					</tr>
					
					<tr>
						<th>집전화번호</th>
						<td>
							<%@ include file="/jsp/include/tel_number.jsp" %>
							<select name="join_tel" >
								<c:forEach var="t" items="${tel}">
									<option value="${t}">${t}</option>
								</c:forEach>
							</select>
							- <input name="join_tel2" id="join_tel2" size="4" maxlength="4" class="input_box">
							- <input name="join_tel3" id="join_tel3" size="4" maxlength="4" class="input_box">
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
							- <input name="join_phone2" id="join_phone2" size="4" maxlength="4" class="input_box">
							- <input name="join_phone3" id="join_phone3" size="4" maxlength="4" class="input_box">
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
					<input type="reset" value="Cancel" class="input_button" onclick="$('#join_id').focus();">
				</div>
			</form>
			
		</div>
	</body>
</html>