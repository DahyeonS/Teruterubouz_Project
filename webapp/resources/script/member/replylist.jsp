<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var content;
	
	function pagingReply(params) {
		$.ajax({
			type: 'POST',
			url: '../memberApi/pagingReply',
			dataType: 'json',
			data: params,
			success: function(data) {
				const {totalCount, endPage, isBNext, isBPrev, isNext, isPrev, pageNum, startPage} = data;
	
				let li = '';
				if(isBPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply('+ (startPage - 1) + ', ' + params['limit'] + ');">처음</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">처음</span></li>';
				if(isPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply('+ (pageNum - 1) + ', ' + params['limit'] + ');">이전</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">이전</span></li>';
				for(let i=startPage; i<=endPage; i++) {
					if(i === pageNum) li += '<li class="page-item active"><span class="page-link">'+ i + '</span></li>';
					else li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(' + i + ', ' + params['limit'] + ');">'+ i +'</a></li>';
				};
				if(isNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(' + (pageNum + 1) + ', ' + params['limit'] + ');">다음</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">다음</span></li>';
				if(isBNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(' + (endPage + 1) + ', ' + params['limit'] + ');">마지막</a></li>';
				else li += '<li class="page-item disabled"><span class="page-link">마지막</span></li>';
				$('#paging').html(li);
	
				let string = '작성댓글 총 ' + totalCount + '개';
				$('#count').html(string);
			},
			error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	
	function getReply(page, limit) {
		const params = {page, limit, content};
		$.ajax({
			type: 'POST',
			url: '../memberApi/replyList',
			dataType: 'json',
			data: params,
			success: function(data) {
				let tr = '';
				if (data['rs'] === 0) {
					Swal.fire({
						text: '조회되는 댓글이 없습니다.',
						icon: 'info',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
					return;
				} else {
					for (let i=0; i<data['rs'].length; i++) {
						if (data['rs'][i]['num'] !== 0) $('#noreply').hide();
						$('#reply').show();
						const {num, postNum, title, content, postdate} = data['rs'][i];
						tr += '<tr><th id="title" scope="row"><a href="#" onclick="loginCheck(' + postNum + ');" class="text-dark">';
						if (title.length > 15) tr += title.substring(0, 15) + '…';
						else tr += title;
						tr += '</a></th><td id="rcontent"><a href="#" onclick="loginCheck(' + postNum + ');" class="text-dark">';
						if (content.length > 15) tr += content.substring(0, 15) + '…';
						else tr += content;
						tr += '</td><td>' + postdate + '</td>' + '<td><a href="#" onclick="deleteCheck(' + num + ');" id="delete">삭제</td></tr>';
					}
				}
				$('#tbody').html(tr);
				pagingReply(params);
				return search;
			},
			error: function(xhr, status, error) {
				console.log(xhr, status, error);
			}
		});
	};
	
	function deleteReply(param) {
		$.ajax({
			type: 'POST',
			url: '../memberApi/deleteReply',
			dataType: 'json',
			data: param,
			success: function(data) {
				if(data['rs'] === 1) {
					Swal.fire({
						text: '댓글이 삭제되었습니다.',
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
	
	function loginCheck(num) {
		if ('${id}' === '') {
			Swal.fire({
				text: '세션이 만료되었습니다.',
				icon: 'info',
				confirmButtonColor: '#4faaff',
				confirmButtonText: '확인'
			}).then(result => {
				if (result.isConfirmed) $('a').attr('href', 'login');
			});
		} else window.open('../board/view?num=' + num);
	};
	
	function deleteCheck(num) {
		Swal.fire({
			text: '해당 댓글을 삭제합니까?',
			icon: 'question',
			showDenyButton: true,
			confirmButtonColor: '#4faaff',
			confirmButtonText: '예',
			denyButtonText: '아니오',
			denyButtonColor: '#ff4f4f'
		}).then(result => {
			if (result.isConfirmed) {
				const param = {num};
				deleteReply(param);
			} else return;
		});
	};
	
	$(function() {
		$('#reply').hide();
	
		let limit = 10;
		getReply(1, limit);
		
		$('#limit').change(function() {
			limit = parseInt($('#limit option:selected').val());
			getReply(1, limit);
		});
		
		$('#select').change(function() {
			title = undefined;
			content = undefined;
		});

		$('#search').click(function() {
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
				content = $('#content').val();
				getReply(1, limit);
			}
		});
		
		$('#content').keydown(function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
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
					content = $('#content').val();
					getReply(1, limit);
				}
			}
		});
	});
</script>
