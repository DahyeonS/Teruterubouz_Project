<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
        <%@include file="../../../resources/script/board/view.jsp"%>
        <link rel="stylesheet" href="../resources/css/board/view.css">
    </head>
    <%@include file="../topmenu.jsp"%>
    <body>
        <main class="container">
            <div id="title" class="text-center my-5">
            </div>
            <div id="region" class="text-end">
            </div>
            <div id="info">
            </div>
            <hr>
            <div class="mb-5">
                <div id="filelist" class="m-0 border-0">
                </div>
                <div id="image" class="my-3">
                </div>
                <div id="content">
                </div>
            </div>
            <section id="replies" class="mt-5">
                <div class="py-3"></div>
                <div id="replylist${param.num}" class="row g-1 align-items-center border border-info d-flex justify-content-center text-center px-2 py-3 mt-5 bg-white rounded">
                </div>
            </section>
            <div class="py-2"></div>
            <table class="d-flex justify-content-center my-5">
            <c:if test="${nickname != null}">
            <tr>
            <td><textarea class="form-control-lg mx-3" id="reply${param.num}" style="font-size: 10pt;"></textarea></td>
            <td><input type="button" class="btn btn-info text-white" value="댓글 작성" onclick="writeReply(${param.num});" id="rwrite"></td>
            </tr>
            </c:if>
            <c:if test="${nickname == null}">
            <tr>
            <td><textarea class="form-control-lg" id="reply${param.num}" style="font-size: 10pt;" placeholder="로그인한 사용자만 작성할 수 있습니다." readonly="readonly"></textarea>&nbsp;&nbsp;</td>
            <td><input type="button" class="btn btn-info text-white" value="댓글 작성" id="rwrite" disabled="disabled"></td>
            </tr>
            </c:if>
            <tr>
            </table>
            <input type="button" class="btn btn-info text-white" value="목록보기" id="list">
            <input type="button" class="btn btn-info text-white mx-2" value="글쓰기" id="write">
            <div id="control" class="mb-5">
            </div>
        </div>
        <%@include file="../footer.jsp"%>
    </body>
</html>