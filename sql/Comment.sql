-- 테이블 생성
CREATE TABLE comment (
    id VARCHAR(10) NOT NULL,
    num INT PRIMARY KEY NOT NULL,
    post_num INT NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    context VARCHAR(4000) NOT NULL,
    postdate DATETIME DEFAULT NOW() NOT NULL,
    FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (post_num) REFERENCES post(num) ON DELETE CASCADE,
    FOREIGN KEY (nickname) REFERENCES member(nickname) ON UPDATE CASCADE
);

-- 확인
SELECT * FROM reply;