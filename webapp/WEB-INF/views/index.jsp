<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="./resources/script/index.js"></script>
<link rel="stylesheet" href="./resources/css/index.css">
</head>
<%@include file="topmenu.jsp"%>
<body>
	<main>
		<div id="mainpage" class="carousel slide carousel-fade" data-bs-ride="carousel">
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
		<div class="container">
		</div>
	</main>
	<%@include file="./footer.jsp"%>
</body>
</html>