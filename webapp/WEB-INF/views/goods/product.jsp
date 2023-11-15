<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 조회</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
		<script src="https://unpkg.com/jquery-aniview/dist/jquery.aniview.js"></script>
		<link rel="stylesheet" href="../resources/css/goods/product.css">
		<script>
			if ('${id}' === '') {
				alert('로그인이 필요한 서비스입니다.');
				location.href = "../member/login";
			}
		</script>
	</head>
	<%@include file="../topmenu.jsp"%>
	<body>
		<main class="container my-5">
			<div class="row">
				<div class="col-lg-6">
					<div class="wrap-pic-w pos-relative text-center mb-5">
						<img class="border border-secondary rounded" src="../resources/image/peakpx.jpg" id="image">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="justify-content-center">
						<p id="new"><span class="badge text-bg-info text-white">New</span></p>
						<h3 class="mb-3">맑음돌이 인형</h3>
						<p>귀여운 맑음돌이 인형입니다. 처마에 매달아서 맑은 날씨를 기대해보아요.</p>
						<hr>
						<h4><span class="fst-italic opacity-50" id="price">￦ 5,000</span></h4>
						<p class="fst-italic opacity-50">배송비 별도</p>
						<hr>
						<label for="select" class="text-secondary">건당 최대 5개까지 주문가능합니다.</label>
						<select class="form-select mt-1 mb-4" id="select">
							<option>수량을 선택하세요.</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
						<div class="d-flex flex-wrap align-items-center">
							<button class="btn btn-info text-white px-5 py-2 mb-5" disabled="disabled">판매 예정</button>
						</div>
					</div>
				</div>
				<div class="col-lg-12 my-5 border border-secondary rounded bg-white d-flex align-items-center justify-content-center opacity-75" id="info">
					<h3 class="fw-normal text-secondary fst-italic">준비 중인 상품입니다.</h3>
				</div>
			</div>
			<div class="text-center">
				<a href="../goods" class="btn btn-info text-white px-4 py-2">목록보기</a>
			</div>
		</main>
		<%@include file="../footer.jsp"%>
	</body>
</html>