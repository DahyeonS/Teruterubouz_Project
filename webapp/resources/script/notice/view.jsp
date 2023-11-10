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
                
                let info = '<div class="d-flex justify-content-between"><p id="postdate" class="my-3">작성일자 ' + postdate + '</p>';
                if (updateDate !== null) info += '<p id="updatedate" class="my-3">수정일자 ' + updateDate + '</p>'
                info += '</div><div class="d-flex justify-content-end"><p class="mb-1">조회수 ' + visitCount + '</p></div>';
                
                $('title').html(title);
                $('#title').html('<h3>'+ title +'</h3>');
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
                    alert('게시글이 삭제되었습니다.');
                    location.href = 'list'
                } else {
                    alert('죄송합니다. 다시 시도해주세요.');
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
        const input = confirm('게시글을 삭제하겠습니까?');
        if (input) deleteBoard(num);
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