<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<style>
		a{
			color: black;
			text-decoration: none;
		}
		header{
			width: 100%;
			height: 60px;
			margin: 0 auto;
			padding: 0;
			font-size: 0;
			background-color: white;
			top : 0;
			left: 0;
			position: fixed;
			border-bottom: 1px solid #bbbbbb;
		}
		header>div{
			display: inline-block;
			box-sizing: border-box;
			height: 100%;
		}
		
		.header_left, .header_right{
			width: 6%;
		}
		#img_header_left, #img_header_right{
			width: 50px;
		    position: absolute;
		    height: 50px;
		    top: 10%;
		    cursor: pointer;
		}
		.header_center{
			width: 88%;
			height: 60px;
			text-align: center;
		    position: relative;
		}
		.header_text, .header_icon{
			width: 100%;
		    height: 60px;
		    position: absolute;
		    left: 0;
		    text-align: right;
		    padding-right: 50px;
			display: none;
		}
		.header_text>div, .header_icon>div{
			display: inline-block;
			height: 100%;
			width: 80px;
			text-align: center;
		}
		.header_icon div{
			width: 50px;
		}
		.header_text div span, .header_icon div img{
			font-size: 10pt;
		    line-height: 60px;
		    font-weight: bold;
		    width: 30px;
		    height: 30px;
		    margin: 15px;
		    cursor: pointer;
		}
		.header_text div span{
			width: 100%;
			margin: 0;
		}
		#div_mask {  
			position:absolute;  
			z-index:9000;  
			background-color:#000;  
			display:none;  
			left:0;
			top:0;
			opacity: 0.3;
		}
		
		.arrow_box {
	        width: 130px !important;
		    height: 55px !important;
		    position: absolute;
		    background: #ffffff;
		    border: 2px solid #000000;
		    border-radius: 5px;
		    bottom: -55px;
		    right: 105px;
		    display: none;
		    color: gray;
		    font-weight: bold;
		    font-size: 13px;
		    line-height: 55px;
		}
		.arrow_box:after, .arrow_box:before {
			bottom: 100%;
			left: 50%;
			border: solid transparent;
			content: " ";
			height: 0;
			width: 0;
			position: absolute;
			pointer-events: none;
		}
		
		.arrow_box:after {
			border-color: rgba(255, 255, 255, 0);
			border-bottom-color: #ffffff;
		    border-width: 10px;
			margin-left: -10px;
		}
		.arrow_box:before {
			border-color: rgba(0, 0, 0, 0);
			border-bottom-color: #000000;
			border-width: 12px;
   			margin-left: -12px;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		function member_del(){
			window.open("member_del.nhn","회원탈퇴","width=400,height=300, left=500, top=350");
		}
		$(document).ready(function(){
		    
			
		    const icon = $('.header_icon');
		    const text = $('.header_text');
		    
		    console.log('!width : '+$(window).width());
		    
		    if($(window).width() < 1000) {
		        icon.show();
		    } else {
		        text.show();
		    }

            $( window ).resize( function() {
               console.log('width : ' + $(window).width());
               if($(window).width() < 1000) {
                   text.hide();
					icon.show();
				} else {
				    icon.hide();
				    text.show();
				}
               
            });
            
            $(window).scroll(function() {
                //console.log('top : ' + $(window).scrollTop() + '\nheight : ' + $(window).height());
                if ($(window).scrollTop() > $(window).height() / 100) {
					$('header').css({
						'box-shadow': '0 1px 10px gray',
					});
				} else {
					$('header').css({
						'box-shadow': '',
					});
				}
             });
            
            $('#span_mypage, #img_mypage').click(function(){
            	$('.arrow_box').toggle();
            });
            
		});
	</script>
	<body>
		<header>
			<div class="header_left">
				<img id="img_header_left" src="./resources/images/home.png" onclick="location.href='./member_login.nhn';">
			</div>
			
			<div class="header_center">
				<div class="header_text">
					<div class="div_board">
						<a href="./bbs_list.nhn">
							<span id="span_board">게시판</span>
						</a>
					</div>
					
					<c:if test="${id != null}">
						<div class="div_mypage">
							<span id="span_mypage">${id}</span>
							<div class="arrow_box">
								<span class="span_modify" onclick="location.href='./member_update.nhn'">수정</span>
								&nbsp; ·&nbsp; 
								<span class="span_delete" onclick="member_del()">탈퇴</span>
							</div>
						</div>
					</c:if>
					
					<div class="div_sign">
							<c:choose>
								<c:when test="${id != null}">
									<a href="./member_logout.nhn">
										<span id="span_logout">로그아웃</span>
									</a>
								</c:when>
								<c:otherwise>
										<span id="span_login">로그인</span>
								</c:otherwise>
							</c:choose>
					</div>
				</div>
				
				<div class="header_icon">
					<div class="div_board">
						<a href="./bbs_list.nhn">
							<img id="img_board" src="./resources/images/board.png">
						</a>
					</div>
					<c:if test="${id != null}">
						<div class="div_mypage">
							<img id="img_mypage" src="./resources/images/user.png">
							<div class="arrow_box">
								<span class="span_modify" onclick="location.href='./member_update.nhn'">수정</span>
								&nbsp; ·&nbsp; 
								<span class="span_delete" onclick="member_del()">탈퇴</span>
							</div>
						</div>
					</c:if>
					<div class="div_sign">
						<c:choose>
							<c:when test="${id != null}">
								<a href="./member_logout.nhn">
									<img id="img_logout" src="./resources/images/sign-out.png">
								</a>
							</c:when>
							<c:otherwise>
									<img id="img_login" src="./resources/images/sign-in.png">
							</c:otherwise>
						</c:choose>
					</div>
					
				</div>
				
			</div>
			
			<div class="header_right">
				<c:choose>
					<c:when test="${!empty join_file}">
						<img id="img_header_right" src="./resources/upload${join_file}">
					</c:when>
					<c:otherwise>
						<img id="img_header_right" src="./resources/images/cancel.png">
					</c:otherwise>
				</c:choose>
			</div>
		</header>
		
		
	</body>
</html>