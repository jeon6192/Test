<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 게시판 리스트 -->
	<table border="1">
		<tr>
			<th colspan="3">게시판 - list</th>
			<th colspan="2">
				<font size=2>글 개수 : ${listcount}</font>
			</th>
		</tr>
		<tr>
			<th width="8%"><div>번호</div></th>
			<th width="50%"><div>제목</div></th>
			<th width="14%"><div>작성자</div></th>
			<th width="17%"><div>날짜</div></th>
			<th width="11%"><div>조회수</div></th>
		</tr>
		<c:set var="num" value="${listcount-(page-1) * 10}"/>
		<c:forEach var="b" items="${boardlist}">
		<tr>
			<td>
				<c:out value="${num}"/>	<%-- num 출력 --%>
				<c:set var="num" value="${num-1}"/>	<%-- num = num - 1 --%>
			</td>
			<td>
				<div>
					<c:if test="${b.board_re_lev != 0}">
						<c:forEach var="a" begin="0"
									end="${b.board_re_lev * 2}" step="1">
							&nbsp;
						</c:forEach>
						<img src = "./resources/images/AnswerLine.gif">
					</c:if>
					<c:if test="${b.board_re_lev == 0}">
						&nbsp;
					</c:if>
					
					<!-- 제목 출력 부분 -->
					<a href="./board_cont.nhn?board_num=${b.board_num}&page=${page}&state=cont">
						${b.board_subject}
					</a>
				</div>
			</td>
			<td>
				<div>${b.board_name}</div>
			</td>
			<td>
				<div>${b.board_date}</div>
			</td>
			<td>
				<div>${b.board_readcount}</div>
			</td>
		</tr>
		</c:forEach>
		<tr class="h30 lime center btn" style="text-align: center">
			<td colspan=5>
				<c:if test="${page <= 1}">
					이전&nbsp;
				</c:if>
				<c:if test="${page > 1}">
					<a href="./board_list.nhn?page=${page-1}">이전</a>
				</c:if>
				<c:forEach var ="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page}">
						${a}
					</c:if>
					<c:if test="${a != page}">
						<a href="./board_list.nhn?page=${a}">${a}</a>
					</c:if>
				</c:forEach>
				<c:if test="${page >= maxpage}">
					&nbsp;다음
				</c:if>
				<c:if test="${page < maxpage}">
					<a href="./board_list.nhn?page=${page + 1}">&nbsp;다음</a>
				</c:if>
			</td>
		</tr>
			<!-- 레코드가 없으면 -->
		<c:if test="${listcount == 0}">
			<tr>
				<td colspan="3">MVC 게시판</td>
				<td style="text-align:right">
					<font size=2>등록된 글이 없습니다.	</font></td>
			</tr>
		</c:if>
			<tr>
				<td colspan="5" style="text-align:right">
					<a href="./board_write.nhn">[글쓰기]</a>
				</td>
			</tr>
	</table>
</body>
</html>