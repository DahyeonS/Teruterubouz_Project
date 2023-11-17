<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function nickCheck(nickname) {
        const param = {nickname};
        $.ajax({
            type: 'POST',
            url: '../memberApi/nickCheck',
            data: param,
            dataType: 'json',
            success: function(data) {
                if(data['rs'] === 1) {
                    if(param['nickname'] === '${nickname}') {
                        $('#nicksuccess').hide();
                        $('#nickfail').hide();
                        $('#nickequal').show();
                        $('#submit').removeAttr("disabled");
                    } else {
                        $('#nicksuccess').hide();
                        $('#nickequal').hide();
                        $('#nickfail').show();
                        $('#submit').attr('disabled', 'disabled');
                    }
                } else {
                    $('#nickfail').hide();
                    $('#nickequal').hide();
                    $('#nicksuccess').show();
                    $('#submit').removeAttr("disabled");
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };

    function deleteCheck() {
        Swal.fire({
                text: '회원을 탈퇴할까요?',
                icon: 'question',
                showDenyButton: true,
                confirmButtonColor: '#4faaff',
                confirmButtonText: '예',
                denyButtonText: '아니오',
                denyButtonColor: '#ff4f4f'
            }).then(result => {
                if (result.isConfirmed) location.href = 'delete';
                else return;
            });
    }

    function update() {
        const id = $('#id').val();;
        const nickname = $('#nickname').val();
        const param = {id, nickname};
        $.ajax({
            type: 'POST',
            url: '../memberApi/update',
            data: param,
            dataType: 'json',
            success: function(data) {
                if(data['rs'] === 0) {
                    Swal.fire({
                        title: '오류',
                        text: '죄송합니다. 다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    });
                } else {
                    Swal.fire({
                        title: '회원정보 수정',
                        text: '회원정보가 수정되었습니다.',
                        icon: 'success',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    }).then(result => {
                        if (result.isConfirmed) location.reload();
                    });
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };

    $(function() {
        $('#nicksuccess').hide();
        $('#nickfail').hide();
        $('#nickequal').hide();
        $('#nicklong').hide();
        
        $('#nickname').keyup(function() {
            const nickname = $('#nickname').val();
            if (/^[ㄱ-ㅎ|가-힣]+$/.test(nickname) && nickname.length > 15) {
                $('#nicklong').show();
                $('#nickcheck').attr('disabled', 'disabled');
            } else {
                $('#nicklong').hide();
                $('#nickcheck').removeAttr("disabled");
            }
        });
        
        $('#submit').click(function() {
            Swal.fire({
                title: '회원정보 수정',
                text: '회원정보를 수정하겠습니까?',
                icon: 'question',
                showDenyButton: true,
                confirmButtonColor: '#4faaff',
                confirmButtonText: '예',
                denyButtonText: '아니오',
                denyButtonColor: '#ff4f4f'
            }).then(result => {
                if (result.isConfirmed) update();
                else return;
            });
        });

        $('#nickcheck').click(function() {
            event.preventDefault();
            const nickname = $('#nickname').val();
            if(nickname === '') {
                Swal.fire({
                    text: '별명을 입력해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인',
                    script: $('#nickname').focus()
                });
            } else nickCheck(nickname);
        });
    });
</script>