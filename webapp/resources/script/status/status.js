function tempYearLoad() {
	$.ajax({
        type: 'GET',
        url: 'status/getTemp',
        dataType: 'json',
        success: function(data) {
			let avg = ["평균기온(°C)"];
			let max = ["평균최고기온(°C)"];
			let min = ["평균최저기온(°C)"];
			let year = [];
			for (item of data['rs']) {
				avg.push(item['avgTem']);
				max.push(item['maxTem']);
                min.push(item['minTem']);
            year.push(item['date']);
            }
            let chart = bb.generate({
                size : {
                    height: 700
                },
                title: {
                    text: "년도별 전국 기온 통계"
                },
                bindto: "#chart1",
                data: {
                    type: "line",
                    columns: [avg, max, min],
                    colors: {
                        "평균최고기온(°C)": "#ee5c52",
                        "평균기온(°C)": "#66d662",
                        "평균최저기온(°C)": "#618cdb"
                    }
                },
                axis: {
                x: {
                        type: "category",
                        categories: year,
                        height: 80
                    }
                },
                background: {
                    
                }
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function tempMonthLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균기온(°C)"];
            let max = ["평균최고기온(°C)"];
            let min = ["평균최저기온(°C)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                min.push(item['min']);
            }
            let chart = bb.generate({
                size : {
                    height: 700
                },
                title: {
                    text: "월별 전국 기온 통계"
                },
                bindto: "#chart2",
                data: {
                    type: "line",
                    columns: [avg, max, min],
                    colors: {
                        "평균최고기온(°C)": "#ee5c52",
                        "평균기온(°C)": "#66d662",
                        "평균최저기온(°C)": "#618cdb"
                    }
                },
                axis: {
                    x: {
                        type: "category",
                        categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                        height: 50
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function tempPreLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp/rf',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균기온(°C)"];
            let max = ["평균최고기온(°C)"];
            let min = ["평균최저기온(°C)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                min.push(item['min']);
            }
            chartTempPre = bb.generate({
                size : {
                    height: 700
                },
                title: {
                    text: "내년 전국 기온 예측"
                },
                bindto: "#chart3",
                data: {
                    type: "line",
                    columns: [avg, max, min],
                    colors: {
                        "평균최고기온(°C)": "#ee5c52",
                        "평균기온(°C)": "#66d662",
                        "평균최저기온(°C)": "#618cdb"
                    }
                },
                axis: {
                    x: {
                        type: "category",
                        categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                        height: 50
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function tempRfLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp/rf',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균기온(°C)"];
            let max = ["평균최고기온(°C)"];
            let min = ["평균최저기온(°C)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                min.push(item['min']);
            }
            chartTempPre.load({
                columns: [avg, max, min]
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function tempSvmLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/temp/svm',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균기온(°C)"];
            let max = ["평균최고기온(°C)"];
            let min = ["평균최저기온(°C)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                min.push(item['min']);
            }
            chartTempPre.load({
                columns: [avg, max, min],
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function rainYearLoad() {
	$.ajax({
        type: 'GET',
        url: 'status/getRain',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균일강수량(mm)"];
            let max = ["평균최다일강수량(mm)"];
            let hour = ["평균1시간최다강수량(mm)"];
            let year = [];
            for (item of data['rs']) {
                avg.push(item['avgRain']);
                max.push(item['maxRain']);
                hour.push(item['hourRain']);
                year.push(item['date']);
            }
            let chart = bb.generate({
                size : {
                    height: 700
                },
                title: {
                    text: "년도별 전국 강수량 통계"
                },
                bindto: "#chart4",
                data: {
                    type: "line",
                    columns: [avg, max, hour],
                    colors: {
                        "평균최고기온(°C)": "#ee5c52",
                        "평균기온(°C)": "#66d662",
                        "평균최저기온(°C)": "#618cdb"
                    }
                },
                axis: {
                    x: {
                        type: "category",
                        categories: year,
                        height: 80
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function rainMonthLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/rain',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균일강수량(mm)"];
            let max = ["평균최다일강수량(mm)"];
            let hour = ["평균1시간최다강수량(mm)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                hour.push(item['hour']);
            }
            let chart = bb.generate({
                size : {
                    height: 700
                },
                title: {
                    text: "월별 전국 강수량 통계"
                },
                bindto: "#chart5",
                data: {
                    type: "line",
                    columns: [avg, max, hour],
                    colors: {
                        "평균최고기온(°C)": "#ee5c52",
                        "평균기온(°C)": "#66d662",
                        "평균최저기온(°C)": "#618cdb"
                    }
                },
                axis: {
                    x: {
                        type: "category",
                        categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                        height: 50
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function rainPreLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/rain/rf',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균일강수량(mm)"];
            let max = ["평균최다일강수량(mm)"];
            let hour = ["평균1시간최다강수량(mm)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                hour.push(item['hour']);
            }
            chartRainPre = bb.generate({
                size : {
                    height: 700
                },
                title: {
                    text: "내년 전국 강수량 예측"
                },
                bindto: "#chart6",
                data: {
                    type: "line",
                    columns: [avg, max, hour],
                    colors: {
                        "평균최고기온(°C)": "#ee5c52",
                        "평균기온(°C)": "#66d662",
                        "평균최저기온(°C)": "#618cdb"
                    }
                },
                axis: {
                    x: {
                        type: "category",
                        categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                        height: 50
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function rainRfLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/rain/rf',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균일강수량(mm)"];
            let max = ["평균최다일강수량(mm)"];
            let hour = ["평균1시간최다강수량(mm)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                hour.push(item['hour']);
            }
            chartRainPre.load({
                columns: [avg, max, hour]
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

function rainSvmLoad() {
	$.ajax({
        type: 'GET',
        url: 'http://127.0.0.1:5050/rain/svm',
        dataType: 'json',
        success: function(data) {
            let avg = ["평균일강수량(mm)"];
            let max = ["평균최다일강수량(mm)"];
            let hour = ["평균1시간최다강수량(mm)"];
            for (item of data) {
                avg.push(item['avg']);
                max.push(item['max']);
                hour.push(item['hour']);
            }
            chartRainPre.load({
                columns: [avg, max, hour],
            });
        },
        error: function(xhr, status, error) {
            console.log(xhr, status, error);
        }
    });
}

$(function() {
	tempYearLoad();
	tempMonthLoad();
	rainYearLoad();
	rainMonthLoad();
	
	let chartTempPre;
	let chartRainPre;
	
	tempPreLoad();
	rainPreLoad();

	$('input[name="tempmodel"]').on('change', function() {
		if (this.value == 1) tempRfLoad();
		else tempSvmLoad();
	});
	$('input[name="rainmodel"]').on('change', function() {
		if (this.value == 1) rainRfLoad();
		else rainSvmLoad();
	});
});