USE world;

SELECT * FROM country WHERE Code = 'AFG';
SELECT * FROM country WHERE NAME = 'South Korea';
SELECT * FROM country WHERE Continent = 'Asia';

SELECT * FROM country WHERE LifeExpectancy >= 80;
SELECT * FROM country WHERE GNP < 10000;

SELECT * FROM country WHERE Continent = 'Asia' AND Population >= 100000000;
SELECT * FROM country WHERE Continent = 'Europe' OR Continent = 'North America';

-- 똑같은 결과
SELECT * FROM country WHERE Continent != 'Asia';
SELECT * FROM country WHERE NOT Continent = 'Asia';

SELECT * FROM country WHERE LifeExpectancy >= 70 AND LifeExpectancy <= 80;
-- BETWEEN 은 이상,이하
-- 숫자에 사용
SELECT * FROM country WHERE LifeExpectancy BETWEEN 70 AND 80;

-- 문자열에 사용
SELECT * FROM country WHERE Continent IN ('Asia', 'Europe');

-- * 과 같음 (개수 제한 X)
SELECT * FROM country WHERE Name LIKE 'South%';
SELECT * FROM country WHERE Name LIKE '%States%';
-- ? 와 같음 (문자의 개수 제한)
SELECT * FROM country WHERE Name LIKE '_____';
SELECT * FROM country WHERE Name LIKE '___land';

SELECT * FROM country;

-- = 연산자는 숫자와 문자열에만 사용가능함
-- SELECT * FROM country WHERE GNPOld = NULL;
SELECT * FROM country WHERE GNPOld IS NULL;
SELECT * FROM country WHERE IndepYear IS NOT NULL;

-- 실습
USE sakila;
SELECT * FROM film;

-- 대여료(`rental_rate`)가 4달러 이상인 영화의 제목과 대여료 조회
SELECT title, rental_rate	
FROM film WHERE rental_rate >= 4;

-- 상영시간(`length`)이 120분 미만인 영화 조회
SELECT * FROM film WHERE length < 120;

-- 등급(`rating`)이 'PG-13'인 영화 조회
SELECT * FROM film WHERE rating = 'PG-13';

-- 등급이 'PG'이고 대여료가 3달러 이상인 영화
SELECT * FROM film WHERE rating = 'PG' AND rental_rate >= 3;

-- 등급이 'G' 또는 'PG'인 영화
SELECT * FROM film WHERE rating =  'G' OR rating = 'PG';

-- 상영시간이 60분 미만이거나 180분 이상인 영화
SELECT * FROM film WHERE length < 60 OR length >= 180;

-- 제목에 'LOVE'가 포함된 영화 조회
SELECT * FROM film WHERE title LIKE '%LOVE%';

-- 제목이 'THE'로 시작하는 영화 조회
SELECT * FROM film WHERE title LIKE 'THE%';

-- 배우 성(`last_name`)이 'SON'으로 끝나는 배우 조회
SELECT * FROM actor WHERE last_name LIKE '%SON';

-- 등급이 'PG-13'인 영화 중에서 대여료가 2.99달러 이상 4.99달러 이하이고, 상영시간이 90분 이상인 영화 
SELECT * FROM film
	WHERE rating = 'PG-13'
	AND rental_rate BETWEEN 2.99 AND 4.99
    AND length >= 90;
