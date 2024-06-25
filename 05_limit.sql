-- limit
-- 전체 행 조회
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	FROM tbl_menu
  ORDER BY menu_price DESC;
  
--   정렬 후 4번 인덱스 위치부터 3개를 잘라라
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	FROM tbl_menu
  ORDER BY menu_price DESC
  LIMIT 4,3;


-- 값이 다른데, limit까지 할 시에 데이터 체계가 다르다
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	FROM tbl_menu
  ORDER BY menu_price DESC;
-- limit이 포함된 order by랑 단순 order by는 정렬 기준 컬럼의 값이
-- 같으면 약간의 순서 차이가 있을 수 있다.(추가적인 정렬로 조정 가능)
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	FROM tbl_menu
  ORDER BY menu_price DESC, menu_code desc
  LIMIT 4,3;

SELECT
		 *
	FROM tbl_menu
   ORDER BY menu_code limit 10; 
	-- 하나의 수치만 주면 length의 의미를 가지게 됨

-- db의 인덱스 체계는 (0 ~9)

