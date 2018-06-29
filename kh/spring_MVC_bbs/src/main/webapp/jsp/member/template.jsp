<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pagefile=request.getParameter("page");
	System.out.println(pagefile);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="./css/template.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<h1>
			<a href="./main.net">화이팅!~</a>
		</h1>
		<br>
	</header>
	<nav>
		<jsp:include page="header.jsp" /><br>
		<br>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="left.jsp" />
		</aside>
		<section>
			<%-- <c:if test="${page!=null }">
					<jsp:include page='${page}+".jsp"'/>
				</c:if> --%>
			<%if(pagefile!=null){ %>
			<jsp:include page='<%=pagefile+".jsp" %>' />
			<%
					}
				 %>
		</section>
	</div>

</body>
</html>