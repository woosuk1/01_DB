-- type casting
-- 명시적 형변환

-- 1) 숫자 -> 숫자
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격평균'
	FROM tbl_menu;
DESC tbl_menu;

-- 소수점 이하 한자리까지만 표기할 수도 있다.
SELECT CAST(AVG(menu_price) AS float) AS '가격평균'
	FROM tbl_menu;

INSERT INTO tbl_menu VALUES ( NULL, '커피맛푸딩', 2000, 8,'y');

-- 소수점 이하 12자리까지도 표기할 수 있따.
SELECT CAST(AVG(menu_price) AS double) AS '가격평균'
	FROM tbl_menu;

-- 2) 문자 -> 날짜
-- 2024년 6월 27일을 date형으로 반환
-- 자동으로 인식해주는 $ -> delimiter
SELECT CAST('2024$6$27' AS DATE);
SELECT CAST('2024#6#27' AS DATE);

-- 3) 숫자 -> 문자
-- 아래 예는 묵시적 형변환 한 예이다.
SELECT CONCAT(1000, '원');
-- 명시적으로는..
SELECT CONCAT(CAST(1000 AS CHAR), '원');

-- 암시적 형변환
-- MARIADB 연산 시 치환하기 힘든 문자열은 0으로 치환 적용
-- '반가워'가 0으로 치환(true에 해당되는 건 1, false는 0)
SELECT 1 + '2'; 
SELECT 5 > '반가';

SELECT RAND(), FLOOR(RAND() * (11 -1 ) + 1);

SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);