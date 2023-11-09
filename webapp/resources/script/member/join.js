function idCheck(id) {
	const param = {id};
	$.ajax({
        type: 'POST',
        url: '../memberApi/idCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
            if (data['rs'] === 1) {
                $('#id').attr('class', 'form-control is-invalid');
                $('#idsuccess').hide();
                $('#idfail').show();
                $('#submit').attr('disabled', 'disabled');
            } else {
                $('#id').attr('class', 'form-control');
                $('#idsuccess').show();
                $('#idfail').hide();
                $('#submit').removeAttr("disabled");
            }
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function nickCheck(nickname) {
	const param = {nickname};
	$.ajax({
        type: 'POST',
        url: '../memberApi/nickCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
            if (data['rs'] === 1) {
                $('#nickname').attr('class', 'form-control is-invalid');
                $('#nicksuccess').hide();
                $('#nickfail').show();
                $('#submit').attr('disabled', 'disabled');
            } else {
                $('#nickname').attr('class', 'form-control');
                $('#nicksuccess').show();
                $('#nickfail').hide();
                $('#submit').removeAttr("disabled");
            }
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function join(params) {
	$.ajax({
        type: 'POST',
        url: '../memberApi/join',
        dataType: 'json',
        data: params,
        success: function(data) {
            if (data['rs'] === 0) {
                alert('죄송합니다. 다시 시도해주세요.');
            } else {
                alert('회원가입을 축하드립니다!');
                location.href = 'login';
            }
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	$('#id').focus();

	$('#idsuccess').hide();
	$('#idfail').hide();
	$('#pwsuccess').hide();
	$('#pwfail').hide();
	$('#pwvoid').hide();
	$('#nicksuccess').hide();
	$('#nickfail').hide();
	$('#nicklong').hide();
	
	$('#pw').keyup(function() {
		if ($('#pw').val() !== $('#pw2').val()) {
            $('#pw').attr('class', 'form-control is-invalid');
            $('#pw2').attr('class', 'form-control is-invalid');
			$('#pwsuccess').hide();
			$('#pwvoid').hide();
			$('#pwfail').show();
			$('#submit').attr('disabled', 'disabled');
		} else if ($('#pw').val() === '') {
            $('#pw').attr('class', 'form-control is-invalid');
            $('#pw2').attr('class', 'form-control is-invalid');
			$('#pwsuccess').hide();
			$('#pwfail').hide();
			$('#pwvoid').show();
			$('#submit').attr('disabled', 'disabled');
        } else {
            $('#pw').attr('class', 'form-control');
            $('#pw2').attr('class', 'form-control');
			$('#pwfail').hide();
			$('#pwvoid').hide();
			$('#pwsuccess').show();
			$('#submit').removeAttr("disabled");
		}
	});

	$('#pw2').keyup(function() {
		if ($('#pw').val() !== $('#pw2').val()) {
            $('#pw').attr('class', 'form-control is-invalid');
            $('#pw2').attr('class', 'form-control is-invalid');
			$('#pwsuccess').hide();
			$('#pwvoid').hide();
			$('#pwfail').show();
			$('#submit').attr('disabled', 'disabled');
		} else if ($('#pw').val() === '') {
            $('#pw').attr('class', 'form-control is-invalid');
            $('#pw2').attr('class', 'form-control is-invalid');
			$('#pwsuccess').hide();
			$('#pwfail').hide();
			$('#pwvoid').show();
			$('#submit').attr('disabled', 'disabled');
        } else {
            $('#pw').attr('class', 'form-control');
            $('#pw2').attr('class', 'form-control');
			$('#pwfail').hide();
			$('#pwvoid').hide();
			$('#pwsuccess').show();
			$('#submit').removeAttr("disabled");
		}
	});
	
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

	$('#idcheck').click(function() {
        const id = $('#id').val();
        if(id === '') {
            alert('아이디를 입력해주세요.');
            $('#id').focus();
            return;
        } else if (/^[ㄱ-ㅎ|가-힣]+$/.test(id)) {
            alert('아이디는 한글을 사용할 수 없습니다.');
            $('#id').focus();
            return;
        }
        idCheck(id);
	});
	
	$('#nickcheck').click(function() {
        const nickname = $('#nickname').val();
        if(nickname === '') {
            alert('별명을 입력해주세요.');
            $('#nickname').focus();
            return;
        }
        nickCheck(nickname);
    });
	
	$('#submit').click(function() {
        const id = $('#id').val();
        const pw = $('#pw').val();
        const pw2 = $('#pw2').val();
        const nickname = $('#nickname').val();
        if(id === '') {
            alert('아이디를 입력해주세요.');
            $('#id').focus();
            return;
        } else if (/^[ㄱ-ㅎ|가-힣]+$/.test(id)) {
            alert('아이디는 한글을 사용할 수 없습니다.');
            $('#id').focus();
            return;
        }
        if(pw === '') {
            alert('비밀번호를 입력해주세요.');
            $('#pw').focus();
            return;
        }
        if(pw2 === '') {
            alert('비밀번호 확인을 해주세요.');
            $('#pw2').focus();
            return;
        } else if (pw !== pw2) {
            alert('비밀번호가 일치하지 않습니다.');
            $('#pw2').focus();
            return;
        }
        if(nickname === '') {
            alert('별명을 입력해주세요.');
            $('#nickname').focus();
            return;
        }
        const params = {id, pw, nickname};
        join(params);
    });
});