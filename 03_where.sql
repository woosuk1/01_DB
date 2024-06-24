-- where절 
-- 주문가능한 메뉴만 조회(메뉴이름, 메뉴가격, 주문가능실태)
SELECT
		 menu_name
	  , menu_price
	  , orderable_status
	FROM tbl_menu
	WHERE orderable_status = 'y';
-- 	WHERE orderable_status = 'n';

-- desc를 통해 컬럼명 빠르게 확인
DESC tbl_menu;
-- --------------------------------------
-- '기타' 카테고리에 해당하지 않은 메뉴를 조회하시오.
-- 1)카테고리명이 '기타'인 카테고리는 카테고리 코드가 10번이다.
SELECT
		*	
	FROM tbl_category
	WHERE category_name = '기타';

-- mariadb의 is not은 !=과 <> 이다.
-- 2) 카테고리 코드가 10번이 아닌 메뉴 조회
SELECT
		*
	FROM tbl_menu
-- 	WHERE category_code != 10;
 	WHere category_code <> 10; 


-- 대소 비교를 where 절에 활용할 수 있다. (<, >, >=, <=)
SELECT
		 *
	FROM tbl_menu
	WHERE menu_price >= 5000
	ORDER BY menu_price;
-- 5000원 이상이면서 7000원 미만인 메뉴 조회
SELECT
		 *
	FROM tbl_menu
	WHERE 5000 <= menu_price 
	  AND 7000 > menu_price;
--  10000원보다 크거나 5000원 이하인 메뉴 조회
SELECT
		 *
	FROM tbl_menu
	WHERE 10000 < menu_price OR 5000 >= menu_price;

-- --------------------------------------------------------
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
	FROM tbl_menu
  WHERE menu_price > 5000
     OR category_code = 10;
     
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
	FROM tbl_menu
  WHERE menu_price > 5000
    and category_code = 10;

-- --------------------------------------------------------------
-- between 연산자 활용하기
-- 가격이 5000원 이상이면서 9000원 이하인 메뉴 전체 컬럼 조회
SELECT
		 *
	FROM tbl_menu
  WHERE menu_price >= 5000
    AND menu_price <= 9000;

-- 닫힌 구간일 때(이상, 이하)
SELECT
		 *
	FROM tbl_menu
  WHERE menu_price BETWEEN 5000 AND 9000;

-- 반대 범위도 테스트
SELECT
		 *
	FROM tbl_menu
  WHERE menu_price NOT BETWEEN 5000 AND 9000;
  

-- ----------------------------------------------
-- like문
-- 제목, 작성자 등을 검색할 때 사용
SELECT
		 *
	FROM tbl_menu
  WHERE menu_name LIKE '%밥%';
  
SELECT
		 *
	FROM tbl_menu
  WHERE menu_name NOT LIKE '%밥%';

-- --------------------------------
-- in 연산자
SELECT
		 *
	FROM tbl_menu
  WHERE category_code = 5
     OR category_code = 8
     OR category_code = 10;
     
SELECT
		 *
	FROM tbl_menu
--   WHERE category_code IN (5,8,10);
  WHERE category_code not IN (5,8,10);
  
-- --------------------------------------------
-- is null 연산자 활용
SELECT
		 *
	FROM tbl_category
  WHERE ref_category_code is NULL;

SELECT
		 *
	FROM tbl_category
  WHERE ref_category_code is not NULL;