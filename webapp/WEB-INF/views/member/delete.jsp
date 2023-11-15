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
        <main class="container d-flex align-items-center py-4 bg-body-tertiary">
            <div class="form-signin w-lg-25 w-md-50 m-auto">
                <form>
                    <h4 class="mb-3 fw-normal">회원탈퇴</h4>
                    <div class="form">
                        <input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력하세요">
                        <input type="button" value="탈퇴하기" id="submit" class="btn btn-info text-light btn-sm">
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>