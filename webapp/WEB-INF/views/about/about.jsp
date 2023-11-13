<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="https://unpkg.com/jquery-aniview/dist/jquery.aniview.js"></script>
<script src="./resources/script/about/about.js"></script>
<link rel="stylesheet" href="./resources/css/about/about.css">
</head>
<%@include file="../topmenu.jsp"%>
<body>
    <main class="container marketing">
        <div class="row featurette my-5">
            <div class="col-lg-5 mb-5 animate__animated animate__fadeIn" id="summary">
                <div class="text-center">
                    <img src="./resources/image/teruterubouzu.png">
                </div>
            </div>
            <div class="col-lg-7 animate__animated animate__slideInUp">
                <h2 class="featurette-heading fw-normal lh-1 mb-5">맑은 날씨를 좋아하는 사람들의 모임</h2>
                <p class="lead mb-3 fst-italic">파란 하늘 좋아하는 사람, 비 오는 게 싫은 사람, 햇님이 좋은 사람 여기여기 모여라~</p>
                <p>맑음돌이 프로젝트는 맑은 날을 소망하는 날씨 커뮤니티입니다.</p>
            </div>
        </div>
        <hr class="featurette-divider">
        <div class="row featurette my-5">
            <div class="col-lg-5 mb-5">
                <div class="text-center mx-5 animated aniview" data-av-animation="animate__fadeInLeft" id="element">
                    <img class="mt-5" src="./resources/image/mark_question.png">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="animated aniview" data-av-animation="animate__fadeInRight">
                    <h2 class="featurette-heading fw-normal lh-1 mb-5">내일 날씨 맑음?</h2>
                    <p class="lead mb-3 fst-italic">내일은 해가 뜰까요?</p>
                    <p>주요 도시들의 날씨를 확인해보세요.</p>
                    <p>&nbsp</p>
                    <p>&nbsp</p>
                    <a href="weather?city=seoul" class="btn btn-info text-white">확인하러 가기</a>
                </div>
            </div>
        </div>
        <hr class="featurette-divider">
        <div class="row featurette my-5">
            <div class="col-lg-5 mb-5">
                <div class="text-center mx-5 animated aniview" data-av-animation="animate__fadeInLeft" id="element">
                    <img src="./resources/image/document_data_bunseki.png" id="status">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="animated aniview" data-av-animation="animate__fadeInRight">
                    <h2 class="featurette-heading fw-normal lh-1 mb-5">내년 날씨 어때?</h2>
                    <p class="lead mb-3 fst-italic">다음 해 날씨는 어떨까?</p>
                    <p>30년 동안의 전국 날씨 데이터를 확인해보세요.</p>
                    <p>&nbsp</p>
                    <p>&nbsp</p>
                    <a href="status" class="btn btn-info text-white">확인하러 가기</a>
                </div>
            </div>
        </div>
        <hr class="featurette-divider">
        <div class="row featurette my-5">
            <div class="col-lg-5 mb-5">
                <div class="text-center mx-5 animated aniview" data-av-animation="animate__fadeInLeft" id="element">
                    <img src="./resources/image/internet_online_salon_set.png" id="community">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="animated aniview" data-av-animation="animate__fadeInRight">
                    <h2 class="featurette-heading fw-normal lh-1 mb-5">커뮤니티</h2>
                    <p class="lead mb-3 fst-italic">다른 지역 날씨는 어떨까?</p>
                    <p>여러 지역 사람들의 목소리를 들어보세요.</p>
                    <p>&nbsp</p>
                    <p>&nbsp</p>
                    <a href="board/list" class="btn btn-info text-white">바로가기</a>
                </div>
            </div>
        </div>
    </main>
    <%@include file="../footer.jsp"%>
</body>
</html>