<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<link href="./resources/css/header.css" rel="stylesheet" type="text/css">
	<script src="./resources/js/header.js"></script>
	
	<body>
		<header>
			<div class="header_left">
				<img id="img_header_left" src="./resources/images/home.png">
			</div>
			
			<div class="header_center">
				<div class="header_text">
					<div class="div_board">
						<a href="./bbs_list.nhn">
							<span id="span_board">검색</span>
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