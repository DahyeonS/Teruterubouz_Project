<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    var id, nickname, title, content, rcontent;

    function fn_option(code, name) {
        return '<option value="' + code + '">' + name + '</option>';
    }
    
    function cityShow() {
        const province = $('#province option:selected').val();
        
        const gyeonggi = ['가평군', '고양특례시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시',
            '동두천시', '부천시', '성남시', '수원특례시', '시흥시', '안산시', '안성시', '안양시', '양주시', '여주시',
            '연천군', '오산시', '용인특례시', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시'];
        const gangwon = ['강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양구군', '양양군', '영월군',
            '인제군', '정선군', '철원군', '평창군', '홍천군', '화천군', '횡성군'];
        const nchungcheong = ['제천시', '청주시', '충주시', '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '증평군', '진천군'];
        const schungcheong = ['계룡시', '공주시', '논산시', '당진시', '보령시', '서산시', '아산시', '천안시', '금산군', '부여군', '서천군',
            '예산군', '청양군', '태안군', '홍성군'];
        const njeolla = ['군산시', '김제시', '남원시', '익산시', '전주시', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군', '진안군'];
        const sjeolla = ['광양시', '나주시', '목포시', '순천시', '여수시', '강진군', '고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
        const ngyeongsang = ['경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시', '영주시', '영천시', '포항시', '고령군', '봉화군', '성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군'];
        const sgyeongsang = ['거제시', '김해시', '밀양시', '사천시', '양산시', '진주시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군', '창녕군', '하동군', '함안군', '함양군', '합천군'];
        const jeju = ['서귀포시', '제주시'];
        
        const seoul = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구',
            '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구',
            '중구', '중랑구'];
        const incheon = ['강화군', '옹진군', '계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '중구'];
        const daejeon = ['대덕구', '동구', '서구', '유성구', '중구'];
        const gwangju = ['광산구', '남구', '동구', '북구', '서구'];
        const daegu = ['군위군', '달성군', '남구', '달서구', '동구', '북구', '서구', '수성구', '중구'];
        const ulsan = ['울주군', '남구', '동구', '북구', '중구'];
        const busan = ['기장군', '금정구', '강서구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '수영구', '연제구', '영도구', '해운대구'];
        
        if (province == '서울') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of seoul) $('#district').append(fn_option(d, d));
        } else if (province == '인천') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of incheon) $('#district').append(fn_option(d, d));
        } else if (province == '경기도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of gyeonggi) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '강원도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of gangwon) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '충청북도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of nchungcheong) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '충청남도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of schungcheong) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '대전') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of daejeon) $('#district').append(fn_option(d, d));
        } else if (province == '세종') {
            $('#citydiv').hide();
            $('#district').hide();
            $('#district').empty();
            $('#district').append(fn_option('', null));
        } else if (province == '전라북도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of njeolla) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '전라남도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of sjeolla) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '광주') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of gwangju) $('#district').append(fn_option(d, d));
        } else if (province == '경상북도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of ngyeongsang) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '경상남도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of sgyeongsang) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else if (province == '대구') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of daegu) $('#district').append(fn_option(d, d));
        } else if (province == '울산') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of ulsan) $('#district').append(fn_option(d, d));
        } else if (province == '부산') {
            $('#citydiv').hide();
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of busan) $('#district').append(fn_option(d, d));
        } else if (province == '제주도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of jeju) $('#city').append(fn_option(c, c));
            $('#district').empty();
            $('#district').hide();
        } else {
            $('#city').empty();
            $('#citydiv').hide();
            $('#district').empty();
            $('#district').hide();
        }
    }
    
    function districtShow() {
        const city = $('#city option:selected').val();
        
        const goyang = ['덕양구', '일산동구', '일산서구'];
        const seongnam = ['분당구', '수정구', '중원구'];
        const suwon = ['권선구', '영통구', '장안구', '팔달구'];
        const ansan = ['단원구', '상록구'];
        const anyang = ['동안구', '만안구'];
        const yongin = ['기흥구', '수지구', '처인구'];
        
        const cheongju = ['상당구', '서원구', '청원구', '흥덕구'];
        const cheonan = ['동남구', '서북구'];
        const jeonju = ['덕진구', '완산구'];
        const pohang = ['남구', '북구'];
        const changwon = ['마산합포구', '마산회원구', '의창구', '성산구', '진해구'];
        
        if (city == '고양특례시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of goyang) $('#district').append(fn_option(d, d));
        } else if (city == '성남시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of seongnam) $('#district').append(fn_option(d, d));
        } else if (city == '수원특례시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of suwon) $('#district').append(fn_option(d, d));
        } else if (city == '안산시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of ansan) $('#district').append(fn_option(d, d));
        } else if (city == '안양시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of anyang) $('#district').append(fn_option(d, d));
        } else if (city == '용인특례시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of yongin) $('#district').append(fn_option(d, d));
        } else if (city == '청주시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of cheongju) $('#district').append(fn_option(d, d));
        } else if (city == '천안시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of cheonan) $('#district').append(fn_option(d, d));
        } else if (city == '전주시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of jeonju) $('#district').append(fn_option(d, d));
        } else if (city == '포항시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of pohang) $('#district').append(fn_option(d, d));
        } else if (city == '창원시') {
            $('#district').show();
            $('#district').empty();
            $('#district').append(fn_option('선택', '선택'));
            for (d of changwon) $('#district').append(fn_option(d, d));
        } else {
            $('#district').hide();
            $('#district').empty();
            $('#district').append(fn_option('', null));
        }
    }
    
    function pagingBoard(params) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/pagingBoard',
            dataType: 'json',
            data: params,
            success: function(data) {
            const {endPage, isBNext, isBPrev, isNext, isPrev, pageNum, startPage} = data;
			let li = '';
			if(isBPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard('+ (startPage - 1) + ', ' + params['limit'] + ');">처음</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">처음</span></li>';
			if(isPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard('+ (pageNum - 1) + ', ' + params['limit'] + ');">이전</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">이전</span></li>';
			for(let i=startPage; i<=endPage; i++) {
				if(i === pageNum) li += '<li class="page-item active"><span class="page-link">'+ i + '</span></li>';
				else li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + i + ', ' + params['limit'] + ');">'+ i +'</a></li>';
			};
			if(isNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + (pageNum + 1) + ', ' + params['limit'] + ');">다음</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">다음</span></li>';
			if(isBNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + (endPage + 1) + ', ' + params['limit'] + ');">마지막</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">마지막</span></li>';
            $('#paging').html(li);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };

    function pagingBoardReply(params) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/pagingBoardReply',
            dataType: 'json',
            data: params,
            success: function(data) {
            const {endPage, isBNext, isBPrev, isNext, isPrev, pageNum, startPage} = data;
			let li = '';
			if(isBPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard('+ (startPage - 1) + ', ' + params['limit'] + ');">처음</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">처음</span></li>';
			if(isPrev) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard('+ (pageNum - 1) + ', ' + params['limit'] + ');">이전</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">이전</span></li>';
			for(let i=startPage; i<=endPage; i++) {
				if(i === pageNum) li += '<li class="page-item active"><span class="page-link">'+ i + '</span></li>';
				else li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + i + ', ' + params['limit'] + ');">'+ i +'</a></li>';
			};
			if(isNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + (pageNum + 1) + ', ' + params['limit'] + ');">다음</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">다음</span></li>';
			if(isBNext) li += '<li class="page-item"><a href="#" class="page-link" onclick="getBoard(' + (endPage + 1) + ', ' + params['limit'] + ');">마지막</a></li>';
			else li += '<li class="page-item disabled"><span class="page-link">마지막</span></li>';
            $('#paging').html(li);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function getBoard(page) {
        let province = $('#province option:selected').val();
        if (province == '선택' || province == undefined) province = '';
        else if (province == '강원도') province = '강원특별자치도';
        else if (province == '제주도') province = '제주특별자치도';
        
        let city = '';
        if (province == '서울') city = '서울특별시';
        else if (province == '인천') city = '인천광역시';
        else if (province == '대전') city = '대전광역시';
        else if (province == '세종') city = '세종특별자치시';
        else if (province == '광주') city = '광주광역시';
        else if (province == '대구') city = '대구광역시';
        else if (province == '울산') city = '울산광역시';
        else if (province == '부산') city = '부산광역시';
        else city = $('#city option:selected').val();
        if (city == '선택' || city == undefined) city = '';
        
        let district = $('#district option:selected').val();
        if (district == '선택' || district == undefined) district = '';
        
        if (rcontent === undefined) {
            const params = {page, id, nickname, title, content, province, city, district};
            console.log(params);
            $.ajax({
                type: 'POST',
                url: '../boardApi/boardList',
                dataType: 'json',
                data: params,
                success: function(data) {
                    let div = '';
                    if (data['rs'] === 0) {
                        Swal.fire({
                            text: '조회되는 게시글이 없습니다.',
                            icon: 'info',
                            confirmButtonColor: '#4faaff',
                            confirmButtonText: '확인',
                        });
                        return;
                    } else {
                        for (let i=0; i<data['rs'].length; i++) {
                            const {num, title, nickname, postdate, visitCount, fileId} = data['rs'][i];
                            div += '<div class="col"><div class="card shadow-sm" id="board">';
                            if (fileId == '') div += '<img class="card-img-top" src="../resources/image/no_image_logo.png" alt="' + num + '" onclick="linkBoard(' + num + ');">';
                            else {
                                const fileName = encodeURIComponent(fileId.split(',')[0]);
                                div += '<img class="card-img-top" src="../resources/uploads/s_' + fileName + '" alt="' + num + '" onclick="linkBoard(' + num + ');"/>';
                            }
                            div += '<div class="card-body"><h6 class="card-text"><a class="text-title text-dark" href="#" onclick="linkBoard(' + num + ');"';
                            if (nickname === '관리자') div += ' style="font-weight: bold;"';
                            div += '>';
                            if (title.length > 15) div += title.substring(0, 15) + '…';
                            else div += title;
                                
                            div += '</a></h6><hr><div id="info" class="d-flex justify-content-between align-items-center mb-3"><p class="card-text"';
                            if (nickname === '관리자') div += ' style="font-weight: bold;"'
                            div += '>';
                            if (nickname.length > 5) div += nickname.substring(0, 5) + '…';
                            else div += nickname;
                            div += '</p><p class="card-text">조회수 ' + visitCount + '</p></div><p class="card-text"><small class="text-body-secondary">'
                                + postdate + '</small></p></div></div></div>';
                        }
                    }
                    $('#boardlist').html(div);
                    pagingBoard(params);
                },
                error: function(xhr, status, error) {
                    console.log(xhr, status, error);
                }
            });
        } else {
            const params = {page, content: rcontent, province, city, district};
            $.ajax({
                type: 'POST',
                url: '../boardApi/boardListReply',
                dataType: 'json',
                data: params,
                success: function(data) {
                    let div = '';
                    if (data['rs'] === 0) {
                        Swal.fire({
                            text: '조회되는 게시글이 없습니다.',
                            icon: 'info',
                            confirmButtonColor: '#4faaff',
                            confirmButtonText: '확인',
                        });
                        return;
                    } else {
                        for (let i=0; i<data['rs'].length; i++) {
                            const {num, title, nickname, postdate, visitCount, fileId} = data['rs'][i];
                            div += '<div class="col"><div class="card shadow-sm" id="board">';
                            if (fileId == '') div += '<img class="card-img-top" src="../resources/image/no_image_logo.png" alt="' + num + '" onclick="linkBoard(' + num + ');">';
                            else {
                                const fileName = encodeURIComponent(fileId.split(',')[0]);
                                div += '<img class="card-img-top" src="../resources/uploads/s_' + fileName + '" alt="' + num + '" onclick="linkBoard(' + num + ');"/>';
                            }
                            div += '<div class="card-body"><h6 class="card-text"><a class="text-title text-dark" href="#" onclick="linkBoard(' + num + ');"';
                            if (nickname === '관리자') div += ' style="font-weight: bold;"';
                            div += '>';
                            if (title.length > 15) div += title.substring(0, 15) + '…';
                            else div += title;
                                
                            div += '</a></h6><hr><div id="info" class="d-flex justify-content-between align-items-center mb-3"><p class="card-text"';
                            if (nickname === '관리자') div += ' style="font-weight: bold;"'
                            div += '>';
                            if (nickname.length > 5) div += nickname.substring(0, 5) + '…';
                            else div += nickname;
                            div += '</p><p class="card-text">조회수 ' + visitCount + '</p></div><p class="card-text"><small class="text-body-secondary">'
                                + postdate + '</small></p></div></div></div>';
                        }
                    }
                    $('#boardlist').html(div);
                    pagingBoardReply(params);
                },
                error: function(xhr, status, error) {
                    console.log(xhr, status, error);
                }
            });
        }
    };
    
    function linkBoard(num) {
        location.href = 'view?num=' + num;
    }
    
    $(function() {
        $('#citydiv').hide();
        $('#district').hide();
        
        if ('${param.province}' !== '') {
            $('#province option[value="${param.province}"]').attr('selected', 'selected');
            cityShow();
            
            const cities = ['서울', '인천', '대전', '세종', '광주', '대구', '울산', '부산'];
            if (cities.indexOf('${param.province}') === -1) {
                $('#city option[value="${param.city}"]').attr('selected', 'selected');
                districtShow();
            }
            if ('${param.district}' !== '') $('#district option[value="${param.district}"]').attr('selected', 'selected');
        }
        
        getBoard(1);
        
        $('#write').click(function() {
            location.href = 'write';
        });
        
        $('#search').click(function() {
            const word = $('#content').val();

            if ($('#select').val() === 'id') id = $('#content').val();
            else if ($('#select').val() === 'nickname') nickname = $('#content').val();
            else if ($('#select').val() === 'title') title = $('#content').val();
            else if ($('#select').val() === 'content') content = $('#content').val();
            else if ($('#select').val() === 'rcontent') rcontent = $('#content').val();
            else {
                Swal.fire({
                    text: '검색 종류를 선택해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인'
                });
                return;
            }

            if (word === '') {
				Swal.fire({
					text: '검색어를 입력해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
				return;
			} else getBoard(1);
        });
        
        $('#all').click(function() {
            location.href = 'list';
        });
        
        $('#content').keydown(function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                if ($('#select').val() === 'id') id = $('#content').val();
                else if ($('#select').val() === 'nickname') nickname = $('#content').val();
                else if ($('#select').val() === 'title') title = $('#content').val();
                else if ($('#select').val() === 'content') content = $('#content').val();
                else if ($('#select').val() === 'rcontent') rcontent = $('#content').val();
                else {
                    Swal.fire({
                        text: '검색 종류를 선택해주세요.',
                        icon: 'info',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    });
                    return;
                }

                const word = $('#content').val();
                if (word === '') {
                    Swal.fire({
                        text: '검색어를 입력해주세요.',
                        icon: 'info',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    });
                    return;
                } else getBoard(1);
            }
        });
        
        $('#select').change(function() {
            id = undefined;
            nickname = undefined;
            title = undefined;
            content = undefined;
            rcontent = undefined;
        });

        $('#province').change(function() {
            cityShow();
            getBoard(1);
        });
        
        $('#city').change(function() {
            districtShow();
            getBoard(1);
        });
        
        $('#district').change(function() {
            getBoard(1);
        });
    });
</script>