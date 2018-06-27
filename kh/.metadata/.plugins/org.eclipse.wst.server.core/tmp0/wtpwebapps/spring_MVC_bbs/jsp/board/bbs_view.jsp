<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
		<link href="./resources/css/bbs_view.css" rel="stylesheet" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="./resources/js/bbs_view.js"></script>
 		
	</head>
	<body>
		<ul class="ul_view">
			<li class="li_title">
				<div class="div_subject">${bbsBean.bbs_subject}</div>
				<div class="div_title_bottom">
					<span class="span_writer">${bbsBean.bbs_name}</span><br>
					조회수 <span class="span_readCount">${bbsBean.bbs_readcount}</span>
					·
					<span class="span_date">${bbsBean.bbs_date}</span>
				</div>
			</li>
			<li class="li_content">
				<input type="hidden" id="bbs_pass" value="${bbsBean.bbs_pass}">
				<input type="hidden" id="bbs_num" value="${bbsBean.bbs_num}">
				<input type="hidden" id="page" value="${page}">
				<div class="div_content">
					<c:if test="${!empty bbsBean.bbs_file}">
						<div class="div_img">
							<a href="./download.file?path=${bbsBean.bbs_file}&original=${bbsBean.bbs_original}">
								<img class="img_content" src="./resources/upload${bbsBean.bbs_file}">
							</a>
						</div>
					</c:if>
					${bbsBean.bbs_content }
				</div>
			</li>
				
		</ul>
		
		<div class="div_btn">
			<c:if test="${id=='admin'||id==bbsBean.bbs_name}">
			</c:if>
			<a href="<c:url value='/bbs_reply.nhn?num=${bbsBean.bbs_num }&page=${page}'/>">
		    	<img src="./resources/images/reply.png">
		    </a>&nbsp;
	    	<a href="<c:url value='/bbs_update.nhn?num=${bbsBean.bbs_num}&page=${page}'/>">
				<img src="./resources/images/update.png">
			</a>&nbsp;
			<a href="javascript:wrapWindow()">
				<img src="./resources/images/delete.png">
			</a>&nbsp;
			<a href="<c:url value='/bbs_list.nhn?page=${page}'/>">
				<img src="./resources/images/list.png">
			</a>&nbsp;
		</div>
		
		<div id="mask"></div>
		<div class="div_in">
			<span class="span_x">X</span>
			<div class="div_text">비밀번호를 입력하세요</div>
			<div class="div_chk"></div>
			<div class="div_input">
				<input type="password" name="bbs_num" class="input_pass">
				<br><br>
				<button type="button" class="btn_delete">확인</button>
			</div>
		</div>
	</body>
</html>