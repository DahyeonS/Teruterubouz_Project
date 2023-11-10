<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function weatherLoad(city) {
        $.ajax({
            type: 'GET',
            url: 'http://127.0.0.1:5050/' + city,
            dataType: 'json',
            success: function(data) {
                let text = '<div id="weather" class="carousel carousel-dark slide px-5 py-5" data-bs-ride="true">'
                    + '<div class="carousel-inner">';
                
                let now = new Date();
                let one = new Date();
                one.setDate(now.getDate()+1);
                let two = new Date();
                two.setDate(now.getDate()+2);
    
                for (let i=0; i<data.length; i++) {
                    let time = new Date(data[i]['date'].substr(0, 4), parseInt(data[i]['date'].substr(4, 2))-1, data[i]['date'].substr(6, 2));
    
                    const isSameDate = (date1, date2) => {
                        return date1.getFullYear() === date2.getFullYear()
                        && date1.getMonth() === date2.getMonth()
                        && date1.getDate() === date2.getDate();
                    }
                    
                    if (i === 0) text += '<div class="carousel-item active">';
                    else text += '<div class="carousel-item">';

                    if (isSameDate(now, time)) {
                        if (data[i]['date'][8] === '0') text += '<h3>오늘 오전</h3><br>';
                        else text += '<h3>오늘 오후</h3><br>';
                    } else if (isSameDate(one, time)) {
                        if (data[i]['date'][8] === '0') text += '<h3>내일 오전</h3><br>';
                        else text += '<h3>내일 오후</h3><br>';
                    } else if (isSameDate(two, time)) {
                        if (data[i]['date'][8] === '0') text += '<h3>모레 오전</h3><br>';
                        else text += '<h3>모레 오후</h3><br>';
                    } else {
                        if (data[i]['date'][8] === '0') text += '<h3>글피 오전</h3><br>';
                        else text += '<h3>글피 오후</h3><br>';
                    }
    
                    if (data[i]['sky'][3] === '1' && data[i]['rain'] === '0') text += '<div id="image"><img src="./resources/image/tenki_mark01_hare.png"></div><br><h5 id="sunny">맑음</h5>';
                    else if (data[i]['sky'][3] === '2' && data[i]['rain'] === '0') text += '<div id="image"><img src="./resources/image/kumo.png"></div><br><h5>구름 조금</h5>';
                    else if (data[i]['sky'][3] === '3' && data[i]['rain'] === '0') text += '<div id="image"><img src="./resources/image/kumo.png"></div><br><h5>구름 많음</h5>';
                    else if (data[i]['sky'][3] === '4' && data[i]['rain'] === '0') text += '<div id="image"><img src="./resources/image/tenki_mark05_kumori.png"></div><br><h5>흐림</h5>';
                    else if (data[i]['rain'] === '3') text += '<div id="image"><img src="./resources/image/tenki_mark09_gousetsu.png"></div><br><h5>눈</h5>';
                    else if (data[i]['rain'] === '4') text += '<div id="image"><img src="./resources/image/tenki_mark03_gouu.png"></div><br><h5>진눈깨비</h5>';
                    else text += '<div id="image"><img src="./resources/image/tenki_mark03_gouu.png"></div><br><h5>비</h5>';
                    
                    text += '<p>강수확률 ' + data[i]['prob'] + '%</p></div>'
                }
                text += '</div><button class="carousel-control-prev" type="button" data-bs-target="#weather" data-bs-slide="prev">'
                    + '<span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">이전</span></button>'
                    + '<button class="carousel-control-next" type="button" data-bs-target="#weather" data-bs-slide="next">'
                    + '<span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">다음</span></button></div>';
                $('#weatherinfo').html(text);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }
    
    $(function() {
        const city = '${param.city}';
        weatherLoad(city);
    });
</script>