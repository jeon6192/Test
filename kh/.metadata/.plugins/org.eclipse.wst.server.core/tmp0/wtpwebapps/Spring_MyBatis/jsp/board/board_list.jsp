<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>MVC 게시판</title>
		<link href="./resources/css/board_list.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			$(document).ready(function(){
			   $('.btn_write').click(function(){
			       location.href='./board_write.nhn';
			   });
			});
		</script>
		
	</head>
	<body>
		<c:set var="p" value="${pageMap}"/>
		<ul class="ul_list">
			<c:if test="${p.listCount>=1}">
				<li class="li_title">
					<div class="div_boardName">MVC 게시판 - list</div>
					<div class="div_boardCount">글 개수 : ${p.listCount }</div>
				</li>
				<li class="li_title2">
					<div class="div_num">번호</div>
					<div class="div_subject">제목</div>
					<div class="div_writer">작성자</div>
					<div class="div_date">날짜</div>
					<div class="div_readCount">조회수</div>
				</li>
				
				
				<c:set var="num" value="${p.listCount-(p.page-1)*10 }"/>
				<li class="li_body">
					<c:forEach var="board" items="${boardBeanList }">
						<div class="div_body">
							<div class="div_num">
								<c:out value="${num }"/>
								<c:set var="num" value="${num-1 }"/>
							</div>
							<div style="text-align: left;" class="div_subject">
								<c:if test="${board.board_re_lev!=0 }">
									<c:forEach var="a" begin="0" end="${board.board_re_lev*2 }" step="1">
										&nbsp;
									</c:forEach>
									<img class="img_arrow" src="./resources/image/arrow.png">
								</c:if>
								<c:if test="${board.board_re_lev==0 }">
									&nbsp;
								</c:if>
								<a class="a_subject" href="./board_detail.nhn?num=${board.board_num }&page=${p.page}">
									${board.board_subject }
								</a>
							</div>
							<div class="div_writer">${board.board_name }</div>
							<div class="div_date" style="line-height: 1;">${board.board_date }</div>
							<div class="div_readCount">${board.board_readcount }</div>
						</div>
					</c:forEach>
				</li>
				
				<li class="li_page">
					<div class="div_page">
						<c:if test="${p.page<=1 }">
							이전&nbsp;
						</c:if>
						<c:if test="${p.page>1 }">
							<a href="./board_list.nhn?page=${p.page-1 }">이전</a>&nbsp;
						</c:if>
						
						<c:forEach var="a" begin="${p.startPage }" end="${p.endPage }">
							<c:if test="${a==p.page }">
								${a }
							</c:if>
							<c:if test="${a!=p.page }">
								<a href="./board_list.nhn?page=${a }">${a }</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${p.page>=p.maxPage }">
							&nbsp;다음
						</c:if>
						<c:if test="${p.page<p.maxPage }">
							&nbsp;<a href="./board_list.nhn?page=${p.page+1 }">다음</a>
						</c:if>
						
					</div>
				</li>
				
			</c:if>
			
			
			<c:if test="${p.listCount==0}">
				<li class="li_title">
					<div class="div_boardName">MVC 게시판</div>
					<div style="text-align:right;"><font style="margin-right:15px;" size=2>등록된 글이 없습니다.</font></div>
				</li>
			</c:if>
				<li class="li_bottom2">
					<div class="div_boardWrite">
						<button class="btn_write" type="button">글쓰기</button>
					</div>
				</li>
		</ul>
	</body>
</html>