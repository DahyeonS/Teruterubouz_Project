<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
function dataLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/data',
        dataType: 'json',
        success: function(data) {
        	let tr = '';
        	for (let i=0; i<data.length; i++) {
        		tr += '<tr><td>' + data[i]['id'] + '</td><td>' + data[i]['smoke'] + '</td></tr>';
        	}
        	$('tbody').html(tr);
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	dataLoad();
});
</script>
</head>
<body>
<h1>TEST</h1>
<table border="1">
<thead>
<tr>
<th>ID</th>
<th>흡연여부</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
</body>
</html>