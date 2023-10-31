<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<%@include file="loginCheck.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function pwCheck(pw) {
	const param = {pw};
	$.ajax({
        type: 'POST',
        url: '../memberApi/pwCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
        	if (data['rs'] === 0) alert('비밀번호가 맞지 않습니다.');
        	else {
        		location.href = 'update';
        	}
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
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<form>
<table>
<tr>
<th>비밀번호를 입력하세요</th>
</tr>
<tr>
<td><input type="password" id="pw"></td>
</tr>
<tr>
<td colspan="2"><input type="button" value="다음" id="submit"></td>
</tr>
</table>
</form>
</body>
</html>