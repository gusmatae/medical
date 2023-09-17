<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${cpath}/resources/css/CompanyMember.css"> --%>
</head>
<body>
	<div id = "brand">
		<b><strong>Medical ERP</strong></b>
		<button>로그인</button>
	</div>
	<div id = "navigator">
		<nav>
		  <ul>
		    <li><a href="${cpath}/">홈</a></li>
		    <li><a href="${cpath}/CompanyMemberList">직원관리</a></li>
		    <li><a href="#">환자관리</a></li>
		    <li><a href="#">의료기품관리</a></li>
		    <li><a href="#">회계</a></li>
		    <li><a href="#">연락처</a></li>
		  </ul>
		</nav>
	</div>
</body>
</html>