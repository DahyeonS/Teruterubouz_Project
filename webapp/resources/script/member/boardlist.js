function pagingBoard(params) {
	$.ajax({
		type: 'POST',
		url: '../memberApi/pagingBoard',
		dataType: 'json',
		data: params,
		success: function(data) {
			const {blockNum, endPage, isBNext, isBPrev, isNext, isPrev, listNum, pageNum, startPage, totalCount, totalPage} = data;
			let tr = '<tr><td colspan="5">';
			if(isPrev) tr += '<a href="#" onclick="getBoard('+ (pageNum - 1) + ', ' + params['limit'] + ');">[<]</a>';
			if(isBPrev) tr += '<a href="#" onclick="getBoard('+ (startPage - 1) + ', ' + params['limit'] + ');">[<<]</a>';
			for(let i=startPage; i<=endPage; i++) {
				if(i === pageNum) tr += '<span style="color:red;">['+ i + ']</span>';
				else tr += '<a href="#" onclick="getBoard(' + i + ', ' + params['limit'] + ');">['+ i +']</a>';
			};
			if(isNext) tr += '<a href="#" onclick="getBoard(' + (pageNum + 1) + ', ' + params['limit'] + ');">[>]</a>';
			if(isBNext) tr += '<a href="#" onclick="getBoard(' + (endPage + 1) + ', ' + params['limit'] + ');">[>>]</a>';
			tr += '</td></tr>';
            $('#paging').html(tr);
        },
        error: function(xhr, status, error) {
			console.log(xhr, status, error);
        }
    });
};

function getBoard(page, limit) {
	let title, content;
	if ($('#select').val() === 'title') title = $('#content').val();
	else if ($('#select').val() === 'content') content = $('#content').val();
	
	const params = {page, limit, title, content};
	$.ajax({
		type: 'POST',
        url: '../memberApi/boardList',
        dataType: 'json',
        data: params,
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
			pagingBoard(params);
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
	} else window.open('../board/view?num=' + num);
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
	let limit = 10;
	getBoard(1, limit);
	
	$('#limit').change(function() {
		limit = $('#limit option:selected').val();
		getBoard(1, limit);
	});
	
	$('#search').click(function() {
		const content = $('#content').val();
		if ($('#select').val() === '선택') {
			alert('검색 종류를 선택해주세요.');
			return;
		}
		if (content === '') {
			alert('검색어를 입력해주세요.');
			return;
		} else getBoard(1, limit);
	});
	
	$('#content').keydown(function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			if ($('#select').val() === '선택') {
				alert('검색 종류를 선택해주세요.');
				return;
			}
			const content = $('#content').val();
			if (content === '') {
				alert('검색어를 입력해주세요.');
				return;
			} else getBoard(1, limit);
			return;
		}
    });
});