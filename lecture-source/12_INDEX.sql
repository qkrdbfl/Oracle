-- 12_INDEX

-- ROWID : ������Ʈ ��ȣ, ������� ��ȣ, ��� ��ȣ, ������ ��ȣ�� �̷�����ִ�.
SELECT
       ROWID
     , EMP_ID
     , EMP_NAME
  FROM EMPLOYEE;

-- USER_INDEXES
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

-- �ε��� ��Ʈ --
-- ���ϴ� ���̺��� �ε����� ����Ҽ� �ֵ��� ������ ���� ����
SELECT /*+ INDEX(E ����Ƽ1_PK)*/
        E.*
   FROM EMPLOYEE E; --200�� �������� ������

-- �ε��� �������� ���������� ��ĵ�϶�� �ǹ�(INDEX_DESC)
SELECT /*+ INDEX_DESC(E ����Ƽ1_PK)*/
        E.*
   FROM EMPLOYEE E; -- 900�� ���� ������ ������

--------------
-- ���� �ε��� ����  : PK, UNIQUE ���� ������ �����ϸ� �ڵ����� �ش� �÷��� UNIQUE INDEX�� ���� ��.
-- �ߺ� ���� ���� �÷��� UNIQUE �ε����� ������ �� �ִ�.
CREATE UNIQUE INDEX IDX_EMPNO
ON EMPLOYEE(EMP_NO);

-- �ߺ� ���� �ִ� �÷��� UNIQUE �ε����� �������� ���Ѵ�.
CREATE UNIQUE INDEX IDX_DEPT_CODE -- ����ũ�ε����� �ߺ�X
ON EMPLOYEE(DEPT_CODE);


-- ����� �ε���(NONUNIQUE INDEX) 
--  WHERE������ ����ϰ� ���Ǵ� �Ϲ� �÷��� ������� ����
CREATE INDEX IDX_DEPT_CODE -- ������ε��� ����. (UNIQUE)�� ����
ON EMPLOYEE(DEPT_CODE);

-- ���� �ε���(COMPOSITE INDEX) 
-- ���� �ε����� �ߺ� ���� ���� ���� ���� ���� ���� �˻� �ӵ��� ��� ��Ų��.
CREATE INDEX IDX_DEPT-- ���� �ε��� ����.
ON DEPARTMENT (DEPT_ID, DEPT_TITLE);-- �÷��� �κ��� ����.

-- ���� ���� �ε����� ����� ��ȸ
SELECT /*+ INDEX_DESC(D IDX_DEPT)*/ -- �ε��� ��Ʈ�� ��
        D.DEPT_ID
   FROM DEPARTMENT D
  WHERE D.DEPT_ID > '0'
    AND D.DEPT_TITLE > '0';

-- �Լ� ��� �ε���(FUNCTION BASED INDEX)
--  �������� �˻��ϴ� ��찡 ���ٸ�, �����̳� �Լ������� �̷���� �÷��� �ε����� ����� �ִ�.
CREATE INDEX IDX_EMP_SALCALC -- �Լ� ��� �ε��� ����
ON EMPLOYEE((SALARY + (SALARY * NVL(BONUS,0))) * 12);

--  �Լ� ��� �ε����� ����� ��ȸ ���� �ۼ�
SELECT /*+ INDEX_DESC(E IDX_EMP_SALCALC)*/ -- IDX_EMP_SALCALC�� ��ȸ�ϰڴٴ� �ε��� ��Ʈ ���
        E.EMP_ID
      , E.EMP_NAME
      ,(E.SALARY + (E.SALARY * NVL(E.BONUS,0))) * 12 ����
   FROM EMPLOYEE E
 WHERE (E.SALARY + (E.SALARY * NVL(E.BONUS,0))) * 12 > 1000000;