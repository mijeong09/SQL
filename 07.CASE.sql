USE world;

SELECT 
	Name,
	Continent,
    -- 하나의 값을 반환
	CASE Continent
		WHEN 'Asia' THEN '아시아'
        WHEN 'Europe' THEN '유럽'
		ELSE 'etc'
	END
    -- 
FROM country;

SELECT
	Name,
    Population,
    CASE
		WHEN Population >= 100000000 THEN '큰 국가'
        WHEN Population >= 10000000 THEN '중간 국가'
        ELSE '작은 국가'
    END
FROM country;

SELECT
	Name, Population, GNP,
    CASE
		WHEN (GNP / Population) >= 0.02 THEN '선진국 O'
        ELSE '선진국 X'
    END
FROM country;

SELECT
	Name, Continent, Population
FROM country
WHERE Population >= 
CASE Continent
	WHEN 'Asian' THEN 50000000
    WHEN 'Europe' THEN 30000000
    ELSE 10000000
END;

SELECT
	Name, Continent, Population
FROM country
ORDER BY
	CASE Continent
		WHEN 'Asian' THEN Population
        WHEN 'Europe' THEN GNP
        ELSE Population
    END;
    
SELECT
	Continent, COUNT(*),
    SUM(CASE WHEN Population > 50000000 THEN 1 ELSE 0 END)
FROM country
GROUP BY Continent;

