# 개요
**웹 페이지 처리를 위한 자바 파일들을 모아놓은 곳입니다.**

## web
**메인 페이지 처리를 위한 곳입니다.**
### *HomeController.java*
메인 페이지의 서블릿을 관리합니다.

### *FileIO.java*
파일 업로드를 관리합니다.

## mybatis/mapper
**MyBatis의 처리를 하는 Mapper 파일들을 모아놓은 곳입니다.**

### *StatusMapper.java*
status 폴더의 Mapper 파일

### *MemberMapper.java*
member 폴더의 Mapper 파일

### *BoardMapper.java*
board 폴더의 Mapper 파일

### *NoticeMapper.java*
notice 폴더의 Mapper 파일

## status
**날씨 통계 페이지를 처리하는 곳입니다.**

### *StatusController.java*
status 폴더의 서블릿을 관리

### *StatusDTO.java*
날시 데이터를 저장하는 곳

### *StatusService.java*
status의 작업을 처리하는 곳

#### *StatusServiceImpl.java*
StatusService의 자식 클래스

## member
**회원 관리**

### *MemberController.java*
member 폴더의 서블릿을 관리

### *MemberControllerAjax.java*
member 폴더의 AJAX 작업을 관리

### *MemberDTO.java*
회원 데이터를 저장하는 곳

### *MemberService.java*
member의 작업을 처리하는 곳

#### *MemberServiceImpl.java*
MemberService의 자식 클래스

## board
**커뮤니티 게시판**

### *BoardController.java*
board 폴더의 서블릿을 관리

### *BoardControllerAjax.java*
board 폴더의 AJAX 작업을 관리

### *BoardDTO.java*
회원 데이터를 저장하는 곳

### *BoardService.java*
board의 작업을 처리하는 곳

#### *BoardServiceImpl.java*
BoardService의 자식 클래스

## notice
**공지 게시판**

### *NoticeController.java*
notice 폴더의 서블릿을 관리

### *NoticeControllerAjax.java*
notice 폴더의 AJAX 작업을 관리

### *NoticeService.java*
notice의 작업을 처리하는 곳

#### *NoticeServiceImpl.java*
NoticeService의 자식 클래스
