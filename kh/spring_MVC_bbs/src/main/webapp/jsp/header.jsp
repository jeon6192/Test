<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<link href="./resources/css/bbs_list.css" rel="stylesheet" type="text/css">
	<script src="./resources/js/bbs_list.js"></script>
	
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
		header div{
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
		.header_text div, .header_icon div{
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
		.div_login{
			display: none;
			position:absolute;  
			z-index:10000;
			maring: 0 auto;
			width: 400px;
			height: 200px;
			background-color: aliceblue;
			border: 1px solid black;
		}
		.div_login div{
			text-align: center;
			width: 100%;
		    height: 30px;
		}
		
		.span_x{
			font-weight: bold;
			float: right;
			padding-right: 5px;
			cursor: pointer;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		function login(){
			$('.id').val('');
		    $('.div_chk').empty();
		    $('.password').val('');
		    
		    var maskHeight = $(document).height();  
		    var maskWidth = $(window).width();  
	
		    $('#div_mask').css({'width':maskWidth,'height':maskHeight});  
	
		    $('#div_mask').fadeIn(500);
		    $('#div_mask').fadeTo(100);    
	
		    const divWidth = maskWidth/2 - 150+'px';
		    const divHeight = maskHeight/2 - 200+'px';
		    $('.div_login').css('left', divWidth);
		    $('.div_login').css('top', divHeight);
		    $('.div_login').show();
		    
		    
		    $(".div_login").load("jsp/login.jsp"); 
		} 
		
		
	
		$(document).ready(function(){
			//검은 막을 눌렀을 때
		    $('#div_mask').click(function () {  
		        $(this).hide();  
		        $('.div_login').hide();
		    }); 
		    
			
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
		});
	</script>
	<body>
		<header>
			<div class="header_left">
				<img id="img_header_left" src="./resources/images/home.png">
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
							<a href="./user_info.net">
								<span id="span_mypage">마이페이지</span>
							</a>
						</div>
					</c:if>
					
					<div class="div_sign">
						세션:${id }
							<c:choose>
								<c:when test="${id != null}">
									<a href="./logout.me">
										<span id="span_logout">로그아웃</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:login()">
										<span id="span_login">로그인</span>
									</a>
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
							<a href="./user_info.net">
								<img id="img_mypage" src="./resources/images/user.png">
							</a>
						</div>
					</c:if>
					<div class="div_sign">
						<c:choose>
							<c:when test="${id != null}">
								<a href="./logout.me">
									<img id="img_logout" src="./resources/images/sign-out.png">
								</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:login()">
									<img id="img_login" src="./resources/images/sign-in.png">
								</a>
							</c:otherwise>
						</c:choose>
					</div>
					
				</div>
				
			</div>
			
			<div class="header_right">
				<img id="img_header_right" src="./resources/images/cancel.png">
			</div>
		</header>
		
		
		<div id="div_mask"></div>
		<div class="div_login">
		</div>
	</body>
</html>