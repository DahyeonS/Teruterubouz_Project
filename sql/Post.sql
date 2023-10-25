-- 테이블 생성
CREATE TABLE post (
    id VARCHAR(20) NOT NULL,
    num INT PRIMARY KEY NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    province VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    district VARCHAR(20) NOT NULL,
    file_id INT,
    file_name VARCHAR(200),
    postdate DATETIME DEFAULT NOW() NOT NULL,
    update_date DATETIME,
    visit_count INT DEFAULT 0,
    FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (nickname) REFERENCES member(nickname) ON UPDATE CASCADE
);

-- 확인
SELECT * FROM post;