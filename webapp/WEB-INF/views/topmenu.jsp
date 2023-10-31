<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function logoutCheck() {
	const check = confirm('로그아웃 하시겠습니까?');
	if (check) {
		alert('로그아웃이 완료되었습니다.');
		location.href = '<%=contextPath%>/member/logout';
	}
	else return;
}
</script>
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
<c:if test="${id == null}">
<a href="<%=contextPath%>/member/login">로그인</a>
</c:if>
<c:if test="${id != null}">
<a href="<%=contextPath%>/member/check">${nickname}(${id})님</a>
<a href="#" onclick="logoutCheck();">로그아웃</a>
</c:if>
</div>
<a href="<%=contextPath%>" id="home">Home</a>
<br>
<a href="<%=contextPath%>/weather?city=seoul">오늘 날씨 맑음?</a>
<a href="<%=contextPath%>/status">내년 날씨 어때?</a>
<div class="menu">
<a href="<%=contextPath%>">About</a> 
<a href="<%=contextPath%>/board/list">Community</a> 
<a href="<%=contextPath%>">Goods</a>
</div>
<br><br><br>
</body>
</html>