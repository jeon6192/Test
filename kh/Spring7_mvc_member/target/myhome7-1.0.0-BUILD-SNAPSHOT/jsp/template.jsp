<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Insert title here</title>
		<style>
			section{
				margin-top: 60px;
				width: 100%;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<section>
			<c:if test="${!empty viewName}">
				<jsp:include page="${viewName}.jsp"/>
			</c:if>
		</section>
		
	</body>
</html>