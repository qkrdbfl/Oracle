-- 09_DDL(Data Definition Language)

--ALTER : ��ü�� �����ϴ� ����
--���̺� ��ü ���� �� ALTER TABLE ���̺�� ������ ����; < ����

-- �÷� �߰�
SELECT
        DC.*
   FROM DEPT_COPY DC;   

ALTER TABLE DEPT_COPY
ADD (LNAME VARCHAR2(20));

-- �÷� ����
ALTER TABLE DEPT_COPY
DROP COLUMN LNAME;

SELECT
        DC.*
   FROM DEPT_COPY DC;  

-- �÷� ������ DEFAULT(����Ʈ) �� ����
ALTER TABLE DEPT_COPY
ADD (CNAME VARCHAR2(20) DEFAULT '�ѱ�');

SELECT
        DC.*
   FROM DEPT_COPY DC; 

-- ���� ���� �߰�
CREATE TABLE DEPT_COPY2
AS
SELECT D.*
  FROM DEPARTMENT D;

-- PK �������� �߰�
ALTER TABLE DEPT_COPY2
ADD CONSTRAINT PK_DEPT_ID2 PRIMARY KEY(DEPT_ID);

-- UNIQUE ���� ���� �߰�
ALTER TABLE DEPT_COPY2
ADD CONSTRAINT UN_DEPT_TITLE2 UNIQUE(DEPT_TITLE);

-- NOT NULL ���� ���� �߰�
-- !** ADD �� �ƴ� MODIFY �� ��� **
-- NOT NULL���� NULL�� NULL���� NOT NULL�� �Ӵٰ��� ���� ����
ALTER TABLE DEPT_COPY2
MODIFY DEPT_TITLE CONSTRAINT NN_DEPT_TITLE2 NOT NULL;

--  �÷� �ڷ��� ����
ALTER TABLE DEPT_COPY2
MODIFY DEPT_ID CHAR(3)
MODIFY DEPT_TITLE VARCHAR2(20)
MODIFY LOCATION_ID VARCHAR2(2);

--�ٸ��� �����غ���
-- !�÷��� ũ�⸦ ���̴� ��� �����Ϸ��� ũ�⸦ �ʰ��ϴ� �÷� ���� ���� ���� ������ �� �ִ�.
-- �̹� �ִ� ������ ���̰� 9�� 10�� (�Ϻ� ���� �ʹ� Ŀ�� �� ���̸� ���� �� ����) ��� ������
ALTER TABLE DEPT_COPY2 -- ������� �ִ� �����͸� ����ؼ� �ؾ���
MODIFY DEPT_TITLE VARCHAR2(10);

-- DEFAULT �� ����
-- ���� ���� ���� �ȹٲ� �μ�Ʈ �� ������
ALTER TABLE DEPT_COPY
MODIFY CNAME DEFAULT '�̱�';-- ����Ʈ�� �̱����� �����ϱ�

INSERT
  INTO DEPT_COPY
VALUES
(
  'DO'
, '�����'
, 'L2'
,  DEFAULT
); -- D0 ������� L2 �̱� ���� ����

SELECT
        DC.*
   FROM DEPT_COPY DC;-- Ȯ��

-- �÷� ����
ALTER TABLE DEPT_COPY2
DROP COLUMN DEPT_TITLE;

ALTER TABLE DEPT_COPY2
DROP COLUMN DEPT_ID;

-- ���̺� �ּ� �Ѱ� �̻��� �÷��� �����־ƾ� ���� ����
-- ���̺� ��� ������ �����Ҽ� ���� ������ ��
ALTER TABLE DEPT_COPY2
DROP COLUMN LOCATION_ID;

-- ���� ������ �ִ� �÷� ����
CREATE TABLE TB1( -- ���̺� ����
  PK NUMBER PRIMARY KEY,
  FK NUMBER REFERENCES TB1,-- �տ� FK�� PK�� �����Ѵٴ� �� 
  COL1 NUMBER,
  CHECK(PK > 0 AND COL1 > 0)
);
-- PK(�÷�)�� �����غ��� -- ���������� ����
-- �÷� ���� �� ���� �ϰ� �ִ� �÷��� �ִٸ� ���� �Ұ�
ALTER TABLE TB1
DROP COLUMN PK; -- �θ�Ű�� �����Ҽ� ���ٴ� ����

-- ���� ������ �Բ� �����ϴ� ������ ����ϸ� ���� ���� ����
ALTER TABLE TB1 --����
DROP COLUMN PK CASCADE CONSTRAINTS;-- ������

SELECT
        T.*
   FROM TB1 T; --Ȯ�� PK ��� �÷��� �� ������ 
   
   
-- ���������� �����ϱ�  
-- ���� ������ �ɸ� CONST_EMP ���̺� ����
CREATE TABLE CONST_EMP (
    ENAME VARCHAR2(20) NOT NULL,
    ENO VARCHAR2(15) NOT NULL,
    MARRIAGE CHAR(1) DEFAULT 'N',
    EID CHAR(3),
    EMAIL VARCHAR2(30),
    JID CHAR(2),
    MID CHAR(3),
    DID CHAR(2),
-- ���̺� ������ ���� ���� ����
    CONSTRAINT CK_MARRIAGE CHECK(MARRIAGE IN('Y', 'N')),
    CONSTRAINT PK_EID PRIMARY KEY(EID),
    CONSTRAINT UN_ENO UNIQUE(ENO),
    CONSTRAINT UN_EMAIL UNIQUE(EMAIL),
    CONSTRAINT FK_JID FOREIGN KEY(JID) REFERENCES JOB(JOB_CODE) ON DELETE SET NULL,
    CONSTRAINT FK_MID FOREIGN KEY(MID) REFERENCES CONST_EMP ON DELETE SET NULL,
    CONSTRAINT FK_DID FOREIGN KEY(DID) REFERENCES DEPARTMENT ON DELETE CASCADE
);

-- �������� 1�� ���� ��
ALTER TABLE CONST_EMP
DROP CONSTRAINT CK_MARRIAGE;

-- ���� ���� ������ ���� ��
ALTER TABLE CONST_EMP
DROP CONSTRAINT FK_JID
DROP CONSTRAINT FK_MID
DROP CONSTRAINT FK_DID;

-- NOT NULL ���������� ���� �ÿ��� * MODIFY * ��� --����
ALTER TABLE CONST_EMP
MODIFY (ENAME NULL, ENO NULL); --MODIFY(�÷��� NULL, �÷��� NULL);

-- �̸� ���� --
--[�÷��� ����]
-- ALTER TABLE ���̺�� RENAME COLUMN �����÷��� TO �����÷���; 
CREATE TABLE DEPT_COPY3
AS SELECT * FROM DEPARTMENT;

SELECT
        DC.*
   FROM DEPT_COPY3 DC;-- Ȯ��
   
-- DEPT_CODE�� �÷��� �ٲ㺸��
ALTER TABLE DEPT_COPY3
RENAME COLUMN DEPT_ID TO DEPT_CODE;-- RENAME ���

-- [�������Ǹ� ����]
ALTER TABLE DEPT_COPY3
ADD CONSTRAINT PK_DEPT_CODE3 PRIMARY KEY(DEPT_CODE);

ALTER TABLE DEPT_COPY3
RENAME CONSTRAINT PK_DEPT_CODE3 TO PK_DCODE; --CONSTRAINT ���

-- [���̺�� ����]
ALTER TABLE DEPT_COPY3
RENAME TO DEPT_TEST; -- DEPT_TEST�� �ٲ�

SELECT
        DC.*
   FROM DEPT_COPY3 DC; -- ���̻� DEPT_COPY3�� �˻��ص� �̸��� �ٲ㼭 �������� �ʴٴ� ������

SELECT
        DT.*
   FROM DEPT_TEST DT; -- ���� �߱� ������ �� ��

-- [���̺� ����]
-- DROP TABLE ���̺�� [CASCADE CONSTRAINTS];
-- �θ�(���� �÷�) ���� ���� ���Ѵٰ� �ϴ� ������ ���� �� ������ �־ �ڿ�  [CASCADE CONSTRAINTS]; �� �ٿ���
DROP TABLE DEPT_TEST CASCADE CONSTRAINTS;

SELECT
        DT.*
    ROM DEPT_TEST DT; -- ���� �Ǿ �˻� �ȵ�