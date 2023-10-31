<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function pagingBoard(params) {
	$.ajax({
        type: 'POST',
        url: '../boardApi/pagingBoard',
        dataType: 'json',
        data: params,
        success: function(data) {
        	const {blockNum, endPage, isBNext, isBPrev, isNext, isPrev, listNum, pageNum, startPage, totalCount, totalPage} = data;
        	let td = '<td colspan="10">';
			if(isPrev) td += '<a href="#" onclick="getBoard('+ (pageNum - 1) + ');">[<]</a>';
            if(isBPrev) td += '<a href="#" onclick="getBoard('+ (startPage - 1) + ');">[<<]</a>';
			for(let i=startPage; i<=endPage; i++) {
				if(i === pageNum) td += '<span style="color:red;">['+ i + ']</span>';
				else td += '<a href="#" onclick="getBoard(' + i + ');">['+ i +']</a>';
			};
			if(isNext) td += '<a href="#" onclick="getBoard(' + (pageNum + 1) + ');">[>]</a>';
			if(isBNext) td += '<a href="#" onclick="getBoard(' + (endPage + 1) + ');">[>>]</a>';
			td += '</td>';
			$('#paging').html(td);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

function getBoard(page) {
	let id, nickname, title, content;
	if ($('#select').val() === 'id') id = $('#content').val();
	else if ($('#select').val() === 'nickname') nickname = $('#content').val();
	else if ($('#select').val() === 'title') title = $('#content').val();
	else if ($('#select').val() === 'content') content = $('#content').val();
	
	const params = {page, id, nickname, title, content};
	$.ajax({
        type: 'POST',
        url: '../boardApi/boardList',
        dataType: 'json',
        data: params,
        success: function(data) {
            let photo1, photo2, title1, title2, visit1, visit2;
            if (data['rs'] === 0) {
            	alert('조회되는 게시글이 없습니다.');
            	return;
            } else {
	            for (let i=0; i<data['rs'].length; i++) {
	            	const {num, title, nickname, visitCount, fileId} = data['rs'][i];
	            	
	            	if (i < 5) {
	            		photo1 += '<td colspan=2>';
	            		title1 += '<td colspan=2><a href="#" onclick="linkBoard(' + num + ');">' + title + '</td>';
	            		visit1 += '<td>' + nickname + '</td><td>조회수 ' + visitCount + '</td>';
	            		if (fileId == '') photo1 += '<img src="../resources/image/no-image-icon-23483.png" style="width: 200px; height: 150px" alt="' + num + '" onclick="linkBoard(' + num + ');"></td>';
	            		else {
	            			const fileName = encodeURIComponent(fileId.split(',')[0]);
	            			photo1 += '<img src="../resources/uploads/s_' + fileName + '" style="width: 200px; height: 150px" alt="' + num + '" onclick="linkBoard(' + num + ');"/></td>';
	            		}
	            		if ((i+1) % 5 == 0) {
		            		photo1 += '</tr>';
		            		title1 += '</tr>';
		            	}
	            	} else {
	            		photo2 += '<td colspan=2>';
	            		title2 += '<td colspan=2><a href="#" onclick="linkBoard(' + num + ');">' + title + '</td>';
	            		visit2 += '<td>' + nickname + '</td><td>조회수 ' + visitCount + '</td>';
		            	if (fileId == '') photo2 += '<img src="../resources/image/no-image-icon-23483.png" style="width: 200px; height: 150px" alt="' + num + '" onclick="linkBoard(' + num + ');"></td>';
		            	else {
	            			const fileName = encodeURIComponent(fileId);
	            			photo2 += '<img src="../resources/uploads/s_' + fileName + '" style="width: 200px; height: 150px" alt="' + num + '" onclick="linkBoard(' + num + ');"/></td>';
	            		}
		            	if ((i+1) % 5 == 0) {
		            		photo2 += '</tr>';
		            		title2 += '</tr>';
		            	}
	            	}
	            }
            }
            $('#boardlist #photo1').html('');
            $('#boardlist #photo2').html('');
            $('#boardlist #title1').html('');
            $('#boardlist #title2').html('');
            $('#boardlist #visit1').html('');
            $('#boardlist #visit2').html('');
            
            $('#boardlist #photo1').html(photo1);
            $('#boardlist #photo2').html(photo2);
            $('#boardlist #title1').html(title1);
            $('#boardlist #title2').html(title2);
            $('#boardlist #visit1').html(visit1);
            $('#boardlist #visit2').html(visit2);
            pagingBoard(params);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

function linkBoard(num) {
	location.href = 'view?num=' + num;
}

$(function() {
	const sPage = '${param.page}'
	let page = 1;
	if (sPage !== '') page = sPage;
	getBoard(page);
	
	$('#write').click(function() {
		location.href = 'write';
	});
	
	$('#search').click(function() {
		const content = $('#content').val();
		if (content === '') {
			alert('검색어를 입력해주세요.');
		} else getBoard(page);
	});
	
	$('#content').keydown(function(event) {
    	if (event.keyCode === 13) {
    		event.preventDefault();
    		const content = $('#content').val();
    		if (content === '') {
    			alert('검색어를 입력해주세요.');
    		} else getBoard(page);
    		return;
    	}
    });
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>커뮤니티 게시판</h1>
<form>
	<select id="select">
		<option>선택</option>
		<option value="id">아이디</option>
		<option value="nickname">별명</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
	</select>
	<input type="text" id="content">
	<input type="button" value="검색하기" id="search">
</form>
<input type="button" value="글쓰기" id="write">
<table id="boardlist">
<tr id="photo1"></tr>
<tr id="title1"></tr>
<tr id="visit1"></tr>
<tr id="photo2"></tr>
<tr id="title2"></tr>
<tr id="visit2"></tr>
<tr id="paging"></tr>
</table>
</body>
</html>