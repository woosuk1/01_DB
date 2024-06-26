SHOW TABLES;

-- 1. 모든 사원 모든 컬럼 조회
SELECT 
		 * 
	FROM employee;

-- 2. 사원들의 사번(사원번호), 이름 조회
SELECT
		 emp_id
	  , emp_name
	FROM employee;
-- 3. 201번 사번의 사번 및 이름 조회
SELECT
		 emp_id
	  , emp_name		 
	FROM employee
  WHERE emp_id = 201;
-- 4. employee 테이블에서 부서 코드가 'D9'인 사원 조회
SELECT
		 *
	FROM employee
  WHERE dept_code = 'd9';
 
-- 5. employee 테이블에서 직급 코드가 'J1'인 사원 조회
SELECT
		 *
	FROM employee
  WHERE job_code = 'j1';
 
-- 6. employee 테이블에서 급여가 300만원 이상(>=)인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하시오.
SELECT
		 emp_id
	  , emp_name
	  , dept_code
	  , salary
	FROM employee
  WHERE salary >= 3000000;

-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는
-- 직원의 이름, 부서코드, 급여 조회
SELECT
		 emp_name
	  , dept_code
	  , salary
	FROM employee
  WHERE dept_code = 'd6' AND salary >= 3000000;

-- 8. 보너스를 받지 않는 사원에 대한
-- 사번, 직원명, 급여, 보너스를 조회
SELECT
		 emp_id
	  , emp_name
	  , salary
	  , bonus
	FROM employee
   WHERE bonus IS NOT null;
-- 9. 'D9' 부서에서 근무하지 않는 사원의
-- 사번, 이름, 부서코드를 조회
SELECT
		 emp_id
	  , emp_name
	  , dept_code
	FROM employee
  WHERE dept_code != 'd9';
-- 10. employee 테이블에서 퇴사 여부가 N인 직원들 조회하고
-- 사번, 이름, 입사일을 별칭을 사용해 조회해 보기
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)
SELECT
		 emp_id AS '사번'
	  , emp_name AS '이름'
	  , hire_date AS '입사일'
	FROM employee
  WHERE ent_yn = 'n';
-- 11. employee 테이블에서 급여 350만원 이상
-- 550만원 이하를 받는 직원의
-- 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회해 보기
SELECT
		 emp_id
	  , emp_name
	  , salary
	  , dept_code
	  , job_code
	FROM employee
  WHERE salary BETWEEN 3500000 AND 5500000;
 
-- 12. employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회
SELECT
		 emp_id
	  , emp_name
	  , hire_date
	FROM employee
  WHERE emp_name LIKE '%김%';

 
-- 13. employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
SELECT
		 emp_id
	  , emp_name
	  , hire_date
	FROM employee
  WHERE emp_name NOT like '김%';
-- 14. EMPLOYEE 테이블에서 '하'문자가 이름에 포함 된
-- 직원의 이름, 주민번호, 부서코드 조회
SELECT
		 emp_name
	  , emp_no
	  , dept_code
	FROM employee
  WHERE emp_name LIKE '%하%';
 
-- 15. 'J2'직급이면서 급여가 200만원 이상인 직원이거나
-- 'J7'직급인 직원의 이름, 급여, 직급코드 조회
SELECT
		 emp_name
	  , salary
	  , job_code
	FROM employee
  WHERE job_code IN (SELECT job_code
  							from employee
							where salary >= 2000000 AND job_code = 'j2')
  			OR job_code = 'j7' ;
 
-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에
-- 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회
SELECT
		 emp_name
	  , salary
	  , job_code
	FROM employee
  WHERE job_code IN (SELECT job_code
  							from employee
							where job_code = 'j7' or job_code = 'j2')
			and salary >= 2000000;
-- 17. IN 연산자로 업그레이드
SELECT
		 emp_name
	  , salary
	  , job_code
	FROM employee
  WHERE job_code IN (SELECT job_code
  							from employee
							where job_code IN('j2','j7'))
			and salary >= 2000000;

-- ------------------------------------------
-- <JOIN 사용 연습문제>              

-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1명)
SELECT
		 a.emp_id
	  , a.EMP_NAME
	  , b.DEPT_TITLE
	FROM employee a
	JOIN department b ON a.DEPT_CODE = b.DEPT_ID
	WHERE a.EMP_NAME LIKE '%형%';


-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9명)
-- department, employee, job table을 join해야한다.
SELECT
		 a.emp_name
	  , c.JOB_NAME
	  , a.DEPT_CODE
	  , b.DEPT_TITLE
	FROM employee a
	JOIN department b ON a.DEPT_CODE = b.DEPT_ID
	JOIN job c ON c.JOB_CODE = a.JOB_CODE
	WHERE b.dept_title LIKE '해외영업%';
-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8명)(INNER JOIN 결과)
SELECT
		 a.emp_name
	  , a.bonus
	  , b.dept_title
	  , c.local_name
	FROM employee a
	JOIN department b ON a.dept_code = b.DEPT_ID
	JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
	WHERE a.BONUS IS NOT null;
-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3명)
SELECT
		 a.emp_name
	  , b.dept_title
	  , c.job_name
	  , d.local_name
	FROM employee a
	JOIN department b ON a.dept_code = b.DEPT_ID
	JOIN job c ON c.JOB_CODE = a.JOB_CODE
	JOIN location d ON d.LOCAL_CODE = b.LOCATION_ID
	WHERE a.DEPT_CODE = 'd2';

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20명)
SELECT
		 *
	FROM job, employee, sal_grade;

SELECT
		 a.emp_name
	  , b.job_name
	  , a.salary
	  , a.salary * ( 1 + IFNULL(a.bonus , 0)) * 12
	FROM employee a
	JOIN job b ON a.JOB_CODE = b.JOB_CODE
	JOIN sal_grade c ON c.sal_level = a.sal_level
	WHERE c.MIN_SAL < a.SALARY;


-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15명)
SELECT
		 a.emp_name
	  , b.DEPT_TITLE
	  , c.LOCAL_NAME
	  , d.NATIONAL_NAME
	FROM employee a
	JOIN department b ON a.DEPT_CODE = b.DEPT_ID
	JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
	JOIN NATIONAL d ON c.NATIONAL_CODE = d.NATIONAL_CODE
	WHERE d.national_name = '한국' OR d.NATIONAL_NAME = '일본';

-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- self join 사용(60명)

SELECT
		 a.EMP_NAME
	  , a.DEPT_CODE
	  , b.EMP_NAME
	FROM employee a
	JOIN employee b ON a.DEPT_CODE = b.DEPT_CODE
	WHERE a.EMP_ID != b.emp_id
	ORDER BY 1;
-- 8. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8명)
SELECT
		 a.emp_name
	  , b.JOB_NAME
	  , a.salary
	FROM (SELECT
					 *
				FROM employee c
				WHERE c.bonus IS NULL) a
	JOIN job b ON a.job_code = b.job_code
	WHERE a.job_code IN ('j4','j7');

-- 9. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문을 작성할 것)

SELECT
		 a.emp_id
	  , a.emp_name
	  , b.JOB_NAME
	  , c.DEPT_TITLE
	  , d.LOCAL_NAME
	  , a.SALARY
	FROM employee a
	JOIN job b ON a.JOB_CODE = b.JOB_CODE
	JOIN department c ON a.DEPT_CODE = c.DEPT_ID
	JOIN location d ON c.LOCATION_ID = d.LOCAL_CODE
	WHERE b.JOB_NAME = '대리' AND d.LOCAL_NAME IN  ('ASIA1','ASIA2','ASIA3');
	
