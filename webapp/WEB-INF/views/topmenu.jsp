<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.login {float: right;}
.menu {
	float: right;
}
a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<div class="login">
<a href="<%=contextPath%>">Login</a>
<a href="<%=contextPath%>">ID</a>
<a href="<%=contextPath%>">Logout</a>
</div>
<a href="<%=contextPath%>" id="home">Home</a>
<br>
<a href="<%=contextPath%>/weather?city=seoul">오늘 날씨 맑음?</a>
<a href="<%=contextPath%>/status">내년 날씨 어때?</a>
<div class="menu">
<a href="<%=contextPath%>">About</a> 
<a href="<%=contextPath%>">Community</a> 
<a href="<%=contextPath%>">Goods</a>
</div>
<br><br><br>
</body>
</html>