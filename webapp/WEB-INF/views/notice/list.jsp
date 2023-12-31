<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
		<%@include file="../../../resources/script/notice/list.jsp"%>
		<link rel="stylesheet" href="../resources/css/notice/list.css">
	</head>
	<%@include file="../topmenu.jsp"%>
	<body>
		<main class="container">
			<h3 class="my-5 fw-normal">공지사항</h3>
			<h2 class="h4 mb-3 fw-normal" id="noboard">작성글이 없습니다.</h2>
			<c:if test="${grade == 'ADMIN'}">
				<input type="button" value="글쓰기" id="write" class="btn btn-outline-primary mb-4">
			</c:if>
			<form id="board">
				<div class="row g-4">
					<div class="col-2">
						<select id="select" class="form-select">
							<option>선택</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="col-5">
						<input type="text" id="content" class="form-control">
					</div>
					<div class="col-2">
						<input type="button" value="검색하기" id="search" class="btn btn-outline-primary">
					</div>
					<div class="col-1">
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
				<table class="table table-responsive-sm table-hover align-middle mt-4">
					<thead class="table-secondary align-middle">
						<tr>
							<th scope="col">번호</th>
							<th scope="col" id="title">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성일자</th>
							<c:if test="${grade == 'ADMIN'}">
								<th scope="col"><div></div></th>
							</c:if>
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