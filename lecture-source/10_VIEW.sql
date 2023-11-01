-- 10_VIEW

-- 사번 , 이름, 직급명, 근무지역을 조회하고 그 결과를 V_RESULT_EMP라는 뷰로 생성
CREATE OR REPLACE VIEW V_RESULT_EMP --V_RESULT_EMP라는 뷰 생성 구문
AS -- 권한이 불충분 하다는 오류 시스템 계졍에 직원관리데이터에 뷰를 생성할수 있는 권한은 안줬기 때문
SELECT 
      EMP_ID
    , EMP_NAME
    , JOB_NAME
    , DEPT_TITLE
    , LOCAL_NAME
  FROM EMPLOYEE E
  LEFT JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
  LEFT JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
  LEFT JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE);


-- 직원 관리 계정에는 뷰 객체 생성 권한이 부여 되어 있지 않아 권한 불충분 오류남
-- 시스템 계정으로 변환하여 뷰 객체 생성 권한을 부여한 뒤 작업한다
GRANT CREATE VIEW TO C##EMPLOYEE; -- 시스템 계정으로 바꾼뒤 실행함. 그 뒤 위의 V_RESULT_EMP라는 뷰 생성 구문을 실행한다.

-- 이제 뷰가 생성됨!
-- 뷰를 통해 조회한다
SELECT
        V.*
   FROM V_RESULT_EMP V
  WHERE V.EMP_ID = '205'; -- EMP_ID 가 205인 사람을 조회됨

-- 뷰에 대한 정보를 확인하는 데이터 딕셔너리
SELECT
       UV.*
  FROM USER_VIEWS UV;

-- 뷰에 별칭을 부여해서 생성하기
CREATE OR REPLACE VIEW V_EMP
(
  사번
, 이름
, 부서
)
AS
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
  FROM EMPLOYEE;

SELECT --조회 확인
       V.*
  FROM V_EMP V;

-- 뷰 삭제
DROP VIEW V_EMP; -- DROP VIEW 뷰이름; 넣기


-- 베이스테이블에서 정보 변경 시 뷰 반영 테스트
COMMIT; -- 되돌릴 수 있는 커밋 시점

-- 베이스테이블 EMPLOYEE 변경
UPDATE
       EMPLOYEE
   SET EMP_NAME = '홍길동'
 WHERE EMP_ID = '200';
 
-- 베이스테이블과 뷰 조회
SELECT
        E.*
   FROM EMPLOYEE E
  WHERE EMP_ID = '200';

-- 베이스테이블의 정보가 변경 되면 VIEW(뷰)의 정보도 같이 변경된다.
SELECT
        V.*
   FROM V_RESULT_EMP V
  WHERE EMP_ID = '200';

-- 수정 전으로 돌아간다.
ROLLBACK; --선동일씨 떄로 돌아감

DROP VIEW V_RESULT_EMP; -- V_RESULT_EMP 뷰삭제

-- 뷰 생성
-- 이 때는 반드시 별칭을 지정해서 뷰를 생성해야 한다.
CREATE OR REPLACE VIEW V_EMP_JOB
(
  사번 -- 안쓰면 오류
, 이름 -- //
, 직급 -- //
, 성별 -- //
, 근무년수 -- 안쓰면 오류
)
AS
SELECT
        EMP_ID
      , EMP_NAME
      , JOB_NAME
      , DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', '여') -- 이 식은 반드시 별명과 함께 지정하라는 오류남
      , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE);

SELECT -- 뷰 조회
        V.*
   FROM V_EMP_JOB V;

-- 테이블 변경시 뷰도 변경되는데 반대로도 되는지 테스트 해보기 --
-- VIEW를 이용한 DML구문 동작 테스트
CREATE OR REPLACE VIEW V_JOB
AS
SELECT
      JOB_CODE
    , JOB_NAME
 FROM JOB;
 
--뷰를 통한 데이터 삽입
INSERT
  INTO V_JOB
(
  JOB_CODE
, JOB_NAME
)
VALUES
(
  'J8'
, '인턴'
);

SELECT -- 뷰 조회 확인 --둘다 같음
        V.*
   FROM V_JOB V;

SELECT -- 베이스테이블 조회 확인 --둘다 같음
        J.*
   FROM JOB J;
   
-- 뷰를 통한 컬럼 값 수정
UPDATE --업뎃
        V_JOB V
    SET JOB_NAME = '알바'
  WHERE JOB_CODE = 'J8';

DELETE -- 뷰를 통한 위의 행 삭제
FROM V_JOB
WHERE JOB_CODE = 'J8';


-- DML 명령어로 VIEW 조작이 불가능한 경우
-- 1. 뷰 정의에 포함 되지 않은 컬럼을 조작하는 경우
-- 뷰 생성
CREATE OR REPLACE VIEW V_JOB2
AS
SELECT J.JOB_CODE
  FROM JOB J;

SELECT -- 확인
        V.*
   FROM V_JOB2 V;
   
-- 뷰 정의에 포함되지 않은 컬럼을 포함하여 INSERT   
-- "JOB_NAME" : 부적합한 식별자 오류남
INSERT
  INTO V_JOB2
(
  JOB_CODE
, JOB_NAME
)
VALUES
(
  'J8'
, '인턴'
);
-------- 고쳐보기
-- 뷰 정의에 사용 된 컬럼만 사용하므로 삽입 가능
-- 뷰 정의에 포함 된 컬럼만으로 INSERT
INSERT
  INTO V_JOB2
(
  JOB_CODE
)
VALUES
(
  'J8'
);

SELECT -- 확인
        J.*
   FROM JOB J;

-- 뷰 정의에 사용된 컬럼만 사용하여 DELETE 가능
DELETE
  FROM V_JOB2
 WHERE JOB_CODE = 'J8';
 
-- 2. 뷰에 포함되지 않은 컬럼 중에
-- 베이스가 되는 테이블의 컬럼이 NOT NULL  제약 조건이 지정된 경우
CREATE OR REPLACE VIEW V_JOB3
AS
SELECT J.JOB_NAME
  FROM JOB J;

SELECT -- JOB_NAME쪽만 뷰를 통해 보임(조회)
        V.*
   FROM V_JOB3 V;

-- (JOB_CODE, JOB) 에는 NULL이 삽입 될 수 없어 오류
INSERT
INTO V_JOB3
(
  JOB_CODE -- 이거랑
, JOB_NAME -- 이거 둘다 오류남 부적합 식별자
)
VALUES
(
  'J8'
, '인턴'
);

-- 뷰에 정의 된 컬럼만을 사용한 UPDATE 수행 가능
UPDATE
        V_JOB3 V
    SET V.JOB_NAME = '인턴'
  WHERE V.JOB_NAME = '사원';


-- 3. 산술 표현식으로 정의 된 경우
CREATE OR REPLACE VIEW EMP_SAL
AS
SELECT EMP_ID
     , EMP_NAME
     , SALARY
     ,(SALARY + (E.SALARY * NVL(E.BONUS, 0))) * 12 연봉 -- 가상으로 만든 금액
  FROM EMPLOYEE;
  
SELECT -- 확인
        *
   FROM EMP_SAL;

-- 산술표현식으로 연산 된 가상 컬럼 연봉에는 INSERT 불가
INSERT
  INTO EMP_SAL
(
  EMP_ID
, EMP_NAME
, SALARY
, 연봉 --오류 (가상 열은 사용할 수 없습니다)
)
VALUES
(
  '800'
, '정진훈'
, 3000000
, 4000000
);
-------

-- 산술표현식으로 연산 된 가상 컬럼 연봉은 UPDATE 불가
UPDATE 
        EMP_SAL
    SET 연봉 = 80000000 -- 가상 값을 수정하는것도 오류
  WHERE EMP_ID = '200';

---- DELETE의 조건으로는 사용 가능
DELETE
  FROM EMP_SAL ES
 WHERE ES.연봉 = 124800000; -- 선동일씨가 삭제됨
 
ROLLBACK; --돌리기

-- 4. JOIN을 이용해 여러 테이블을 연결한 경우
--뷰 생성
CREATE OR REPLACE VIEW V_JOINEMP
AS
SELECT 
       E.EMP_ID
     , E.EMP_NAME
     , D.DEPT_TITLE
  FROM EMPLOYEE E
  LEFT JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID);
  
SELECT-- 화긴
        *
   FROM V_JOINEMP;

-- JOIN으로 생성 된 뷰에 INSERT 써보기
--오류 : (조인 뷰에 의하여 하나 이상의 기본 테이블을 수정할 수 없습니다.)
INSERT
  INTO V_JOINEMP
(
  EMP_ID
, EMP_NAME
, DEPT_TITLE
)
VALUES
(
   888
, '조세오'
, '인사관리부'
);

-- JOIN으로 생성 된 뷰에 UPDATE 써보기
-- 오류 : (키-보존된것이 아닌 테이블로 대응한 열을 수정할 수 없습니다)
UPDATE
        V_JOINEMP V
    SET V.DEPT_TITLE = '인사관리부';

-- JOIN으로 생성 된 뷰에 DELETE 써보기
-- DELETE의 조건으로 사용하는건 가능함
DELETE
   FROM V_JOINEMP V
  WHERE V.EMP_ID = '219';

ROLLBACK;

-- 5. DISTINCT를 포함한 경우
-- 뷰 생성
CREATE OR REPLACE VIEW V_DT_EMP
AS
SELECT DISTINCT E.JOB_CODE
  FROM EMPLOYEE E;

-- DISTINCT를 포함한 뷰에 INSERT 써보기
-- 오류 : (뷰에 대한 데이터 조작이 부적합합니다)
INSERT
INTO V_DT_EMP
(
  JOB_CODE
)
VALUES
(
  'J9'
);

--  DISTINCT를 포함한 뷰에 UPDATE 써보기
-- 오류 : (뷰에 대한 데이터 조작이 부적합합니다)
UPDATE
        V_DT_EMP V
    SET V.JOB_CODE = 'J9'
  WHERE V.JOB_CODE = 'J7';

-- DISTINCT를 포함한 뷰에 DELETE 써보기
-- 오류 : (뷰에 대한 데이터 조작이 부적합합니다)
DELETE
  FROM V_DT_EMP V
 WHERE V.JOB_CODE = 'J7';
 

-- 6. 그룹함수나 GROUP BY절을 포함한 경우
-- 뷰 생성 
CREATE OR REPLACE VIEW V_GROUPDEPT
AS
SELECT E.DEPT_CODE
     , SUM(E.SALARY) 합계 
     , AVG(E.SALARY) 평균 
  FROM EMPLOYEE E
 GROUP BY E.DEPT_CODE; -- 그룹바이로 만들어진 가상 컬럼
 
-- 그룹 함수, GROUP BY절을 포함한 뷰에 INSERT
-- 오류 : (가상 열은 사용할 수 없습니다)
INSERT
  INTO V_GROUPDEPT
(
  DEPT_CODE
, 합계 -- 그룹바이로 만들어진 가상 합계, 평균
, 평균 -- //
)
VALUES
(
  'D0'
, 60000000
, 4000000
); 

-- 그룹 함수, GROUP BY절을 포함한 뷰에 UPDATE
-- 오류 : (뷰에 대한 데이터 조작이 부적합합니다)
UPDATE
        V_GROUPDEPT V
    SET V.DEPT_CODE = 'D10'
  WHERE V.DEPT_CODE = 'D1';

-- 그룹 함수, GROUP BY절을 포함한 뷰에 DELETE
-- 오류 : (뷰에 대한 데이터 조작이 부적합합니다)
DELETE
  FROM V_GROUPDEPT V
 WHERE V.DEPT_CODE = 'D1';
-- 그룹바이 뷰에 INSERT, UPDATE, DELETE 다 불가능하다


-- VIEW OPTION(옵션) --
-- FORCE / NOFORCE
-- FORCE 옵션으로 뷰 생성
CREATE OR REPLACE FORCE VIEW V_EMP
AS -- (경고: 컴파일 오류와 함께 뷰가 생성되었습니다.)라고 뜸
SELECT TCODE -- 걍 아무말로 쓴 SELECT. 그래도 만들어지긴 함
     , TNAME
     , TCONTENT
  FROM TT;

CREATE OR REPLACE /*NOFORCE*/ VIEW V_EMP
AS -- 오류 (테이블 또는 뷰가 없다)
SELECT TCODE
     , TNAME
     , TCONTENT
  FROM TT;

-- WITH CHECK OPTION : 조건절에 사용된 컬럼 값을 수정 하지 못하게 하는 옵션
-- 뷰 생성
CREATE OR REPLACE VIEW V_EMP2
AS
SELECT
        E.*
   FROM EMPLOYEE E
  WHERE MANAGER_ID = '200' -- 200번인 애만 기준으로 조회하는 서브쿼리
   WITH CHECK OPTION; --체크해서 그 값을 수정하지 못하게끔 하겠다는 코드.

-- 위 구문을 수정하라고 써보자. 
-- 오류 : (뷰의 WITH CHECK OPTION의 조건에 위배 됩니다)
UPDATE
        V_EMP2
    SET MANAGER_ID = '900'
  WHERE MANAGER_ID = '200'; 
 
-- 실행 못하게끔 해보자
-- WITH READ ONLY : DNL 수행을 불가능하게 하는 옵션
-- 뷰 생성
CREATE OR REPLACE VIEW V_DEPT
AS
SELECT
        D.*
   FROM DEPARTMENT D
   WITH READ ONLY; -- READ ONLY옵션을 붙임 

-- DELETE 테스트
-- 오류 : (읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.)
DELETE
  FROM V_DEPT;