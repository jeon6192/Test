<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>MVC 게시판 글쓰기</title>
		<link href="./resources/css/bbs_write.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="./resources/js/bbs_write.js"></script>
	</head>
	<body>

		<form action="./bbs_update_ok.nhn?page=${page}" method="post" name="bbsform" onsubmit="return check()" enctype="multipart/form-data">
			<ul class="write_ul">
				<li class="name_li">
					<div>글쓴이</div>
					<div>
						<input class="input_box" name="bbs_name" id="name" type="text" size="15" maxlength="30"
							value="${bbsBean.bbs_name}" readonly="readonly">
					</div>
				</li>
				<li class="pass_li">
					<div>비밀번호</div>
					<div>
						<input class="input_box" name="bbs_pass" id="pass" type="password" size="15" maxlength="30">
					</div>
				</li>
				<li class="subject_li">
					<div>제목</div>
					<div>
						<input class="input_box" name="bbs_subject" id="subject" type="text" size="50" maxlength="100"
							value="${bbsBean.bbs_subject}">
					</div>
				</li>
				<li class="content_li">
					<div>내용</div>
					<div style="float: right;">
						<textarea rows="15" cols="60" name="bbs_content" id="content">${bbsBean.bbs_content}</textarea>
					</div>
				</li>
				<li class="file_li">
					<div style="float:left;">파일첨부</div>
					<div class="div_file">
						<label for="upfile">
							<img src="resources/images/file_open.png" alt="파일열기" class="img_file">
						</label>
		            	<input type="file" name="uploadfile" id="upfile" value="./resources/upload${bbsBean.bbs_file}">
			            <span id="filevalue">${bbsBean.bbs_original}</span>&nbsp;
			            <span id="close"><img src="resources/images/cancel.png"></span>
					</div>
				</li>
	
				<li class="btn_li">
					<div>
						<button class="btn_submit" type="submit">작성</button>
						<button class="btn_reset" type="reset" onclick="history.back()">취소</button>
						<input type="hidden" id="bbs_pass" value="${bbsBean.bbs_pass}">
						<input type="hidden" name="bbs_num" value="${bbsBean.bbs_num}">
					</div>
				</li>
			</ul>
		</form>

	</body>
</html>