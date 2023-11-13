# 개요
**데이터베이스를 관리할 SQL 파일들을 모아놓은 곳입니다.**

**CSV 출처 https://data.kma.go.kr/climate/RankState/selectRankStatisticsDivisionList.do?pgmNo=179**

## *member.sql*
**로그인 및 회원 관리를 위한 회원 테이블**

> ### 칼럼명
> idx - 회원 일련번호
> 
> id - 회원 ID
> 
> pw - 회원 비밀번호
> 
> nickname - 회원 닉네임
> 
> grade - 회원 등급(관리자, 일반회원 2단계로 나뉘어 있음)
>
> regdate - 회원가입 날짜

## *post.sql*
**커뮤니티 게시판 관리를 위한 게시판 테이블**

> ### 칼럼명
> id - 회원 ID
> 
> num - 게시판 일련번호
> 
> nickname - 회원 닉네임
>
> title - 게시글 제목
>
> content - 게시글 내용
>
> province - 시/도
>
> city - 시
>
> district - 군/구
>
> file_id - 파일 일련번호
>
> file_name - 파일 이름
>
> postdate - 게시 날짜
>
> update_date - 수정 날짜
> 
> visit_count - 방문자 수

## *comment.sql*
**커뮤니티 댓글 관리를 위한 댓글 테이블**

> ### 칼럼명
> id - 회원 ID
>
> num - 댓글 일련번호
>
> post_num - 댓글이 속한 게시글 번호
>
> nickname - 회원 닉네임
>
> content - 댓글 내용
>
> postdate - 댓글 작성 날짜

## *notice.sql*
**공지사항 게시판 테이블**

> ### 칼럼명
> num - 게시판 일련번호
> 
> nickname - 회원 닉네임
>
> title - 게시글 제목
>
> content - 게시글 내용
>
> postdate - 게시 날짜
>
> update_date - 수정 날짜
> 
> visit_count - 방문자 수
