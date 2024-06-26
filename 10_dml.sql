/* DML(Data Manipulation Language) */
-- cqrs -> select 와 dml을 구분하는 것

-- insert, update, delete, select(dql(data query lang)

/* insert */
-- 새로운 행을 추가하는 구문이다.
-- 테이블의 행의 수가 증가한다.
SELECT * FROM tbl_menu;

INSERT
	INTO tbl_menu
( -- 컬럼 생략해도 되긴한다(추천x)
  menu_name
, menu_price
, category_code
, orderable_status
)
VALUES
(
  '초콜릿죽'
, 6500
, 7
, 'Y'
);

SELECT * FROM tbl_menu ORDER BY 1 DESC;

/* multi insert */
INSERT
	INTO tbl_menu
VALUES
(NULL, '참치맛아이스크림', 1700, 12,'Y'),
(NULL, '멸치맛아이스크림', 1500, 11,'Y'),
(NULL, '소시지맛커피', 2500, 8,'Y');
/* update */
-- 테이블에 기록된 컬럼값을 수정하는 구문이다.
-- 전체 행 갯수에는 변화가 없다.
SELECT
		 *
	FROM tbl_menu
  WHERE menu_name = '소시지맛커피';
  
UPDATE tbl_menu
	SET category_code = 7
 WHERE menu_code = 25;
 
-- subquery를 활용한 update
-- 다중행이면 = 대신 in을 써야함
UPDATE tbl_menu
	SET category_code = 6
 WHERE menu_Code in (SELECT menu_code
 							 FROM tbl_menu
							WHERE menu_name = '소시지맛커피');	
							
/* delete */
-- 테이블의 행을 삭제하는 구문이다.
-- 테이블의 행의 갯수가 줄어든다.

SELECT * FROM tbl_menu;
-- delete와 truncate 시간이 어떻게 다른가??
DELETE
	FROM tbl_menu;
--  rollback; 하면 복원됨
ROLLBACK;

-- mysql 또는 mariadb는 autocommit이 기본적으로 'on'이라
-- insert, update, delete 시에 베이스테이블(메모리)에 바로 반영된다.
-- 다시 살리고 싶다면 autocommit을 꺼주어야 한다.
SET autocommit = OFF;

DELETE
	FROM tbl_menu
  ORDER BY menu_price --메뉴가격 기준 오름차순
  LIMIT 2;
  
/* replace */
-- insert 시 primary key(null x, 중복 x, 이후 수정 x)
-- 또는 unique key(중복 x)가 충돌이 발생하지 않도록
-- replace를 통해 중복된 데이터는 덮어 씌울 수 있다.

 REPLACE
	INTO tbl_menu 
-- REPLACE tbl_menu 도 가능하다..!
 VALUES
(
  17
, '참기름소주'
, 5000
, 10
, 'y'
);

SELECT * FROM tbl_menu WHERE menu_code = 17;