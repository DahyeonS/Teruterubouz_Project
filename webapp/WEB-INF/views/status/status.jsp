<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 통계 조회</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://d3js.org/d3.v7.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/billboard.js/3.9.4/billboard.min.js" integrity="sha512-z/STTxopF5zN2T1Fm+xdVanV6ypEVVL7KBFxnPi2WkO9mzjo3gpUXnPkdgCBaYZq2H0z16hXkXBiGQ3HRty03A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/billboard.js/3.9.4/billboard.min.css" integrity="sha512-L+GG44se0A9Mp8Sp/fq2t9Y8+Y4F0ApJYmnhUaDnwIqSVQiEnqIvsuquTVvGfj5gXaOvy1yVJ7AI1OvDDIwp3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="./resources/script/status/status.js"></script>
<link rel="stylesheet" href="./resources/css/status/status.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
	<main class="container">
		<h3 class="mb-3 mt-5 fw-normal">기온 통계</h3>
		<div class="animate__animated animate__fadeIn">
			<div class="my-5">
				<div id="chart1"></div>
			</div>
			<div class="my-5">
				<div id="chart2"></div>
			</div>
			<div class="my-5">
				<div class="mx-5 mb-2">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" checked="checked" name="tempmodel" id="tempmodel1" value="1">
						<label class="form-check-label" for="tempmodel1">모델 1</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="tempmodel" id="tempmodel2" value="2">
						<label class="form-check-label" for="tempmodel2">모델 2</label>
					</div>
				</div>
				<div id="chart3"></div>
			</div>
			<hr class="mb-5">
			<h3 class="mb-3 fw-normal">강수량 통계</h3>
			<div class="my-5">
				<div id="chart4"></div>
			</div>
			<div class="my-5">
				<div id="chart5"></div>
			</div>
			<div class="my-5">
				<div class="mx-5 mb-2">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" checked="checked" name="rainmodel" id="rainmodel1" value="1">
						<label class="form-check-label" for="rainmodel1">모델 1</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="rainmodel" id="rainmodel2" value="2">
						<label class="form-check-label" for="rainmodel2">모델 2</label>
					</div>
				</div>
				<div id="chart6"></div>
			</div>
		</div>
	</main>
	<%@include file="../footer.jsp"%>
</body>
</html>