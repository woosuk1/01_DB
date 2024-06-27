/* index */
SELECT * FROM tbl_menu;

CREATE TABLE phone(
	phone_code INT PRIMARY KEY,
	phone_name VARCHAR(100),
	phone_price DECIMAL(10,2)
);

INSERT
	INTO phone
VALUES
(1, 'galaxys24', 1200000),
(2, 'iphone14pro', 1430000),
(3, 'galaxyfold3', 1730000);

SELECT * FROM phone;

-- where절을 활용한 단순 조회(인덱스가 정해지지 않은 컬럼)
SELECT * FROM phone WHERE phone_name = 'galaxys24';
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxys24';

-- phone_name에 index 추가하기
CREATE INDEX idx_name ON phone(phone_name);
SHOW INDEX FROM phone;
-- 위의 쿼리는 dictionary table이 보여진 것이다.

-- 다시 index가 추가된 컬럼으로 조회해서 index를 태웠는지 확인
SELECT * FROM phone WHERE phone_name = 'galaxys24';
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxys24';

-- 인덱스 추가시, 주기적으로 한버씩 다시 index를
-- rebuild 해줘야한다.
-- mariadb는 optimize 키워드를 사용한다.
optimize TABLE phone;

-- idx drop(primary key 제외)
DROP INDEX idx_name ON phone;
SHOW INDEX FROM phone;