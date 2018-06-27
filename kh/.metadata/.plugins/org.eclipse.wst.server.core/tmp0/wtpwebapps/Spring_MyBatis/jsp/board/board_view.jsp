<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
		<link href="./resources/css/board_view.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="./resources/js/board_view.js"></script>
		<script>
			$(document).ready(function(){
			    $('.btn_delete').click(function () {
			        var pass = '${boardBean.board_pass}';
			        var inputPass = $('.input_pass').val();
			        
			        if(pass != inputPass) {
			            $('.div_chk').empty().append('비밀번호가 틀렸습니다.').hide().fadeIn(800);
			            setTimeout(function() {
			                $('.div_chk').fadeOut(800, function() {
			                    $(this).empty().show();
			                });
			              }, 3000);
			        } else {
			            $('#mask, .div_in').hide();  
			            location.href="<c:url value='/board_delete.nhn?num=${boardBean.board_num}&page=${page}'/>";
			        }
			    });
			});
		</script>
 		
	</head>
	<body>
		<ul class="ul_view">
			<li class="li_title">
				<div class="div_subject">${boardBean.board_subject}</div>
				<div class="div_title_bottom">
					<span class="span_writer">${boardBean.board_name}</span><br>
					조회수 <span class="span_readCount">${boardBean.board_readcount}</span>
					·
					<span class="span_date">${boardBean.board_date}</span>
				</div>
			</li>
			<li class="li_content">
				<div class="div_content">
					${boardBean.board_content }
				</div>
			</li>
				
		</ul>
		
		<div class="div_btn">
			<c:if test="${id=='admin'||id==boardBean.board_name}">
			</c:if>
			<a href="<c:url value='/board_reply.nhn?num=${boardBean.board_num }'/>">
		    	<img src="./resources/image/reply.png">
		    </a>&nbsp;
	    	<a href="<c:url value='/board_update.nhn?num=${boardBean.board_num}'/>">
				<img src="./resources/image/update.png">
			</a>&nbsp;
			<a href="javascript:wrapWindow()">
				<img src="./resources/image/delete.png">
			</a>&nbsp;
			<a href="<c:url value='/board_list.nhn?page=${page}'/>">
				<img src="./resources/image/list.png">
			</a>&nbsp;
		</div>
		
		<div id="mask"></div>
		<div class="div_in">
			<div class="div_text">비밀번호를 입력하세요</div>
			<div class="div_chk"></div>
			<div class="div_input">
				<input type="password" name="board_num" class="input_pass">
				<br><br>
				<button type="button" class="btn_delete">확인</button>
			</div>
		</div>
	</body>
</html>