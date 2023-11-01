-- 06. 테이블 생성 및 제약 조건

-- 테이블 생성 
CREATE TABLE MEMBER ( 
  MEMBER_ID VARCHAR2(20),
  MEMBER_PWD VARCHAR2(20),
  MEMBER_NAME VARCHAR2(20) DEFAULT '홍길동'
);

-- 컬럼에 주석 달기
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원이름';

-- 테이블 조회
SELECT
       *
  FROM MEMBER;
  
-- 해당 계정이 보유하고 있는 테이블, 컬럼 조회 구문 
SELECT
       *
  FROM USER_TABLES ;

SELECT
       *
  FROM USER_TAB_COLUMNS
 WHERE TABLE_NAME = 'MEMBER';

-- 제약 조건
-- 해당 계정이 보유하고 있는 제약 조건 조회 구문
SELECT
       *
  FROM USER_CONSTRAINTS;
  
SELECT
       *
  FROM USER_CONS_COLUMNS;
  
-- NOT NULL 테스트 

-- 제약 조건이 없는 USER_NOCONS 테이블 생성
CREATE TABLE USER_NOCONS (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(30),
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
);

-- 알맞게 정보가 입력 된 데이터
INSERT
INTO USER_NOCONS
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
  1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);
-- 아무런 제약 조건 없이 테이블을 생성하면 필수 정보가 NULL로 누락 되어도 문제 없이 삽입
INSERT
INTO USER_NOCONS
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
  2
, NULL
, NULL
, NULL
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- 테이블 조회
SELECT
       *
  FROM USER_NOCONS;

-- "컬럼 레벨"에 NOT NULL 제약 조건을 설정하여 USER_NOTNULL 테이블 생성
CREATE TABLE USER_NOTNULL (
    USER_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
);

-- USER_NOTNULL 테이블의 제약 조건 검색
SELECT
       UC.*
     , UCC.*
  FROM USER_CONSTRAINTS UC
  JOIN USER_CONS_COLUMNS UCC ON(UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME)
 WHERE UC.TABLE_NAME = 'USER_NOTNULL';

-- USER_NOTNULL 테이블 제약 조건 위반 테스트
-- 알맞게 정보가 입력 된 데이터
INSERT
INTO USER_NOTNULL
(
USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

INSERT
INTO USER_NOTNULL
(
USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
  2
, 'user02'
, 'pass02'
, NULL
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- UNIQUE 제약 조건

-- UNIQUE 제약 조건이 없는 USER_NOCONS에는 완전히 동일한 행을 삽입해도 문제가 없다.
-- 아이디 등의 컬럼은 중복을 허용하면 안되므로 UNIQUE 제약조건이 필요하다.
INSERT
INTO USER_NOCONS
(
USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- UNIQUE 제약 조건을 "컬럼 레벨"에서 설정한 USER_UNIQUE 테이블 생성
CREATE TABLE USER_UNIQUE (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) UNIQUE NOT NULL,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
);

-- USER_UNIQUE 테이블에 동일 USER_ID 삽입 불가 테스트
INSERT
INTO USER_UNIQUE
(
USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- "제약조건명"을 이용해서 제약 조건 검색
SELECT
       UCC.TABLE_NAME
     , UCC.COLUMN_NAME
     , UC.CONSTRAINT_TYPE
  FROM USER_CONSTRAINTS UC
     , USER_CONS_COLUMNS UCC
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
   AND UCC.CONSTRAINT_NAME = 'SYS_C007371';  --위에서 발생한 제약 조건 이름을 사용

-- "테이블 레벨"에서 UNIQUE 제약 조건을 설정하는 USER_UNIQUE2 테이블 생성
CREATE TABLE USER_UNIQUE2 (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) NOT NULL,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    UNIQUE(USER_ID)--대상 컬럼을 같이 기재해야 함
);

-- USER_UNIQUE2에 USER_ID 중복 삽입 불가 테스트
INSERT
INTO USER_UNIQUE2
(
USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- "제약조건명"을 이용해서 제약 조건 검색
SELECT
       UCC.TABLE_NAME
     , UCC.COLUMN_NAME
     , UC.CONSTRAINT_TYPE
  FROM USER_CONSTRAINTS UC
     , USER_CONS_COLUMNS UCC
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
   AND UCC.CONSTRAINT_NAME = 'SYS_C007374';  --위에서 발생한 제약 조건 이름을 사용

-- 2개 이상의 컬럼을 묶어서 하나의 UNIQUE 제약 조건 설정
-- 이 때는 테이블 레벨에서 밖에 설정할 수 없다.
CREATE TABLE USER_UNIQUE3 (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) NOT NULL,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    UNIQUE(USER_NO, USER_ID)
);


-- USER_UNIQUE3에 USER_NO, USER_ID에 대해 중복 값 입력 불가한지 테스트
INSERT
INTO USER_UNIQUE3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
  1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

INSERT
INTO USER_UNIQUE3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
   1
, 'user02'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

INSERT
INTO USER_UNIQUE3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
   2
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- USER_NO와 USER_ID가 모두 동일한 경우에만 제약조건 위배
INSERT
INTO USER_UNIQUE3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
   1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- "제약조건명"을 이용해서 제약 조건 검색
SELECT
       UCC.TABLE_NAME
     , UCC.COLUMN_NAME
     , UC.CONSTRAINT_TYPE
  FROM USER_CONSTRAINTS UC
     , USER_CONS_COLUMNS UCC -- 'SYS_C007377'의 2행이 있음
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
   AND UCC.CONSTRAINT_NAME = 'SYS_C007377';  --위에서 발생한 제약 조건 이름을 사용

-- 제약 조건명 붙여서 테이블 생성 --문법임 외우기
CREATE TABLE CONS_NAME(              -- 제약조건명 -- NOT NULL을 주고싶다는 뜻
  TEST_DATA1 VARCHAR2(20) CONSTRAINT NN_TEST_DATA1 NOT NULL,
  TEST_DATA2 VARCHAR2(20) CONSTRAINT UN_TEST_DATA2 UNIQUE,
  TEST_DATA3 VARCHAR2(30),
  CONSTRAINT UN_TEST_DATA3 UNIQUE(TEST_DATA3)--제약조건명을 TEST_DATA3로 하겠다
);

-- CONS_NAME 테이블의 제약 조건 검색
SELECT
        UC.*
   FROM USER_CONSTRAINTS UC
  WHERE TABLE_NAME = 'CONS_NAME';

-- CHECK 제약 조건

-- USER_CHECK 테이블 생성
CREATE TABLE USER_CHECK (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK(GENDER IN ('남', '여')), --!
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
);

-- USER_CHECK에 GENDER에 대해 '남' OR '여' 외에 입력 불가한지 테스트
INSERT
INTO USER_CHECK
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
   3
, 'user03'
, 'pass03'
, '선덕여왕'
, '여' --'여자' 라고 하면 체크 제약조건(C##EMPLOYEE.SYS_C007382) 위배 뜸.
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- 테이블 레벨에서 CHECK 제약 조건 설정
CREATE TABLE TEST_CHECK(
    TEST_NUMBER NUMBER,
    CONSTRAINT CK_TEST_NUMBER CHECK(TEST_NUMBER > 0)-- CHECK(제약조건)을 쓰는 법
);

-- TEST_CHECK 테이블에 삽입 테스트
INSERT
  INTO TEST_CHECK --테이블명
(
  TEST_NUMBER --컬럼명 나열
)
VALUES
(
  10 -- 삽입할 데이터 리터럴 쓰기 -- 음수인 -10은 체크제약조건 위배 에러남
);
 
-- PRIMARY KEY(기본키) 제약 조건 : 1.UNIQUE 해야하고 2.NOT NULL 이어야한다

-- 컬럼 레벨에서 PK 설정하여 USER_PRIMARYKEY 테이블 생성
CREATE TABLE USER_PRIMARYKEY (
    USER_NO NUMBER CONSTRAINT PK_USER_NO PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK(GENDER IN ('남', '여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)
);

-- PRIMARY KEY의 NOT NULL, UNIQUE 테스트
INSERT
INTO USER_PRIMARYKEY
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
   1   --NULL이라고 하면 ("C##EMPLOYEE"."USER_PRIMARYKEY"."USER_NO") 안에 삽입 불가라고 뜸
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);

-- "테이블 레벨"에서 PK 설정(복합키로 설정)
CREATE TABLE USER_PRIMARYKEY2 (
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK(GENDER IN ('남', '여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    CONSTRAINT PK_USER_NO2 PRIMARY KEY(USER_NO, USER_ID)
);
   
-- PRIMARY KEY의 NOT NULL, UNIQUE 테스트
INSERT
  INTO USER_PRIMARYKEY2
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
)
VALUES
(
   1     -- 이거랑
, 'user01' -- 이건 PK로 묶여서 설정해놔서 둘중 하나라도 NULL이면 에러남
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
);
 
-- FOREIGN KEY(외래키) 제약 조건 : 다른 테이블의 PRIMARY KEY나 UNIQUE KEY를 참조함  
-- 참조(REFERENCES) 된 다른 테이블에서 제공하는 값만 사용.
-- 제공되는 값 외에는 NULL을 사용할 수 있다. 

-- 부모 테이블 생성 및 데이터 삽입
CREATE TABLE USER_GRADE(
  GRADE_CODE NUMBER PRIMARY KEY,
  GRADE_NAME VARCHAR2(30) NOT NULL
);
INSERT
  INTO USER_GRADE
(
  GRADE_CODE
, GRADE_NAME
)
VALUES
(
   10
, '일반회원'
);

INSERT
INTO USER_GRADE
(
  GRADE_CODE
, GRADE_NAME
)
VALUES
(
   20
, '우수회원'
);

INSERT
INTO USER_GRADE
(
  GRADE_CODE
, GRADE_NAME
)
VALUES
(
   30
, '특별회원'
);

SELECT
UG.*
FROM USER_GRADE UG;

-- 자식 테이블 USER_FOREIGNKEY 생성
CREATE TABLE USER_FOREIGNKEY (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK(GENDER IN ('남', '여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODE NUMBER,
    CONSTRAINT FK_GRADE_CODE FOREIGN KEY(GRADE_CODE) REFERENCES USER_GRADE(GRADE_CODE)
);

INSERT
INTO USER_FOREIGNKEY
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
, 10 -- GRADE_CODE
);

INSERT
INTO USER_FOREIGNKEY
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   2
, 'user02'
, 'pass02'
, '유관순'
, '여'
, '010-1111-2222'
, 'yoo123@greedy.com'
, 10
);

INSERT
INTO USER_FOREIGNKEY
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   3
, 'user03'
, 'pass03'
, '윤봉길'
, '남'
, '010-1234-5678'
, 'yoon123@greedy.com'
, 30
);

-- FK는 NULL 값을 허용한다.
INSERT
INTO USER_FOREIGNKEY
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   4
, 'user04'
, 'pass04'
, '선덕여왕'
, '여'
, '010-1234-5678'
, 'sun123@greedy.com'
, NULL
);

-- 부모 키가 없어 외래키 제약 조건 위반 에러남.
INSERT
INTO USER_FOREIGNKEY
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   5
, 'user05'
, 'pass05'
, '신사임당'
, '여'
, '010-1234-5678'
, 'shin123@greedy.com'
, 50
);

-- 두 테이블을 조인하여 조회
SELECT
        UF.USER_ID
      , UF.GENDER
      , UF.PHONE
      , UG.GRADE_NAME
   FROM USER_FOREIGNKEY  --이거랑 밑에랑 조인
   LEFT JOIN USER_GRADE ON (UF.GRADE_CODE = UG.GRADE_CODE);-- GRADE_CODE 에 넣어둔 정수가 일치하는것 끼리 위에 정해둔 회원에 맞춰 나옴

-- 삭제 옵션 : 부모테이블의 데이터 삭제시 자식 테이블의 데이터를 어떻게 처리할 것인지 설정

-- ON DELETE RESTRICT : 삭제 기본 지정 룰 (삭제 불가)
-- FK로 지정된 컬럼에서 사용하고 있으므로 삭제 불가
DELETE
  FROM USER_GRADE
 WHERE GRADE_CODE = 10; --니 맘대로 삭제하면 안된다고 오류남

-- 자식 레코드로 사용되지 않는 값은 삭제가 가능하다.
DELETE
  FROM USER_GRADE
 WHERE GRADE_CODE = 20;  --이건 삭제됨 참조하는 애가 없기때문
  
--!  
-- ON DELETE SET NULL : 부모 키 삭제 시 자식 키를 NULL로 변경하는 옵션
-- USER_GRADE2 테이블 생성
CREATE TABLE USER_GRADE2(
  GRADE_CODE NUMBER PRIMARY KEY,
  GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT
 INTO USER_GRADE2
(
      GRADE_CODE
    , GRADE_NAME
)
VALUES
(
   10
, '일반회원'
);

INSERT
 INTO USER_GRADE2
(
      GRADE_CODE
    , GRADE_NAME
)
VALUES
(
   20
, '우수회원'
);

INSERT
 INTO USER_GRADE2
(
      GRADE_CODE
    , GRADE_NAME
)
VALUES
(
   30
, '특별회원'
);

SELECT
        UG.*
   FROM USER_GRADE2 UG;
   
-- USER_FOREIGNKEY2 테이블 생성
    CREATE TABLE USER_FOREIGNKEY2 (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK(GENDER IN ('남', '여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODE NUMBER,
    CONSTRAINT FK_GRADE_CODE2 FOREIGN KEY(GRADE_CODE) REFERENCES USER_GRADE2(GRADE_CODE) ON DELETE SET NULL
);

INSERT
INTO USER_FOREIGNKEY2
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
, 10
);

INSERT
 INTO USER_FOREIGNKEY2
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   2
, 'user02'
, 'pass02'
, '유관순'
, '여'
, '010-1111-2222'
, 'yoo123@greedy.com'
, 10
);

INSERT
INTO USER_FOREIGNKEY2
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   3
, 'user03'
, 'pass03'
, '윤봉길'
, '남'
, '010-1234-5678'
, 'yoon123@greedy.com'
, 30
);

-- FK는 NULL 값을 허용한다.
INSERT
 INTO USER_FOREIGNKEY2
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   4
, 'user04'
, 'pass04'
, '선덕여왕'
, '여'
, '010-1234-5678'
, 'sun123@greedy.com'
, NULL
);

-- 부모 키가 없어 외래키 제약 조건 위반
INSERT
INTO USER_FOREIGNKEY2
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   5
, 'user05'
, 'pass05'
, '신사임당'
, '여'
, '010-1234-5678'
, 'shin123@greedy.com'
, 50
);

-- 삭제 제한이 걸려있지 않아 자식 레코드가 있더라도 삭제가 수행된다.
DELETE
  FROM USER_GRADE2
 WHERE GRADE_CODE = 10;

SELECT
        *
   FROM USER_GRADE2;
   
-- 대신 삭제 된 값을 참조할 수는 없으므로 NULL 값으로 변경된다.
SELECT -- 삭제해서 값이 없어짐 NULL로 출력
        *
   FROM USER_FOREIGNKEY2;
 
 
--!  
-- ON DELETE CASCADE : 부모 키 삭제시 자식 키를 가진 행도 삭제 (같이 날아감)
-- USER_GRADE3 테이블 생성
CREATE TABLE USER_GRADE3(
  GRADE_CODE NUMBER PRIMARY KEY,
  GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT
 INTO USER_GRADE3
(
      GRADE_CODE
    , GRADE_NAME
)
VALUES
(
   10
, '일반회원'
);

INSERT
 INTO USER_GRADE3
(
      GRADE_CODE
    , GRADE_NAME
)
VALUES
(
   20
, '우수회원'
);

INSERT
 INTO USER_GRADE3
(
    GRADE_CODE
    , GRADE_NAME
)
VALUES
(
   30
, '특별회원'
);

SELECT
        UG.*
   FROM USER_GRADE3 UG;
   
-- USER_FOREIGNKEY3 테이블 생성
CREATE TABLE USER_FOREIGNKEY3 (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10) CHECK(GENDER IN ('남', '여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODE NUMBER,
    CONSTRAINT FK_GRADE_CODE3 FOREIGN KEY(GRADE_CODE) REFERENCES USER_GRADE3(GRADE_CODE) ON DELETE CASCADE
);

INSERT
 INTO USER_FOREIGNKEY3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   1
, 'user01'
, 'pass01'
, '홍길동'
, '남'
, '010-1234-5678'
, 'hong123@greedy.com'
, 10
);

INSERT
 INTO USER_FOREIGNKEY3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   2
, 'user02'
, 'pass02'
, '유관순'
, '여'
, '010-1111-2222'
, 'yoo123@greedy.com'
, 10
);

INSERT
 INTO USER_FOREIGNKEY3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   3
, 'user03'
, 'pass03'
, '윤봉길'
, '남'
, '010-1234-5678'
, 'yoon123@greedy.com'
, 30
);

-- FK는 NULL 값을 허용한다.
INSERT
 INTO USER_FOREIGNKEY3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   4
, 'user04'
, 'pass04'
, '선덕여왕'
, '여'
, '010-1234-5678'
, 'sun123@greedy.com'
, NULL
);

-- 부모 키가 없어 외래키 제약 조건 위반
INSERT
 INTO USER_FOREIGNKEY3
(
  USER_NO
, USER_ID
, USER_PWD
, USER_NAME
, GENDER
, PHONE
, EMAIL
, GRADE_CODE
)
VALUES
(
   5
, 'user05'
, 'pass05'
, '신사임당'
, '여'
, '010-1234-5678'
, 'shin123@greedy.com'
, 50
);

-- 삭제 제한이 걸려있지 않아 자식 레코드가 있더라도 삭제 가능
DELETE
  FROM USER_GRADE3
 WHERE GRADE_CODE = 10;
 
SELECT
        *
   FROM USER_GRADE3;
   
-- 대신 CASCADE 조건의 경우(삭제 된 값을 참조할 수 없으므로) 자식 테이블의 해당 행이 같이 삭제 되었다.
SELECT
        *
   FROM USER_FOREIGNKEY3;


-- 서브쿼리를 이용한 테이블 생성
CREATE TABLE EMPLOYEE_COPY
AS
SELECT --서브쿼리
        E.*
   FROM EMPLOYEE E;
   
-- 조회 
-- 컬럼명, 데이터 타입, 행이 복사 되고 제약 조건은 NOT NULL만 복사 된다.
SELECT
        *
   FROM EMPLOYEE_COPY;
  

-- 회원 가입용 테이블 생성(USER_TEST) --------------------------------------------
-- 컬럼명 : USER_NO(회원번호)- PK 설정
--         USER_ID(회원아이디) -- 중복 금지, NULL값 허용 안함
--         USER_PWD(회원비밀번호) -- NULL값 허용 안함
--         GENDER(성별) -- '남' 또는 '여'로 입력
--         PHONE(연락처) 
--         ADDRESS(주소)
--         STATUS(탈퇴여부) -- NOT NULL, 'Y' 혹은 'N'으로 입력
-- 각 제약 조건에 모두 제약조건명 부여
-- 각 컬럼별로 코멘트 생성
-- 5명 이상 회원 정보 INSERT   

CREATE TABLE USER_TEST(
  USER_NO NUMBER CONSTRAINT PK_USERNO PRIMARY KEY,
  USER_ID VARCHAR2(20) CONSTRAINT NN_USER_ID NOT NULL CONSTRAINT UK_USER_ID UNIQUE,
  USER_PWD VARCHAR2(20) CONSTRAINT NN_USER_PWD NOT NULL,
  GENDER VARCHAR2(3) CONSTRAINT CK_GENDER CHECK(GENDER IN ('남', '여')),
  PHONE VARCHAR2(20),
  ADDRESS VARCHAR2(100),
  STATUS VARCHAR2(3) CONSTRAINT NN_STATUS NOT NULL,
  CONSTRAINT CK_STATUS CHECK(STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN USER_TEST.USER_NO IS '회원번호';
COMMENT ON COLUMN USER_TEST.USER_ID IS '회원아이디';
COMMENT ON COLUMN USER_TEST.USER_PWD IS '비밀번호';
COMMENT ON COLUMN USER_TEST.GENDER IS '성별';
COMMENT ON COLUMN USER_TEST.PHONE IS '연락처';
COMMENT ON COLUMN USER_TEST.ADDRESS IS '주소';
COMMENT ON COLUMN USER_TEST.STATUS IS '탈퇴여부';

INSERT 
  INTO USER_TEST
(
  USER_NO, 
  USER_ID, 
  USER_PWD, 
  GENDER,
  PHONE, 
  ADDRESS, 
  STATUS
)
VALUES
(
  1, 
  'user01', 
  'pass01', 
  '여', 
  '010-1234-5678', 
  '서울시 강남구 역삼동', 
  'N'
);

INSERT 
  INTO USER_TEST
(
  USER_NO, USER_ID, USER_PWD
, GENDER, PHONE
, ADDRESS, STATUS
)
VALUES
(
  2, 
  'user02', 
  'pass02', 
  '남', 
  '010-1234-5679', 
  '서울시 강남구 역삼동', 
  'N'
);

INSERT 
  INTO USER_TEST
(
  USER_NO, 
  USER_ID, 
  USER_PWD, 
  GENDER, 
  PHONE, 
  ADDRESS, 
  STATUS
)
VALUES
(
  3, 
  'user03', 
  'pass03', 
  '여', 
  '010-1234-5670', 
  '서울시 강남구 역삼동', 
  'Y'
);

INSERT 
  INTO USER_TEST
(
  USER_NO, USER_ID, USER_PWD
, GENDER, PHONE
, ADDRESS, STATUS
)
VALUES
(
  4, 
  'user04', 
  'pass04', 
  '남', 
  '010-1234-5671', 
  '서울시 강남구 역삼동', 
  'N'
);

INSERT 
  INTO USER_TEST
(
  USER_NO, USER_ID, USER_PWD
, GENDER, PHONE
, ADDRESS, STATUS
)
VALUES
(
  5, 
  'user05', 
  'pass05', 
  '여', 
  '010-1234-5672', 
  '서울시 강남구 역삼동', 
  'N'
);

SELECT
       *
  FROM USER_TEST;