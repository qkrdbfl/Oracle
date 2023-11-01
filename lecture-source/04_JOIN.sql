--04. JOIN

--오라클 전용구문

--연결에 사용할 두 컬럼명이 다른 경우
SELECT
        EMP_ID
       ,EMP_NAME
       ,DEPT_CODE
       ,DEPT_TITLE
   FROM EMPLOYEE
       ,DEPARTMENT
  WHERE DEPT_CODE = DEPT_ID;--JOIN조건쓰기 NULL이었던 사원 2명은 포함하지 않고 나옴      

--연결에 사용할 두 컬럼명이 같은 경우
--테이블명을 지정하지 않으면 열의 정의가 애매하다는 오류남!
SELECT
        EMPLOUEE.EMP_ID
       ,EMPLOUEE.EMP_NAME
       ,EMPLOUEE.JOB_CODE --테이블명 써주기
       ,JOB.JOB_NAME
  FROM EMPLOYEE
       ,JOB
 --WHERE JOB_CODE = JOB_CODE;--열의 정의가 애매하다는 에러      
 WHERE EMPLOUEE.JOB_CODE = JOB.JOB_CODE;-- 테이블명 써주기

--테이블명에 별칭을 사용 가능함
SELECT
        E.EMP_ID
       ,E.EMP_NAME
       ,E.JOB_CODE 
       ,J.JOB_NAME
  FROM EMPLOYEE E --이렇게 줄이기 가능
       ,JOB J
 WHERE E.JOB_CODE = J.JOB_CODE;

--ANSI 표준 구문

--연결에 사용할 두 컬럼명이 같은 경우(위에꺼를 조인을 이용해 써보자)
SELECT
        EMP_ID
       ,EMP_NAME
       ,JOB_CODE 
       ,JOB_NAME
  FROM EMPLOYEE
  JOIN JOB USING(JOB_CODE);--USING(JOB_CODE)조인 조건문 USING는 같은경우에 쓰기

--연결에 사용할 두 컬럼명이 다른경우
SELECT
        EMP_ID
       ,EMP_NAME
       ,JOB_CODE 
       ,JOB_NAME
  FROM EMPLOYEE
  JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);--ON(DEPT_CODE = DEPT_ID)조건문 ON는 서로 다를때 쓰기

--컬럼명이 같은 경우에도 ON으로 작성 가능하다
SELECT
        E.EMP_ID
       ,E.EMP_NAME
       ,E.JOB_CODE 
       ,J.JOB_NAME
  FROM EMPLOYEE E --대신 테이블명을 지정해 적어줘야함
  JOIN JOB J ON(E.DEPT_CODE = J.JOB_CODE);

-- ERPARTMENT 테이블과 LOCATION 테이블을 조인하여 모든 컬럼 조회
--ORACLE 전용
SELECT
        *
  FROM DEPARTMENT
     , LOCATION
 WHERE LOCATION_ID = LOCAL_CODE;

--ANSI 표준
SELECT
        *
  FROM DEPARTMENT
  JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);  

-- 조인은 기본적으로 일치하는 행만 결과에 포함하는  INNER JOIN으로 실행된다
--일치하는 값이 없어도 결과에 포함 시키고 싶을 경우 OUTER JOIN을 명시적으로 해야한다

--LEFT OUTER JOIN
--ANST 표준
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE  
   LEFT /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);--OUTER생략 가능
   
-- ORACLE 전용   
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT
  WHERE DEPT_CODE = DEPT_ID(+);-- DEPT_ID+를해야 EMPLOYEE로 조인하겠다는 말

--RIGHT OUTER JOIN
--ANST 표준
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE  
   RIGHT /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- ORACLE 전용   
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT
  WHERE DEPT_CODE(+) = DEPT_ID;
  
--FULL OUTER JOIN  
--ANST 표준
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE  
   FULL /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- ORACLE 전용   
--FULL OUTER JOIN을 하지 못한다.
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT
  WHERE DEPT_CODE(+) = DEPT_ID(+);-- outer-join된 테이블은 1개만 지정할 수 있다는 에러  
  
--CROSS JOIN : 두 테이블의 모든 행의 가능조합을 반환함
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE
 CROSS JOIN DEPARTMENT;  

--이것도 CROSS JOIN의 형태다  
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT;  
  
--NON EQUAL JOIN
-- 등호 이외의 비교연산자를 사용하여 조인하는 것

--ANST 표준
SELECT
        EMP_NAME
       ,SALARY
       ,E.SAL_LEVEL "EMPLOYEE의 SAL_LEVEL"
       ,S.SAL_LEVEL "SAL_GRADE의 SAL_LEVEL"
   FROM EMPLOYEE E
   JOIN SAL_GRADE S ON(SALARY BETWEEN MIN_SAL AND MAX_SAL);--샐러리(EMPLOYEE컬럼)가 두것의 사이에 만족하는 트루를 찾는것 

-- ORACLE 전용
SELECT
       EMP_NAME
       ,SALARY
       ,E.SAL_LEVEL "EMPLOYEE의 SAL_LEVEL"
       ,S.SAL_LEVEL "SAL_GRADE의 SAL_LEVEL"
   FROM EMPLOYEE E
       ,SAL_GRADE S 
  WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;
  
-- SELF JOIN
-- ANSI 표준
SELECT
        E1.EMP_ID 사번
      , E1.EMP_NAME 사원명
      , E1.MANAGER_ID 관리자사번
      , E2.EMP_NAME 관리자명
   FROM EMPLOYEE E1
   JOIN EMPLOYEE E2 ON(E1.MANAGER_ID = E2.EMP_ID);-- INNER JOIN이라서 관리자가 있는 사람만 나옴

-- ORACLE 전용
SELECT
        E1.EMP_ID 사번
      , E1.EMP_NAME 직원명
      , E1.MANAGER_ID 관리자사번
      , E2.EMP_NAME 관리자명
   FROM EMPLOYEE E1
      , EMPLOYEE E2
  WHERE E1.MANAGER_ID = E2.EMP_ID;

----다중 JOIN : 두개 이상의 테이블 JOIN
--ANSI 표준
--조인 구문 나열 순서에 유의해야한다!
SELECT
        EMP_NAME
       ,DEPT_TITLE
       ,LOCAL_NAME
   FROM EMPLOYEE
   JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
   JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);
-- JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)-- 순서 지켜서 하기 이게 밑으로 내려오면 에러

-- ORACLE 전용
--테이블명의 서술 순서는 관계없음!
SELECT
        EMP_NAME
       ,DEPT_TITLE
       ,LOCAL_NAME
   FROM EMPLOYEE
       ,DEPARTMENT-- 오라클전용은 일단 프롬에 쭉 나열하고
       ,LOCATION  
 WHERE DEPT_CODE = DEPT_ID-- 왜얼로 조건 쓰기
   AND LOCATION_ID = LOCAL_CODE; --이거는 프롬으로 써서 전부 출력한다는 의미로 위에처럼 순서를 지키지 않아도 잘 출력됨
  
--직급이 대리이면서 아시아 지역에 근무하는 직원의
--이름, 직급명, 부서명, 근무지역명 조회

--ANSI 표준
SELECT
        EMP_NAME
       ,JOB_NAME
       ,DEPT_TITLE
       ,LOCAL_NAME
   FROM EMPLOYEE--여기서부터
   JOIN JOB USING(JOB_CODE)
   JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
   JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)--여기까지 조인하겠다 라는 뜻
  WHERE JOB_NAME = '대리'
    AND LOCAL_NAME LIKE 'ASIA%';

--ORACLE 전용
SELECT
        E.EMP_NAME --나열후
      , J.JOB_NAME
      , D.DEPT_TITLE
      , L.LOCAL_NAME
   FROM EMPLOYEE E--여기부터
      , JOB J
      , DEPARTMENT D
      , LOCATION L--여기까지 테이블 나열
  WHERE E.JOB_CODE = J.JOB_CODE--여기부터 왜얼로 앤드들을 연결하여 걸러낸다(트루/펄스)
    AND E.DEPT_CODE = D.DEPT_ID
    AND D.LOCATION_ID = L.LOCAL_CODE--여기까지.
    AND JOB_NAME = '대리'-- 위의 조건 결과에 추가조건
    AND LOCAL_NAME LIKE 'ASIA%';-- 위의 조건 결과에 추가조건