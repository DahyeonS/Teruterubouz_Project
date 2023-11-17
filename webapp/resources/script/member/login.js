function login(id, pw) {
	const params = {id, pw};
	$.ajax({
		type: 'POST',
		url: '../memberApi/login',
		dataType: 'json',
		data: params,
		success: function(data) {
			if (data['rs'] === 0) {
				Swal.fire({
					title: '오류',
					text: 'ID 또는 비밀번호가 다릅니다.',
					icon: 'error',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#id').focus()
				});
			}
			else {
				Swal.fire({
					title: '로그인',
					text: '환영합니다!',
					icon: 'success',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				}).then(result => {
					if (result.isConfirmed) location.href = '../';
				});
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
		if (id === '') {
			Swal.fire({
				text: '아이디를 입력해주세요.',
				icon: 'info',
				confirmButtonColor: '#4faaff',
				confirmButtonText: '확인',
				script: $('#id').focus()
			});
		} else if (pw === '') {
			Swal.fire({
				text: '비밀번호를 입력해주세요.',
				icon: 'info',
				confirmButtonColor: '#4faaff',
				confirmButtonText: '확인',
				script: $('#pw').focus()
			});
		} else login(id, pw);
	});
	$('#pw').keydown(function(event) {
		if (event.keyCode === 13) {
			const id = $('#id').val();
			const pw = $('#pw').val();
			if (id === '') {
				Swal.fire({
					text: '아이디를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#id').focus()
				});
			} else if (pw === '') {
				Swal.fire({
					text: '비밀번호를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#pw').focus()
				});
			} else login(id, pw);
		}
	});
	$('#id').keydown(function(event) {
		if (event.keyCode === 13) {
			const id = $('#id').val();
			const pw = $('#pw').val();
			if (id === '') {
				Swal.fire({
					text: '아이디를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#id').focus()
				});
			} else if (pw === '') {
				Swal.fire({
					text: '비밀번호를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인',
					script: $('#pw').focus()
				});
			} else login(id, pw);
		}
	});
});