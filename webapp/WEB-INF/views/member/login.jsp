<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
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
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>로그인</h1>
<form>
<table>
<tr>
<th>아이디</th>
<td><input type="text" id="id"></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type="password" id="pw"></td>
</tr>
<tr>
<td colspan="2"><input type="button" value="로그인" id="submit"></td>
</tr>
</table>
</form>
<br>
<a href="./join">회원가입</a>
</body>
</html>