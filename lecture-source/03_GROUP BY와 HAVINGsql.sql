--03. GROUP BY�� HAVING

-- GROUP BY : ���� ������ ������ ��� �� �÷��� ������ ���� ������ �ϳ��� �׷����� ���´�

--�μ��� ���� �հ�
SELECT
        DEPT_CODE
       ,SUM(SALARY) 
   FROM EMPLOYEE  -- ��������� ���� ���� �׷��� �׷� �Լ��� �ƴ϶�� ������  
 GROUP BY DEPT_CODE; --�̰� ������� �׷����� ����
 
-- �μ��� �޿� �հ�, ���(����ó��), �ο��� ��ȸ �� �μ��ڵ� �� �������� ����
SELECT
        DEPT_CODE �μ�
      , SUM(SALARY) �հ�
      , ROUND(AVG(SALARY)) ���
      , COUNT(*) �ο���
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
  ORDER BY DEPT_CODE;
-- ORDER BY 1 DESC NULLS LAST;
-- ORDER BY �μ�;
-- ORDER BY 4 DESC, 1; --�������� �ϰ� ������ DESC

-- ���� �ڵ庰�� ���ʽ��� �޴� ������� ��ȸ�ϰ� ���� �ڵ� �������� ����
SELECT
        JOB_CODE
      , COUNT(BONUS)
   FROM EMPLOYEE
  GROUP BY JOB_CODE
  ORDER BY JOB_CODE;


-- ���� �ڵ庰�� ���ʽ��� �޴� ������� ��ȸ�ϰ� ���� �ڵ� �������� ����
-- ��, ���ʽ��� �޴� ����� ���� ������ ������� ����
SELECT
        JOB_CODE
      , COUNT(BONUS)
   FROM EMPLOYEE
  WHERE BONUS IS NOT NULL 
  GROUP BY JOB_CODE
  ORDER BY JOB_CODE;

-- GROUP BY ���� �ϳ� �̻��� �׷��� �����Ҽ� ����
SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
      , COUNT(*)
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
      , JOB_CODE
  ORDER BY 1;
 
-- GROUP BY ���� �Լ����� ����Ҽ� �ִ�     
-- ���� �׷����� �޿� ���(���� ó��), �հ�, �ο����� ��ȸ�� �� �ο����� �������� ����
SELECT
        DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��') ����
      , ROUND(AVG(SALARY)) ���
      , SUM(SALARY) �հ�
      , COUNT(*) �ο���  
   FROM EMPLOYEE
  GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��')
-- GROUP BY ���� (SELECT���� ��Ī�� ����� �� ����. ���� SELECT ���� ������� �ʾҴ�.)
-- ORDER BY ����; -- �� �������� ���ٸ� �̰� ������
  ORDER BY ���� DESC; -- ORDER BY ���� �������� ���� �ǹǷ� SELECT�� ��Ī ��� ����


-- HAVING�� : �׷� �Լ��� ���ؿ� �׷쿡 ���� ������ �����Ҷ� ����Ѵ�
-- 300���� �̻��� ������ �޴� ������� ������� �μ��� ���� ��� ���
SELECT
        DEPT_CODE
      , ROUND(AVG(SALARY)) ���
   FROM EMPLOYEE
  WHERE SALARY >= 3000000
  GROUP BY DEPT_CODE
  ORDER BY 1;
  
-- ��� ������ ������� �μ��� ���� ����� ���� �� ����� 300���� �̻��� �μ� ��ȸ
SELECT
        DEPT_CODE
      , ROUND(AVG(SALARY)) ���
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
 HAVING ROUND(AVG(SALARY)) >= 3000000
  ORDER BY 1;

--���� �Լ� : GROUP BY �������� ����ϴ� �Լ�
SELECT
        JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY ROLLUP(JOB_CODE)
  ORDER BY 1;

SELECT
        JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY CUBE(JOB_CODE)
  ORDER BY 1;
-------------
SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY ROLLUP(DEPT_CODE, JOB_CODE) --ù��°���ڲ�(DEPT_CODE)�� �߰� ���谡 ��
  ORDER BY 1;

SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY CUBE(DEPT_CODE, JOB_CODE)--�� ��� ���ڵ��� �߰�������� ����
  ORDER BY 1;

-- GROUPING : ���ڷ� ���� ���� �÷� ������ ���⹰�̸� 0�� ��ȯ�ϰ�, �ƴϸ� 1�� ��ȯ�ϴ� �Լ��̴�.
SELECT
        DEPT_CODE
      , JOB_CODE
      , SUM(SALARY)
      , COUNT(*)
      , GROUPING(DEPT_CODE) "�μ��� �׷� ���� ����"
      , GROUPING(JOB_CODE) "���޺� �׷� ���� ����"
   FROM EMPLOYEE
  GROUP BY CUBE(DEPT_CODE, JOB_CODE)
  ORDER BY 1;

-- CASE ���
SELECT
        NVL(DEPT_CODE, '�μ�����')
      , JOB_CODE
      , SUM(SALARY)
      , CASE
            WHEN GROUPING(NVL(DEPT_CODE, '�μ�����')) = 0 AND GROUPING(JOB_CODE) = 1 THEN '�μ����հ�'
            WHEN GROUPING(NVL(DEPT_CODE, '�μ�����')) = 1 AND GROUPING(JOB_CODE) = 0 THEN '���޺��հ�'
            WHEN GROUPING(NVL(DEPT_CODE, '�μ�����')) = 0 AND GROUPING(JOB_CODE) = 0 THEN '�׷캰�հ�'
            ELSE '���հ�'
        END ����
  FROM EMPLOYEE
 GROUP BY CUBE(NVL(DEPT_CODE, '�μ�����'), JOB_CODE)
 ORDER BY 1;

-- SET OPERATION (���� ����)

-- UNION
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  UNION
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

-- UNION ALL : �ߺ������� �ϴ� ������ ���Ĺ���
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  UNION ALL
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

-- INTERSECT : �������� ����� ���
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  INTERSECT
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

-- MINUS : ù��°������ �Ȱ�ġ�°͸� ���
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D5'
  MINUS
SELECT
        EMP_ID
      , EMP_NAME
      , DEPT_CODE
      , SALARY
   FROM EMPLOYEE
  WHERE SALARY > 3000000;

--  GROUPING SET
SELECT
        DEPT_CODE
      , JOB_CODE
      , MANAGER_ID
      , FLOOR(AVG(SALARY))
   FROM EMPLOYEE
  GROUP BY GROUPING SETS((DEPT_CODE, JOB_CODE, MANAGER_ID)--1�� �׷��� ���
                         , (DEPT_CODE, MANAGER_ID)-- 2�� �׷��� ���
                         , (JOB_CODE, MANAGER_ID)--3�� �׷��� ���  ���� �ϳ��� �� ���Ĺ���(�߰��� �׷�ƴѰ� NULL��)
                         );