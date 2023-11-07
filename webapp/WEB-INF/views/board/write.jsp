<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<%@include file="../../../resources/script/board/loginCheck.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<%@include file="../../../resources/script/board/write.jsp"%>
<link rel="stylesheet" href="../resources/css/board/write.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <main>
        <div class="container">
            <br>
            <c:if test="${param.update == null}">
                <h3 class="mb-3 fw-normal">게시글 작성</h3>
            </c:if>
            <c:if test="${param.update != null}">
                <h3 class="mb-3 fw-normal">게시글 수정</h3>
            </c:if>
            <br>
            <form>
                <div class="row g-4">
                    <div class="col-2">
                        <select id="province" class="form-select">
                            <option>선택</option>
                            <option value="서울">서울특별시</option>
                            <option value="인천">인천광역시</option>
                            <option value="경기도">경기도</option>
                            <option value="강원도">강원특별자치도</option>
                            <option value="충청북도">충청북도</option>
                            <option value="충청남도">충청남도</option>
                            <option value="대전">대전광역시</option>
                            <option value="세종">세종특별자치시</option>
                            <option value="전라북도">전라북도</option>
                            <option value="전라남도">전라남도</option>
                            <option value="광주">광주광역시</option>
                            <option value="경상북도">경상북도</option>
                            <option value="경상남도">경상남도</option>
                            <option value="대구">대구광역시</option>
                            <option value="울산">울산광역시</option>
                            <option value="부산">부산광역시</option>
                            <option value="제주도">제주특별자치도</option>
                        </select>
                    </div>
                    <div class="col-lg-3 col-sm-4" id="citydiv">
                        <select id="city" class="form-select">
                            <option>선택</option>
                        </select>
                    </div>
                    <div class="col-lg-2 col-sm-3">
                        <select id="district" class="form-select">
                            <option>선택</option>
                        </select>
                    </div>
                </div>
                <br>
                <br>
                <input type="text" id="title" placeholder="제목을 입력하세요." class="form-control-lg w-100">
                <br>
                <br>
                <br>
                <textarea id="content" placeholder="내용을 입력하세요." class="form-control-lg w-100"></textarea>
                <br>
                <div id="filelist">
                </div>
                <c:if test="${param.update != null}">
                    <br>
                    <h6>파일 추가하기</h6>
                </c:if>
                <input type="file" name="uploadFile" id="file" class="form-control w-50" multiple>
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