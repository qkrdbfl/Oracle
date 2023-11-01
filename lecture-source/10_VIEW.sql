-- 10_VIEW

-- ��� , �̸�, ���޸�, �ٹ������� ��ȸ�ϰ� �� ����� V_RESULT_EMP��� ��� ����
CREATE OR REPLACE VIEW V_RESULT_EMP --V_RESULT_EMP��� �� ���� ����
AS -- ������ ����� �ϴٴ� ���� �ý��� ������ �������������Ϳ� �並 �����Ҽ� �ִ� ������ ����� ����
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


-- ���� ���� �������� �� ��ü ���� ������ �ο� �Ǿ� ���� �ʾ� ���� ����� ������
-- �ý��� �������� ��ȯ�Ͽ� �� ��ü ���� ������ �ο��� �� �۾��Ѵ�
GRANT CREATE VIEW TO C##EMPLOYEE; -- �ý��� �������� �ٲ۵� ������. �� �� ���� V_RESULT_EMP��� �� ���� ������ �����Ѵ�.

-- ���� �䰡 ������!
-- �並 ���� ��ȸ�Ѵ�
SELECT
        V.*
   FROM V_RESULT_EMP V
  WHERE V.EMP_ID = '205'; -- EMP_ID �� 205�� ����� ��ȸ��

-- �信 ���� ������ Ȯ���ϴ� ������ ��ųʸ�
SELECT
       UV.*
  FROM USER_VIEWS UV;

-- �信 ��Ī�� �ο��ؼ� �����ϱ�
CREATE OR REPLACE VIEW V_EMP
(
  ���
, �̸�
, �μ�
)
AS
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
  FROM EMPLOYEE;

SELECT --��ȸ Ȯ��
       V.*
  FROM V_EMP V;

-- �� ����
DROP VIEW V_EMP; -- DROP VIEW ���̸�; �ֱ�


-- ���̽����̺��� ���� ���� �� �� �ݿ� �׽�Ʈ
COMMIT; -- �ǵ��� �� �ִ� Ŀ�� ����

-- ���̽����̺� EMPLOYEE ����
UPDATE
       EMPLOYEE
   SET EMP_NAME = 'ȫ�浿'
 WHERE EMP_ID = '200';
 
-- ���̽����̺�� �� ��ȸ
SELECT
        E.*
   FROM EMPLOYEE E
  WHERE EMP_ID = '200';

-- ���̽����̺��� ������ ���� �Ǹ� VIEW(��)�� ������ ���� ����ȴ�.
SELECT
        V.*
   FROM V_RESULT_EMP V
  WHERE EMP_ID = '200';

-- ���� ������ ���ư���.
ROLLBACK; --�����Ͼ� ���� ���ư�

DROP VIEW V_RESULT_EMP; -- V_RESULT_EMP �����

-- �� ����
-- �� ���� �ݵ�� ��Ī�� �����ؼ� �並 �����ؾ� �Ѵ�.
CREATE OR REPLACE VIEW V_EMP_JOB
(
  ��� -- �Ⱦ��� ����
, �̸� -- //
, ���� -- //
, ���� -- //
, �ٹ���� -- �Ⱦ��� ����
)
AS
SELECT
        EMP_ID
      , EMP_NAME
      , JOB_NAME
      , DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', '��') -- �� ���� �ݵ�� ����� �Բ� �����϶�� ������
      , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE);

SELECT -- �� ��ȸ
        V.*
   FROM V_EMP_JOB V;

-- ���̺� ����� �䵵 ����Ǵµ� �ݴ�ε� �Ǵ��� �׽�Ʈ �غ��� --
-- VIEW�� �̿��� DML���� ���� �׽�Ʈ
CREATE OR REPLACE VIEW V_JOB
AS
SELECT
      JOB_CODE
    , JOB_NAME
 FROM JOB;
 
--�並 ���� ������ ����
INSERT
  INTO V_JOB
(
  JOB_CODE
, JOB_NAME
)
VALUES
(
  'J8'
, '����'
);

SELECT -- �� ��ȸ Ȯ�� --�Ѵ� ����
        V.*
   FROM V_JOB V;

SELECT -- ���̽����̺� ��ȸ Ȯ�� --�Ѵ� ����
        J.*
   FROM JOB J;
   
-- �並 ���� �÷� �� ����
UPDATE --����
        V_JOB V
    SET JOB_NAME = '�˹�'
  WHERE JOB_CODE = 'J8';

DELETE -- �並 ���� ���� �� ����
FROM V_JOB
WHERE JOB_CODE = 'J8';


-- DML ��ɾ�� VIEW ������ �Ұ����� ���
-- 1. �� ���ǿ� ���� ���� ���� �÷��� �����ϴ� ���
-- �� ����
CREATE OR REPLACE VIEW V_JOB2
AS
SELECT J.JOB_CODE
  FROM JOB J;

SELECT -- Ȯ��
        V.*
   FROM V_JOB2 V;
   
-- �� ���ǿ� ���Ե��� ���� �÷��� �����Ͽ� INSERT   
-- "JOB_NAME" : �������� �ĺ��� ������
INSERT
  INTO V_JOB2
(
  JOB_CODE
, JOB_NAME
)
VALUES
(
  'J8'
, '����'
);
-------- ���ĺ���
-- �� ���ǿ� ��� �� �÷��� ����ϹǷ� ���� ����
-- �� ���ǿ� ���� �� �÷������� INSERT
INSERT
  INTO V_JOB2
(
  JOB_CODE
)
VALUES
(
  'J8'
);

SELECT -- Ȯ��
        J.*
   FROM JOB J;

-- �� ���ǿ� ���� �÷��� ����Ͽ� DELETE ����
DELETE
  FROM V_JOB2
 WHERE JOB_CODE = 'J8';
 
-- 2. �信 ���Ե��� ���� �÷� �߿�
-- ���̽��� �Ǵ� ���̺��� �÷��� NOT NULL  ���� ������ ������ ���
CREATE OR REPLACE VIEW V_JOB3
AS
SELECT J.JOB_NAME
  FROM JOB J;

SELECT -- JOB_NAME�ʸ� �並 ���� ����(��ȸ)
        V.*
   FROM V_JOB3 V;

-- (JOB_CODE, JOB) ���� NULL�� ���� �� �� ���� ����
INSERT
INTO V_JOB3
(
  JOB_CODE -- �̰Ŷ�
, JOB_NAME -- �̰� �Ѵ� ������ ������ �ĺ���
)
VALUES
(
  'J8'
, '����'
);

-- �信 ���� �� �÷����� ����� UPDATE ���� ����
UPDATE
        V_JOB3 V
    SET V.JOB_NAME = '����'
  WHERE V.JOB_NAME = '���';


-- 3. ��� ǥ�������� ���� �� ���
CREATE OR REPLACE VIEW EMP_SAL
AS
SELECT EMP_ID
     , EMP_NAME
     , SALARY
     ,(SALARY + (E.SALARY * NVL(E.BONUS, 0))) * 12 ���� -- �������� ���� �ݾ�
  FROM EMPLOYEE;
  
SELECT -- Ȯ��
        *
   FROM EMP_SAL;

-- ���ǥ�������� ���� �� ���� �÷� �������� INSERT �Ұ�
INSERT
  INTO EMP_SAL
(
  EMP_ID
, EMP_NAME
, SALARY
, ���� --���� (���� ���� ����� �� �����ϴ�)
)
VALUES
(
  '800'
, '������'
, 3000000
, 4000000
);
-------

-- ���ǥ�������� ���� �� ���� �÷� ������ UPDATE �Ұ�
UPDATE 
        EMP_SAL
    SET ���� = 80000000 -- ���� ���� �����ϴ°͵� ����
  WHERE EMP_ID = '200';

---- DELETE�� �������δ� ��� ����
DELETE
  FROM EMP_SAL ES
 WHERE ES.���� = 124800000; -- �����Ͼ��� ������
 
ROLLBACK; --������

-- 4. JOIN�� �̿��� ���� ���̺��� ������ ���
--�� ����
CREATE OR REPLACE VIEW V_JOINEMP
AS
SELECT 
       E.EMP_ID
     , E.EMP_NAME
     , D.DEPT_TITLE
  FROM EMPLOYEE E
  LEFT JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID);
  
SELECT-- ȭ��
        *
   FROM V_JOINEMP;

-- JOIN���� ���� �� �信 INSERT �Ẹ��
--���� : (���� �信 ���Ͽ� �ϳ� �̻��� �⺻ ���̺��� ������ �� �����ϴ�.)
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
, '������'
, '�λ������'
);

-- JOIN���� ���� �� �信 UPDATE �Ẹ��
-- ���� : (Ű-�����Ȱ��� �ƴ� ���̺�� ������ ���� ������ �� �����ϴ�)
UPDATE
        V_JOINEMP V
    SET V.DEPT_TITLE = '�λ������';

-- JOIN���� ���� �� �信 DELETE �Ẹ��
-- DELETE�� �������� ����ϴ°� ������
DELETE
   FROM V_JOINEMP V
  WHERE V.EMP_ID = '219';

ROLLBACK;

-- 5. DISTINCT�� ������ ���
-- �� ����
CREATE OR REPLACE VIEW V_DT_EMP
AS
SELECT DISTINCT E.JOB_CODE
  FROM EMPLOYEE E;

-- DISTINCT�� ������ �信 INSERT �Ẹ��
-- ���� : (�信 ���� ������ ������ �������մϴ�)
INSERT
INTO V_DT_EMP
(
  JOB_CODE
)
VALUES
(
  'J9'
);

--  DISTINCT�� ������ �信 UPDATE �Ẹ��
-- ���� : (�信 ���� ������ ������ �������մϴ�)
UPDATE
        V_DT_EMP V
    SET V.JOB_CODE = 'J9'
  WHERE V.JOB_CODE = 'J7';

-- DISTINCT�� ������ �信 DELETE �Ẹ��
-- ���� : (�信 ���� ������ ������ �������մϴ�)
DELETE
  FROM V_DT_EMP V
 WHERE V.JOB_CODE = 'J7';
 

-- 6. �׷��Լ��� GROUP BY���� ������ ���
-- �� ���� 
CREATE OR REPLACE VIEW V_GROUPDEPT
AS
SELECT E.DEPT_CODE
     , SUM(E.SALARY) �հ� 
     , AVG(E.SALARY) ��� 
  FROM EMPLOYEE E
 GROUP BY E.DEPT_CODE; -- �׷���̷� ������� ���� �÷�
 
-- �׷� �Լ�, GROUP BY���� ������ �信 INSERT
-- ���� : (���� ���� ����� �� �����ϴ�)
INSERT
  INTO V_GROUPDEPT
(
  DEPT_CODE
, �հ� -- �׷���̷� ������� ���� �հ�, ���
, ��� -- //
)
VALUES
(
  'D0'
, 60000000
, 4000000
); 

-- �׷� �Լ�, GROUP BY���� ������ �信 UPDATE
-- ���� : (�信 ���� ������ ������ �������մϴ�)
UPDATE
        V_GROUPDEPT V
    SET V.DEPT_CODE = 'D10'
  WHERE V.DEPT_CODE = 'D1';

-- �׷� �Լ�, GROUP BY���� ������ �信 DELETE
-- ���� : (�信 ���� ������ ������ �������մϴ�)
DELETE
  FROM V_GROUPDEPT V
 WHERE V.DEPT_CODE = 'D1';
-- �׷���� �信 INSERT, UPDATE, DELETE �� �Ұ����ϴ�


-- VIEW OPTION(�ɼ�) --
-- FORCE / NOFORCE
-- FORCE �ɼ����� �� ����
CREATE OR REPLACE FORCE VIEW V_EMP
AS -- (���: ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.)��� ��
SELECT TCODE -- �� �ƹ����� �� SELECT. �׷��� ��������� ��
     , TNAME
     , TCONTENT
  FROM TT;

CREATE OR REPLACE /*NOFORCE*/ VIEW V_EMP
AS -- ���� (���̺� �Ǵ� �䰡 ����)
SELECT TCODE
     , TNAME
     , TCONTENT
  FROM TT;

-- WITH CHECK OPTION : �������� ���� �÷� ���� ���� ���� ���ϰ� �ϴ� �ɼ�
-- �� ����
CREATE OR REPLACE VIEW V_EMP2
AS
SELECT
        E.*
   FROM EMPLOYEE E
  WHERE MANAGER_ID = '200' -- 200���� �ָ� �������� ��ȸ�ϴ� ��������
   WITH CHECK OPTION; --üũ�ؼ� �� ���� �������� ���ϰԲ� �ϰڴٴ� �ڵ�.

-- �� ������ �����϶�� �Ẹ��. 
-- ���� : (���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�)
UPDATE
        V_EMP2
    SET MANAGER_ID = '900'
  WHERE MANAGER_ID = '200'; 
 
-- ���� ���ϰԲ� �غ���
-- WITH READ ONLY : DNL ������ �Ұ����ϰ� �ϴ� �ɼ�
-- �� ����
CREATE OR REPLACE VIEW V_DEPT
AS
SELECT
        D.*
   FROM DEPARTMENT D
   WITH READ ONLY; -- READ ONLY�ɼ��� ���� 

-- DELETE �׽�Ʈ
-- ���� : (�б� ���� �信���� DML �۾��� ������ �� �����ϴ�.)
DELETE
  FROM V_DEPT;