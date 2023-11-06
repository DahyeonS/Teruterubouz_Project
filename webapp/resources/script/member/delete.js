function deleteMember(pw) {
	const param = {pw};
	$.ajax({
        type: 'POST',
        url: '../memberApi/delete',
        dataType: 'json',
        data: param,
        success: function(data) {
			if (data['rs'] === 0) {
				alert("비밀번호를 다시 확인해주세요.");
				return;
			} else {
				alert("<회원 탈퇴 완료> 그동안 감사했습니다.");
				location.href = "../";
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
			alert('비밀번호를 입력해주세요.');
			return;
		} else deleteMember(pw);
	});
	$('#pw').keydown(function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
    });
});