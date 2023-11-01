-- 08_TCL(Transaction Control Language)

CREATE TABLE TBL_USER(
    USERNO NUMBER UNIQUE,
    ID VARCHAR2(20) PRIMARY KEY,
    PASSWORD CHAR(20) NOT NULL
);

INSERT
  INTO TBL_USER
(
  USERNO
, ID
, PASSWORD
)
VALUES
(
   1
, 'test1'
, 'pass1'
);
--
INSERT
  INTO TBL_USER
(
  USERNO
, ID
, PASSWORD
)
VALUES
(
   2
, 'test2'
, 'pass2'
);
--
INSERT
  INTO TBL_USER
(
  USERNO
, ID
, PASSWORD
)
VALUES
(
   3
, 'test3'
, 'pass3'
);

SELECT
        UT.*
   FROM TBL_USER UT;     

COMMIT; --커밋 필수!
--
INSERT
  INTO TBL_USER
(
  USERNO
, ID
, PASSWORD
)
VALUES
(
   4
, 'test4'
, 'pass4'
);

SELECT
        UT.*
   FROM TBL_USER UT;

ROLLBACK;

SAVEPOINT SP1; --세이브포인트
--
INSERT
  INTO TBL_USER
(
  USERNO
, ID
, PASSWORD
)
VALUES
(
   5
, 'test5'
, 'pass5'
);

SELECT
        UT.*
   FROM TBL_USER UT;

ROLLBACK TO SP1; -- SP1 세이브 포인트로 돌아감

ROLLBACK;
------------------------