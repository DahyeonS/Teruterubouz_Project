<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성글 목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="../resources/script/member/boardlist.js"></script>
<%@include file="../../../resources/script/member/loginCheck.jsp"%>
</head>
<%@include file="../topmenu.jsp"%>
<body>
	<div class="container">
		<h1>작성글 목록</h1>
		<h2 id="noboard">작성글이 없습니다.</h2>
		<form id="board">
			<div>
				<div>
					<div class="search">
						<select id="select">
							<option>선택</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<select id="limit">
							<option value="10" selected="selected">10개</option>
							<option value="30">30개</option>
							<option value="50">50개</option>
						</select>
						<input type="text" id="content">
						<input type="button" value="검색하기" id="search">
					</div>
				</div>
				<table border="1">
					<thead>
						<tr>
							<th class="num">번호</th>
							<th class="title">제목</th>
							<th class="count">조회수</th>
							<th class="date">작성일</th>
							<th class="control">&nbsp</th>
						</tr>
					</thead>
					<tbody id="tbody"/>
					<tbody id="paging"/>
				</table>
			</div>
		</form>
	</div>
</body>
</html>