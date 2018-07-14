<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	.div_temp_cont{
		position: absolute;
		top: 61px;
		width: 100%;
		left: 0;
	}
</style>

<jsp:include page="./header.jsp"/>

<div class="div_temp_cont">
	<c:set var="pageFile" value="${empty param.temp_page ? './main.jsp' : param.temp_page }"/>
		<jsp:include page='${pageFile}' />
</div>