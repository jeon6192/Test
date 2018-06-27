<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="UTF-8">
        <title>Title</title>
        <link href="./css/join.css" rel="stylesheet" type="text/css">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="./js/join.js"></script>
    </head>
    <body>
        <fieldset>
            <legend>회원가입</legend>
            <form  name=joinform method=post action=joinProcess.net>
            	<div class="id_ajax"></div>
                <label>아이디</label><input type=text name=id id=id placeholder="Enter id">
                <input type=button value="ID중복검사" id=idcheck><br><br>
                <label>비밀번호</label><input type=password name=password id=password><br><br>
                <label>이름</label><input type=text name=name id=name placeholder="Enter age"><br><br>
                <label>나이</label><input type=text name=age id=age maxlength="2"><br><br>
                <label>성별</label><span>
         			<input type=radio name=gender id=gender1 value="남" checked>남자
            		<input type=radio name=gender id=gender2 value="여">여자
            	</span><br><br>
                <label>E-Mail</label><input type=text name=email id=email size=10>@
                <input type=text name=domain id=domain size=10>
                <select name=sel id=sel>
                    <option value="">직접입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
                </select>
                <br><br><br>
                <div class="clearfix">
	                <input type=submit value="회원가입" id="submit">
	                <input type=reset value="취소">
                </div>
            </form>
        </fieldset>
    </body>
</html>