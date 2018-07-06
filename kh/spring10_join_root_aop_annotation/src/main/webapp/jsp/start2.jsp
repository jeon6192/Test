<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="./resources/js/getdata2.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			#insert_form, #result{
				width: 35%;
				min-width: 400px;
				margin: 0 auto;
			    margin-top: 20px;
				box-sizing: border-box;
				padding: 20px 10px;
				box-shadow: 0 0 13px rgba(33, 33, 33, 0.3);
				border: 1px solid #c7c7c7;
				border-radius: 5px;
			}
			#result{
				margin-top: 300px;
			}
			#insert_form fieldset{
				border: 1px solid #c7c7c7;
				font-weight: bold;
				text-align: center;
			}
			fieldset table{
				width: 90%;
				margin: 0 auto;
				box-sizing: border-box;
				padding: 20px 10px;
			}
			#result li{
				text-align: center;
				border-bottom: 1px solid #efefef;
				list-style: none;
				height: 25px;
			}
			.li_id{
				border-top: 1px solid #efefef;
			}
			#result li div{
				display: inline-block;
				box-sizing: border-box;
				width: 49%;
				height: 100%;
			}
			#result li div:first-child {
			    background-color: black;
    			color: white;
			}
			.li_series{
				margin-bottom: 10px;
			}
			.header_div{
				width: 100%;
				margin: 0 auto;
				padding-bottom: 10px;
				font-size: 0;
				top : 0;
				left: 0;
				position: fixed;
			    background-color: white;
			}
			input[type="submit"]{
				margin-bottom: 10px;
				width: 70px;
				height: 25px;
				color: black;
				border: 1px solid black;
				background-color: white;
				transition: all 0.6s;
				font-weight: bold;
			}
			input[type="submit"]:hover{
				color: white;
				background-color: black;
			}
			#insert_form input{
				border: 1px solid black;
			}
			.round-button {
			    display:block;
		        width: 35px;
				height: 35px;
			    border: 2px solid #f5f5f5;
			    border-radius: 50%;
			    color:#f5f5f5;
			    text-align:center;
			    text-decoration:none;
			    background: #464646;
			    box-shadow: 0 0 3px gray;
		        margin: 0 auto;
			}
			.round-button:hover {
			    background: #262626;
			}
			.div_arrow{
			    width: 100%;
    			position: fixed;
				top: 210px;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>
		<div class="header_div">
			<form id="insert_form">
				<fieldset>
					<legend>데이터 추가</legend>
					<table>
						<tr>
							<td><label>상품명</label></td>
							<td><input type="text" name="name" id="name"></td>
						</tr>
						<tr>
							<td><label>모델 번호</label></td>
							<td><input type="text" name="modelnumber" id="modelnumber"></td>
						</tr>
						<tr>
							<td><label>시리즈</label></td>
							<td><input type="text" name="series" id="series"></td>
						</tr>
					</table>
					<input type="submit" value="추가">
				</fieldset>
			</form>
		</div>
		<div class="div_arrow">
			<a href="#" class="round-button" onclick="dropbox(); return false;">
				<i class="fa fa-angle-up" style="font-size:33px"></i>
			</a>
			
		</div>
		
		<ul id="result">
		</ul>
		<!-- <table border="1" id="result">
		</table> -->
	
	</body>
</html>