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
Status 폴더의 Mapper 파일

### *MemberMapper.java*
Member 폴더의 Mapper 파일

### *BoardMapper.java*
Board 폴더의 Mapper 파일

### *NoticeMapper.java*
Notice 폴더의 Mapper 파일

## status
**날씨 통계 페이지를 처리하는 곳입니다.**

### *StatusController.java*
Status 폴더의 서블릿을 관리

### *StatusDTO.java*
날시 데이터를 저장하는 곳

### *StatusService.java*
Status의 작업을 처리하는 곳

#### *StatusServiceImpl.java*
StatusService의 자식 클래스

## member

### *MemberController.java*
Member 폴더의 서블릿을 관리

### *MemberControllerAjax.java*
Member 폴더의 AJAX 작업을 관리

### *MemberDTO.java*
회원 데이터를 저장하는 곳

### *MemberService.java*
Member의 작업을 처리하는 곳

#### *MemberServiceImpl.java*
MemberService의 자식 클래스

## board

## notice
