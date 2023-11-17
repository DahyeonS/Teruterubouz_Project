<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function loadBoard(num) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../noticeApi/load',
            dataType: 'json',
            data: param,
            success: function(data) {
                const {title, content} = data;
                $('#title').attr("value", title);
                $('#content').html(content);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }

    function write() {
        const title = $('#title').val();
        const content = $('#content').val();
        params = {title, content};
        $.ajax({
            type: 'POST',
            url: '../noticeApi/write',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    Swal.fire({
						text: '게시글이 작성되었습니다.',
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
    }

    function update(num) {
        const title = $('#title').val();
        const content = $('#content').val();
        params = {num, title, content};
        $.ajax({
            type: 'POST',
            url: '../noticeApi/update',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    Swal.fire({
                        text: '게시글이 수정되었습니다.',
                        icon: 'success',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    }).then(result => {
                        if (result.isConfirmed) location.href = 'view?num=${param.update}'
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
    }


    $(function() {
        if (${param.update != null}) {
            $('title').html('게시글 수정');
            loadBoard(${param.update});
        }
        
        $('#content').keyup(function (e) {
            if ($(this).val().length > 200) {
                $(this).val($(this).val().substring(0, 2000));
            };
        });
        
        $('#submit').click(function() {
            if ($('#title').val() === '') {
                Swal.fire({
					text: '제목을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            } else if ($('#content').val() === '') {
                Swal.fire({
					text: '내용을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            } else write();
        });
        
        $('#cancel').click(function() {
            history.back();
        });
        
        $('#update').click(function() {
            if ($('#title').val() === '') {
                Swal.fire({
					text: '제목을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            } else if ($('#content').val() === '') {
                Swal.fire({
					text: '내용을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            } else update(${param.update});
        });
    });
</script>