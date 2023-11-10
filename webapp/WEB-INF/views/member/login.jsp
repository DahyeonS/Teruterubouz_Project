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
    <main class="container d-flex align-items-center py-4 bg-body-tertiary">
        <div class="form-signin w-lg-25 w-md-50 m-auto">
            <form class="row g-2">
                <h3 class="mb-3 fw-normal">로그인</h3>
                <div class="col-sm-12">
                    <div class="form-floating">
                        <input type="text" id="id" class="form-control" placeholder="아이디">
                        <label for="id">아이디</label>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-floating">
                        <input type="password" id="pw" class="form-control" placeholder="비밀번호">
                        <label for="pw">비밀번호</label>
                    </div>
                </div>
                <div><input type="button" value="로그인" id="submit" class="btn btn-info w-100 py-2 text-light"></div>
            </form>
            <br>
            <div class="btn-info btn py-2"><a href="./join" class="text-light">회원가입</a></div>
        </div>
    </main>
    <%@include file="../footer.jsp"%>
</body>
</html>