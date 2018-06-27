<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<style>
		header{
			width: 100%;
			height: 60px;
			margin: 0 auto;
			padding: 0;
			font-size: 0;
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
			width: 60px;
			height: 60px;
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
		.header_text span, .header_icon img{
			height: 50%;
		    margin-top: 15px;
		    min-width: 30px;
		    margin-right: 30px;
		    font-size: 10pt;
		    line-height: 60px;
		    font-weight: bold;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
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
		});
	</script>
	<body>
		<header>
			<div class="header_left">
				<img id="img_header_left" src="./resources/images/home.png">
			</div>
			
			<div class="header_center">
				<div class="header_text">
					<span id="span_apple">YOUTUBE</span>
					<span id="span_plus">PLUS</span>
					<span id="span_youtube">APPLE</span>
				</div>
				
				<div class="header_icon">
					<img id="img_apple" src="./resources/images/apple.png">
					<img id="img_plus" src="./resources/images/plus.png">
					<img id="img_youtube" src="./resources/images/youtube.png">
				</div>
				
			</div>
			
			<div class="header_right">
				<img id="img_header_right" src="./resources/images/arrow.png">
			</div>
		</header>
	</body>
</html>