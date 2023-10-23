-- 테이블 생성
CREATE TABLE post (
    id VARCHAR(10) NOT NULL,
    num INT PRIMARY KEY NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    category VARCHAR(10) NOT NULL,
    file_id INT,
    file_name VARCHAR(100),
    postdate DATETIME DEFAULT NOW() NOT NULL,
    update_date DATETIME,
    visit_count INT DEFAULT 0,
    FOREIGN KEY (nickname) REFERENCES member(nickname) ON UPDATE CASCADE,
    FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE
);

-- 확인
SELECT * FROM post;