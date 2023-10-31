<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<%@include file="loginCheck.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function pwUpdate() {
	const id = '${id}';
    const pw = $('#pw').val();
    const param = {id, pw};
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
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>비밀번호 수정</h1>
<form>
<table>
<tr>
<th>비밀번호</th>
<td><input type="password" id="pw"></td>
</tr>
<tr>
<th>비밀번호 확인</th>
<td><input type="password" id="pw2"></td>
</tr>
<tr id="pwfail">
<th>&nbsp</th>
<td>비밀번호가 일치하지 않습니다.</td>
</tr>
<tr id="pwsuccess">
<th>&nbsp</th>
<td>비밀번호 확인이 완료되었습니다.</td>
</tr>
<tr>
<td colspan="2"><input type="button" value="수정하기" id="submit"></td>
</tr>
</table>
</form>
</body>
</html>