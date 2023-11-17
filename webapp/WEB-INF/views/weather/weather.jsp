<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>오늘의 날씨</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
		<%@include file="../../../resources/script/weather/weather.jsp"%>
		<link rel="stylesheet" href="./resources/css/weather/weather.css">
	</head>
	<%@include file="../topmenu.jsp"%>
	<body>
		<main class="container">
			<div class="dropdown" id="region">
				<button class="btn btn-outline-info dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">다른 지역 보기</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="./weather?city=seoul">서울</a></li>
					<li><a class="dropdown-item" href="./weather?city=incheon">인천</a></li>
					<li><a class="dropdown-item" href="./weather?city=chuncheon">춘천</a></li>
					<li><a class="dropdown-item" href="./weather?city=gangneung">강릉</a></li>
					<li><a class="dropdown-item" href="./weather?city=daejeon">대전</a></li>
					<li><a class="dropdown-item" href="./weather?city=sejong">세종</a></li>
					<li><a class="dropdown-item" href="./weather?city=gwangju">광주</a></li>
					<li><a class="dropdown-item" href="./weather?city=daegu">대구</a></li>
					<li><a class="dropdown-item" href="./weather?city=ulsan">울산</a></li>
					<li><a class="dropdown-item" href="./weather?city=busan">부산</a></li>
					<li><a class="dropdown-item" href="./weather?city=jeju">제주</a></li>
				</ul>
			</div>
			<c:if test="${param.city == 'seoul'}">
				<h3 class="mb-3 mt-5 fw-normal">서울 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'incheon'}">
				<h3 class="mb-3 mt-5 fw-normal">인천 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'chuncheon'}">
				<h3 class="mb-3 mt-5 fw-normal">춘천 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'gangneung'}">
				<h3 class="mb-3 mt-5 fw-normal">강릉 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'daejeon'}">
				<h3 class="mb-3 mt-5 fw-normal">대전 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'sejong'}">
				<h3 class="mb-3 mt-5 fw-normal">세종 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'gwangju'}">
				<h3 class="mb-3 mt-5 fw-normal">광주 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'daegu'}">
				<h3 class="mb-3 mt-5 fw-normal">대구 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'ulsan'}">
				<h3 class="mb-3 mt-5 fw-normal">울산 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'busan'}">
				<h3 class="mb-3 mt-5 fw-normal">부산 날씨</h3>
			</c:if>
			<c:if test="${param.city == 'jeju'}">
				<h3 class="mb-3 mt-5 fw-normal">제주 날씨</h3>
			</c:if>
			<div id="weatherinfo" class="justify-content-center m-0 align-items-center">
				<div class="py-3"></div>
				<div id="image" class="my-5">
					<div class="spinner-border text-info" role="status" id="loading">
						<span class="visually-hidden">로딩 중</span>
					</div>
				</div>
			</div>
			<div class="text-end mt-5">
				<a href="https://www.weather.go.kr" target="_blank" class="btn btn-info text-white">기상청 바로가기</a>
			</div>
		</main>
		<%@include file="../footer.jsp"%>
	</body>
</html>