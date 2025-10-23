USE temp;

DROP TABLE customer;

CREATE TABLE customer (
	id		INT				PRIMARY KEY AUTO_INCREMENT,
    name	VARCHAR(50)		NOT NULL,
    email	VARCHAR(100)	NOT NULL
);

-- CRUD
INSERT INTO customer (name, email) VALUES 
('kim', 'asdf@naver.com'),
('lee', '1234@gmail.com'),
('hong', 'qwer@naver.com')
;
-- '*' 모든 것을 의미 
SELECT * FROM customer;
UPDATE customer SET 
	email = '1234@naver.com',
	name = 'choi'
WHERE id = 1;
DELETE FROM customer WHERE id = 1;

-- SELECT
SELECT name, email AS 이메일, id FROM customer;

USE world;

SELECT DISTINCT Continent FROM country;