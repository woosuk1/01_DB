-- join

-- alias(별칭)
-- 컬럼에 별칭을 다는 것 외에도 from절에 작성되는 것들에 별칭도 추가 가능
-- 테이블 또는 from 절에 별칭을 추가할 때는 (') 없이 별칭을 작성한다
-- as는 생략가능하다.

SELECT
		 a.category_code
	  , a.menu_name
 	FROM tbl_menu AS a -- 별칭을 테이블에 달 수 있고, 구분이 잘되게 
  ORDER BY a.category_code, a.menu_name;
  

-- inner join(내부 조인)
-- inner라는 키워드는 생략해도 inner join이다.
-- 1) on을 활용
-- 풀면 menu 테이블을 보고싶은데, 카테고리 테이블에 있는 이름도 볼래
SELECT
		 a.menu_name
	  , b.category_name
	  , b.category_code
	  , a.menu_code
	FROM tbl_menu a
  INNER JOIN tbl_category b ON a.category_code = b.category_code;

-- (foreign key와 primary key가)category code가 매핑이 되지 않는다면
-- 같지 않는다면 innerjoin은 가져오지 않는다.
SELECT
		 a.*
	  , b.*
	FROM tbl_menu a
--   INNER JOIN tbl_category b ON a.category_code = b.category_code;
  JOIN tbl_category b ON a.category_code = b.category_code; -- 같다

-- 2) USING을 활용
-- join할 테이블들의 매핑 컬럼명들이 동일할 경우에만 사용 가능한 문법
SELECT
		 a.menu_name
	  , b.category_name
	  , b.category_code
	FROM tbl_menu a
  INNER JOIN tbl_category b USING (category_code);

-- -------------------------------------------------
-- outer join
-- 1) left join
-- category는 다 보여줬으면 좋겠다
SELECT
		 a.category_name
	  , b.menu_name
	FROM tbl_category a
	LEFT JOIN tbl_menu b ON (a.category_code = b.category_code);

-- 2) right join
SELECT
		 a.menu_name
	  , b.category_name
	FROM tbl_menu a
 RIGHT join tbl_category b ON (a.category_code = b.category_code);
--  살리고 싶을 때  left join tbl_abc -> 앞선 카테고리 살려야하니까.

-- 3) cross join
-- 매핑은 필요없다..! 
SELECT
		 a.menu_name
	  , b.category_name
	FROM tbl_menu a
  CROSS JOIN tbl_category b;
  
-- 4) self join
-- a에 해당하는 것은 하위 카테고리, b에 해당하는 것은 상위 카테고리
SELECT
		 a.category_name
	  , b.category_name
	FROM tbl_category a
	JOIN tbl_category b ON (a.ref_category_code = b.category_code);
