<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>주소 찾기</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			$(document).ready(function(){
				$('input[type=image]').click(function(){
					var dong = $('#inputdong').val();
					location.href = 'zipcode_find_ok.nhn?dong=' + dong;
				});
				
				$('#sel_zip').change(function(){
					var selAddr = $('#sel_zip :selected').text(); 
					
					var zipcode = selAddr.split('[')[1].split(']')[0];
					var addr = selAddr.split('[')[1].split(']')[1].substring(1);
					
					// id 뒤에 opener.document 또는 parent.document
					// 를 통해 부모객체를 제어함
					$('#join_zip', opener.document).val(zipcode);
					$('#join_addr1', opener.document).val(addr);
					
					window.close();
				});
				
				$('#zipform').submit(function(){
					if($('#inputdong').val() == ''){
						alert('도로를 입력해 주세요');
						return false;
					}
				});
			});
		</script>
	</head>
	<body>
		<form method="post" action="zipcode_find_ok.nhn" id="zipform">
			<table class="bg">
				<tr>
					<td colspan=2 class="center">
					<input type="image"
						   src="./resources/images/ZipCode_img01.gif" 
						   width="413" height="58">
					</td>
				</tr>
				<tr>
					<td colspan=2 class="center">
					    <strong>
					    <font color="#466d1b"><span class="style1"> 
					        [거주지의 대로명을 입력하고 '찾기'버튼을 누르세요!] 
					    </span></font>
					    </strong>
					</td>
				</tr>
				<tr height="30">
				    <td class="right">
				      <input type="text" name="dong" id="inputdong" size="10"
				             maxlength="10" height="19" value="${dong}">&nbsp;</td>
				             <td class="image02">
				             <input type="image" src="./resources/images/m-i02.gif"
				                    width="69" height="19">
				    </td>
				</tr>
				
				<tr>
					<td colspan="2" class="center30">
						<c:if test="${!empty zipcodeList}">
							<select id="sel_zip">
								<option value="0">주소를 선택하세요</option>
								<c:forEach var="z" items="${zipcodeList}">
									<option value="addr2">[${z.zipcode}] ${z.addr}</option>
								</c:forEach>
							</select>
						</c:if>
						<c:if test="${empty zipcodeList}">
							<select>
								<option value="0">검색된 결과가 없습니다</option>
							</select>
						</c:if>
					</td>
				</tr>
				
			</table>
			
		</form>
		
	</body>
</html>