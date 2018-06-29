<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./header.jsp"/>

<div class="div_temp_cont">
	<c:set var="pageFile" value="${empty param.temp_page ? './main.jsp' : param.temp_page }"/>
		<jsp:include page='${pageFile}' />
</div>