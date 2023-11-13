<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/goods/product.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
	<main class="container mt-5">
		<div class="row">
			<div class="col-lg-6">
				<div class="wrap-pic-w pos-relative text-center mb-5">
					<img class="rounded" src="../resources/image/peakpx.jpg" id="image">
				</div>
			</div>
			<div class="col-lg-6">
				<div class="">
					<h4 class="">맑음돌이 인형</h4>
					<span class="">준비 중입니다.</span>
					<p class="">귀여운 맑음돌이 인형입니다.</p>
					<div class="">
						<div class="">
							<div class="">수량</div>
							<div class="">
								<div class="">
									<select class="">
										<option>수량을 선택하세요.</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="d-flex flex-wrap align-items-center">
						<button class="btn btn-info text-white px-5 py-2" disabled="disabled">준비 중입니다.</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="../footer.jsp"%>
</body>
</html>