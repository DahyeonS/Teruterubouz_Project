<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function idCheck(id) {
	const param = {id};
	$.ajax({
        type: 'POST',
        url: '../memberApi/idCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
        	if (data['rs'] === 1) {
        		$('#idsuccess').hide();
        		$('#idfail').show();
        		$('#submit').attr('disabled', 'disabled');
        	} else {
        		$('#idsuccess').show();
        		$('#idfail').hide();
        		$('#submit').removeAttr("disabled");
        	}
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function nickCheck(nickname) {
	const param = {nickname};
	$.ajax({
        type: 'POST',
        url: '../memberApi/nickCheck',
        dataType: 'json',
        data: param,
        success: function(data) {
        	if (data['rs'] === 1) {
        		$('#nicksuccess').hide();
        		$('#nickfail').show();
        		$('#submit').attr('disabled', 'disabled');
        	} else {
        		$('#nicksuccess').show();
        		$('#nickfail').hide();
        		$('#submit').removeAttr("disabled");
        	}
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function join(params) {
	$.ajax({
        type: 'POST',
        url: '../memberApi/join',
        dataType: 'json',
        data: params,
        success: function(data) {
        	if (data['rs'] === 0) {
        		alert('죄송합니다. 다시 시도해주세요.');
        	} else {
        		alert('회원가입을 축하드립니다!');
        		location.href = 'login';
        	}
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	$('#idsuccess').hide();
	$('#idfail').hide();
	$('#pwsuccess').hide();
	$('#pwfail').hide();
	$('#nicksuccess').hide();
	$('#nickfail').hide();
	
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
	
	$('#idcheck').click(function() {
        const id = $('#id').val();
        if(id === '') {
            alert('아이디를 입력해주세요.');
            $('#id').focus();
            return;
        } else if (/^[ㄱ-ㅎ|가-힣]+$/.test(id)) {
        	alert('아이디는 한글을 사용할 수 없습니다.');
            $('#id').focus();
        	return;
        }
        idCheck(id);
	});
	
	$('#nickcheck').click(function() {
        const nickname = $('#nickname').val();
        if(nickname === '') {
            alert('닉네임을 입력해주세요.');
            $('#nickname').focus();
            return;
        }
        nickCheck(nickname);
    });
	
	$('#submit').click(function() {
        const id = $('#id').val();
        const pw = $('#pw').val();
        const pw2 = $('#pw2').val();
        const nickname = $('#nickname').val();
        if(id === '') {
            alert('아이디를 입력해주세요.');
            $('#id').focus();
            return;
        } else if (/^[ㄱ-ㅎ|가-힣]+$/.test(id)) {
            alert('아이디는 한글을 사용할 수 없습니다.');
            $('#id').focus();
            return;
        }
        if(pw === '') {
            alert('비밀번호를 입력해주세요.');
            $('#pw').focus();
            return;
        }
        if(pw2 === '') {
            alert('비밀번호 확인을 해주세요.');
            $('#pw2').focus();
            return;
        } else if (pw !== pw2) {
            alert('비밀번호가 일치하지 않습니다.');
            $('#pw2').focus();
            return;
        }
        if(nickname === '') {
            alert('닉네임을 입력해주세요.');
            $('#nickname').focus();
            return;
        }
        const params = {id, pw, nickname};
        join(params);
    });
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>회원가입</h1>

<form>
<table>
<tr>
<th>아이디</th>
<td><input type="text" id="id"></td>
<td><input type="button" id="idcheck" value="중복확인" style="margin-left: 20px"></td>
</tr>
<tr id="idfail">
<th>&nbsp</th>
<td>중복된 아이디입니다.</td>
</tr>
<tr id="idsuccess">
<th>&nbsp</th>
<td>사용할 수 있는 아이디입니다.</td>
</tr>
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
<th>닉네임</th>
<td><input type="text" id="nickname"></td>
<td><input type="button" id="nickcheck" value="중복확인" style="margin-left: 20px"></td>
</tr>
<tr id="nickfail">
<th>&nbsp</th>
<td>중복된 닉네임입니다.</td>
</tr>
<tr id="nicksuccess">
<th>&nbsp</th>
<td>사용할 수 있는 닉네임입니다.</td>
</tr>
<tr>
<th colspan="2">&nbsp</th>
<td><input type="button" value="가입하기" id="submit" style="margin-left: 20px"></td>
</tr>
</table>
</form>
</body>
</html>