function pwCheck(pw) {
	const param = {pw};
	$.ajax({
        type: 'POST',
        url: '../memberApi/pwCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
			if (data['rs'] === 0) alert('비밀번호가 맞지 않습니다.');
			else location.href = 'update';
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
		if (pw === '') alert('비밀번호를 입력해주세요.');
		else pwCheck(pw);
    });
    $('#pw').keydown(function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			const pw = $('#pw').val();
			if (pw === '') alert('비밀번호를 입력해주세요.');
			else pwCheck(pw);
		}
    });
});