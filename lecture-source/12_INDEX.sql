-- 12_INDEX

-- ROWID : 오브젝트 번호, 상대파일 번호, 블록 번호, 데이터 번호로 이루어져있다.
SELECT
       ROWID
     , EMP_ID
     , EMP_NAME
  FROM EMPLOYEE;

-- USER_INDEXES
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

-- 인덱스 힌트 --
-- 원하는 테이블의 인덱스를 사용할수 있도록 구문을 통해 선택
SELECT /*+ INDEX(E 엔터티1_PK)*/
        E.*
   FROM EMPLOYEE E; --200번 먼저순서 내려옴

-- 인덱스 영역에서 역방향으로 스캔하라는 의미(INDEX_DESC)
SELECT /*+ INDEX_DESC(E 엔터티1_PK)*/
        E.*
   FROM EMPLOYEE E; -- 900번 먼저 순서로 내려옴

--------------
-- 고유 인덱스 생성  : PK, UNIQUE 제약 조건을 생성하면 자동으로 해당 컬럼에 UNIQUE INDEX가 생성 됨.
-- 중복 값이 없는 컬럼은 UNIQUE 인덱스를 생성할 수 있다.
CREATE UNIQUE INDEX IDX_EMPNO
ON EMPLOYEE(EMP_NO);

-- 중복 값이 있는 컬럼은 UNIQUE 인덱스를 생성하지 못한다.
CREATE UNIQUE INDEX IDX_DEPT_CODE -- 유니크인덱스는 중복X
ON EMPLOYEE(DEPT_CODE);


-- 비고유 인덱스(NONUNIQUE INDEX) 
--  WHERE절에서 빈번하게 사용되는 일반 컬럼을 대상으로 생성
CREATE INDEX IDX_DEPT_CODE -- 비고유인덱스 생성. (UNIQUE)가 빠짐
ON EMPLOYEE(DEPT_CODE);

-- 결합 인덱스(COMPOSITE INDEX) 
-- 결합 인덱스는 중복 값이 낮은 값이 먼저 오는 것이 검색 속도를 향상 시킨다.
CREATE INDEX IDX_DEPT-- 결합 인덱스 생성.
ON DEPARTMENT (DEPT_ID, DEPT_TITLE);-- 컬럼인 부분을 나열.

-- 위의 결합 인덱스를 사용한 조회
SELECT /*+ INDEX_DESC(D IDX_DEPT)*/ -- 인덱스 힌트를 줌
        D.DEPT_ID
   FROM DEPARTMENT D
  WHERE D.DEPT_ID > '0'
    AND D.DEPT_TITLE > '0';

-- 함수 기반 인덱스(FUNCTION BASED INDEX)
--  계산식으로 검색하는 경우가 많다면, 수식이나 함수식으로 이루어진 컬럼을 인덱스로 만들수 있다.
CREATE INDEX IDX_EMP_SALCALC -- 함수 기반 인덱스 생성
ON EMPLOYEE((SALARY + (SALARY * NVL(BONUS,0))) * 12);

--  함수 기반 인덱스를 사용한 조회 구문 작성
SELECT /*+ INDEX_DESC(E IDX_EMP_SALCALC)*/ -- IDX_EMP_SALCALC를 조회하겠다는 인덱스 힌트 써놈
        E.EMP_ID
      , E.EMP_NAME
      ,(E.SALARY + (E.SALARY * NVL(E.BONUS,0))) * 12 연봉
   FROM EMPLOYEE E
 WHERE (E.SALARY + (E.SALARY * NVL(E.BONUS,0))) * 12 > 1000000;