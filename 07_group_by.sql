-- group by 절

-- 메뉴가 존재하는 카테고리 그룹 조회
-- 그룹 함수(sum, avg, count)를 적용하기 위한 설정
SELECT
		 category_code
	FROM tbl_menu
	GROUP BY category_code;
	
-- count 함수 활용

-- column 개수 count
SELECT
		 COUNT(*)
	FROM tbl_menu;
-- count 함수 활용
SELECT
		 COUNT(*)
	  , concat(a.category_code, '번 카테고리') AS '카테고리 번호'
-- 	  , a.menu_name  무의미하다, 그룹에 대표격이라 쓰레기값
	FROM tbl_menu a
  GROUP BY a.category_code;
  
-- count 함수
-- count(컬럼명 또는 *)
-- count(컬럼명) 해당 컬럼에 null이 아닌 행의 갯수
-- count(*) 모든 행의 갯수
SELECT
		 COUNT(*) AS '모든 카테고리 행'
	  , COUNT(ref_category_Code) AS '상위 카테고리가 존재하는 카테고리'-- null인 개수 제외 count
	FROM tbl_category;

-- sum 함수 활용
SELECT
		 a.category_code
	  , CONCAT(SUM(a.menu_price), '원입니다') AS 메뉴가격	 
	FROM tbl_menu a
  GROUP BY a.category_code;

-- avg 함수 활용
-- 함수도 중첩이 가능하다
SELECT
		 category_code
	  , floor(AVG(menu_price))
	FROM tbl_menu
  GROUP BY category_code;

-- having 절
SELECT
		 SUM(menu_price)
	  , category_code
	FROM tbl_menu
  GROUP BY category_code 
--   having category_code BETWEEN 5 AND 9;
  HAVING SUM(menu_price) >= 20000;
  
SELECT
		 category_code
	  , menu_price
	FROM tbl_menu
  WHERE menu_price > 10000
  GROUP BY category_code
 HAVING AVG(menu_price)> 12000 -- having 절은 주로 그룹함수 또는 그룹 단위 조건
  ORDER BY 1 DESC;
  
-- -------------------
-- rollup
-- group을 묶을 때 하나의 기준(하나의 컬럼)으로 그룹화하여 rollup을 하면
-- 총 합계의 개념이 나온다.
SELECT
		 sum(menu_price) 
	  , category_code 
	FROM tbl_menu
  GROUP BY category_code
   WITH ROLLUP;
   
-- group을 묶을 때 여러개의 기준(여러개의 칼럼)으로 그룹화하여 rollup
SELECT 
		 SUM(menu_price)
	  , menu_price
	  , category_code
	FROM tbl_menu
  GROUP BY menu_price, category_code
   WITH ROLLUP;