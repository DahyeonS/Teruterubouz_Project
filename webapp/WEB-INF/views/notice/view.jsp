<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/notice/view.jsp"%>
<link rel="stylesheet" href="../resources/css/notice/view.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <main>
        <div class="container">
            <div id="title" class="text-center my-5">
            </div>
            <div id="info">
            </div>
            <hr>
            <div class="mb-5">
                <div id="content">
                </div>
            </div>
            <br>
            <input type="button" class="btn btn-info text-white" value="목록보기" id="list">
            <c:if test="${grade == 'ADMIN'}">
                <input type="button" class="btn btn-info text-white mx-2" value="글쓰기" id="write">
            </c:if>
            <div id="control" class="mb-3">
                <c:if test="${grade == 'ADMIN'}">
                    <input class="btn btn-info text-white mx-2" type="button" value="수정하기" id="update" onclick="updateLink(${param.num});">
                    <input class="btn btn-info text-white" type="button" value="삭제하기" id="delete" onclick="deleteConfirm(${param.num})">
                </c:if>
            </div>
            <br>
        </div>
    </main>
    <%@include file="../footer.jsp"%>
</body>
</html>