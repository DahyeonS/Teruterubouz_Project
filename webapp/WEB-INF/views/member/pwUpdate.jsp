<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>비밀번호 변경</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
        <%@include file="../../../resources/script/member/loginCheck.jsp"%>
        <script src="../resources/script/member/pwupdate.js"></script>
    </head>
    <%@include file="../topmenu.jsp"%>
    <body>
        <main class="container d-flex align-items-center py-4 bg-body-tertiary">
            <div class="form-signin w-lg-50 w-md-75 m-auto">
                <form class="row g-2">
                    <h3 class="mb-3 fw-normal">비밀번호 변경</h3>
                        <div class="col-md-12">
                            <label for="pw" class="form-label">새 비밀번호</label>
                            <input type="password" id="pw" class="form-control">
                        </div>
                        <div class="col-md-12">
                            <label for="pw2" class="form-label">비밀번호 확인</label>
                            <input type="password" id="pw2" class="form-control">
                            <div id="pwfail" class="form-text text-danger">비밀번호가 일치하지 않습니다.</div>
                            <div id="pwsuccess" class="form-text">비밀번호 확인이 완료되었습니다.</div>
                        </div>
                        <input type="button" value="수정하기" id="submit" class="btn btn-info py-2 text-light w-100">
                </form>
            </div>
        </main>
    </body>
</html>