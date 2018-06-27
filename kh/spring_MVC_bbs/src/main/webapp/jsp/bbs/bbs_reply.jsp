<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action = "./board_reply.nhn" method="post">

	<input type="hidden" name="board_num" value= "${bcont.board_num}">
	<input type="hidden" name="board_re_ref" value= "${bcont.board_re_ref}">
	<input type="hidden" name="board_re_lev" value= "${bcont.board_re_lev}">
	<input type="hidden" name="board_re_seq" value= "${bcont.board_re_seq}">
	<input type="hidden" name="page" value= "${page}">

<table>
	<tr class="center">
		<th colspan="2">Reply 페이지</th>
	</tr>
	<tr>
		<td><div>글쓴이</div></td>
		<td>
			<input name="board_name" id="board_name" type="text" value="${bcont.board_name}">
		</td>
	</tr>
	<tr>
		<td><div>제 목</div></td>
		<td>
			<input name="board_subject" id="board_subject" type="text" size="50" maxlength="100" value="Re: ${bcont.board_subject }">
		</td>
	</tr>
	<tr>
		<td><div>내 용</div></td>
		<td>
			<textarea name="board_content" id="board_content" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>                          
		<td><div>비밀번호</div></td>
		<td>
			<input name="board_pass" id="board_pass" type="password" size="10" maxlength="30" value="">
		</td>
	</tr>
	
	<tr class="center">
		<td colspan="2" class="h30 lime">
			<input type=submit value="등록">
			<input type=reset value="취소" onClick="history.go(-1)">
		</td>
	</tr>
</table>
</form>

</body>
</html>