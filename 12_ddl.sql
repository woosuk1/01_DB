/*ddl(data definition language)*/
CREATE TABLE if NOT EXISTS tb1(
	pk INT PRIMARY KEY, -- 일종의 제약조건
	fk INT,
	col1 VARCHAR(255), -- 255byte정도면,,사진 포함한 데이터까지 보낼 수 있다.
	CHECK(col1 IN ('Y', 'N')) -- 제약조건 y or n
) ENGINE = INNODB;

-- 존재하는 테이블을 요약해서 보고 싶다면 describe 키워드 가능
DESC tb1;

INSERT
	INTO tb1
VALUES
(
  1,2,'Y'
);

/* auto_increment */
/* drop */
DROP TABLE tb2;

CREATE TABLE tb2(
	pk INT PRIMARY KEY AUTO_INCREMENT,
	fk INT,
	col1 VARCHAR(255),
	CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

DESC tb2;

INSERT
	INTO tb2
VALUES
(
  NULL
, 2
, 'n'
);

SELECT * FROM tb2;
COMMIT;
ROLLBACK;

/* alter */
-- 컬럼 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;
DESC tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;

-- 컬럼 이름 및 컬럼 정의 변경
ALTER TABLE tb2 CHANGE COLUMN fk change_fk INT NOT NULL;

-- 제약조건 제거(primary key 제약조건 제거 도전!)
ALTER TABLE tb2 DROP PRIMARY KEY;

-- auto_increment 먼저 제거(drop이 아닌 nodify)
ALTER TABLE tb2 MODIFY pk INT;
DESC tb2;

-- 다시 primary key 제거
ALTER TABLE tb2 DROP PRIMARY KEY;
DESC tb2;
