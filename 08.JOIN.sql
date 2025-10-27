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

SELECT
	c1.Name, c2.Name
FROM city c1 INNER JOIN city c2
ON c1.ID = c2.ID
WHERE c1.CountryCode = 'KOR';

SELECT
	*
FROM country co INNER JOIN city ci ON co.Code = ci.CountryCode
				INNER JOIN countrylanguage cl ON ci.CountryCode = cl.CountryCode
;