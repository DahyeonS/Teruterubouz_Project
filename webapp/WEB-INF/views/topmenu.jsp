<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
<link rel="stylesheet" href="<%=contextPath%>/resources/css/topmenu.css">
</head>
<body class="bg-body-tertiary">
	<nav class="navbar navbar-dark sticky-top navbar-expand-lg rounded bg-info bg-opacity-75" id="menu">
		<div class="container">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#innermenu" aria-controls="innermenu" aria-expanded="false">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="innermenu">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 active text-white" aria-current="page" href="<%=contextPath%>" id="home">Home</a></li>
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/about">About</a></li>
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/notice/list">Notice</a></li>
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/board/list">Community</a></li>
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/goods">Goods</a></li>
				</ul>
			</div>
			<ul class="nav" id="login">
				<c:if test="${id == null}">
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/member/login">로그인</a></li>
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/member/join">회원가입</a></li>
				</c:if>
				<c:if test="${id != null}">
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="<%=contextPath%>/member/check">${nickname}(${id})님</a></li>
					<li class="nav-item"><a class="nav-link link-body-emphasis px-2 text-white" href="#" onclick="logoutCheck();">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<header class="p-3 mb-3 border-bottom bg-white">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a class="nav-link px-2 link-body-emphasis" href="<%=contextPath%>/weather?city=seoul">오늘 날씨 맑음?</a></li>
					<li><a class="nav-link px-2 link-body-emphasis" href="<%=contextPath%>/status">내년 날씨 어때?</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>