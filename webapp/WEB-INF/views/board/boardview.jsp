<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function getBoard(num) {
	const param = {num};
	$.ajax({
        type: 'POST',
        url: '../boardApi/getBoard',
        dataType: 'json',
        data: param,
        success: function(data) {
        	console.log(data);
        	const {num, id, nickname, title, content, province, city, district, fileId, fileName, postdate, updateDate, visitCount} = data;
        	
        	let region = '';
        	cities = ['서울', '인천', '대전', '세종', '광주', '대구', '울산', '부산'];
        	if (cities.indexOf(province) === -1) region += '<a id="province" href="#">' + province + '</a> ';
        	
        	region += '<a id="city" href="#">' + city + '</a>';
        	if (province !== '세종') region += ' <a id="district" href="#">' + district + '</a>';
        	
        	
        	let info = '<h4 id="nickname">' + nickname + '(' + id + ')</h4><h4 id="postdate">작성일자 ' + postdate + '</h4>';
        	if (updateDate !== null) info += '<h4 id="updatedate">수정일자 ' + updateDate + '</h4>'
        	info += '<h4>조회수 ' + visitCount + '</h4>';
        	
        	let image = '';
        	if (fileId === '') $('#image').hide;
        	else {
	        	const newFileId = encodeURIComponent(fileId.split(',')[0]);
	        	image += '<img src="../resources/uploads/' + newFileId + '" style="width: 70%; height: auto;"/><br>';
        	}
        	
        	$('title').html(title);
        	$('#title').html('<h2>'+ title +'</h2>');
        	$('#region').html(region);
        	$('#info').html(info);
        	$('#image').html(image);
        	$('#content').html(content);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

$(function() {
	getBoard(${param.num});
	
	$('#write').click(function() {
		location.href = 'write';
	});
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<div id="title">
</div>
<div id="region">
</div>
<div id="info">
</div>
<hr>
<div id="image">
</div>
<div id="content">
</div>
</body>
</html>