<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 목록</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
		<%@include file="../../../resources/script/member/loginCheck.jsp"%>
		<%@include file="../../../resources/script/member/replylist.jsp"%>
		<link rel="stylesheet" href="../resources/css/member/replylist.css">
	</head>
	<%@include file="../topmenu.jsp"%>
	<body>
		<main class="container">
			<div class="d-flex align-items-center justify-content-between my-5">
				<h3 class="fw-normal">댓글 목록</h3>
				<a href="boardList">작성글 목록</a>
			</div>
			<h2 class="h4 mb-3 fw-normal" id="noreply">작성한 댓글이 없습니다.</h2>
			<form id="reply">
				<div class="row g-4">
					<div class="col-5">
						<input type="text" id="content" class="form-control">
					</div>
					<div class="col-2">
						<input type="button" value="검색하기" id="search" class="btn btn-outline-primary">
					</div>
					<div class="col-3">
						<div></div>
					</div>
					<div class="col-2">
						<select id="limit" class="justify-content-md-end form-select">
							<option value="10" selected="selected">10개</option>
							<option value="30">30개</option>
							<option value="50">50개</option>
						</select>
					</div>
				</div>
				<h6 class="mt-4 mb-3 fw-bold" id="count"></h6>
				<table class="table table-responsive-sm table-hover align-middle">
					<thead class="table-secondary align-middle">
						<tr>
							<th scope="col" id="title">게시글 제목</th>
							<th scope="col">댓글 내용</th>
							<th scope="col">작성일자</th>
							<th scope="col"><div></div></th>
						</tr>
					</thead>
					<tbody id="tbody"/>
				</table>
				<nav>
					<ul id="paging" class="pagination justify-content-center"></ul>
				</nav>
			</form>
		</main>
		<%@include file="../footer.jsp"%>
	</body>
</html>