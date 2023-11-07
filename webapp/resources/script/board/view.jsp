<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function getBoard(num, writer) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/getBoard',
            dataType: 'json',
            data: param,
            success: function(data) {
                console.log(data);
                const {num, id, nickname, title, content, province, city, district, fileId, fileName, postdate, updateDate, visitCount} = data;
                
                let region = '';
                const cities = ['서울', '인천', '대전', '세종', '광주', '대구', '울산', '부산'];
                if (cities.indexOf(province) === -1) region += '<a id="province" href="list?province=' + province +  '">' + province + '</a> ';
                
                region += '<a id="city" href="list?province=' + province + '&city=' + city + '">' + city + '</a>';
                if (province !== '세종') region += ' <a id="district" href="list?province=' + province + '&city=' + city + '&district=' + district + '">' + district + '</a>';
                
                let info = '<h4 id="nickname">' + nickname + '(' + id + ')</h4><h4 id="postdate">작성일자 ' + postdate + '</h4>';
                if (updateDate !== null) info += '<h4 id="updatedate">수정일자 ' + updateDate + '</h4>'
                info += '<h4>조회수 ' + visitCount + '</h4>';
                
                let image = '';
                let filelist = ''
                if (fileId === '') {
                    $('#image').hide;
                    $('#filelist').hide;
                }
                else {
                    for (let i=0; i<fileId.split(', ').length; i++) {
                        const newFileId = encodeURIComponent(fileId.split(', ')[i]);
                        image += '<img src="../resources/uploads/' + newFileId + '" style="width: 70%; height: auto;"/><br>';
                        filelist += '<img src="../resources/image/image_picture_icon_143003.png" style="width: 20px; height: 20px"/> <a href="download?fileId=' + newFileId + '&fileName=' + fileName.split(',')[i] + '">' + fileName.split(',')[i] + '</a><br>'
                    }
                }
                
                let control;
                if (id == '${id}' || '${grade}' === 'ADMIN') {
                    control = '<input type="button" value="수정하기" id="update" onclick="updateLink(' + num + ');">'
                    + '<input type="button" value="삭제하기" id="delete" onclick="deleteConfirm(' + num + ')">';
                }
                
                $('title').html(title);
                $('#title').html('<h2>'+ title +'</h2>');
                $('#region').html(region);
                $('#info').html(info);
                $('#image').html(image);
                $('#filelist').html(filelist);
                $('#content').html(content);
                $('#control').html(control);
                
                if (id === 'admin') {
                    $('#title > h2').attr('style', 'color: red;');
                    $('#content').attr('style', 'font-weight: bold;');
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function getReply(postNum, page) {
        const params = {postNum, page};
        $.ajax({
            type: 'POST',
            url: '../boardApi/getReply',
            dataType: 'json',
            data: params,
            success: function(data) {
                if (data['rs'] !== 0) {
                    let string = '';
                    for (item of data['rs']) {
                        string += '<tr><td id="rnickname">' + item['nickname'] + '님&nbsp&nbsp&nbsp</td><td id="rcontent">' + item['content'] + '</td></tr><tr><td id="rpostdate">' + item['postdate'] + '</td>';
                        if ('${nickname}' === item['nickname'] || '${grade}' === 'ADMIN') string += '<td id="rdelete"><a href="#" onclick="deleteReplyConfirm(' + item['num'] + ')">삭제</td></tr><tr><td>&nbsp</td></tr>';
                        else string += '</tr>';
                    }
                    string += '<tr id="paging"/>';
                    $('#replylist' + postNum).html(string);
                    pagingReply(params);
                    $('.replies').show();
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function pagingReply(params) {
        $.ajax({
            type: 'POST',
            url: '../boardApi/pagingReply',
            dataType: 'json',
            data: params,
            success: function(data) {
                const {blockNum, endPage, isBNext, isBPrev, isNext, isPrev, listNum, pageNum, startPage, totalCount, totalPage} = data;
                let td = '<td colspan="10">';
                if(isPrev) td += '<a href="#" onclick="getReply(${param.num} ,'+ (pageNum - 1) + ');">[<]</a>';
                if(isBPrev) td += '<a href="#" onclick="getReply(${param.num} ,'+ (startPage - 1) + ');">[<<]</a>';
                for(let i=startPage; i<=endPage; i++) {
                    if(i === pageNum) td += '<span style="color:red;">['+ i + ']</span>';
                    else td += '<a href="#" onclick="getReply(${param.num} ,' + i + ');">['+ i +']</a>';
                };
                if(isNext) td += '<a href="#" onclick="getReply(${param.num} ,' + (pageNum + 1) + ');">[>]</a>';
                if(isBNext) td += '<a href="#" onclick="getReply(${param.num} ,' + (endPage + 1) + ');">[>>]</a>';
                td += '</td>';
                $('#paging').html(td);
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function deleteBoard(num) {
        const param = {num};
        $.ajax({
            type: 'POST',
            url: '../boardApi/delete',
            dataType: 'json',
            data: param,
            success: function(data) {
                if (data['rs'] !== 0) {
                    alert('게시글이 삭제되었습니다.');
                    location.href = 'list'
                } else {
                    alert('죄송합니다. 다시 시도해주세요.');
                    return;
                }
            },
            error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function writeReply(postNum) {
        const id = '${id}';
        const nickname = '${nickname}';
        const content = $('#reply' + ${param.num}).val();
        
        if (content === '') alert('내용을 입력해주세요.');
        else {
            const params = {id, postNum, nickname, content};
            console.log(params);
            $.ajax({
                type: 'POST',
                url: '../boardApi/reply',
                dataType: 'json',
                data: params,
                success: function(data) {
                    if(data['rs'] !== 0) {
                        alert('댓글이 작성되었습니다.');
                        location.reload();
                    } else {
                        alert('다시 시도해주세요.');
                        return;
                    }
                },
                error: function(xhr, status, error) {
                    console.log(xhr, status, error);
                }
            });
        }
    };
    
    function deleteReply(param) {
        const num = '${param.num}';
        $.ajax({
            type: 'POST',
            url: '../boardApi/deleteReply',
            dataType: 'json',
            data: param,
            success: function(data) {
                if(data['rs'] === 1) {
                    alert('게시글이 삭제되었습니다.');
                    location.reload();
                } else {
                    alert('죄송합니다. 다시 시도해주세요.');
                    return;
                }
            }, error: function(xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    };
    
    function updateLink(num) {
        location.href = 'write?update=' + num;
    }
    
    function deleteConfirm(num) {
        const input = confirm('게시글을 삭제하겠습니까?');
        if (input) deleteBoard(num);
    }
    
    function deleteReplyConfirm(num) {
        const input = confirm('해당 댓글을 삭제합니까?');
        if (input) {
            const param = {num};
            deleteReply(param);
        } else return;
    };
    
    $(function() {
        $('.replies').hide();
        
        let page = 1;
        const sPage = '${param.page}';
        if (sPage !== '') page = parseInt(sPage);
        
        getBoard(${param.num});
        getReply(${param.num}, page);
        
        $('#write').click(function() {
            location.href = 'write';
        });
        
        $('#list').click(function() {
            location.href = 'list';
        });
    });
</script>