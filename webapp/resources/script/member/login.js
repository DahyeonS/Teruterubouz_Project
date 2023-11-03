function login(id, pw) {
	const params = {id, pw};
	$.ajax({
        type: 'POST',
        url: '../memberApi/login',
        dataType: 'json',
        data: params,
        success: function(data) {
			if (data['rs'] === 0) {
				alert('ID 또는 비밀번호가 다릅니다.');
				return;
			}
			else {
				alert('환영합니다!');
				location.href = '../';
			}
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	$('#id').focus();
	$('#submit').click(function() {
        const id = $('#id').val();
		const pw = $('#pw').val();
		if (id === '') alert('아이디를 입력해주세요.');
		else if (pw === '') alert('비밀번호를 입력해주세요.');
		else login(id, pw);
    });
    $('#pw').keydown(function(event) {
		if (event.keyCode === 13) {
			const id = $('#id').val();
			const pw = $('#pw').val();
			if (id === '') alert('아이디를 입력해주세요.');
			else if (pw === '') alert('비밀번호를 입력해주세요.');
			else login(id, pw);
		}
    });
    $('#id').keydown(function(event) {
		if (event.keyCode === 13) {
			const id = $('#id').val();
			const pw = $('#pw').val();
			if (id === '') alert('아이디를 입력해주세요.');
			else if (pw === '') alert('비밀번호를 입력해주세요.');
			else login(id, pw);
		}
    });
});