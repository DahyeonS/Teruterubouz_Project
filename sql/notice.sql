-- 테이블 생성
CREATE TABLE notice (
    num INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    postdate DATETIME DEFAULT NOW() NOT NULL,
    update_date DATETIME,
    visit_count INT DEFAULT 0
);

-- 확인
SELECT * FROM notice;