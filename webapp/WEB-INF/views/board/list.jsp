<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/board/list.jsp"%>
<link rel="stylesheet" href="../resources/css/board/list.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
	<main class="container">
		<h3 class="my-5 fw-normal">커뮤니티 게시판</h3>
		<form>
			<div class="row g-4">
				<div class="col-2">
					<select id="select" class="form-select">
						<option>선택</option>
						<option value="id">아이디</option>
						<option value="nickname">별명</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="col-lg-3 col-sm-4">
					<select id="province" class="form-select">
						<option>선택</option>
						<option value="서울">서울특별시</option>
						<option value="인천">인천광역시</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원특별자치도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="대전">대전광역시</option>
						<option value="세종">세종특별자치시</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="광주">광주광역시</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="대구">대구광역시</option>
						<option value="울산">울산광역시</option>
						<option value="부산">부산광역시</option>
						<option value="제주도">제주특별자치도</option>
					</select>
				</div>
				<div class="col-lg-2 col-sm-3" id="citydiv">
					<select id="city" class="form-select">
						<option>선택</option>
					</select>
				</div>
				<div class="col-sm-2 col-sm-3">
					<select id="district" class="form-select">
						<option>선택</option>
					</select>
				</div>
				<div class="col-xs-6 w-50">
					<input type="text" id="content" class="form-control">
				</div>
				<div class="col-sm-1">
					<input type="button" value="검색하기" id="search" class="btn btn-outline-primary">
				</div>
				<div class="col-lg-2">
					<input type="button" value="전체보기" id="all" class="btn btn-outline-primary justify-content-start">
				</div>
			</div>
		</form>
		<input type="button" value="글쓰기" id="write" class="btn btn-outline-primary mt-4 mb-5">
		<nav>
			<ul id="paging" class="pagination justify-content-center"></ul>
		</nav>
		<div class="album py-5 bg-body-tertiary">
			<div id="boardlist" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-4">
				<div class="col">
				</div>
			</div>
		</div>
	</main>
	<%@include file="../footer.jsp"%>
</body>
</html>