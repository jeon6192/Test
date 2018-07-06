<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>주소 찾기</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="./resources/js/jquery.prettydropdowns.js"></script>
		<script>
			$(document).ready(function(){
				
				
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
				
				$('input[type=image]').click(function(e){
					if($('#inputdong').val() == ''){
						alert('도로를 입력해 주세요');
					}
					var dong = $('#inputdong').val();
					
					$.ajax({
						data : {"dong" : dong},
						url : './zipcode_find_ok.nhn',
						dataType : 'json', 
						cache : false,
						headers : {
							"cache-control" : "no-cache",
							"pragma" : "no-cache"
						},
						success: function(data){

							if (data.length < 1) {
								$('#sel_zip').empty().append('<option value="0">검색된 결과가 없습니다</option>');
							} else {
								$('#sel_zip').empty().append('<option value="0">주소를 선택하세요</option>');
								$(data).each(function(index, item){
									$('#sel_zip').append('<option value="addr2">[' + item.zipcode + 
										'] ' + item.addr + '</option>');
								});
							}
							$('#sel_zip').prettyDropdown();
							
						}
					});
					
					//location.href = 'zipcode_find_ok.nhn?dong=' + dong;
				});
			});
		</script>
		
		<link rel="stylesheet" href="./resources/css/prettydropdowns.css">
		<style>
			input#inputdong {
			    width: 210px;
			    border: none;
			    border-radius: 5px;
			    box-shadow: inset 0px -7px 10px -7px chartreuse;
			    outline: none;
			}
			select#sel_zip {
			    width: 210px;
			    border: none;
			    border-radius: 5px;
			    box-shadow: inset 0px -7px 10px -7px chartreuse;
			    outline: none;
			}
			.prettydropdown {
				width: 210px;
			}
			.prettydropdown > ul {
			    width: 210px;
			    border: none;
			    border-radius: 5px;
			    box-shadow: inset 0px -7px 10px -7px chartreuse;
			    outline: none;
			    font-size: 14px;
			}
			.prettydropdown > ul li{
				width: auto;
				height: 20px;
				line-height: 20px;
    			padding-left: 0.1em;
			}
			.prettydropdown ul .hover{
				background-color: chartreuse;
			}
			.prettydropdown.arrow > ul > li.selected:before, .prettydropdown.arrow > ul > li.selected:after{
				right: 15px;
			}
		</style>
	</head>
	<body>
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
			             maxlength="10" height="19" placeholder="주소를 입력하세요">&nbsp;</td>
	             <td class="image02">
	             <input type="image" src="./resources/images/m-i02.gif"
	                    width="69" height="19">
			    </td>
			</tr>
			
			<tr>
				<td colspan="2" class="center30">
					<select id="sel_zip">
						<!-- <option value="0">주소를 선택하세요</option> -->
						<%-- <c:forEach var="z" items="${zipcodeList}">
							<option value="addr2">[${z.zipcode}] ${z.addr}</option>
						</c:forEach> --%>
					</select>
					<!-- <select>
						<option value="0">검색된 결과가 없습니다</option>
					</select> -->
				</td>
			</tr>
			
		</table>
			
		
	</body>
</html>