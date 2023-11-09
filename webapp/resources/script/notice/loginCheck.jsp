<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if ('${id}' === '') {
		alert('세션이 만료되었습니다.');
		location.href = "../member/login";
	}
</script>