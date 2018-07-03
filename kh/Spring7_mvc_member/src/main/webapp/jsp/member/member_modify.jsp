<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			$(document).ready(function(){
				var tel1 = $('#tel1').val();
				var phone1 = $('#phone1').val();
				$('[name=join_tel1] option').each(function(){
					if($(this).val() == tel1){
						$(this).attr('selected', 'selected');
					}
				});
				$('[name=join_phone1] option').each(function(){
					if($(this).val() == phone1){
						$(this).attr('selected', 'selected');
					}
				});
				
				if ($("#filevalue").text() == "") {
			        $("#close").hide();
			    }
			    $("#upfile").change(function() {
			        var a = $("#upfile").val().split('\\');
			        $("#filevalue").text(a[a.length-1]);
			        $("#close").show();
			        $(this).hide();
			    });
			    $("#close").click(function() {
			        $("#close").hide();
			        $("#filevalue").text("")
			        $('#upfile').val('').show();
			    });
			});
			function onlyNumber(e){
				e = e || window.e;
				var keyID = (e.which) ? e.which : e.keyCode;
				if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
					return;
				else
					return false;
			}
			function removeChar(e) {
				e = e || window.e;
				var keyID = (e.which) ? e.which : e.keyCode;
				if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
					return;
				else
					e.target.value = e.target.value.replace(/[^0-9]/g, "");
			}
	
			function post_check() {
				window.open("zipcode_find.nhn", "우편번호검색",
						"width=430, height=500, left=500, top=350, scrollbars=yes");
				// 폭이 420이고 높이가 200, 스크롤바가 생성되는 새로운 공지창을 만듬
			}
	
			function post_search(){
				alert("우편번호 검색 버튼을 클릭하세요");
			}
	
			function domain_list(){
				if($('#mail_list').val() == '0'){
					$('#join_maildomain').val('').focus().attr('readOnly', false);
				} else {
					$('#join_maildomain').val($('#mail_list').val());
				}
			}
	
			function check(){
				if($('#join_pwd1').val() != $('#password').val()){
					alert('비밀번호가 다릅니다');
					return false;
				}
				if($('#join_pwd1').val() == ''){
					alert('비번을 입력해주세요');
					return false;
				}
				if($('#join_pwd2').val() == ''){
					alert('비번확인을 입력해주세요');
					return false;
				}
				if($('#join_pwd1').val() != $('#join_pwd2').val()){
					alert('비밀번호가 일치하지 않습니다');
					return false;
				}
				if($('#join_zip').val() == ''){
					alert('주소를 입력해주세요');
					return false;
				}
				if($('#join_addr2').val() == ''){
					alert('상세주소를 입력해주세요');
					return false;
				}
				if($('#join_tel2').val() == '' || $('#join_tel3').val() == ''){
					alert('전화번호를 입력해주세요');
					return false;
				}
				if($('#join_phone2').val() == '' || $('#join_phone3').val() == ''){
					alert('휴대번호를 입력해주세요');
					return false;
				}
				if($('#join_mailid').val() == '' || $('#join_maildomain').val() == ''){
					alert('이메일을 입력해주세요');
					return false;
				}
				$('#profile').val($('#filevalue').text());
			}
		</script>
		<style>
			.img_file, #close>img{
				height: 30px;
				width: 30px;
			}
			#upfile{
				display: none;
			}
		</style>
	</head>
	<body>
		<div id="modify_wrap">
			<h2 class="modify_title">회원정보수정</h2>
			
			<form name="f" method="post" action="./member_update_ok.nhn" onsubmit="return check()"  enctype="multipart/form-data"> 
				<c:set var="m" value="${memberBean}"/>
				<table id="join_t">
					<tr>
						<th>회원아이디</th>
						<td>
							<input name="join_id" id="join_id" size="14" class="input_box" readonly="readonly" value="${m.join_id}">
						</td>
					</tr>
					
					<tr>	
						<th>회원비번</th>
						<td>
							<input type="hidden" id="password" value="${m.join_pwd}">
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
							<input name="join_name" id="join_name" size="14" class="input_box" value="${m.join_name}">
						</td>
					</tr>
					
					<tr>
						<th>우편번호</th>
						<td>
							<input name="join_zip" id="join_zip" size="3" class="input_box" readonly onclick="post_search()" value="${m.join_zip}">
							<input type="button" value="우편번호검색" class="input_button" onclick="post_check()">
						</td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td>
							<input name="join_addr1" id="join_addr1" size="50" class="input_box" readonly onclick="post_search()" value="${m.join_addr1}">
						</td>
					</tr>
					
					<tr>
						<th>나머지 주소</th>
						<td>
							<input name="join_addr2" id="join_addr2" size="37" class="input_box" value="${m.join_addr2}">
						</td>
					</tr>
					
					<tr>
						<th>집전화번호</th>
						<td>
							<input type="hidden" id="tel1" value="${m.join_tel1}">
							<%@ include file="/jsp/include/tel_number.jsp" %>
							<select name="join_tel1" >
								<c:forEach var="t" items="${tel}">
									<option value="${t}">${t}</option>
								</c:forEach>
							</select>
							- <input name="join_tel2" id="join_tel2" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' value="${m.join_tel2}">
							- <input name="join_tel3" id="join_tel3" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' value="${m.join_tel3}">
						</td>
					</tr>
					
					<tr>
						<th>휴대전화번호</th>
						<td>
							<input type="hidden" id="phone1" value="${m.join_phone1}">
							<%@ include file="/jsp/include/phone_number.jsp" %>
							<select name="join_phone1" >
								<c:forEach var="p" items="${phone}">
									<option value="${p}">${p}</option>
								</c:forEach>
							</select>
							- <input name="join_phone2" id="join_phone2" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' value="${m.join_phone2}">
							- <input name="join_phone3" id="join_phone3" size="4" maxlength="4" class="input_box" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' value="${m.join_phone3}">
						</td>
					</tr>
					
					<tr>
						<th>전자우편</th>
						<td>
							<input name="join_mailid" id="join_mailid" size="10" class="input_box" value="${m.join_mailid}">
							@ <input name="join_maildomain" id="join_maildomain" size="20" class="input_box" readonly value="${m.join_maildomain}">
							
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
							<label for="upfile">
								<img src="resources/images/file_open.png" alt="파일열기" class="img_file">
							</label>
							<input type="hidden" name="profile" id="profile" value="">
			            	<input type="file" name="join_profile" id="upfile">
				            <span id="filevalue">${m.join_original}</span>&nbsp;
				            <span id="close"><img src="resources/images/cancel.png"></span>
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