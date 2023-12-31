<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var title, content;
	
	function pagingBoard(params) {
		$.ajax({
			type: 'POST',
			url: '../noticeApi/pagingBoard',
			dataType: 'json',
			data: params,
			success: function(data) {
				const {endPage, isBNext, isBPrev, isNext, isPrev, pageNum, startPage} = data;
				let li = '';
				if(isBPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard('+ (startPage - 1) + ', ' + params['limit'] + ');">처음</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">처음</span></li>';
				if(isPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard('+ (pageNum - 1) + ', ' + params['limit'] + ');">이전</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">이전</span></li>';
				for(let i=startPage; i<=endPage; i++) {
					if(i === pageNum) li += '<li class="page-item active"><span class="page-link">'+ i + '</span></li>';
					else li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + i + ', ' + params['limit'] + ');">'+ i +'</a></li>';
				};
				if(isNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + (pageNum + 1) + ', ' + params['limit'] + ');">다음</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">다음</span></li>';
				if(isBNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + (endPage + 1) + ', ' + params['limit'] + ');">마지막</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">마지막</span></li>';
				$('#paging').html(li);
			},
			error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	
	function getBoard(page, limit) {
		const params = {page, limit, title, content};
		$.ajax({
			type: 'POST',
			url: '../noticeApi/boardList',
			dataType: 'json',
			data: params,
			success: function(data) {
				let tr = '';
				if (data['rs'] === 0) {
					Swal.fire({
						text: '조회되는 게시글이 없습니다.',
						icon: 'info',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
					return;
				} else {
					for (let i=0; i<data['rs'].length; i++) {
						if (data['rs'][i]['num'] !== 0) $('#noboard').hide();
						$('#board').show();
						const {num, title, visitCount, postdate} = data['rs'][i];
						tr += '<tr><th scope="row">' + num + '</th><td id="title"><a href="view?num=' + num + '" class="text-dark">';
						if (title.length > 15) tr += title.substring(0, 15) + '…</a></td><td>';
						else tr += title + '</a></td><td>';
						tr += visitCount + '</td><td>' + postdate + '</td>';
						if ('${grade}' === 'ADMIN') tr += '<td><a href="#" onclick="deleteCheck(' + num + ');" id="delete">삭제</td>';
						tr += '</tr>';
					}
				}
				$('#tbody').html(tr);
				pagingBoard(params);
				return search;
			},
			error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	
	function deleteBoard(param) {
		$.ajax({
			type: 'POST',
			url: '../noticeApi/delete',
			dataType: 'json',
			data: param,
			success: function(data) {
				if(data['rs'] === 1) {
					Swal.fire({
						text: '게시글이 삭제되었습니다.',
						icon: 'success',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					}).then(result => {
						if (result.isConfirmed) location.reload();
					});
				} else {
					Swal.fire({
						title: '오류',
						text: '죄송합니다. 다시 시도해주세요.',
						icon: 'error',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
				}
			}, error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	
	function deleteCheck(num) {
		Swal.fire({
			text: '해당 게시글을 삭제합니까?',
			icon: 'question',
			showDenyButton: true,
			confirmButtonColor: '#4faaff',
			confirmButtonText: '예',
			denyButtonText: '아니오',
			denyButtonColor: '#ff4f4f'
		}).then(result => {
			if (result.isConfirmed) {
				const param = {num};
				deleteBoard(param);
			} else return;
		});
	};
	
	$(function() {
		$('#board').hide();
	
		let limit = 10;
		getBoard(1, limit);
		
		$('#limit').change(function() {
			limit = parseInt($('#limit option:selected').val());
			getBoard(1, limit);
		});
		
		$('#select').change(function() {
			title = undefined;
			content = undefined;
		});

		$('#write').click(function() {
			location.href = 'write';
		});
	
		$('#search').click(function() {
			const word = $('#content').val();
			if ($('#select').val() === '선택') {
				Swal.fire({
					text: '검색 종류를 선택해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
				return;
			}
			if (word === '') {
				Swal.fire({
					text: '검색어를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
				return;
			} else {
				if ($('#select').val() === 'title') title = $('#content').val();
				else if ($('#select').val() === 'content') content = $('#content').val();
				getBoard(1, limit);
			}
		});
		
		$('#content').keydown(function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				if ($('#select').val() === '선택') {
					Swal.fire({
						text: '검색 종류를 선택해주세요.',
						icon: 'info',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
					return;
				}
				const word = $('#content').val();
				if (word === '') {
					Swal.fire({
						text: '검색어를 입력해주세요.',
						icon: 'info',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
					return;
				} else {
					if ($('#select').val() === 'title') title = $('#content').val();
					else if ($('#select').val() === 'content') content = $('#content').val();
					getBoard(1, limit);
				}
			}
		});
	});
</script>