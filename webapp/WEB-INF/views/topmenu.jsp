<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
		<script>
			function logoutCheck() {
				Swal.fire({
					title: '로그아웃',
					text: '로그아웃 하시겠습니까?',
					icon: 'question',
					showDenyButton: true,
					confirmButtonColor: '#4faaff',
					confirmButtonText: '예',
					denyButtonText: '아니오',
					denyButtonColor: '#ff4f4f'
				}).then(result => {
					if (result.isConfirmed) {
						Swal.fire({
							title: '로그아웃',
							text: '로그아웃이 완료되었습니다.',
							icon: 'success',
							confirmButtonColor: '#4faaff',
							confirmButtonText: '확인'
						}).then(result => {
							if (result.isConfirmed) location.href = '<%=contextPath%>/member/logout';
						});
					} else return;
				});
			}
			
			$(function(){
				$(window).scroll(function() {
					if ($(this).scrollTop() > 50) {
						$('#back-to-top').fadeIn();
					} else {
						$('#back-to-top').fadeOut();
					}
				});
				$('#back-to-top').click(function() {
					$('body, html').animate({
						scrollTop: 0
					}, 100);
					return false;
				});
			});
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
		<a id="back-to-top" href="#" class="btn btn-outline-secondary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-bar-up" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M3.646 11.854a.5.5 0 0 0 .708 0L8 8.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708zM2.4 5.2c0 .22.18.4.4.4h10.4a.4.4 0 0 0 0-.8H2.8a.4.4 0 0 0-.4.4z"/>
			</svg>
		</a>
	</body>
</html>