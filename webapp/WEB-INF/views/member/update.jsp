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
function nickCheck(nickname) {
    const param = {nickname};
    $.ajax({
        type: 'POST',
        url: '../memberApi/nickCheck',
        data: param,
        dataType: 'json',
        success: function(data) {
            if(data['rs'] === 1) {
            	if(param['nickname'] === '${nickname}') {
                	$('#nicksuccess').hide();
                	$('#nickfail').hide();
                	$('#nickequal').show();
                	$('#submit').removeAttr("disabled");
            	} else {
	                $('#nicksuccess').hide();
	                $('#nickequal').hide();
	                $('#nickfail').show();
	                $('#submit').attr('disabled', 'disabled');
            	}
            } else {
                $('#nickfail').hide();
                $('#nickequal').hide();
                $('#nicksuccess').show();
                $('#submit').removeAttr("disabled");
            }
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

function deleteCheck() {
	const check = confirm('회원을 탈퇴할까요?');
	if (check) location.href = 'delete';
	else return;
}

function update() {
	const id = '${id}';
    const nickname = $('#nickname').val();
    const param = {id, nickname};
    $.ajax({
        type: 'POST',
        url: '../memberApi/update',
        data: param,
        dataType: 'json',
        success: function(data) {
            if(data['rs'] === 0) {
            	alert('죄송합니다. 다시 시도해주세요.');
            	return;
            } else {
            	alert('회원정보가 수정되었습니다.');
            	location.reload();
            }
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
};

$(function() {
    $('#nicksuccess').hide();
    $('#nickfail').hide();
    $('#nickequal').hide();
	$('#submit').click(function() {
		const input = confirm("회원정보를 수정하겠습니까?");
	    if (input) {
			update();
	   	}
	    else return;
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
});
</script>
</head>
<%@include file="../topmenu.jsp"%>
<body>
<h1>회원정보</h1>
<a href="pwUpdate">비밀번호 수정</a>
<br><br>
<form>
<table>
<tr>
<th>아이디</th>
<td><input type="text" id="id" value="${id}" readonly="readonly"></td>
</tr>
<tr>
<th>닉네임</th>
<td><input type="text" id="nickname" value="${nickname}">
<input id="nickcheck" type="button" value="중복확인"></td>
</tr>
<tr id="nicksuccess"><th></th><td>사용 가능한 닉네임입니다.</td></tr>
<tr id="nickfail"><th></th><td>사용 불가능한 닉네임입니다.</td></tr>
<tr id="nickequal"><th></th><td>이전 닉네임과 동일합니다.</td></tr>
<tr>
<td colspan="2"><input type="button" value="회원정보 수정" id="submit"></td>
</tr>
</table>
</form>
<br>
<a href="boardList">작성글 목록</a>
<br>
<br>
<a href="#" onclick="deleteCheck();">회원탈퇴</a>
</body>
</html>