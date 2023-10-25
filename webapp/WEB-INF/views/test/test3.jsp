<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="https://d3js.org/d3.v7.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/billboard.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billboard.css">
<script>
function dataLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp/rf',
        dataType: 'json',
        success: function(data) {
        	let avg = ["평균기온(°C)"];
        	let max = ["최고기온(°C)"];
        	let min = ["최저기온(°C)"];
        	for (item of data) {
        		console.log(item);
        		avg.push(item['avg']);
        		max.push(item['max']);
        		min.push(item['min']);
        	}
        	chart = bb.generate({
    		    bindto: "#chart",
    		    data: {
    		        type: "line",
    		        columns: [avg, max, min],
    		        colors: {
    		        	"최고기온(°C)": "#ff0000",
    		        	"평균기온(°C)": "#00ff00",
    		        	"최저기온(°C)": "#0000ff"
    		          }
    		    },
    		    axis: {
    		    	x: {
    		    		type: "category",
    		    		categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    		    	}
    		    }
    		});
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function rfLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp/rf',
        dataType: 'json',
        success: function(data) {
        	let avg = ["평균기온(°C)"];
        	let max = ["최고기온(°C)"];
        	let min = ["최저기온(°C)"];
        	for (item of data) {
        		console.log(item);
        		avg.push(item['avg']);
        		max.push(item['max']);
        		min.push(item['min']);
        	}
    		chart.load({
    			columns: [avg, max, min]
    		});
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function svmLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp/svm',
        dataType: 'json',
        success: function(data) {
        	let avg = ["평균기온(°C)"];
        	let max = ["최고기온(°C)"];
        	let min = ["최저기온(°C)"];
        	for (item of data) {
        		console.log(item);
        		avg.push(item['avg']);
        		max.push(item['max']);
        		min.push(item['min']);
        	}
    		chart.load({
    			columns: [avg, max, min]
    		});
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	let chart;
	dataLoad();
	$('input[name="model"]').on('change', function() {
		if (this.value == 1) rfLoad();
		else svmLoad();
	});
});
</script>
</head>
<body>
<h1>TEST</h1>
<input type="radio" checked="checked" name="model" value="1"> 모델 1
<input type="radio" name="model" value="2"> 모델 2
<div id="chart"></div>
</body>
</html>