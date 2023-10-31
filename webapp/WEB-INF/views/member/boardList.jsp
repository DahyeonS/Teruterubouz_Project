<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성글 목록</title>
<%@include file="loginCheck.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function pagingBoard(param) {
	$.ajax({
        type: 'POST',
        url: '../memberApi/pagingBoard',
        dataType: 'json',
        data: param,
        success: function(data) {
        	const {blockNum, endPage, isBNext, isBPrev, isNext, isPrev, listNum, pageNum, startPage, totalCount, totalPage} = data;
        	let tr = '<tr><td colspan="5">';
			if(isPrev) tr += '<a href="#" onclick="getBoard('+ (pageNum - 1) + ', ' + param['limit'] + ');">[<]</a>';
            if(isBPrev) tr += '<a href="#" onclick="getBoard('+ (startPage - 1) + ', ' + param['limit'] + ');">[<<]</a>';
			for(let i=startPage; i<=endPage; i++) {
				if(i === pageNum) tr += '<span style="color:red;">['+ i + ']</span>';
				else tr += '<a href="#" onclick="getBoard(' + i + ', ' + param['limit'] + ');">['+ i +']</a>';
			};
			if(isNext) tr += '<a href="#" onclick="getBoard(' + (pageNum + 1) + ', ' + param['limit'] + ');">[>]</a>';
			if(isBNext) tr += '<a href="#" onclick="getBoard(' + (endPage + 1) + ', ' + param['limit'] + ');">[>>]</a></td></tr>';
            $('#paging').html(tr);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

function getBoard(page, limit) {
	let title, content;
	if ($('#select').val() === 'title') {
		title = $('#content').val();
	} else if ($('#select').val() === 'content') {
		content = $('#content').val();
	}
	
	const param = {page, limit, title, content};
	$.ajax({
        type: 'POST',
        url: '../memberApi/boardList',
        dataType: 'json',
        data: param,
        success: function(data) {
            let tr = '';
            if (data['rs'] === 0) {
            	alert('조회되는 게시글이 없습니다.');
            	return;
            } else {
	            for (let i=0; i<data['rs'].length; i++) {
	            	if (data['rs'][i]['num'] !== 0) $('#noboard').hide();
	            	$('#board').show();
	                const {num, title, visitCount, postdate} = data['rs'][i];
	                tr += '<tr style="text-align: center;"><td class="num">' + num + '</td><td class="title"><a href="#" onclick="loginCheck(' + num + ');">'
	                	+ title + '</a></td><td class="count">' + visitCount + '</td><td class="date">' + postdate + '</td>'
	                	+ '<td class="control"><a href="#" onclick="deleteCheck(' + num + ');" id="delete">삭제</td></tr>';
	            }
            }
            $('#tbody').html(tr);
            pagingBoard(param);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

function deleteBoard(param) {
    $.ajax({
        type: 'POST',
        url: '../memberApi/deleteBoard',
        dataType: 'json',
        data: param,
        success: function(data) {
            if(data['rs'] === 1) {
                alert('게시글이 삭제되었습니다.');
                location.reload();
            } else alert('죄송합니다. 다시 시도해주세요.');
        }, error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

function loginCheck(num) {
	if ('${id}' === '') {
		alert('세션이 만료되었습니다.')
		$('a').attr('href', 'login');
	} else location.href = '../board/view?num=' + num;
};

function deleteCheck(num) {
	const input = confirm('해당 게시글을 삭제합니까?');
	if (input) {
		const param = {num};
		deleteBoard(param);
	} else return;
};

$(function() {
	$('#board').hide();
	const sPage = '${param.page}'
	let page = 1;
	if (sPage !== '') page = sPage;
	let limit = 10;
	getBoard(page, limit);
	
	$('#limit').change(function() {
		limit = $('#limit option:selected').val();
		getBoard(page, limit);
	});
	
	$('#search').click(function() {
		const content = $('#content').val();
		if (content === '') {
			alert('검색어를 입력해주세요.');
		} else getBoard(page, limit);
	});
	
	$('#content').keydown(function(event) {
    	if (event.keyCode === 13) {
    		event.preventDefault();
    		const content = $('#content').val();
    		if (content === '') {
    			alert('검색어를 입력해주세요.');
    		} else getBoard(page, limit);
    		return;
    	}
    });
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>작성글 목록</h1>
<h2 id="noboard">작성글이 없습니다.</h2>
	<form id="board">
		<div>
			<div>
				<div class="search">
					<select id="select">
						<option>선택</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<select id="limit">
						<option value="10" selected="selected">10개</option>
						<option value="30">30개</option>
						<option value="50">50개</option>
					</select>
					<input type="text" id="content">
					<input type="button" value="검색하기" id="search">
				</div>
			</div>
			<table border="1">
				<thead>
					<tr>
						<th class="num">번호</th>
						<th class="title">제목</th>
						<th class="count">조회수</th>
						<th class="date">작성일</th>
						<th class="control">&nbsp</th>
					</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
				<tbody id="paging">
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>