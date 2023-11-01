--03. GROUP BY와 HAVING

-- GROUP BY : 같은 값들이 여러개 기록 된 컬럼을 가지고 같은 값들을 하나의 그룹으로 묶는다

--부서별 월급 합계
SELECT
        DEPT_CODE
       ,SUM(SALARY) 
   FROM EMPLOYEE  -- 여기까지만 쓰면 단일 그룹의 그룹 함수가 아니라는 오류남  
 GROUP BY DEPT_CODE; --이걸 써줘야함 그룹으로 묶기
 
-- 부서별 급여 합계, 평균(정수처리), 인원수 조회 후 부서코드 순 오름차순 정렬
SELECT
        DEPT_CODE 부서
      , SUM(SALARY) 합계
      , ROUND(AVG(SALARY)) 평균
      , COUNT(*) 인원수
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
  ORDER BY DEPT_CODE;
-- ORDER BY 1 DESC NULLS LAST;
-- ORDER BY 부서;
-- ORDER BY 4 DESC, 1; --역순으로 하고 싶으면 DESC

-- 직급 코드별로 보너스를 받는 사원수를 조회하고 직급 코드 오름차순 정렬
SELECT
        JOB_CODE
      , COUNT(BONUS)
   FROM EMPLOYEE
  GROUP BY JOB_CODE
  ORDER BY JOB_CODE;


-- 직급 코드별로 보너스를 받는 사원수를 조회하고 직급 코드 오름차순 정렬
-- 단, 보너스를 받는 사람이 없는 직급은 결과에서 제외
SELECT
        JOB_CODE
      , COUNT(BONUS)
   FROM EMPLOYEE
  WHERE BONUS IS NOT NULL 
  GROUP BY JOB_CODE
  ORDER BY JOB_CODE;

-- GROUP BY 절에 하나 이상의 그룹을 지정할수 없다
SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
      , COUNT(*)
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
      , JOB_CODE
  ORDER BY 1;
 
-- GROUP BY 절에 함수식을 사용할수 있다     
-- 성별 그룹으로 급여 평균(정수 처리), 합계, 인원수를 조회한 뒤 인원수로 내림차순 정렬
SELECT
        DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여') 성별
      , ROUND(AVG(SALARY)) 평균
      , SUM(SALARY) 합계
      , COUNT(*) 인원수  
   FROM EMPLOYEE
  GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여')
-- GROUP BY 성별 (SELECT절의 별칭을 사용할 수 없다. 아직 SELECT 절은 수행되지 않았다.)
-- ORDER BY 성별; -- 젤 마지막에 쓴다면 이건 가능함
  ORDER BY 성별 DESC; -- ORDER BY 절은 마지막에 수행 되므로 SELECT절 별칭 사용 가능


-- HAVING절 : 그룹 함수로 구해올 그룹에 대해 조건을 설정할때 사용한다
-- 300만원 이상의 월급을 받는 사원들을 대상으로 부서별 월급 평균 계산
SELECT
        DEPT_CODE
      , ROUND(AVG(SALARY)) 평균
   FROM EMPLOYEE
  WHERE SALARY >= 3000000
  GROUP BY DEPT_CODE
  ORDER BY 1;
  
-- 모든 직원을 대상으로 부서별 월급 평균을 구한 뒤 평균이 300만원 이상인 부서 조회
SELECT
        DEPT_CODE
      , ROUND(AVG(SALARY)) 평균
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
 HAVING ROUND(AVG(SALARY)) >= 3000000
  ORDER BY 1;

--집계 함수 : GROUP BY 절에서만 사용하는 함수
SELECT
        JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY ROLLUP(JOB_CODE)
  ORDER BY 1;

SELECT
        JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY CUBE(JOB_CODE)
  ORDER BY 1;
-------------
SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY ROLLUP(DEPT_CODE, JOB_CODE) --첫번째인자꺼(DEPT_CODE)만 중간 집계가 됨
  ORDER BY 1;

SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY CUBE(DEPT_CODE, JOB_CODE)--두 모든 인자들의 중간집계까지 포함
  ORDER BY 1;

-- GROUPING : 인자로 전달 받은 컬럼 집합의 산출물이면 0을 반환하고, 아니면 1을 반환하는 함수이다.
SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
      , COUNT(*)
      , GROUPING(DEPT_CODE) "부서별 그룹 묶인 상태"
      , GROUPING(JOB_CODE) "직급별 그룹 묶인 상태"
   FROM EMPLOYEE
  GROUP BY CUBE(DEPT_CODE, JOB_CODE)
  ORDER BY 1;

-- CASE 사용
SELECT
        NVL(DEPT_CODE, '부서없음')
      , JOB_CODE
      , SUM(SALARY)
      , CASE
            WHEN GROUPING(NVL(DEPT_CODE, '부서없음')) = 0 AND GROUPING(JOB_CODE) = 1 THEN '부서별합계'
            WHEN GROUPING(NVL(DEPT_CODE, '부서없음')) = 1 AND GROUPING(JOB_CODE) = 0 THEN '직급별합계'
            WHEN GROUPING(NVL(DEPT_CODE, '부서없음')) = 0 AND GROUPING(JOB_CODE) = 0 THEN '그룹별합계'
            ELSE '총합계'
        END 구분
  FROM EMPLOYEE
 GROUP BY CUBE(NVL(DEPT_CODE, '부서없음'), JOB_CODE)
 ORDER BY 1;

-- SET OPERATION (집합 연산)

-- UNION
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  UNION
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

-- UNION ALL : 중복까지도 일단 무족권 합쳐벌임
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  UNION ALL
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

-- INTERSECT : 합쳐지는 가운데만 출력
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  INTERSECT
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

-- MINUS : 첫번째꺼에서 안겹치는것만 출력
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  MINUS
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

--  GROUPING SET
SELECT
        DEPT_CODE
      , JOB_CODE
      , MANAGER_ID
      , FLOOR(AVG(SALARY))
   FROM EMPLOYEE
  GROUP BY GROUPING SETS((DEPT_CODE, JOB_CODE, MANAGER_ID)--1번 그룹핑 결과
                         , (DEPT_CODE, MANAGER_ID)-- 2번 그룹핑 결과
                         , (JOB_CODE, MANAGER_ID)--3번 그룹핑 결과  까지 하나로 다 합쳐벌임(중간에 그룹아닌건 NULL로)
                         );