-- 회원 테이블 생성
CREATE TABLE member (
  idx INT PRIMARY KEY AUTO_INCREMENT,
  id VARCHAR(10) NOT NULL UNIQUE,
  pw VARCHAR(30) NOT NULL,
  nickname VARCHAR(20) NOT NULL UNIQUE,
  grade VARCHAR(10) CHECK (grade IN ('ADMIN', 'GENERAL')) DEFAULT 'GENERAL',
  regdate DATETIME DEFAULT NOW() NOT NULL
);

-- 관리자 계정 생성
INSERT INTO member (id, pw, nickname, grade) VALUES ('admin', '1234', '관리자', 'ADMIN');

-- 확인
SELECT * FROM member;