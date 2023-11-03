<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/member/loginCheck.jsp"%>
<script src="../resources/script/member/pwupdate.js"></script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>비밀번호 수정</h1>
<form>
<table>
<tr>
<th>비밀번호</th>
<td><input type="password" id="pw"></td>
</tr>
<tr>
<th>비밀번호 확인</th>
<td><input type="password" id="pw2"></td>
</tr>
<tr id="pwfail">
<th>&nbsp</th>
<td>비밀번호가 일치하지 않습니다.</td>
</tr>
<tr id="pwsuccess">
<th>&nbsp</th>
<td>비밀번호 확인이 완료되었습니다.</td>
</tr>
<tr>
<td colspan="2"><input type="button" value="수정하기" id="submit"></td>
</tr>
</table>
</form>
</body>
</html>