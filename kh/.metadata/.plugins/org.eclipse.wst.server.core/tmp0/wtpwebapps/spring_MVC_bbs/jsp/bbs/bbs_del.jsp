<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "./board_del.nhn">
	��й�ȣ: <input type="text" name="board_pass">
			<input type="hidden" value="${bcont.board_num}" name="board_num">
			<input type="submit" value="����">
			<input type="button" value="���" onclick="history.go(-1);">
	</form>
		
</body>
</html>