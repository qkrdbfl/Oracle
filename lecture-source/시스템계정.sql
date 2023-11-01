-- 계정명 : C##EMPLOYEE, 비밀번호 : EMPLOYEE로 새로운 계정 생성
CREATE USER C##EMPLOYEE IDENTIFIED BY EMPLOYEE;
-- C##EMPLOYEE 계정에 접속 권한, 테이블 생성 권한 등을 부여
GRANT RESOURCE, CONNECT TO C##EMPLOYEE;
-- C##EMPLOYEE 계정에 테이블 스페이스 부여
ALTER USER C##EMPLOYEE QUOTA UNLIMITED ON USERS;
---------------------------------------------------------------
--과제 계정 생성
CREATE USER C##HOMEWORK IDENTIFIED BY HOMEWORK;
GRANT RESOURCE, CONNECT TO C##HOMEWORK;
-- C##EMPLOYEE 계정에 테이블 스페이스 부여
ALTER USER C##HOMEWORK QUOTA UNLIMITED ON USERS;
------------------------------------------------------------------
-- 오지라퍼즈 계정
CREATE USER C##OHGIRAFFERS IDENTIFIED BY OHGIRAFFERS;
GRANT RESOURCE, CONNECT TO C##OHGIRAFFERS;
ALTER USER C##OHGIRAFFERS QUOTA UNLIMITED ON USERS;
-----------------------------------------------------------------------
--박유리 계정
CREATE USER C##QKRDBFL IDENTIFIED BY QKRDBFL;
GRANT RESOURCE, CONNECT TO C##QKRDBFL;
ALTER USER C##QKRDBFL QUOTA UNLIMITED ON USERS;
---------------------------------------