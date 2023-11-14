<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./resources/css/goods/goods.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
	<main class="container">
		<h3 class="mb-3 mt-5 fw-normal">상품 목록</h3>
		<div class="album py-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
				<div class="col">
					<div class="card shadow-sm">
						<img class="card-img-top m-auto" src="resources/image/peakpx.jpg">
						<div class="card-body">
							<h5 class="card-title fw-bold">맑음돌이 인형</h5>
							<span class="badge text-bg-info text-white">New</span>
							<p class="card-text text-secondary">판매예정</p>
							<div class="d-flex justify-content-center">
								<a class="btn btn-info text-white px-lg-5 px-sm-3 py-lg-2 py-sm-1" href="goods/product">이동</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="../footer.jsp"%>
</body>
</html>