-- SELECT * FROM tbl_menu;
-- --------------------------------------
-- SELECT 
-- 		 menu_code
-- 	  , menu_name
-- 	  , menu_price
-- 	  , category_code
-- 	  , orderable_status	
-- 	FROM tbl_menu;
-- 	from절을 처음 해석
-- 	5개의 열이 from 절의 행의 갯수만큼 출력했다.

-- --------------------------------------
-- SELECT
-- 		 category_code
-- 	  , category_name
-- 	  , ref_category_code
-- 	FROM tbl_category;
-- 	
-- --------------------------------------
SELECT
		 menu_name
	  , category_name
	FROM tbl_menu
	JOIN tbl_category ON tbl_menu.category_code = tbl_category.category_code;
	
-- --------------------------------------
-- from절 없는 select 해보기
SELECT 7+3;
SELECT 10 * 2; 
SELECT 6% 3, 6 % 4;
SELECT NOW(); -- 현재 시간
SELECT CONCAT('유', ' ', '관순');  --문자열 합하기

-- SELECT CONCAT('메뉴 이름은 : ',menu_name,'이고 가격은 ', menu_price, '입니다. ') FROM tbl_menu;

-- 별칭(alias) 달아보기
SELECT 7+3 AS '합', 10*2 AS '곱';
SELECT NOW() AS '현재 시간';
SELECT 7+3 AS 합입니다; --별칭을 달 때, 특수기호가 있다면 싱글 쿼테이션(')을 반드시 추가한다.

