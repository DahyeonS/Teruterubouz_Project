<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/notice/write.jsp"%>
<link rel="stylesheet" href="../resources/css/notice/write.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <main>
        <div class="container">
            <br>
            <c:if test="${param.update == null}">
                <h3 class="mb-3 fw-normal">공지 작성</h3>
            </c:if>
            <c:if test="${param.update != null}">
                <h3 class="mb-3 fw-normal">공지 수정</h3>
            </c:if>
            <form>
                <br>
                <input type="text" id="title" placeholder="제목을 입력하세요." class="form-control-lg w-100">
                <br>
                <br>
                <br>
                <textarea id="content" placeholder="내용을 입력하세요." class="form-control-lg w-100"></textarea>
                <br>
                <br>
                <div id="control" class="mb-3">
                    <c:if test="${param.update == null}">
                        <input type="button" value="작성하기" id="submit" class="btn btn-info text-white">
                    </c:if>
                    <c:if test="${param.update != null}">
                        <input type="button" value="수정하기" id="update" class="btn btn-info text-white">
                    </c:if>
                    <input type="button" value="취소" id="cancel" class="btn btn-info text-white">
                </div>
            </form>
        </div>
    </main>
</body>
</html>