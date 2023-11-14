<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/footer.css">
</head>
<body>
    <div class="py-5"></div>
    <footer class="container py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a class="nav-link px-2 text-secondary" aria-current="page" href="<%=contextPath%>" id="home">Home</a></li>
            <li class="nav-item"><a class="nav-link px-2 text-secondary" href="<%=contextPath%>/about">About</a></li>
            <li class="nav-item"><a class="nav-link px-2 text-secondary" href="<%=contextPath%>/notice/list">Notice</a></li>
            <li class="nav-item"><a class="nav-link px-2 text-secondary" href="<%=contextPath%>/board/list">Community</a></li>
            <li class="nav-item"><a class="nav-link px-2 text-secondary" href="<%=contextPath%>/goods">Goods</a></li>
        </ul>
        <p class="text-center text-body-secondary">Illustration <a class="text-secondary" target="_blank" href="https://www.irasutoya.com/">いらすとや</a></p>
        <p class="text-center text-body-secondary"><img src="<%=contextPath%>/resources/image/pngegg.png" id="logo"> 2023 Teruterubouz Project</p>
    </footer>
</body>
</html>