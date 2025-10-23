# SQL 기초 학습

이 저장소는 SQL 기초 개념을 학습하고 정리하기 위해 만들어졌습니다.

## 목차

1.  [SELECT](#1-select---데이터-조회)
2.  [WHERE](#2-where---조건부-데이터-필터링)
3.  [정렬과 제한 (ORDER BY & LIMIT)](#3-정렬과-제한)
4.  [DML (Data Manipulation Language)](#4-dml---데이터-조작어)
5.  [DDL (Data Definition Language)](#5-ddl---데이터-정의어)
6.  [집계 (Aggregation)](#6-집계---데이터-요약)
7.  [GROUP BY](#7-group-by---데이터-그룹화)
8.  [CASE](#8-case---조건부-표현식)

---

## 1. SELECT - 데이터 조회
- 기본적인 데이터 조회 방법
- `SELECT` 와 `FROM` 절의 사용

## 2. WHERE - 조건부 데이터 필터링
- `WHERE` 절을 사용한 특정 조건의 데이터 선택
- 다양한 비교 연산자 (`=`, `>`, `<`, `IN`, `BETWEEN`) 활용

## 3. 정렬과 제한
- `ORDER BY`: 결과 데이터 정렬 (ASC, DESC)
- `LIMIT`: 조회할 데이터의 수 제한

## 4. DML (Data Manipulation Language) - 데이터 조작어
- `INSERT`: 새로운 데이터 추가
- `UPDATE`: 기존 데이터 수정
- `DELETE`: 데이터 삭제

## 5. DDL (Data Definition Language) - 데이터 정의어
- `CREATE`: 데이터베이스 객체 (테이블 등) 생성
- `ALTER`: 기존 객체의 구조 변경
- `DROP`: 객체 삭제

## 6. 집계 - 데이터 요약
- `COUNT()`: 행의 개수 계산
- `SUM()`: 값의 합계
- `AVG()`: 값의 평균
- `MAX()` / `MIN()`: 최대 / 최소값

## 7. GROUP BY - 데이터 그룹화
- `GROUP BY` 절을 사용한 데이터 그룹화
- `HAVING`: 그룹화된 결과에 대한 조건 적용

## 8. CASE - 조건부 표현식
- `CASE` 문을 사용하여 쿼리 내에서 조건부 로직 구현
- `WHEN`, `THEN`, `ELSE`, `END` 키워드 사용법
