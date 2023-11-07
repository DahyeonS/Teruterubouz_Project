<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
	<main>
		<div class="container">
			<br>
			<h3 class="mb-3 fw-normal">상품 목록</h3>
			<div class="album py-5 bg-body-tertiary">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
					<div class="col">
						<div class="card shadow-sm">
							<img class="card-img-top m-auto" src="resources/image/no-image-icon-23483.png">
							<div class="card-body">
								<h5 class="card-title">상품</h5>
								<p class="card-text">설명</p>
								<a class="btn btn-primary" href="goods/product">이동</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>