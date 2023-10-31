<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if (${id == null}) {
		alert('로그인이 필요한 서비스입니다.');
		location.href = "../member/login";
	}
</script>