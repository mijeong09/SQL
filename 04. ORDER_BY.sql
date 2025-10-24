USE world;

SELECT * FROM country
ORDER BY Population DESC;

SELECT * FROM country
ORDER BY Name;

-- 다중 컬럼 정렬: 앞부터 우선 순위
SELECT * FROM country
ORDER BY Continent, Population DESC;

-- 실행순서 : FROM -> WHERE -> ORDER -> SELECT
SELECT * FROM country
WHERE Continent = 'Asia'
ORDER BY GNP;

SELECT * FROM country
ORDER BY Population DESC
LIMIT 5;

-- OFFSET: 건너 뛸 개수
SELECT * FROM country
ORDER BY Population DESC
LIMIT 5 OFFSET 10;

-- 축약 문법
SELECT * FROM country
ORDER BY Population DESC
LIMIT 5, 7;