/* view */
-- 테이블을 활용한 가상 테이블

-- view 사용 이유
-- VIEW는 원본 테이블을 참조해서 보여주는 용도이고
-- 보여지는건 실제 테이블(베이스 테이블)의 값이다.
-- 1) dba가 개발자에게 보여주고 싶은 내용만 보여주는 것
-- 2) 보여지는 컬럼을 알기 쉽게 표현(별칭)

SELECT
		 menu_name
	  , menu_price
	FROM tbl_menu;

DROP VIEW v_menu;
CREATE VIEW v_menu -- CREATE VIEW OR REPLACE하면
-- 있어도 교체해라, DROP문을 쓰지 않고 만들 수 있음 
AS
SELECT
		 menu_name '메뉴명'
	  , menu_price AS '메뉴 단가'
	FROM tbl_menu;
-- oracle에서는 with read only같은 권한 부여 가능

SELECT *FROM v_menu;
-- -------------------------------------
/* view를 통한 dml(절대 절대 비추!) */
-- 베이스 테이블(tbl_menu) 조회
SELECT * FROM tbl_menu;

-- view 생성
CREATE OR REPLACE VIEW hansik
AS
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
	FROM tbl_menu
  WHERE category_code = 4;

SELECT * FROM hansik;

-- hansik이라는 view를 통해 tbl_menu라는 베이스 테이블에
-- 영향을 줌(추가가 돼부렸다.)
INSERT
	INTO hansik
VALUES
(NULL, '식혜맛국밥', 5500, 4, 'y');

SELECT * FROM hansik;
SELECT * FROM tbl_menu;

UPDATE hansik
	SET menu_name = '버터맛국밥'
	  , mxenu_price = 6000
 WHERE menu_name = '식혜맛국밥';
 
-- 원본 테이블 영향 주지 않는 방법
CREATE OR REPLACE VIEW v_test
AS
SELECT 
		 AVG(menu_price) + 3
	FROM tbl_menu;

INSERT INTO v_test values(10);

-- -------------------------------------

