<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="../resources/script/member/delete.js"></script>
<%@include file="../../../resources/script/member/loginCheck.jsp"%>
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container">
        <h1>회원탈퇴</h1>
        <form>
            <table>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="pw"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="탈퇴하기" id="submit"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>