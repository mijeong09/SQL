CREATE DATABASE temp;
CHARACTER SET utf8mb4;
-- 한글 깨짐 방지 인코딩  

-- 데이터 베이스 삭제
DROP DATABASE temp;

-- 데이터 목록 조히
SHOW DATABASES;

-- 데이터 베이스 사용
USE temp;

-- 테이블 생성
CREATE TABLE customer (
	id		INT				PRIMARY KEY AUTO_INCREMENT,
    name	VARCHAR(50)		NOT NULL,
    email	VARCHAR(100)	NOT NULL
);

CREATE TABLE orders (
	id				INT			PRIMARY KEY AUTO_INCREMENT,
	customer_id		int			NOT NULL,
    FOREIGN KEY (customer_id)	REFERENCES customer(id)
);

-- 테이블 삭제
DROP TABLE customer;

DESCRIBE customer;
DESCRIBE orders;

ALTER TABLE customer
ADD COLUMN phone VARCHAR(50);

ALTER TABLE customer
MODIFY COLUMN phone VARCHAR(50) NOT NULL;

ALTER TABLE customer
CHANGE COLUMN phon phone_num VARCHAR(50) NOT NULL;

ALTER TABLE customer
DROP COLUMN phone_num;

-- 1일 경우 참조키에 영향을 미치기 때문에 안됨
-- TRUNCATE TABLE customer;
TRUNCATE TABLE orders;
DROP TABLE orders;

-- 이제 가능
TRUNCATE TABLE customer;