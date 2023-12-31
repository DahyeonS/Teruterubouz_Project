<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function fn_option(code, name) {
        return '<option value="' + code + '">' + name + '</option>';
    }
    
    function checkExtension (fileName, fileSize) {
        const regex = new RegExp('(.*?)\.(png|jpg|jpeg|bmp|gif|tif|webp)$');
        
        if (fileSize >= 5242880) {
            Swal.fire({
                text: '파일 사이즈가 초과되었습니다.',
                icon: 'info',
                confirmButtonColor: '#4faaff',
                confirmButtonText: '확인'
			});
            return false;
        }
        
        if (!(regex.test(fileName))) {
            Swal.fire({
                text: '이미지 파일만 업로드할 수 있습니다.',
                icon: 'info',
                confirmButtonColor: '#4faaff',
                confirmButtonText: '확인'
            });
            return false;
        }
        return true;
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
            $('#district').hide();
        } else if (province == '강원도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of gangwon) $('#city').append(fn_option(c, c));
            $('#district').hide();
        } else if (province == '충청북도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of nchungcheong) $('#city').append(fn_option(c, c));
            $('#district').hide();
        } else if (province == '충청남도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of schungcheong) $('#city').append(fn_option(c, c));
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
            $('#district').hide();
        } else if (province == '전라남도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of sjeolla) $('#city').append(fn_option(c, c));
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
            $('#district').hide();
        } else if (province == '경상남도') {
            $('#citydiv').show();
            $('#city').empty();
            $('#city').append(fn_option('선택', '선택'));
            for (c of sgyeongsang) $('#city').append(fn_option(c, c));
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
            $('#district').hide();
        } else {
            $('#citydiv').hide();
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
    
    function imageLoad(num) {
        param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/load',
            dataType: 'json',
            data: param,
            success: function(data) {
                console.log(data);
                const {num, fileId, fileName} = data;
    
                let filelist = '';
                if (fileName !== '') {
                    filelist = '<br><h6 class="mb-3">업로드된 이미지</h6>'
                    for (let i=0; i<fileId.split(', ').length; i++) {
                        const newFileId = encodeURIComponent(fileId.split(', ')[i]);
                        filelist += '<img id="image' + i + '" src="../resources/uploads/s_' + newFileId + '" alt="' + fileName.split(',')[i] + '"/>'
                        + '<input type="button" class="btn-close mx-3" onclick="imgDeleteConfirm(' + num + ', \'' + newFileId + '\', \'' + fileName.split(',')[i] + '\');"></input>'
                    }
                    $('#filelist').show();
                }
                
                $('#filelist').html(filelist);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }
    
    function loadBoard(num) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/load',
            dataType: 'json',
            data: param,
            success: function(data) {
                const {province, city, district, title, content} = data;
                
                $('#province option[value="' + province + '"]').attr('selected', 'selected');
                cityShow();
                const cities = ['서울', '인천', '대전', '세종', '광주', '대구', '울산', '부산'];
                if (cities.indexOf(province) === -1) {
                    $('#city option[value="' + city + '"]').attr('selected', 'selected');
                    districtShow();
                }
                $('#district option[value="' + district + '"]').attr('selected', 'selected');
                
                imageLoad(num);
                
                $('#title').attr("value", title);
                $('#content').html(content);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }
    
    function deleteImg(num, fileId, fileName) {
        params = {num, fileId, fileName};
        console.log(params);
        $.ajax({
            type: 'POST',
            url: '../boardApi/deleteImg',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    Swal.fire({
						text: '파일이 삭제되었습니다.',
						icon: 'success',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					}).then(result => {
						if (result.isConfirmed) imageLoad(num);
					});
                } else {
                    Swal.fire({
						title: '오류',
						text: '죄송합니다. 다시 시도해주세요.',
						icon: 'error',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
                    return;
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }

    function uploadFile(formData, fileName) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/uploadFile',
            data: formData,
            datatype: 'json',
            processData: false,
            contentType: false,
            success: function(data) {
                const id = '${id}';
                const nickname = '${nickname}';
                const title = $('#title').val();
                const content = $('#content').val();
                
                let province = $('#province option:selected').val();
                if (province == '강원도') province = '강원특별자치도';
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
                
                const district = $('#district option:selected').val();
                
                let fileId = '';
                let newFileName = '';
                if ('${param.update}' == '') fileId = data['fileId'].substring(1, data['fileId'].length-1);
                else {
                    if ($('#filelist img').length !== 0) {
                        for (let i=0; i<$('#filelist img').length; i++) {
                            fileId += $('#image' + i + '').attr("src").split('../resources/uploads/s_')[1] + ', ';
                            newFileName += $('#image' + i + '').attr("alt") + ',';
                            }
                        fileId += data['fileId'].substring(1, data['fileId'].length-1);
                        fileName = newFileName + fileName;
                    } else fileId = data['fileId'].substring(1, data['fileId'].length-1);
                }
                
                let params;
                if ('${param.update}' == '') {
                    params = {id, nickname, title, content, province, city, district, fileId, fileName};
                    write(params);
                }
                else {
                    let num;
                    if ('${param.update}' !== '') num = parseInt('${param.update}');
                    params = {num, id, nickname, title, content, province, city, district, fileId, fileName};
                    update(params);
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }
    
    function write(params) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/write',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    Swal.fire({
						text: '게시글이 작성되었습니다.',
						icon: 'success',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					}).then(result => {
						if (result.isConfirmed) location.href = 'list'
					});
                } else {
                    Swal.fire({
						title: '오류',
						text: '죄송합니다. 다시 시도해주세요.',
						icon: 'error',
						confirmButtonColor: '#4faaff',
						confirmButtonText: '확인'
					});
                    return;
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }
    
    function update(params) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/update',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    Swal.fire({
                        text: '게시글이 수정되었습니다.',
                        icon: 'success',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    }).then(result => {
                        if (result.isConfirmed) location.href = 'view?num=${param.update}'
                    });
                } else {
                    Swal.fire({
                        title: '오류',
                        text: '죄송합니다. 다시 시도해주세요.',
                        icon: 'error',
                        confirmButtonColor: '#4faaff',
                        confirmButtonText: '확인'
                    });
                    return;
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    }
    
    function imgDeleteConfirm(num, fileId, fileName) {
        Swal.fire({
			text: '파일을 삭제합니까?',
			icon: 'question',
			showDenyButton: true,
			confirmButtonColor: '#4faaff',
			confirmButtonText: '예',
			denyButtonText: '아니오',
			denyButtonColor: '#ff4f4f'
		}).then(result => {
			if (result.isConfirmed) deleteImg(num, fileId, fileName);
			else return;
		});
    }
    
    $(function() {
        $('#citydiv').hide();
        $('#district').hide();
        $('#filelist').hide();
        
        if (${param.update != null}) {
            $('title').html('게시글 수정');
            loadBoard(${param.update});
        }
        
        $('#submit').click(function() {
            if ($('#title').val() === '') {
                Swal.fire({
					text: '제목을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            } else if ($('#content').val() === '') {
                Swal.fire({
					text: '내용을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            }
            
            let province = $('#province option:selected').val();
            if (province == '강원도') province = '강원특별자치도';
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
            
            const district = $('#district option:selected').val();
            
            if (province == '선택') {
                Swal.fire({
					text: '지역을 선택해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            }
            else if (city == '선택') {
                Swal.fire({
                    text: '지역을 선택해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인'
                });
                return;
            } else if (district == '선택') {
                Swal.fire({
                    text: '지역을 선택해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인'
                });
                return;
            } else {
                let formData = new FormData();
                let inputFile = $('input[name="uploadFile"]');
                let files = inputFile[0].files;
                
                let fileName = []
                for (file of files) {
                    console.log(file['name']);
                    console.log(file['size']);
                    if (!checkExtension(file['name'], file['size'])) return false;
                    fileName.push(file['name']);
                    formData.append("uploadFile", file);
                }
                fileName = fileName.toString();
                
                console.log(formData);
                
                if (files['length'] !== 0) uploadFile(formData, fileName);
                else {
                    const id = '${id}';
                    const nickname = '${nickname}';
                    const title = $('#title').val();
                    const content = $('#content').val();
                    const fileId = null;
                    const fileName = null;
                    
                    const params = {id, nickname, title, content, province, city, district, fileId, fileName};
                    write(params);
                }
            }
        });
        
        $('#content').keyup(function (e) {
            if ($(this).val().length > 200) {
                $(this).val($(this).val().substring(0, 2000));
            };
        });
        
        $('#province').change(function() {
            cityShow();
        });
        
        $('#city').change(function() {
            districtShow();
        });
        
        $('#cancel').click(function() {
            history.back();
        });
        
        $('#update').click(function() {
            if ($('#title').val() === '') {
                Swal.fire({
					text: '제목을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            } else if ($('#content').val() === '') {
                Swal.fire({
					text: '내용을 작성해주세요.',
					icon: 'info',
					confirmButtonColor: '#4faaff',
					confirmButtonText: '확인'
				});
                return;
            }
            
            let province = $('#province option:selected').val();
            if (province == '강원도') province = '강원특별자치도';
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
            
            const district = $('#district option:selected').val();
            
            if (province == '선택') {
                Swal.fire({
                    text: '지역을 선택해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인'
                });
                return;
            } else if (city == '선택') {
                Swal.fire({
                    text: '지역을 선택해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인'
                });
                return;
            } else if (district == '선택') {
                Swal.fire({
                    text: '지역을 선택해주세요.',
                    icon: 'info',
                    confirmButtonColor: '#4faaff',
                    confirmButtonText: '확인'
                });
                return;
            } else {
                let formData = new FormData();
                let inputFile = $('input[name="uploadFile"]');
                let files = inputFile[0].files;
                
                let fileName = []
                for (file of files) {
                    console.log(file['name']);
                    console.log(file['size']);
                    if (!checkExtension(file['name'], file['size'])) return false;
                    fileName.push(file['name']);
                    formData.append("uploadFile", file);
                }
                fileName = fileName.toString();
                
                if (files['length'] !== 0) uploadFile(formData, fileName);
                else {
                    let num;
                    if ('${param.update}' !== '') num = parseInt('${param.update}');
                    const id = '${id}';
                    const nickname = '${nickname}';
                    const title = $('#title').val();
                    const content = $('#content').val();
                    
                    let fileId = '';
                    let fileName = '';
                    if ($('#filelist img').length !== 0) {
                        for (let i=0; i<$('#filelist img').length; i++) {
                            fileId += $('#image' + i + '').attr("src").split('../resources/uploads/s_')[1] + ', ';
                            fileName += $('#image' + i + '').attr("alt") + ',';
                        }
                        fileId = fileId.substring(0, fileId.length-2);
                        fileName = fileName.substring(0, fileName.length-1);
                    } else {
                        fileId = null;
                        fileName = null;
                    }
                    
                    const params = {num, id, nickname, title, content, province, city, district, fileId, fileName};
                    update(params);
                }
            }
        });
    });
</script>