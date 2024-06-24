-- order by(정렬)

-- 오름차순(ascending, asc)
-- 내림차순(descending, desc)
SELECT
		 menu_code -- 1
	  , menu_name -- 2
	  , menu_price -- 3
	FROM tbl_menu
-- 	ORDER BY menu_price asc;
-- 	ORDER BY menu_price ASC, menu_name DESC; -- 우선순위 순으로 정렬
-- 	ORDER BY 3 ASC, 2 DESC; -- select 절의 컬럼 순번으로 정렬(테이블슌 x)
 	ORDER BY 3, 2 DESC; -- asc는 생략가능(default기 때문)

-- 별칭을 이용한 정렬
SELECT 
		 menu_code AS '메뉴코드' -- ''생략 메뉴코드 가능 
	  , menu_name AS 'mn'
	  , menu_price AS 'mp'
	FROM tbl_menu
	ORDER BY '메뉴코드' DESC; -- 싱클쿼테이션 생략 불가(별칭에 특수기호x)
	
-- -------------------------------------------------------
-- mariadb는 field함수를 활용해서 정렬이 가능하다.
SELECT FIELD('a', 'b', 'c', 'a'); -- 첫번쨰 인자 기준 위치 잡기

SELECT --주어진 인자기준으로 정렬하면 됨 
		 orderable_status
	  , FIELD(orderable_status, 'N', 'Y')
	FROM tbl_menu;

-- field를 활용한 order by
-- 주문 가능한 것부터 보이게 정렬하기
SELECT
		 menu_name
	  , orderable_status
	FROM tbl_menu
	ORDER BY FIELD(orderable_status, 'N', 'Y') DESC;
	-- 데이터를 숫자로 바꿔서 정렬할 때 (1,2의 값을 가지고 정렬)
	
SELECT * FROM tbl_category;
-- --------------------------------------------------------
-- null 값(비어 있는 컬럼값에 대한 정렬)
-- 1) 오름차순 시: null 값이 먼저 나옴
SELECT
		 *
	FROM tbl_category
	ORDER BY ref_category_code asc;
	
-- 2) 내림차순 시: null 값이 나중에 나옴
SELECT
		 *
	FROM tbl_category
	ORDER BY ref_category_code DESC;
	
-- 3) 오름차순에서 NULL이 나중에 나오도록 바꿈
SELECT
		 *
	FROM tbl_category
	ORDER BY -ref_category_code DESC; -- desc를 통해 null을 나중으로 보내고 '-'로 desc와 반대로 진행(asc)

-- 4) 내림차순에서 null이 먼저 나오도록 바꿈
SELECT
		 *
	FROM tbl_category
	ORDER BY -ref_category_code;
