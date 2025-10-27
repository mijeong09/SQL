USE temp;

-- 문제 1-1: 상위 5행 조회
-- 타이타닉 테이블에서 모든 컬럼의 상위 5개 행을 조회하세요.
SELECT * FROM titanic
LIMIT 5;

-- 문제 1-2: 전체 행 수 조회
-- 타이타닉 테이블의 전체 승객 수를 조회하세요. (결과 컬럼명: row_count)
SELECT COUNT(*) as row_count FROM titanic;

-- 문제 1-3: cabin 결측치(NULL) 개수
-- cabin 컬럼의 결측치(빈 문자열) 개수를 조회하세요.
SELECT
	SUM(CASE WHEN cabin = ''  THEN 1 ELSE 0 END)
FROM titanic;

-- 문제 1-4: 요금(fare) 기초 통계
-- 요금(fare)의 최솟값, 최댓값, 평균값을 조회하세요.
-- 평균값은 소수점 둘째 자리까지 반올림
SELECT
	MIN(fare),
    MAX(fare),
    ROUND(AVG(fare), 2)
FROM titanic;

-- 2. 기본 조회 (필터링 & 정렬)
-- 문제 2-1: 1등석 승객 조회
-- 1등석(pclass = 1) 승객의 이름(name), 티켓(ticket), 요금(fare)을 조회하세요.
SELECT
	name,
    ticket,
    fare
FROM titanic
WHERE pclass = 1;

-- 문제 2-2: 셰르부르(C) 항구 탑승자 조회
-- 셰르부르 항구(embarked = 'C')에서 탑승한 승객의 모든 정보를 조회하세요.
SELECT * FROM titanic
WHERE embarked = 'C';

-- 문제 2-3: 30세 미만 생존자 조회
-- 30세 미만이면서 생존한 승객의 이름(name), 나이(age), 성별(sex)을 조회하세요.
SELECT
	name,
    age,
    sex
FROM titanic
WHERE age > 30 AND survived = 1;

-- 문제 2-4: 요금이 비싼 순서로 정렬
-- 모든 승객을 요금이 비싼 순서로 정렬하여 조회하세요.
-- 이름(name), 등급(pclass), 요금(fare) 표시
SELECT
	name,
    pclass,
    fare
FROM titanic
ORDER BY fare DESC;

-- 문제 2-5: 복합 조건 - 여성 1등석 승객
-- 1등석 여성 승객의 이름(name), 나이(age), 요금(fare)을 조회하세요.
-- 나이가 어린 순서로 정렬
SELECT
	name,
    age,
    fare
FROM titanic
WHERE sex = 'female' AND pclass = 1
ORDER BY age;

-- 3. 데이터 집계 (Aggregation & Grouping)
-- 문제 3-1: 전체 생존율 및 생존/사망자 수
-- 다음 두 가지 정보를 각각 조회하세요:

-- 전체 생존율 (소수점 둘째 자리까지 백분율로 표시)
SELECT ROUND(AVG(survived) * 100, 2) FROM titanic;

-- 생존 여부별 승객 수
SELECT
	-- SUM(survived) as 생존자,
	-- COUNT(*) - SUM(survived) as 사망자
    survived,
    COUNT(*)
FROM titanic
GROUP BY survived;

-- 문제 3-2: 성별 생존율
-- 성별로 다음 정보를 조회하세요:

-- 총 승객 수
-- 생존자 수
-- 생존율 (소수점 둘째 자리까지 백분율)
-- 생존율이 높은 순서로 정렬
SELECT
	sex,
	COUNT(*),
	SUM(survived),
    ROUND(AVG(survived) * 100, 2) AS avg_survived
FROM titanic
GROUP BY sex
ORDER BY avg_survived DESC;

-- 문제 3-3: 티켓 등급별 생존율 및 평균 요금
-- 다음 두 가지 정보를 각각 조회하세요:

-- 등급별 생존율
SELECT
	pclass,
    AVG(survived)
FROM titanic
GROUP BY pclass;

-- 등급별 평균 요금, 최소 요금, 최대 요금
SELECT
	pclass,
    AVG(fare),
    MIN(fare),
    MAX(fare)
FROM titanic
GROUP BY pclass;

-- 문제 3-4: 항구별, 등급별 승객 수
-- 탑승 항구와 등급별로 승객 수를 조회하세요.

-- embarked가 NULL인 데이터는 제외
-- 항구, 등급 순서로 정렬
SELECT
	embarked,
    pclass,
	COUNT(*)
FROM titanic
WHERE embarked != ''
GROUP BY embarked, pclass
ORDER BY embarked, pclass;


-- 문제 3-5: 성별 및 등급별 생존율
-- 등급과 성별로 다음 정보를 조회하세요:

-- 총 승객 수
-- 생존자 수
-- 생존율 (백분율)
-- 등급, 성별 순서로 정렬
SELECT
	pclass,
    sex,
	COUNT(*),
    SUM(survived),
    AVG(survived)
FROM titanic
GROUP BY pclass, sex
ORDER BY pclass, sex;

-- 문제 3-6: 가족 동반 유무에 따른 생존율
-- 다음 두 가지 정보를 각각 조회하세요:

-- '혼자' vs '가족동반' 생존율 비교
-- 가족 규모 = sibsp + parch
-- 0명이면 '혼자', 1명 이상이면 '가족동반'
SELECT
    CASE 
		WHEN (sibsp + parch) = 0 THEN '혼자' 
        ELSE '가족'
	END AS family,
    AVG(survived)
FROM titanic
GROUP BY family;

-- 가족이 1명이라도 있는 승객의 평균 생존율
SELECT
	AVG(survived)
FROM titanic
WHERE sibsp > 0 OR parch > 0;

-- 문제 3-7: 가족 규모별 생존율
-- 가족 규모(본인 포함 = 1 + sibsp + parch)별로 승객 수와 생존율을 조회하세요.
-- 가족 규모 순서로 정렬
SELECT
	(1 + sibsp + parch) AS 가족규모,
    COUNT(*),
    AVG(survived)
FROM titanic
GROUP BY 가족규모
ORDER BY 가족규모;


-- 4. 고급 분석 (CASE & HAVING & 서브쿼리)
-- 문제 4-1: 연령대별 승객 수 및 생존율
-- 다음 방식으로 연령대를 구분하여 생존율을 조회하세요:

-- 3개 그룹으로 구분
-- 18세 미만 → 'Child'
-- 18-60세 → 'Adult'
-- 60세 초과 → 'Senior'
-- -- 여기에 SQL 쿼리를 작성하세요
SELECT
	-- CASE의 두가지 형식 중 '조건 표현식'
	CASE
		WHEN age > 60 THEN 'Senior'
        WHEN age > 18 THEN 'Adult'
        ELSE 'Child'
	END AS age_group,
	AVG(survived)
FROM titanic
GROUP BY age_group;

-- 문제 4-2: 요금 구간(Band)별 생존율
-- 요금을 다음 구간으로 분류하고 생존율을 조회하세요:

-- 10달러 미만 → '저가(<10)'
-- 10-30달러 → '중저가(10-29)'
-- 30-100달러 → '중고가(30-99)'
-- 100달러 이상 → '고가(100+)'
-- 요금 구간 순서로 정렬
SELECT
	CASE
		WHEN fare < 10 THEN '저가'
        WHEN fare < 30 THEN '중저가'
        WHEN fare < 100 THEN '중고가'
        ELSE '고가'
    END AS fare_group,
    AVG(survived)
FROM titanic
GROUP BY fare_group
ORDER BY
	CASE fare_group
		WHEN '저가' THEN 1
        WHEN '중저가' THEN 2
        WHEN '중고가' THEN 3
        ELSE 4
    END;

-- 문제 4-3: 평균 요금이 50달러가 넘는 등급 (HAVING)
-- 등급별로 평균 요금을 계산하되, 평균 요금이 50달러를 초과하는 등급만 조회하세요.

-- 힌트: HAVING 절 사용
SELECT
	pclass,
	AVG(fare)
FROM titanic
GROUP BY pclass
HAVING AVG(fare) > 50;

-- 문제 4-4: 전체 평균 요금보다 많이 낸 승객 (서브쿼리)
-- 전체 평균 요금보다 많이 지불한 승객을 조회하세요.

-- 이름(name), 등급(pclass), 요금(fare), 전체 평균 요금 표시
-- 요금이 높은 순서로 정렬
-- 상위 20명만 조회
-- 힌트: 서브쿼리 사용
SELECT
	name,
    pclass,
    fare,
    (SELECT AVG(fare) FROM titanic) 
FROM titanic
WHERE fare > (SELECT AVG(fare) FROM titanic)
ORDER BY fare DESC
LIMIT 20;

-- 문제 4-5: 3등석 평균 나이보다 많은 1등석 승객 (서브쿼리)
-- 1등석 승객 중 3등석 평균 나이보다 나이가 많은 승객을 조회하세요.

-- 이름(name), 나이(age), 등급(pclass), 3등석 평균 나이 표시
-- 나이가 많은 순서로 정렬
-- 상위 20명만 조회

SELECT
	name, age, pclass,
    (SELECT AVG(age) FROM titanic WHERE pclass = 3)
FROM titanic
WHERE pclass = 1 AND age > (SELECT AVG(age) FROM titanic WHERE pclass = 3)
ORDER BY age DESC
LIMIT 20;

