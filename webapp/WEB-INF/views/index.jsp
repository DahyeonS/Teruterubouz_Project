<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HOME</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
		<script src="https://unpkg.com/jquery-aniview/dist/jquery.aniview.js"></script>
		<script src="./resources/script/index.js"></script>
		<link rel="stylesheet" href="./resources/css/index.css">
	</head>
	<%@include file="topmenu.jsp"%>
	<body>
		<main>
			<div id="mainpage" class="carousel slide carousel-fade mb-5" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://c.pxhere.com/photos/d4/79/scenery_han_river_seoul_sky_river_cloud_building_city-650868.jpg!d" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="https://c.pxhere.com/images/01/d6/aac0169a534247556384a3e4e212-1608054.jpg!d" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="https://c.pxhere.com/photos/ca/e9/jeju_island_cloud_shiroyama_hiji_peak_udo_doosan_rods_ascension_world_natural_heritage-805110.jpg!d" class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img src="https://c.pxhere.com/photos/a7/b1/songdo_park_incheon_city_korea_landscape_urban_building-398635.jpg!d" class="d-block w-100">
					</div>
				</div>
			</div>
			<div class="py-3"></div>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-4 my-5">
						<div class="animated aniview" data-av-animation="animate__backInUp">
							<img src="./resources/image/mark_question.png" width="140" height="140" focusable="false">
							<h2 class="fw-normal my-3">처음 오셨나요?</h2>
							<p>이쪽을 확인해주세요!</p>
							<p><a href="about" class="btn btn-outline-info">바로가기</a></p>
						</div>
					</div>
					<div class="col-lg-4 my-5">
						<div class="animated aniview" data-av-animation="animate__backInUp">
							<img src="./resources/image/mark_manpu10_exclamation.png" width="140" height="140" focusable="false">
							<h2 class="fw-normal my-3">공지사항</h2>
							<p>원할한 이용을 위해 안내말씀 드립니다.</p>
							<p><a href="notice/list" class="btn btn-outline-info">보러가기</a></p>
						</div>
					</div>
					<div class="col-lg-4 my-5">
						<div class="animated aniview" data-av-animation="animate__backInUp">
							<img src="./resources/image/teruterubouzu.png" width="140" height="140" focusable="false">
							<h2 class="fw-normal my-3">굿즈</h2>
							<p><span class="badge text-bg-info text-white">New</span>&nbsp;MD상품 드디어 출시!</p>
							<p><a href="goods" class="btn btn-outline-info">구경하기</a></p>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@include file="./footer.jsp"%>
	</body>
</html>