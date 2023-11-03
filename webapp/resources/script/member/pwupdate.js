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
				alert('죄송합니다. 다시 시도해주세요.');
				return;
            } else {
				alert('비밀번호가 수정되었습니다.');
				location.href = 'update';
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
			alert('비밀번호를 변경할 수 없습니다.');
			return;
		} else pwUpdate();
	});
});