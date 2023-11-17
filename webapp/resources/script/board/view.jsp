<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function getBoard(num, writer) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/getBoard',
            dataType: 'json',
            data: param,
            success: function(data) {
                const {num, id, nickname, title, content, province, city, district, fileId, fileName, postdate, updateDate, visitCount} = data;
                
                let region = '';
                const cities = ['서울', '인천', '대전', '세종', '광주', '대구', '울산', '부산'];
                if (cities.indexOf(province) === -1) region += '<a id="province" href="list?province=' + province +  '">' + province + '</a> ';
                
                region += '<a href="list?province=' + province + '&city=' + city + '">' + city + '</a>';
                if (province !== '세종') region += ' <a id="district" href="list?province=' + province + '&city=' + city + '&district=' + district + '">' + district + '</a>';
                
                let info = '<div class="d-flex justify-content-between"><p id="postdate" class="fst-italic my-3">작성일자 ' + postdate + '</p>';
                if (updateDate !== null) info += '<p id="updatedate" class="fst-italic my-3">수정일자 ' + updateDate + '</p>'
                info += '</div><div class="d-flex justify-content-between"><p class="fw-bold mb-1">' + nickname + '(' + id + ')</p><p class="mb-1">조회수 ' + visitCount + '</p></div>';
                
                let image = '';
                let filelist = ''
                if (fileId === '') {
                    $('#image').hide;
                    $('#filelist').hide;
                }
                else {
                    filelist += '<ul class="list-group">';
                    for (let i=0; i<fileId.split(', ').length; i++) {
                        const newFileId = encodeURIComponent(fileId.split(', ')[i]);
                        image += '<img src="../resources/uploads/' + newFileId + '" style="width: 70%; height: auto;"/><br>';
                        filelist += '<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">'
                            + '<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/><path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 '
                            + '2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>'
                            + '</svg><a class="mx-2" href="download?fileId=' + newFileId + '&fileName=' + fileName.split(',')[i] + '">' + fileName.split(',')[i] + '</a></li>'
                    }
                    filelist += '</ul>';
                }
                
                let control = '';
                if (id == '${id}' || '${grade}' === 'ADMIN') {
                    control += '<input class="btn btn-info text-white mx-2" type="button" value="수정하기" id="update" onclick="updateLink(' + num + ');">'
                    + '<input class="btn btn-info text-white" type="button" value="삭제하기" id="delete" onclick="deleteConfirm(' + num + ')">';
                }
                
                $('title').html(title);
                $('#title').html('<h3 class="fw-bold">'+ title +'</h3>');
                $('#region').html(region);
                $('#info').html(info);
                $('#image').html(image);
                $('#filelist').html(filelist);
                $('#content').html(content);
                $('#control').html(control);
                
                if (id === 'admin') {
                    $('#title > h3').attr('class', 'fw-bold text-danger');
                    $('#content').attr('class', 'fw-bold');
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function getReply(postNum, page) {
        event.preventDefault();
        const params = {postNum, page};
        $.ajax({
            type: 'POST',
            url: '../boardApi/getReply',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    let string = '';
                    for (item of data['rs']) {
                        if ('${nickname}' === item['nickname'] || '${grade}' === 'ADMIN') {
                            string += '<div id="rnickname" class="col-lg-3">' + item['nickname'] + '님</div><div id="rcontent" class="col-lg-5">' + item['content']
                                + '</div><div id="rpostdate" class="col-lg-3">' + item['postdate']
                                    + '</div><div id="rdelete" class="col-lg-1"><a href="#" onclick="deleteReplyConfirm(' + item['num'] + ')">삭제</a></div><hr class="mt-3">';
                        } else {
                            string += '<div id="rnickname" class="col-lg-3">' + item['nickname'] + '님</div><div id="rcontent" class="col-lg-5">' + item['content']
                                + '</div><div id="rpostdate" class="col-lg-4">' + item['postdate'] + '</div><hr class="mt-3">';
                        }
                    }
                    string += '<div id="paging" class="pagination justify-content-center mt-2"></div>';
                    $('#replylist' + postNum).html(string);
                    pagingReply(params);
                    $('section').show();
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function pagingReply(params) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/pagingReply',
            dataType: 'json',
            data: params,
            success: function(data) {
            const {totalCount, endPage, isBNext, isBPrev, isNext, isPrev, pageNum, startPage} = data;

			let li = '';
			if(isBPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(${param.num} ,' + (startPage - 1) + ');">처음</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">처음</span></li>';
			if(isPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(${param.num} ,'+ (pageNum - 1) + ');">이전</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">이전</span></li>';
			for(let i=startPage; i<=endPage; i++) {
				if(i === pageNum) li += '<li class="page-item active"><span class="page-link">'+ i + '</span></li>';
				else li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(${param.num} ,' + i + ');">'+ i +'</a></li>';
			};
			if(isNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(${param.num} ,' + (pageNum + 1) + ');">다음</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">다음</span></li>';
			if(isBNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getReply(${param.num} ,' + (endPage + 1) + ');">마지막</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">마지막</span></li>';
            $('#paging').html(li);

            let string = '댓글 ' + totalCount + '개';
            $('#count').html(string);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function deleteBoard(num) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/delete',
            dataType: 'json',
            data: param,
            success: function(data) {
                if (data['rs'] !== 0) {
                    Swal.fire({
						text: '게시글이 삭제되었습니다.',
						icon: 'success',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					}).then(result => {
						if (result.isConfirmed) location.href = 'list'
					});
                } else {
					Swal.fire({
						title: '오류',
						text: '죄송합니다. 다시 시도해주세요.',
						icon: 'error',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
                    return;
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function writeReply(postNum) {
        const id = '${id}';
        const nickname = '${nickname}';
        const content = $('#reply' + ${param.num}).val();
        
        if (content === '') {
            Swal.fire({
                text: '내용을 입력하세요.',
                icon: 'info',
                confirmButtonColor: '#4faaff',
                confirmButtonText: '확인'
			});
        } else {
            const params = {id, postNum, nickname, content};
            console.log(params);
            $.ajax({
                type: 'POST',
                url: '../boardApi/reply',
                dataType: 'json',
                data: params,
                success: function(data) {
                    if(data['rs'] !== 0) {
                        Swal.fire({
                            text: '댓글이 작성되었습니다.',
                            icon: 'success',
                            confirmButtonColor: '#4faaff',
                            confirmButtonText: '확인'
                        }).then(result => {
                            if (result.isConfirmed) location.reload();
                        });
                    } else {
                        Swal.fire({
                            title: '오류',
                            text: '다시 시도해주세요.',
                            icon: 'error',
                            confirmButtonColor: '#4faaff',
                            confirmButtonText: '확인'
                        });
                        return;
                    }
                },
                error: function(xhr, status, error) {
                    console.log(xhr, status, error);
                }
            });
        }
    };
    
    function deleteReply(num) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/deleteReply',
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
                    return;
                }
            }, error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function updateLink(num) {
        location.href = 'write?update=' + num;
    }
    
    function deleteConfirm(num) {
        Swal.fire({
			text: '게시글을 삭제하겠습니까?',
			icon: 'question',
			showDenyButton: true,
			confirmButtonColor: '#4faaff',
			confirmButtonText: '예',
			denyButtonText: '아니오',
			denyButtonColor: '#ff4f4f'
		}).then(result => {
			if (result.isConfirmed) deleteBoard(num);
            else return;
		});
    }
    
    function deleteReplyConfirm(num) {
        Swal.fire({
            text: '해당 댓글을 삭제합니까?',
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#4faaff',
            confirmButtonText: '예',
            denyButtonText: '아니오',
            denyButtonColor: '#ff4f4f'
        }).then(result => {
            if (result.isConfirmed) deleteReply(num);
            else return;
        });
    };
    
    $(function() {
        $('section').hide();
        
        let page = 1;
        const sPage = '${param.page}';
        if (sPage !== '') page = parseInt(sPage);
        
        getBoard(${param.num});
        getReply(${param.num}, page);
        
        $('#write').click(function() {
            location.href = 'write';
        });
        
        $('#list').click(function() {
            location.href = 'list';
        });
    });
</script>