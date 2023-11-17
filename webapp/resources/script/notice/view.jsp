<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function getBoard(num, writer) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../noticeApi/getBoard',
            dataType: 'json',
            data: param,
            success: function(data) {
                const {num, title, content, postdate, updateDate, visitCount} = data;
                
                let info = '<div class="d-flex justify-content-between"><p id="postdate" class="fst-italic my-3">작성일자 ' + postdate + '</p>';
                if (updateDate !== null) info += '<p id="updatedate" class="fst-italic my-3">수정일자 ' + updateDate + '</p>'
                info += '</div><div class="d-flex justify-content-end"><p class="mb-1">조회수 ' + visitCount + '</p></div>';
                
                $('title').html(title);
                $('#title').html('<h3 class="fw-bold">'+ title +'</h3>');
                $('#info').html(info);
                $('#content').html(content);
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
            url: '../noticeApi/delete',
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
    
    $(function() {
        let page = 1;
        const sPage = '${param.page}';
        if (sPage !== '') page = parseInt(sPage);
        
        getBoard(${param.num});
        
        $('#write').click(function() {
            location.href = 'write';
        });
        
        $('#list').click(function() {
            location.href = 'list';
        });
    });
</script>