<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="../resources/script/member/join.js"></script>
<link rel="stylesheet" href="../resources/css/member/join.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container d-flex align-items-center py-4 bg-body-tertiary">
        <main class="form-signin w-50 m-auto">
            <form class="row g-2">
                <h3 class="mb-3 fw-normal">회원가입</h3>
                <div class="col-md-10">
                    <div class="form-floating">
                        <input type="text" id="id" class="form-control" placeholder="아이디">
                        <label for="id">아이디</label>
                        <div id="idfail" class="form-text text-danger">중복된 아이디입니다.</div>
                        <div id="idsuccess" class="form-text">사용할 수 있는 아이디입니다.</div>
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="button" id="idcheck" value="중복확인" class="btn btn-info py-2 text-light">
                </div>
                <div class="col-10">
                    <div class="form-floating">
                        <input type="password" id="pw" class="form-control" placeholder="비밀번호">
                        <label for="pw">비밀번호</label>
                    </div>
                </div>
                <div class="col-10">
                    <div class="form-floating">
                        <input type="password" id="pw2" class="form-control" placeholder="비밀번호 확인">
                        <label for="pw2">비밀번호 확인</label>
                        <div id="pwfail" class="form-text text-danger">비밀번호가 일치하지 않습니다.</div>
                        <div id="pwsuccess" class="form-text">비밀번호 확인이 완료되었습니다.</div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="form-floating">
                        <input type="text" id="nickname"  class="form-control" placeholder="별명">
                        <label for="nickname">별명</label>
                        <div id="nickfail" class="form-text text-danger">중복된 별명입니다.</div>
                        <div id="nicksuccess" class="form-text">사용할 수 있는 별명입니다.</div>
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="button" id="nickcheck" value="중복확인" class="btn btn-info py-2 text-light">
                </div>
                <div><input type="button" value="가입하기" id="submit" class="btn btn-info w-100 py-2 text-light"></div>
            </form>
        </main>
    </div>
</body>
</html>