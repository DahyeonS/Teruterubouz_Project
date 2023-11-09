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
        const check = confirm('회원을 탈퇴할까요?');
        if (check) location.href = 'delete';
        else return;
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
                    alert('죄송합니다. 다시 시도해주세요.');
                    return;
                } else {
                    alert('회원정보가 수정되었습니다.');
                    location.reload();
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
            const input = confirm("회원정보를 수정하겠습니까?");
            if (input) update();
            else return;
        });

        $('#nickcheck').click(function() {
            event.preventDefault();
            const nickname = $('#nickname').val();
            if(nickname === '') {
                alert('닉네임을 입력해주세요.');
                $('#nickname').focus();
                return;
            }
            nickCheck(nickname);
        });
    });
</script>