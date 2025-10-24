USE world;

SELECT * FROM country;
-- NULL 포함 모든 행 개수
SELECT COUNT(*) AS 총국가수 FROM country;

-- NULL 은 제외하고 COUNT
SELECT COUNT(LifeExpectancy) FROM country;

-- DISTINCT: 중복 제거
SELECT DISTINCT Continent FROM country;
-- COUNT 로 한번 더 감싸서 집계
SELECT COUNT(DISTINCT Continent) FROM country;

SELECT SUM(Population) FROM country;
SELECT SUM(Population)FROM country
WHERE Continent = 'Asia';

-- FROM -> 순서로 먼저 작성후 어떤 데이터를 볼지는 마지막에 정하기
-- SELECT ? FROM
SELECT SUM(Population) FROM country
WHERE Population >= 100000000;

-- 숫자라서 연산도 가능
SELECT ROUND(SUM(SurfaceArea) / 10000, 2) FROM country;

SELECT AVG(Population) FROM country;
SELECT AVG(Population) FROM country
WHERE Continent = 'Asia';

-- 서브 쿼리 : 결국 숫자를 반환하기 때문에 가능
-- 찾고자 하는 데이터를 먼저 찾고 그 결과를 이용하는 것
SELECT * FROM country
WHERE Populaion = (SELECT MAX(Population) FROM country) ;
(SELECT MAX(Population) FROM country);

SELECT
	COUNT(*),
    SUM(Population),
    AVG(Population),
    MAX(Population),
    MIN(Population)
FROM country;

SELECT LifeExpectancy FROM country;
SELECT AVG(LifeExpectancy) FROM country;
-- COALESCE: 2개의 테이블을 합침, 단축 평가를 생각하면 됨
SELECT AVG(COALESCE(LifeExpectancy, 10)) FROM country;



-- 실습
USE sakila;

-- 전체 영화 개수
SELECT COUNT(*) FROM film;

-- 등급(rating)이 'PG'인 영화 개수
SELECT COUNT(*) FROM film
WHERE rating = 'PG';

-- 서로 다른 등급(rating)의 개수
SELECT COUNT(DISTINCT rating) FROM film;

-- 모든 영화의 대여료(rental_rate) 합계
SELECT SUM(rental_rate) FROM film;

-- 모든 영화의 평균 대여료 (소수점 둘째 자리)
SELECT ROUND(AVG(rental_rate), 2) FROM film;

-- 등급이 'R'인 영화의 평균 대여료
SELECT AVG(rental_rate) FROM film
WHERE rating = 'R';

-- 가장 비싼 대여료와 해당 영화 제목
SELECT title FROM film 
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- 가장 긴 상영 시간(length)과 해당 영화 제목
SELECT title FROM film
WHERE length = (SELECT MAX(length) FROM film);

-- 가장 짧은 상영 시간과 해당 영화 제목
SELECT title FROM film
WHERE length = (SELECT MIN(length) FROM film);

-- film 테이블의 다음 통계를 한 번에 조회하세요 
-- 		전체 영화 수, 총 대여료 합계, 평균 대여료, 최고 대여료, 최저 대여료, 평균 상영 시간
SELECT
	COUNT(*),
    SUM(rental_rate),
	AVG(rental_rate),
	MAX(rental_rate),
    MIN(rental_rate),
    AVG(length)
FROM film;