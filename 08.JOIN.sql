USE world;

SELECT * FROM city WHERE CountryCode = 'KOR';
SELECT * FROM country WHERE Code = 'KOR';

SELECT
	ci.Name AS 도시명, 
    co.Name AS 나라명,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population / co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Name = 'South Korea';

SELECT
	co.Name,
    COUNT(*)
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
GROUP BY co.Name
ORDER BY COUNT(*) DESC;

SELECT
	co.Continent,
    COUNT(*),
    AVG(ci.Population)
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
GROUP BY co.Continent;


SELECT
	COUNT(DISTINCT co.Code) AS '전체국가수_join',
	(SELECT COUNT(*) FROM country) AS '전체국가수_country'
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code;

SELECT
	*
FROM country co LEFT JOIN city ci
ON co.Code = ci.CountryCode
ORDER BY co.Population;

-- SELF JOIN
SELECT
	c1.Name, c2.Name
FROM city c1 INNER JOIN city c2
ON c1.CountryCode = c2.CountryCode AND c1.ID < c2.ID
WHERE c1.CountryCode = 'KOR';

SELECT
	*
FROM country co INNER JOIN city ci ON co.Code = ci.CountryCode
				INNER JOIN countrylanguage cl ON ci.CountryCode = cl.CountryCode;
                
                
                
-- 실습
USE sakila;
-- 영화(`film`)와 언어(`language`) 테이블을 조인하여 다음을 조회하세요:
-- - 영화 제목 (`film.title`), 언어 이름 (`language.name`)
SELECT
	fi.title,
    lan.name
FROM film fi INNER JOIN language lan
ON fi.language_id = lan.language_id;

-- 영화와 카테고리를 조인하여 다음을 조회하세요:
-- - 영화 제목, 카테고리 이름, 대여료
SELECT
	fi.title, ca.name, fi.rental_rate
FROM film fi INNER JOIN film_category fica ON fi.film_id = fica.film_id
			 INNER JOIN category ca ON fica.category_id = ca.category_id;

-- 모든 고객(`customer`)과 그들의 대여 내역(`rental`)을 조회하세요.
-- - 고객 이름 (first_name, last_name), 대여 ID (rental_id), 대여 날짜 (rental_date)
SELECT
	cu.first_name, cu.last_name, ren.rental_id, ren.rental_date
-- 모든 고객: LEFT, 대출 이력이 있는 고객만: INNER
FROM customer cu LEFT JOIN rental ren ON cu.customer_id = ren.customer_id;

-- 고객별 대여 횟수를 조회하세요. (대여 횟수 0인 고객도 포함)
-- - 고객 이름, 대여 횟수, 대여 횟수가 많은 순서
SELECT
	first_name,
    last_name,
    COUNT(*)
-- 대여 횟수 0인 고객도 포함
FROM customer cu LEFT JOIN rental ren ON cu.customer_id = ren.customer_id
GROUP BY cu.customer_id
ORDER BY COUNT(*) DESC;

-- 같은 상영 시간(`length`)을 가진 영화 쌍을 찾으세요.
-- - 영화1 제목, 영화2 제목, 상영 시간, 상위 10개
SELECT
	f1.title, f2.title, f1.length
FROM film f1 INNER JOIN film f2
ON f1.length = f2.length AND f1.film_id < f2.film_id
ORDER BY f1.length DESC
LIMIT 10;