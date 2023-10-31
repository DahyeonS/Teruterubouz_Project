<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
$(function() {
	$('#write').click(function() {
		location.href = 'write';
	});
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>커뮤니티 게시판</h1>
<input type="button" value="글쓰기" id="write">
</body>
</html>