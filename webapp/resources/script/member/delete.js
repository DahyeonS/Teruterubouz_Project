function deleteMember(pw) {
	const param = {pw};
	$.ajax({
        type: 'POST',
        url: '../memberApi/delete',
        dataType: 'json',
        data: param,
        success: function(data) {
			if (data['rs'] === 0) {
				Swal.fire({
					title: '오류',
					text: '비밀번호를 다시 확인해주세요.',
					icon: 'error',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
			} else {
				Swal.fire({
					title: '회원 탈퇴 완료',
					text: '그동안 감사했습니다.',
					icon: 'success',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				}).then(result => {
					if (result.isConfirmed) location.href = "../";
				});
			}
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
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
		} else deleteMember(pw);
	});
	$('#pw').keydown(function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
    });
});