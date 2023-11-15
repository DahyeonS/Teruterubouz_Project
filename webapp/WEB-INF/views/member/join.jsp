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
        <main class="container py-4">
            <div class="form-signin m-auto position-absolute translate-middle top-50 start-50">
                <h3 class="mb-3 fw-normal mb-4">회원가입</h3>
                <form class="row g-2">
                    <div class="col-10">
                        <div class="form-floating">
                            <input type="text" id="id" maxlength="20" class="form-control" placeholder="아이디">
                            <label for="id">아이디</label>
                            <div id="idfail" class="form-text text-danger">중복된 아이디입니다.</div>
                            <div id="idsuccess" class="form-text">사용할 수 있는 아이디입니다.</div>
                        </div>
                    </div>
                    <div class="col-2">
                        <input type="button" id="idcheck" value="중복확인" class="btn btn-info py-2 text-light">
                    </div>
                    <div class="col-10">
                        <div class="form-floating">
                            <input type="password" id="pw" maxlength="30" class="form-control" placeholder="비밀번호">
                            <label for="pw">비밀번호</label>
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="form-floating">
                            <input type="password" id="pw2" maxlength="30" class="form-control" placeholder="비밀번호 확인">
                            <label for="pw2">비밀번호 확인</label>
                            <div id="pwfail" class="form-text text-danger">비밀번호가 일치하지 않습니다.</div>
                            <div id="pwvoid" class="form-text text-danger">비밀번호를 입력해주세요.</div>
                            <div id="pwsuccess" class="form-text">비밀번호 확인이 완료되었습니다.</div>
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="form-floating">
                            <input type="text" id="nickname" maxlength="30" class="form-control" placeholder="별명">
                            <label for="nickname">별명</label>
                            <div id="nicklong" class="form-text text-danger">한글 15글자까지만 가능합니다.</div>
                            <div id="nickfail" class="form-text text-danger">중복된 별명입니다.</div>
                            <div id="nicksuccess" class="form-text">사용할 수 있는 별명입니다.</div>
                        </div>
                    </div>
                    <div class="col-2">
                        <input type="button" id="nickcheck" value="중복확인" class="btn btn-info py-2 text-light">
                    </div>
                    <div class="col-9 col-lg-10"></div>
                    <div class="col-3 col-lg-2">
                        <input type="button" value="가입하기" id="submit" class="btn btn-info py-2 px-5 ml-3 my-3 text-light">
                    </div>
                </form>
            </div>
            <div class="py-5"></div>
            <div class="py-5"></div>
            <div class="py-5"></div>
            <div class="py-5"></div>
            <div class="py-5"></div>
            <%@include file="../footer.jsp"%>
        </main>
    </body>
</html>