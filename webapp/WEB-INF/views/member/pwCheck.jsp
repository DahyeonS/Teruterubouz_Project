<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/member/loginCheck.jsp"%>
<script src="../resources/script/member/pwcheck.js"></script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container">
        <form>
            <table>
                <tr>
                    <th>비밀번호를 입력하세요</th>
                </tr>
                <tr>
                    <td><input type="password" id="pw"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="다음" id="submit"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>