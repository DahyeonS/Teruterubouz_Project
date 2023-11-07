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
<link rel="stylesheet" href="../resources/css/member/delete.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container d-flex align-items-center py-4 bg-body-tertiary">
        <main class="form-signin w-25 m-auto">
            <form>
                <h3 class="mb-3 fw-normal">회원탈퇴</h3>
                <div class="form">
                    <input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력하세요">
                    <input type="button" value="탈퇴하기" id="submit" class="btn btn-info text-light btn-sm">
                </div>
            </form>
        </main>
    </div>
</body>
</html>