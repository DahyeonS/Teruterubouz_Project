<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/member/loginCheck.jsp"%>
<%@include file="../../../resources/script/member/update.jsp"%>
<link rel="stylesheet" href="../resources/css/member/update.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <div class="container d-flex align-items-center py-4 bg-body-tertiary">
        <main class="form-signin w-50 m-auto">
            <form class="row g-3">
                <h3 class="mb-3 fw-normal">회원정보</h3>
                <a href="boardList">작성글 목록</a>
                <br>
                <br>
                <div class="col-md-10">
                    <label for="id" class="form-label">아이디</label>
                    <input class="form-control" type="text" id="id" value="${id}" readonly="readonly">
                </div>
                <div class="col-md-10">
                    <label class="form-label">닉네임</label>
                    <input type="text" id="nickname" value="${nickname}" class="form-control">
                    <div id="nicksuccess" class="form-text">사용 가능한 닉네임입니다.</div>
                    <div id="nickfail" class="form-text text-danger">사용 불가능한 닉네임입니다.</div>
                    <div id="nickequal" class="form-text">이전 닉네임과 동일합니다.</div>
                </div>
                <div class="col-md-2">
                    <input id="nickcheck" type="button" value="중복확인"  class="btn btn-info text-light">
                </div>
                    <input type="button" value="회원정보 수정" id="submit" class="btn btn-info py-2 text-light w-100">
                </form>
                <br>
                <a href="pwUpdate">비밀번호 변경</a>
                <br>
                <a href="#" onclick="deleteCheck();" id="delete">회원탈퇴</a>
        </main>
    </div>
</body>
</html>