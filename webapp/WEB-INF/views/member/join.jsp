<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="../resources/script/member/join.js"></script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>회원가입</h1>

<form>
<table>
<tr>
<th>아이디</th>
<td><input type="text" id="id"></td>
<td><input type="button" id="idcheck" value="중복확인" style="margin-left: 20px"></td>
</tr>
<tr id="idfail">
<th>&nbsp</th>
<td>중복된 아이디입니다.</td>
</tr>
<tr id="idsuccess">
<th>&nbsp</th>
<td>사용할 수 있는 아이디입니다.</td>
</tr>
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
<th>별명</th>
<td><input type="text" id="nickname"></td>
<td><input type="button" id="nickcheck" value="중복확인" style="margin-left: 20px"></td>
</tr>
<tr id="nickfail">
<th>&nbsp</th>
<td>중복된 별명입니다.</td>
</tr>
<tr id="nicksuccess">
<th>&nbsp</th>
<td>사용할 수 있는 별명입니다.</td>
</tr>
<tr>
<th colspan="2">&nbsp</th>
<td><input type="button" value="가입하기" id="submit" style="margin-left: 20px"></td>
</tr>
</table>
</form>
</body>
</html>