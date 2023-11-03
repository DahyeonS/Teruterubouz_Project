<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/member/loginCheck.jsp"%>
<%@include file="../../../resources/script/member/update.jsp"%>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>회원정보</h1>
<a href="pwUpdate">비밀번호 수정</a>
<br><br>
<form>
<table>
<tr>
<th>아이디</th>
<td><input type="text" id="id" value="${id}" readonly="readonly"></td>
</tr>
<tr>
<th>닉네임</th>
<td><input type="text" id="nickname" value="${nickname}">
<input id="nickcheck" type="button" value="중복확인"></td>
</tr>
<tr id="nicksuccess"><th></th><td>사용 가능한 닉네임입니다.</td></tr>
<tr id="nickfail"><th></th><td>사용 불가능한 닉네임입니다.</td></tr>
<tr id="nickequal"><th></th><td>이전 닉네임과 동일합니다.</td></tr>
<tr>
<td colspan="2"><input type="button" value="회원정보 수정" id="submit"></td>
</tr>
</table>
</form>
<br>
<a href="boardList">작성글 목록</a>
<br>
<br>
<a href="#" onclick="deleteCheck();">회원탈퇴</a>
</body>
</html>