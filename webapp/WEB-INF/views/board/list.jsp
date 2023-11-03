<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/board/list.jsp"%>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>커뮤니티 게시판</h1>
<form>
	<select id="select">
		<option>선택</option>
		<option value="id">아이디</option>
		<option value="nickname">별명</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
	</select>
	<select class="province">
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
	
	<select class="city">
		<option>선택</option>
	</select>
	
	<select class="district">
		<option>선택</option>
	</select>
	
	<input type="text" id="content">
	<input type="button" value="검색하기" id="search">
	<input type="button" value="전체검색" id="all">
</form>
<input type="button" value="글쓰기" id="write">
<table id="boardlist">
<tr id="photo1"/>
<tr id="title1"/>
<tr id="visit1"/>
<tr id="photo2"/>
<tr id="title2"/>
<tr id="visit2"/>
<tr id="paging"/>
</table>
</body>
</html>