-- 05. SUBQUERY

--서브쿼리가 필요한 예

--노옹철 사원과 같은 부서에 소속 된 사원 조회

-- 사원명이 노옹철인 사람의 부서 조회
SELECT
        SEPY_CODE
   FROM EMPLOYEE
  WHERE EMP_NAME = '노옹철';
  
--부서코드가 D9인 직원 조회
SELECT
        FMP_NAME
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D9';
  
--위의 두 쿼리를 하나로 합쳐 작성하기(하나는 메인쿼리 하나는 서브쿼리가 되어야함)
SELECT
        EMP_NAME
   FROM EMPLOYEE-- 메인쿼리
  WHERE DEPT_CODE = (SELECT
                             DEPT_CODE
                        FROM EMPLOYEE--서브쿼리
                       WHERE EMP_NAME = '노옹철');
  
--전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여 조회 
SELECT
        EMP_ID
      , EMP_NAME
      , JOB_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > (SELECT AVG(SALARY)FROM EMPLOYEE);
                      
--SUBQUERY의 유형
--단일행 서브쿼리 : 결과 행이 1행인 서브쿼리로 일반 비교 연산자 사용

--노옹철 사원의 급여보다 많이 받는 직원의 사번, 이름, 부서, 직급 ,급여 조회
SELECT
        EMP_ID
       ,EMP_NAME
       ,DEPT_CODE
       ,JOB_CODE
       ,SALARY
   FROM EMPLOYEE
  WHERE SALARY > (SELECT SALARY
                    FROM EMPLOYEE
                   WHERE EMP_NAME = '노옹철');

--가장 적은 급여를 받는 직원의 사번, 이름, 급여 조회
SELECT
        EMP_ID
       ,EMP_NAME
       ,DEPT_CODE
       ,JOB_CODE
       ,SALARY
   FROM EMPLOYEE
  WHERE SALARY = (SELECT
                        MIN (SALARY)
                   FROM EMPLOYEE);

--WHERE절 뿐만 아니라 HAVING절에도 사용 가능하다
--부서별 급여의 합계 중 합계가 가장 큰 부서의 부서명,급여 합계 조회
SELECT
        DEPT_TITLE
       ,SUM(SALARY)
   FROM EMPLOYEE
   LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    GROUP BY DEPT_TITLE
  HAVING SUM(SALARY) = (SELECT
                                MAX(SUM(SALARY))
                           FROM EMPLOYEE
                          GROUP BY DEPT_CODE);
  
-- 다중행 서브쿼리 : 결과 행이 여러개인 서브쿼리. 일반 비교 연산자를 사용할수 없다
-- 부서별 최고 급여와 동일 급여를 받는 직원의 이름, 직급, 부서, 급여 조회
SELECT
        EMP_NAME
      , JOB_CODE
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
--일반 비교 연산자를 쓸수 없음 (=) 
--WHERE SALARY = (SELECT MAX(SALARY)FROM EMPLOYEE GROUP BY DEPT_CODE);--에러 
  WHERE SALARY IN (SELECT --다른 연산자를 써야함(IN)
                        MAX(SALARY)
                   FROM EMPLOYEE
                  GROUP BY DEPT_CODE);

-- 대리 직급의 직원들 중에서 과장 직급의 최소 급여보다 많이 받는 직원의
-- 사번, 이름, 직급명, 급여를 조회
-- ANY /< ANY : 다중행 서브쿼리를 비교할떄 사용하는 연산자
-- > ANY : 서브쿼리 결과의 최소 값보다 큰 값을 비교
-- < ANY : 서브쿼리 결과의 최대 값보다 작은 값을 비교
SELECT
        EMP_ID
      , EMP_NAME
      , JOB_NAME
      , SALARY
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE)
  WHERE JOB_NAME = '대리'
    AND SALARY > ANY (SELECT --ANY란 다중서브쿼리에서 쓰는 연산자
                            SALARY
                       FROM EMPLOYEE
                       JOIN JOB USING(JOB_CODE)
                      WHERE JOB_NAME = '과장');

-- 차장 직급의 급여의 가장 큰 값보다 많이 받는 과장 직급의 사원 조회
-- > ALL : 서브쿼리의 결과(모두)중 최대 값 보다 큰 값 비교 
-- < ALL : 서브쿼리의 결과(모두)중 최소 값 보다 작은 값 비교 
SELECT
        EMP_ID
      , EMP_NAME
      , JOB_NAME
      , SALARY
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE)
  WHERE JOB_NAME = '과장'
    AND SALARY > ALL (SELECT --ANY란 다중서브쿼리에서 쓰는 연산자
                            SALARY
                       FROM EMPLOYEE
                       JOIN JOB USING(JOB_CODE)
                      WHERE JOB_NAME = '차장');

--다중열 서브쿼리 : 결과 열이 다중열인 서브쿼리
-- 퇴직한 여직원과 같은 부서, 같은 직급에 해당하는 사원의 이름, 직급, 부서, 입사일 조회 
SELECT
        EMP_NAME
      , DEPT_CODE
      , JOB_CODE
   FROM EMPLOYEE
  WHERE DEPT_CODE = (SELECT DEPT_CODE --무슨 부서고 같은지
                       FROM EMPLOYEE
                      WHERE SUBSTR(EMP_NO, 8, 1) = '2' --성별알기
                        AND ENT_YN = 'Y')
  AND JOB_CODE = (SELECT DEPT_CODE-- 직급 확인
                       FROM EMPLOYEE
                      WHERE SUBSTR(EMP_NO, 8, 1) = '2'
                        AND ENT_YN = 'Y');

--다중열 서브쿼리로 변경한다
SELECT
        EMP_NAME
      , DEPT_CODE
      , JOB_CODE
   FROM EMPLOYEE --테이블 명칭 명시
--WHERE DEPT_CODE = (SELECT DEPT_CODE, JOB_CODE --값의 수가 너무 많다는 에러가 남 밑에처럼 바꿔줘야함
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE
                                 FROM EMPLOYEE
                                WHERE SUBSTR(EMP_NO, 8, 1) = '2'
                                  AND ENT_YN = 'Y');


--인라인 뷰((InLine View) : FROM 절에서 사용되는 서브 쿼리 
--서브쿼리의 결과인 Result Set을 테이블 대신 사용할 수 있다.

-- 직급별 평균 급여를 계산한 테이블을 만들고 EMPLOYEE와 JOIN시
-- 평균 급여가 본인의 급여와 동일하면 조인하게 조건을 줘서
-- 직급별 평균 급여에 맞는 급여를 받고 있는 직원을 조회하는 구문
SELECT
        E.EMP_NAME--여기부터
      , J.JOB_NAME
      , E.SALARY
    FROM (SELECT
                JOB_CODE
              , TRUNC(AVG(SALARY), -5) AS JOBAVG
           FROM EMPLOYEE
          GROUP BY JOB_CODE) V --여기까지 서브쿼리지만 테이블처럼 쓰임
     JOIN EMPLOYEE E ON (V.JOBAVG = E.SALARY AND V.JOB_CODE = E.JOB_CODE)
     JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE)
    ORDER BY J.JOB_NAME;

--인라인 뷰 사용시 유의할 점!!!!
SELECT
        EMP_NAME
       ,DEPT_TITLE
       ,JOB_NAME
   FROM(SELECT
                EMP_NAME
               ,DEPT_TITLE 부서명 -- "DEPT_TITLE": 부적합한 식별자 에러남
               ,JOB_NAME   직급명 
           FROM EMPLOYEE
           LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
           JOIN JOB USING(JOB_CODE))
     WHERE DEPT_TITLE = '인사관리부';
  
-- 위의 에러난 문제를 다시 써본다.  
--인라인 뷰의 결과만이 남아 있으므로 서브 쿼리에서 조회에 사용하지 않은 컬럼은 조회불가
--별칭을 사용했다면 별칭만을 사용할수 있음 !!
SELECT
        EMP_NAME
       ,부서명
       ,직급명 --별칭을 사용한다
   FROM(SELECT
                EMP_NAME
               ,DEPT_TITLE 부서명 
               ,JOB_NAME 직급명
           FROM EMPLOYEE
           LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
           JOIN JOB USING(JOB_CODE))
     WHERE 부서명 = '인사관리부'; 

--인라인 뷰를 사요한 TOP-N 분석

--ROWNUM  확인
-- SALARY 기준 내림차순 정렬
--현재는 WHERE절에서 ROWNUM이 결정되어 급여를 많이 받는 순과 관계없는 번호를 가진다.
SELECT
        ROWNUM
      , EMP_NAME
      , SALARY 
   FROM EMPLOYEE
  ORDER BY SALARY DESC;

-- 따라서 원하는 순서의 ROWNUM 붙게 하려면 인라인 뷰를 활용해야 한다
SELECT
        ROWNUM
       ,V.EMP_NAME
       ,V.SALARY
   FROM (SELECT E.*
        FROM EMPLOYEE E
        ORDER BY E.SALARY DESC)V
 WHERE ROWNUM <= 5;     --5까지만 조회

-- 6위에서 10위까지 조회
--WHERE절에서 ROWNUM은 1이 부여되고 해당 값이 조건 상 FALSE가 되어 다음 행에서 다시
--ROWNUM이 1이 부여되므로 모든행은 6~10 사이라는 조건을 만족하지 못해 결과가 0행이 된다
SELECT
        ROWNUM
       ,V.EMP_NAME
       ,V.SALARY
   FROM (SELECT E.*
        FROM EMPLOYEE E
        ORDER BY E.SALARY DESC
        )V
 WHERE ROWNUM BETWEEN 6 AND 10;
 
--위의 구문 6위에서 10위까지 조회 수정하자 
SELECT
        V2.RNUM
      , V2.EMP_NAME
      , V2.SALARY
  FROM (SELECT 
                ROWNUM RNUM
               ,V.EMP_NAME
               ,V.SALARY
          FROM (SELECT E.*
                  FROM EMPLOYEE E
                  ORDER BY E.SALARY DESC
                 )V
         )V2
   WHERE RNUM BETWEEN 6 AND 10; --위의 값을 기반으로 출력    

-- 위의 구문을 좀 더 성능 좋게 써보자
SELECT
        V2.RNUM ---순서2
      , V2.EMP_NAME
      , V2.SALARY
  FROM (SELECT ----순서3
                ROWNUM RNUM --행들의 번호를 적어주는
               ,V.EMP_NAME
               ,V.SALARY
          FROM (SELECT E.* --순서1
                  FROM EMPLOYEE E
                  ORDER BY E.SALARY DESC--1.
                 )V---2.
          WHERE ROWNUM < 11----3. -이 구문 역할은 11에서 멈추라는 의미(조건 외의 범위) 이게 없으면 컴이 전부다 조회함      
         )V2
   WHERE RNUM BETWEEN 6 AND 10;--6~10 출력

-- 급여 평균 3위 안에 드는 부서의 부서코드, 부서명, 평균 급여 조회
SELECT
        DEPT_CODE --부서코드
      , DEPT_TITLE --부서명
      , 평균급여
  FROM (SELECT
              E.DEPT_CODE
            , D.DEPT_TITLE
            , AVG(E.SALARY) 평균급여
         FROM EMPLOYEE E
         JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
        GROUP BY E.DEPT_CODE, D.DEPT_TITLE
        ORDER BY 3 DESC)
  WHERE ROWNUM <= 3; 
  
-- RANK() OUER : 동일한 순위 이후의 등수를 인원수 만큼 건너뛰고 다음 순위를 계산
-- DENSE_RANK() OVER : 동일한 순위 이후의 등수를 이후 등수로 처리
SELECT
        EMP_NAME
      , SALARY
      , RANK() OVER(ORDER BY SALARY DESC) 순위
   FROM EMPLOYEE;-- 인원수를 안넣고 처리의 차이 --19위 중복일때 다음 순위21위

SELECT
        EMP_NAME
      , SALARY
      , DENSE_RANK() OVER(ORDER BY SALARY DESC) 순위 --ORDER BY SALARY DESC를 DENSE_RANK()랭킹 매겨라
   FROM EMPLOYEE; --인원수를 넣고 처리 --19위 중복일때 다음 순위20위

-- SALARY 기준 5위까지 조회
SELECT
        V.*
  FROM (SELECT
              EMP_NAME
            , SALARY
            , RANK() OVER(ORDER BY SALARY DESC) 순위
         FROM EMPLOYEE) V
 WHERE V.순위 <= 5;

--WITH : 서브쿼리에 이름을 붙여주고 붙여준 이름으로 재사용 할 수 있다.
WITH
    TOPN_SAL --사용하고 싶은 이름 지정
  AS (SELECT --내용 작성
            E.EMP_ID
          , E.EMP_NAME
          , E.SALARY
       FROM EMPLOYEE E
   ORDER BY E.SALARY DESC
   )
SELECT
        ROWNUM
      , T.EMP_NAME
      , T.SALARY
   FROM TOPN_SAL T; --이름 재사용

-- 상(호연)관 서브쿼리 :  메인 쿼리 테이블의 값이 변경 되면, 서브쿼리의 결과 값도 바뀌게 된다.
-- 상관 서브쿼리는 메인쿼리가 사용하는 테이블의 값을 서브쿼리가 이용해서 결과를 만든다.

-- 관리자 사번이 EMPLOYEE 테이블에 존재하는 직원에 대한 조회
SELECT
        E.EMP_ID
      , E.EMP_NAME
      , E.DEPT_CODE
      , E.MANAGER_ID
   FROM EMPLOYEE E
  WHERE EXISTS (SELECT
                      E2.EMP_ID
                 FROM EMPLOYEE E2
                WHERE E.MANAGER_ID = E2.EMP_ID
                );

-- 동일 직급의 급여 평균보다 급여를 많이 받고 있는 직원의 직원명, 직급코드, 급여 조회
--스칼라 서브쿼리는 서브쿼리가 반환하는 결과가 1행 1열인 경우를 말한다. 스칼라(반드시 1행 1열)는 단일 값을 의미한다.

SELECT
        EMP_NAME
      , JOB_CODE
      , SALARY
   FROM EMPLOYEE E --상관 쿼리 상태로 적용돼서
WHERE SALARY > (SELECT --여기부터
                      TRUNC(AVG(E2.SALARY), -5)--뒤에 값은 버린채로 샐러리의 값을 게산
                 FROM EMPLOYEE E2
                WHERE E.JOB_CODE = E2.JOB_CODE--여기까지 단일로 사용 못함
                );

--SELECT절에서 서브쿼리 사용 시 결과 값은 반드시 1행으로 나와야 하므로 스칼라 서브쿼리(반드시 1행 1열)만 사용가능하다.
SELECT
        EMP_ID
      , EMP_NAME
      , MANAGER_ID
      , NVL((SELECT EMP_NAME
               FROM EMPLOYEE E2
              WHERE E.MANAGER_ID = E2.EMP_ID
             ), '없음') 관리자명
    FROM EMPLOYEE E
   ORDER BY 1;