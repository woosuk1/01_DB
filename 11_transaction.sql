/* transaction */

-- autocommit 비활성화
SET autocommit = 0;
SET autocommit = off;

-- autocommit 활성화
SET autocommit = 1;
SET autocommit = ON;

-- transaction? -> 하나의 작업단위

START transaction;
INSERT 
	INTO tbl_menu
VALUES
(
  NULL, '바나나해장국', 8500
, 4, 'y'
);
-- 내역
UPDATE tbl_menu
	SET menu_name = '수정된 메뉴'
 WHERE menu_code = 5;
 
SELECT * FROM tbl_menu;

ROLLBACK;

SELECT * FROM tbl_menu;
