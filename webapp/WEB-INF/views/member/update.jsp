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
        <main class="container d-flex align-items-center py-4 bg-body-tertiary">
            <div class="form-signin w-lg-50 w-md-75 m-auto">
                <form class="row">
                    <h3 class="fw-normal">회원정보</h3>
                    <a class="my-4" href="boardList">작성글 목록</a>
                    <label for="id" class="form-label">아이디</label>
                    <div class="input-group col-12">
                        <input class="form-control" type="text" id="id" value="${id}" readonly="readonly">
                    </div>
                    <label class="form-label mt-3">닉네임</label>
                    <div class="input-group col-12">
                        <input type="text" maxlength="30" id="nickname" value="${nickname}" class="form-control" aria-describedby="nickcheck">
                        <button id="nickcheck" type="button" class="btn btn-info text-white rounded">중복확인</button>
                    </div>
                    <div class="col-12">
                        <div id="nicklong" class="form-text text-danger">한글 15글자까지만 가능합니다.</div>
                        <div id="nicksuccess" class="form-text">사용 가능한 닉네임입니다.</div>
                        <div id="nickfail" class="form-text text-danger">사용 불가능한 닉네임입니다.</div>
                        <div id="nickequal" class="form-text">이전 닉네임과 동일합니다.</div>
                    </div>
                    <div class="col-12">
                        <input type="button" value="회원정보 수정" id="submit" class="btn btn-info py-2 my-5 text-light">
                    </div>
                </form>
                <a href="pwUpdate">비밀번호 변경</a>
                <a href="#" onclick="deleteCheck();" id="delete">회원탈퇴</a>
            </div>
        </main>
        <%@include file="../footer.jsp"%>
    </body>
</html>