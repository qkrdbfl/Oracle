-- ������ : C##EMPLOYEE, ��й�ȣ : EMPLOYEE�� ���ο� ���� ����
CREATE USER C##EMPLOYEE IDENTIFIED BY EMPLOYEE;
-- C##EMPLOYEE ������ ���� ����, ���̺� ���� ���� ���� �ο�
GRANT RESOURCE, CONNECT TO C##EMPLOYEE;
-- C##EMPLOYEE ������ ���̺� �����̽� �ο�
ALTER USER C##EMPLOYEE QUOTA UNLIMITED ON USERS;
---------------------------------------------------------------
--���� ���� ����
CREATE USER C##HOMEWORK IDENTIFIED BY HOMEWORK;
GRANT RESOURCE, CONNECT TO C##HOMEWORK;
-- C##EMPLOYEE ������ ���̺� �����̽� �ο�
ALTER USER C##HOMEWORK QUOTA UNLIMITED ON USERS;
------------------------------------------------------------------
-- ���������� ����
CREATE USER C##OHGIRAFFERS IDENTIFIED BY OHGIRAFFERS;
GRANT RESOURCE, CONNECT TO C##OHGIRAFFERS;
ALTER USER C##OHGIRAFFERS QUOTA UNLIMITED ON USERS;
-----------------------------------------------------------------------
--������ ����
CREATE USER C##QKRDBFL IDENTIFIED BY QKRDBFL;
GRANT RESOURCE, CONNECT TO C##QKRDBFL;
ALTER USER C##QKRDBFL QUOTA UNLIMITED ON USERS;
---------------------------------------