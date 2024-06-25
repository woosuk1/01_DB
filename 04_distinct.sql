-- distinct
SELECT
		 category_code
	FROM tbl_menu
  ORDER BY category_code;

--  메뉴가 할당된 카테고리 종류
SELECT
		 DISTINCT category_code
	FROM tbl_menu
  ORDER BY category_code;
  
-- 상위 카테고리 조회하기
-- 여러가지 해석 및 쿼리가 존재한다.
-- 1) where 절 활용
SELECT
		 *
	FROM tbl_category
	WHERE ref_category_code IS NULL;

-- 2) 아래 코드를 통해 카테코리의 상위 카테고리 번호를 알 수 있다.
SELECT
		 distinct ref_category_code
-- 	  , category_name
	FROM tbl_category
	WHERE ref_category_Code IS NOT null;
	
-- 서브 쿼리 활용하면 하나의 쿼리로 작성 가능
-- 아래의 예에서 서브쿼리는 1,2,3을 인자로 줌
SELECT
		 *
	FROM tbl_category
	WHERE ref_category_code IN(SELECT DISTINCT ref_category_code
											FROM tbl_category
										  WHERE ref_category_code IS NOT NULL
											);
-- 다중열 distinct , set로 묶어서 중복 체크
SELECT
		 category_code
	  , orderable_status
	FROM tbl_menu;

-- set로 묶어서 중복체크(distinct 한번에 묶기)
SELECT
		 DISTINCT
		 category_code
	  , orderable_status
	FROM tbl_menu;
	

