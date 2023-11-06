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
<link rel="stylesheet" href="../resources/css/member/pwcheck.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container d-flex align-items-center py-4 bg-body-tertiary">
        <main class="form-signin w-25 m-auto">
            <form>
                <h3 class="mb-3 fw-normal">비밀번호 확인</h3>
                <div class="form">
                    <input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력하세요">
                    <input type="button" value="다음" id="submit" class="btn btn-info py-2 text-light">
                </div>
            </form>
        </main>
    </div>
</body>
</html>