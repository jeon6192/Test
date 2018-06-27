<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<title>main.jsp</title> 
	  	
	  	<script type="text/javascript">
	  		$(function(){
	  			$('#list_btn').click(function(){
	  				$.ajax({
	  			         type : "POST",
	  			         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	  			         data : {
	  			         },
	  			         url : "./list.net",
	  			         success: function(result){
	  			        	 $(".main_div").empty().append(result);
	  			         },
	  			         error: function() {
	  			            alert("error");
	  			         }
					});
	  			});
	  			
	  			$('h1').click(function(){
	  				location.href='./main.net';
	  			})
	  			
	  			$(document).on('click', '.delete_btn', function(){
	  				const id = $(this).attr('id');
	  				
	  				if (id == 'admin') {
	  					alert('관리자는 삭제 X');
	  					return;
	  				}
	  				$.ajax({
	  			         type : "POST",
	  			         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	  			         data : {
	  			        	 "id" : id
	  			         },
	  			         url : "./delete.net",
	  			         success: function(result){
	  			        	 alert('삭제 성공');
	  			        	 $(".main_div").empty().append(result);
	  			         },
	  			         error: function() {
	  			            alert("error");
	  			         }
					});
	  			});
	  			
	  			$(document).on('click', '.update_btn', function(){
	  				const id = $(this).attr('id');
	  				
	  				if (id == 'admin') {
	  					alert('관리자는 수정 X');
	  					return;
	  				}
	  				$.ajax({
	  			         type : "POST",
	  			         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	  			         data : {
	  			        	 "id" : id
	  			         },
	  			         url : "./updateForm.net",
	  			         success: function(result){
	  			        	 $(".main_div").empty().append(result);
	  			         },
	  			         error: function() {
	  			            alert("error");
	  			         }
					});
	  			});
	  			
	  			$(document).on('click', '.update_btn2', function(){
	  				const id = $('[name="id"]').val();
	  				const password = $('[name="password"]').val();
	  				
	  				$.ajax({
	  			         type : "POST",
	  			         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	  			         data : {
	  			        	 "id" : id, "password" : password
	  			         },
	  			         url : "./updatePro.net",
	  			         success: function(result){
	  			        	 alert('수정 성공');
	  			        	 $(".main_div").empty().append(result);
	  			         },
	  			         error: function() {
	  			            alert("error");
	  			         }
					});
	  			});
	  			
	  			$(document).on('click', '.reset_btn', function(){
	  				$.ajax({
	  			         type : "POST",
	  			         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	  			         data : {
	  			         },
	  			         url : "./list.net",
	  			         success: function(result){
	  			        	 $(".main_div").empty().append(result);
	  			         },
	  			         error: function() {
	  			            alert("error");
	  			         }
					});
	  			});
	  			
	  			
	  		});
	  		
	  	</script>
	</head>
	<body>
		<h1 style="text-align: center;">메인</h1>
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
		<div class="main">
			<div class="top_div">
				${id }
			</div>
			<div class="main_div">
				
			</div>
		</div>
	    
	</body>
</html>



