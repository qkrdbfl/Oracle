-- 07_DML (INSERT, UPDATE, DELETE)

-- INSERT

-- EMPLPOYEE 테이블에 INSERT
INSERT
INTO EMPLOYEE
(
EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE,
DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS,
MANAGER_ID, HIRE_DATE, ENT_DATE, ENT_YN
)
VALUES
( --위의 순서처럼 밑에도 맞춰서 써줘야함
'900', '장채현', '901123-2080503', 'jang_ch@greedy.com', '01055691254',
'D1', 'J7', 'S3', 4300000, 0.2,
'200', SYSDATE, NULL, DEFAULT
);

SELECT
       *
  FROM EMPLOYEE; 
    
-- INSERT시 VALUES 대신 서브쿼리 활용    
-- 테이블 생성    
CREATE TABLE EMP_01 (
 EMP_ID NUMBER,
 EMP_NAME VARCHAR2(30),
 DEPT_TITLE VARCHAR2(20)
);

INSERT
  INTO EMP_01
(
  EMP_ID
, EMP_NAME
, DEPT_TITLE
)
(
  SELECT
         EMP_ID
       , EMP_NAME
       , DEPT_TITLE
    FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
);

SELECT
       *
  FROM EMP_01;
    
-- INSERT ALL : 시 사용하는 서브쿼리가 같은 경우
-- 두개 이상의 테이블에 INSERT ALL을 통해 한번에 데이터를 삽입할수 있다.
-- EMP_DEPT_D1 테이블 생성
CREATE TABLE EMP_DEPT_D1
AS
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , HIRE_DATE
  FROM EMPLOYEE
 WHERE 1 = 0; -- 항상 틀림 펄스
 
SELECT
       *
  FROM EMP_DEPT_D1;

--EMP_MANAGER 테이블 생성
CREATE TABLE EMP_MANAGER
AS
SELECT
       EMP_ID
     , EMP_NAME
     , MANAGER_ID
  FROM EMPLOYEE
 WHERE 1 = 0;
 
SELECT
       *
  FROM EMP_MANAGER;
    
-- EMP_DEPT_D1 테이블과 EMP_MANAGER 테이블에 한 번에 삽입 테스트 --

-- EMP_DEPT_D1 테이블에 부서코드가 D1인 직원을 조회해서 사번, 이름, 소속부서, 입사일을 삽입하고 
-- EMP_MANAGER 테이블에 부서코드가 D1인 직원을 조회해서 사번, 이름, 관리자 사번을 삽입한다.    
INSERT ALL --!
  INTO EMP_DEPT_D1
VALUES
(
  EMP_ID
, EMP_NAME
, DEPT_CODE
, HIRE_DATE
)
  INTO EMP_MANAGER
VALUES
(
  EMP_ID
, EMP_NAME
, MANAGER_ID
)
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , HIRE_DATE
     , MANAGER_ID
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D1';    
    
-- INSERT ALL 사용 예제2 (조건식 사용)    
-- 입사일 기준으로 2000년 1월 1일 전에 입사한 사원의 사번, 이름, 입사일, 급여를 조회하여
-- EMP_OLD 테이블에 삽입하고 그 이후에 입사한 사원은 EMP_NEW 테이블에 삽입한다.
CREATE TABLE EMP_OLD
AS
SELECT
       EMP_ID
     , EMP_NAME
     , HIRE_DATE
     , SALARY
  FROM EMPLOYEE
 WHERE 1 = 0;

CREATE TABLE EMP_NEW
AS
SELECT
       EMP_ID
     , EMP_NAME
     , HIRE_DATE
     , SALARY
  FROM EMPLOYEE
 WHERE 1 = 0;

 WHEN HIRE_DATE < '2000/01/01'
  THEN
  INTO EMP_OLD
VALUES
(
  EMP_ID
, EMP_NAME
, HIRE_DATE
, SALARY
)
  WHEN HIRE_DATE >= '2000/01/01'
  THEN
  INTO EMP_NEW --
VALUES
(
  EMP_ID
, EMP_NAME
, HIRE_DATE
, SALARY
)
SELECT
       EMP_ID
     , EMP_NAME
     , HIRE_DATE
     , SALARY
  FROM EMPLOYEE;
   
SELECT 
       EO.*
  FROM EMP_OLD EO;
  
SELECT
       EN.*
  FROM EMP_NEW EN;    
    
--  UPDATE : 테이블에 기록 된 컬럼 값을 수정하는 구문
CREATE TABLE DEPT_COPY
AS
SELECT D.*
  FROM DEPARTMENT D;

SELECT
       DC.*
  FROM DEPT_COPY DC;

UPDATE
       DEPT_COPY
    SET DEPT_TITLE = '전략기획팀' -- 이팀으로 바꾼다.
  WHERE DEPT_ID = 'D9'; -- D9를 

-- 서브쿼리를 활용한 UPDATE
 CREATE TABLE EMP_SALARY
AS
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
     , BONUS
  FROM EMPLOYEE;

-- 다중열 서브쿼리로 작성한다.
UPDATE
       EMP_SALARY
  SET (SALARY, BONUS) = (SELECT
                                 SALARY
                               , BONUS
                            FROM EMP_SALARY
                           WHERE EMP_NAME = '유재식'
                           )
  WHERE EMP_NAME = '방명수';

SELECT
        ES.*
   FROM EMP_SALARY ES;    
    
-- UPDATE시 변경 값은 해당 컬럼에 대한 제약 조건에 위배되지 않아야 한다    

-- EMPLOYEE 테이블의 DEPT_CODE에 외래키 제약조건 추가
ALTER TABLE EMPLOYEE ADD FOREIGN KEY (DEPT_CODE) REFERENCES DEPARTMENT (DEPT_ID);

-- 무결성 제약 조건을 위배한다 (부모키 없음)
UPDATE -- 오류
       EMPLOYEE
   SET DEPT_CODE = '20' --20이라는 값으로 바꾸겠다
 WHERE DEPT_CODE = 'D6'; --D6을
 
-- NOT NULL 제약 조건 위배 
-- NULL로("C##EMPLOYEE"."EMPLOYEE"."EMP_NAME")을 업데이트할 수 없습니다
UPDATE --오류
       EMPLOYEE
   SET EMP_NAME = NULL
 WHERE EMP_ID = '200';
 

-- MERGE : 구조가 같은 두 개의 테이블을 하나로 합치는 기능
-- 테이블에서 지정하는 조건의 값이 존재하면 UPDATE하고, 조건의 값이 없으면 INSERT 한다
CREATE TABLE EMP_M01
AS
SELECT E.*
FROM EMPLOYEE E;

CREATE TABLE EMP_M02
AS
SELECT E.*
FROM EMPLOYEE E
WHERE E.JOB_CODE = 'J4';

-- 해당 테이블의 데이터 조작
INSERT
INTO EMP_M02 A
(
A.EMP_ID, A.EMP_NAME, A.EMP_NO, A.EMAIL, A.PHONE
, A.DEPT_CODE, A.JOB_CODE, A.SAL_LEVEL, A.SALARY, A.BONUS
, A.MANAGER_ID, A.HIRE_DATE, A.ENT_DATE, A.ENT_YN
)
VALUES
(
999, '홍길동', '000101-4567890', 'woo_bl@greedy.com', '01011112222'
, 'D9', 'J4', 'S1', 9000000, 0.5
, NULL, SYSDATE, NULL, DEFAULT
);

SELECT
      EM1.*
 FROM EMP_M01 EM1;

SELECT
      EM2.*
 FROM EMP_M02 EM2;

UPDATE
      EMP_M02
  SET SALARY = 0;

--
MERGE
      INTO EMP_M01 M1
      USING EMP_M02 M2
  ON (M1.EMP_ID = M2.EMP_ID)
 WHEN MATCHED THEN
UPDATE
SET M1.EMP_NAME = M2.EMP_NAME
, M1.EMP_NO = M2.EMP_NO
, M1.EMAIL = M2.EMAIL
, M1.PHONE = M2.PHONE
, M1.DEPT_CODE = M2.DEPT_CODE
, M1.JOB_CODE = M2.JOB_CODE
, M1.SAL_LEVEL = M2.SAL_LEVEL
, M1.SALARY = M2.SALARY
, M1.BONUS = M2.BONUS
, M1.MANAGER_ID = M2.MANAGER_ID
, M1.HIRE_DATE = M2.HIRE_DATE
, M1.ENT_DATE = M2.ENT_DATE
, M1.ENT_YN = M2.ENT_YN
  WHEN NOT MATCHED THEN -- 만약에 동일값 아니고 새로운 행이 있다면
INSERT
( --이거랑
M1.EMP_ID, M1.EMP_NAME, M1.EMP_NO, M1.EMAIL, M1.PHONE
, M1.DEPT_CODE, M1.JOB_CODE, M1.SAL_LEVEL, M1.SALARY, M1.BONUS
, M1.MANAGER_ID, M1.HIRE_DATE, M1.ENT_DATE, M1.ENT_YN
)
VALUES
(-- 이거를 인서트 한다는 뜻
M2.EMP_ID, M2.EMP_NAME, M2.EMP_NO, M2.EMAIL, M2.PHONE
, M2.DEPT_CODE, M2.JOB_CODE, M2.SAL_LEVEL, M2.SALARY, M2.BONUS
, M2.MANAGER_ID, M2.HIRE_DATE, M2.ENT_DATE, M2.ENT_YN
);

SELECT
       EM.*
  FROM EMP_M01 EM;
  


-- DELETE : 테이블의 행을 삭제하는 구문
COMMIT; --저장

DELETE
  FROM EMPLOYEE; -- 삭제

SELECT
       E.*
  FROM EMPLOYEE E;    

ROLLBACK;-- 복구(전꺼 다시 불러오기), 꼭 커밋해야 복구 가능

DELETE
  FROM EMPLOYEE
 WHERE EMP_NAME = '장채현';  -- 얘만 삭제

-- DELETE 수행 시 제약 조건 위반 테스트
-- 무결성 제약조건(C##EMPLOYEE.SYS_C007434)이 위배되었습니다- 자식 레코드가 발견되었습니다
DELETE --오류
  FROM DEPARTMENT
 WHERE DEPT_ID = 'D1';
 
-- FK 제약 조건이 있어도 참조 되고 있지 않은 값은 삭제 가능 
DELETE
  FROM DEPARTMENT
 WHERE DEPT_ID = 'D3';

SELECT
        D.*
   FROM DEPARTMENT D;

ROLLBACK;

-- TRUNCATE : 테이블의 전체 행 삭제 시 사용함
-- DELETE보다 수행 속도가 더 빠르고 ROLLBACK을 통해 복구 불가능.
SELECT
        ES.*
   FROM EMP_SALARY ES;

-- 현재 시점의 데이터를 기록한다.
COMMIT;

DELETE
  FROM EMP_SALARY;

SELECT
       ES.*
  FROM EMP_SALARY ES;

-- 마지막 커밋 시점으로 돌아간다.
ROLLBACK;

--복구 안됨. 테이터 날리면 영원히.. 제거됨
TRUNCATE TABLE EMP_SALARY; -- 테이블_샐러리가 잘림 --롤백으로도 안돌아옴



