<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 날씨</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function weatherLoad(city) {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/' + city,
        dataType: 'json',
        success: function(data) {
        	let text = '<h3>';
	        let now = new Date();
	        
	        let one = new Date();
	        one.setDate(now.getDate()+1);
	        let two = new Date();
	        two.setDate(now.getDate()+2);
        	
        	for (item of data) {
	        	let time = new Date(item['date'].substr(0, 4), parseInt(item['date'].substr(4, 2))-1, item['date'].substr(6, 2));
	        	
	        	const isSameDate = (date1, date2) => {
	        		return date1.getFullYear() === date2.getFullYear()
	        			&& date1.getMonth() === date2.getMonth()
	        		    && date1.getDate() === date2.getDate();
	        	}
	        	
	        	if (isSameDate(now, time)) {
		        	if (item['date'][8] === '0') text += '오늘 오전 ';
		        	else text += '오늘 오후 ';
	        	} else if (isSameDate(one, time)) {
		        	if (item['date'][8] === '0') text += '내일 오전 ';
		        	else text += '내일 오후 ';
	        	} else if (isSameDate(two, time)) {
		        	if (item['date'][8] === '0') text += '모레 오전 ';
		        	else text += '모레 오후 ';
	        	} else {
		        	if (item['date'][8] === '0') text += '글피 오전 ';
		        	else text += '글피 오후 ';
	        	} if (item['sky'][3] === '1') text += '맑음 ';
	        	else if (item['sky'][3] === '2') text += '구름 조금 ';
	        	else if (item['sky'][3] === '3') text += '구름 많음 ';
	        	else text += '흐림 ';
	        	
	        	if (item['rain'] === '0') text += '비 예정 없음';
	        	else text += '비 예정';
	        	
	        	text += '(강수확률 ' + item['prob'] + ')</h3><h3>'
        	}
        	$('.weatherinfo').html(text);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	const city = '${param.city}';
	weatherLoad(city);
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>오늘의 날씨는?</h1>
<div class="region">
<h4>다른 지역 보기
<a href="./weather?city=seoul">서울</a>
<a href="./weather?city=incheon">인천</a>
<a href="./weather?city=daejeon">대전</a>
<a href="./weather?city=sejong">세종</a>
<a href="./weather?city=gwangju">광주</a>
<a href="./weather?city=daegu">대구</a>
<a href="./weather?city=ulsan">울산</a>
<a href="./weather?city=busan">부산</a>
<a href="./weather?city=jeju">제주</a>
</h4>
</div>
<c:if test="${param.city == 'seoul'}">
<h2>서울</h2>
</c:if>
<c:if test="${param.city == 'incheon'}">
<h2>인천</h2>
</c:if>
<c:if test="${param.city == 'daejeon'}">
<h2>대전</h2>
</c:if>
<c:if test="${param.city == 'sejong'}">
<h2>세종</h2>
</c:if>
<c:if test="${param.city == 'gwangju'}">
<h2>광주</h2>
</c:if>
<c:if test="${param.city == 'daegu'}">
<h2>대구</h2>
</c:if>
<c:if test="${param.city == 'ulsan'}">
<h2>울산</h2>
</c:if>
<c:if test="${param.city == 'busan'}">
<h2>부산</h2>
</c:if>
<c:if test="${param.city == 'jeju'}">
<h2>제주</h2>
</c:if>
<div class="weatherinfo">
<h3>로딩 중</h3>
</div>
</body>
</html>