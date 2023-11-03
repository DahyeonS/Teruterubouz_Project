<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="../resources/script/member/login.js"></script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container">
        <h1>로그인</h1>
        <form>
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" id="id"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="pw"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="로그인" id="submit"></td>
                </tr>
            </table>
        </form>
        <br>
        <a href="./join">회원가입</a>
    </div>
</body>
</html>