<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="BoardList.bo">게시판</a>
<a href="user_info.net">내 정보 보기</a>
<c:if test="${id!=null&&id.equals('admin')}">
	<a href='member_list.net'>회원정보 보기</a>
</c:if>


