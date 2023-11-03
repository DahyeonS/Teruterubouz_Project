<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/board/view.jsp"%>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<div id="title">
</div>
<div id="region">
</div>
<div id="info">
</div>
<hr>
<div id="filelist">
</div>
<div id="image">
</div>
<div id="content">
</div>
<div class="replies">
<table id="replylist${param.num}">
</table>
</div>
<table>
<c:if test="${nickname != null}">
<tr>
<td><textarea id="reply${param.num}"></textarea>&nbsp&nbsp</td>
<td><input type="button" value="댓글 작성" onclick="writeReply(${param.num});" id="rwrite"></td>
</tr>
</c:if>
<c:if test="${nickname == null}">
<tr>
<td><textarea id="reply${param.num}" placeholder="로그인한 사용자만 작성할 수 있습니다." readonly="readonly"></textarea>&nbsp&nbsp</td>
<td><input type="button" value="댓글 작성" onclick="writeReply(${param.num});" id="rwrite" disabled="disabled"></td>
</tr>
</c:if>
<tr>
</table>
<input type="button" value="목록보기" id="list">
<div id="control">
</div>
<input type="button" value="글쓰기" id="write">
</body>
</html>