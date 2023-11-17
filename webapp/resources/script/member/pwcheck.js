function pwCheck(pw) {
	const param = {pw};
	$.ajax({
        type: 'POST',
        url: '../memberApi/pwCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
			if (data['rs'] === 0) {
				Swal.fire({
					text: '비밀번호가 맞지 않습니다.',
					icon: 'error',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#pw').focus()
				});
			} else location.href = 'update';
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	$('#pw').focus();
	$('#submit').click(function() {
		const pw = $('#pw').val();
		if (pw === '') {
			Swal.fire({
                text: '비밀번호를 입력해주세요.',
                icon: 'info',
                confirmButtonColor: '#4faaff',
                confirmButtonText: '확인',
                script: $('#pw').focus()
            });
		} else pwCheck(pw);
    });
    $('#pw').keydown(function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			const pw = $('#pw').val();
			if (pw === '') {
				Swal.fire({
					text: '비밀번호를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#pw').focus()
				});
			} else pwCheck(pw);
		}
    });
});