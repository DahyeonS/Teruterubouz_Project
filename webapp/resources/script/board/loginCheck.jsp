<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if ('${id}' === '') {
		Swal.fire({
			text: '로그인이 필요한 서비스입니다.',
			icon: 'info',
			confirmButtonColor: '#4faaff',
			confirmButtonText: '확인'
		}).then(result => {
			if (result.isConfirmed) location.href = "../member/login";
		});
	}
</script>