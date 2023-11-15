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
        <main class="container d-flex align-items-center py-4 bg-body-tertiary">
            <div class="form-signin w-lg-25 w-md-50 m-auto">
                <form>
                    <h4 class="mb-3 fw-normal">비밀번호 확인</h4>
                    <div class="form">
                        <input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력하세요">
                        <input type="button" value="다음" id="submit" class="btn btn-info text-light btn-sm">
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>