<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<table id="board_t">
	<tr class="center">
		<th colspan="2">view 페이지</th>
	</tr>
	
	<c:set var = "b" value="${bcont}"/>
	
	<tr>
		<td>글쓴이</td>
		<td><c:out value="${b.board_name}"/></td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td><c:out value="${b.board_subject }"/></td>
	</tr>
	
	<tr>
		<td>내용</td>
		<!-- <pre>태그로 입력한 그대로 출력되게 합니다. 엔터도 잘나옵니다. -->
		<td><textarea rows="8" cols="50"><c:out value="${b.board_content }"/></textarea></td>
	</tr>
	
	<tr>
		<td>조회수</td>
		<td><c:out value="${b.board_readcount}"/></td>
	</tr>
	
	<tr>
		<td>날짜</td>
		<td><c:out value="${b.board_date}"/></td>
	</tr>
	
	<tr>
		<td colspan="2" class="center">
			<a href = "./board_cont.nhn?board_num=${b.board_num}&page=${page}&state=reply">답변</a>
				&nbsp;&nbsp;
				
			<%-- <c:if test= "${b.board_name == id || id == 'admin' }"> --%>
				<a href= "./board_cont.nhn?board_num=${b.board_num}&page=${page}&state=edit">수정</a>
				&nbsp;&nbsp;
			
			<a href= "./board_cont.nhn?board_num=${b.board_num}&page=${page}&state=del">삭제</a>
				&nbsp;&nbsp;
			<%-- </c:if> --%>
		<a href = "board_list.nhn?page=${ page}">뒤로</a>
		</td>
	</tr>

</table>

</body>
</html>