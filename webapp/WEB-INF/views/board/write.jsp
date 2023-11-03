<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<%@include file="../../../resources/script/board/loginCheck.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/board/write.jsp"%>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<c:if test="${param.update == null}">
<h1>게시글 작성</h1>
</c:if>
<c:if test="${param.update != null}">
<h1>게시글 수정</h1>
</c:if>
<form>
<div class="region">

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

</div>
<h2><input type="text" id="title" placeholder="제목을 입력하세요."></h2>
<br>
<textarea id="content" placeholder="내용을 입력하세요."></textarea>
<br>
<c:if test="${param.update != null}">
파일 추가하기
<br>
</c:if>
<div id="filelist">
</div>
<input type="file" name="uploadFile" id="file" multiple>
<br>
<c:if test="${param.update == null}">
<input type="button" value="작성하기" id="submit">
</c:if>
<c:if test="${param.update != null}">
<input type="button" value="수정하기" id="update">
</c:if>
<input type="button" value="취소" id="cancel">
</form>
</body>
</html>