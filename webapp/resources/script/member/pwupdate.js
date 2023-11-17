function pwUpdate() {
    const pw = $('#pw').val();
    const param = {pw};
    $.ajax({
        type: 'POST',
        url: '../memberApi/pwUpdate',
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
					title: '비밀번호 수정',
					text: '비밀번호가 수정되었습니다.',
					icon: 'success',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				}).then(result => {
					if (result.isConfirmed) location.href = 'update';
				});
            }
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

$(function() {
	$('#pwsuccess').hide();
	$('#pwfail').hide();
	
	$('#pw2').keyup(function() {
		if ($('#pw').val() !== $('#pw2').val()) {
			$('#pwsuccess').hide();
			$('#pwfail').show();
			$('#submit').attr('disabled', 'disabled');
		}
		else {
			$('#pwfail').hide();
			$('#pwsuccess').show();
			$('#submit').removeAttr("disabled");
		}
	});
	
	$('#submit').click(function() {
		const pw = $('#pw').val();
        const pw2 = $('#pw2').val();
		if (pw !== pw2) {
			Swal.fire({
				title: '오류',
				text: '비밀번호를 변경할 수 없습니다.',
				icon: 'error',
				confirmButtonColor: '#4faaff',
				confirmButtonText: '확인'
			});
		} else pwUpdate();
	});
});