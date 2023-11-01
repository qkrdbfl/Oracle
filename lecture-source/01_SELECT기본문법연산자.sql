--01. SELECT �⺻ ���� �� ������

--��� �� ��� �÷� ��ȸ
SELECT
       *
  FROM EMPLOYEE;
  
  --���ϴ� �÷��� ��ȸ
  --���, �̸� ��ȸ
SELECT
        EMP_ID
       ,EMP_NAME
  FROM EMPLOYEE;
  
--���ϴ� �� ��ȸ
--�μ��ڵ尡 D9�� ��� ��ȸ
SELECT
        *
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
--���� �ڵ尡 J1�� ��� ��ȸ
SELECT
        *
  FROM EMPLOYEE
WHERE JOB_CODE = 'J1';

--���ϴ� ��� �÷� ��ȸ
--�޿��� 300���� �̻��� ����� ��� , �̸�, �μ��ڵ�, �޿���ȸ
SELECT
        EMP_ID
       ,EMP_NAME
       ,DEPT_CODE
       ,SALARY
  FROM EMPLOYEE
 WHERE SALARY >= 3000000;
 
 -- AS + ��Ī�� ����Ͽ� ��Ī�� ���� �� �ִ�.
SELECT
        EMP_NAME AS �̸�
       , SALARY * 12 "1�� �޿�"
       , (SALARY + (SALARY * BONUS)) * 12 AS "�� �ҵ�"
       , (SALARY + (SALARY * NVL(BONUS, 0))) * 12 "�� �ҵ�"
  FROM EMPLOYEE;

-- ���Ƿ� ������ ���ڿ��� SELECT������ ����� �� �ִ�.
SELECT
      EMP_ID
    , EMP_NAME
    , SALARY
    , '��' AS ����
  FROM EMPLOYEE;
  
--DISTINCT
SELECT
    DISTINCT JOB_CODE
 FROM EMPLOYEE;
 
 SELECT
        DISTINCT JOB_CODE
        , /*DISTINCT*/ DEPT_CODE
  FROM EMPLOYEE;
  
-- �μ��ڵ尡 D6�̰� �޿��� 200������ �ʰ��ϴ� ������
-- �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT
      EMP_NAME
    , DEPT_CODE
    , SALARY
 FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
  AND SALARY > 2000000;

-- NULL�� ��ȸ
-- ���ʽ��� ���޹��� �ʴ� ����� ���, �̸�, �޿�, ���ʽ��� ��ȸ
SELECT
      EMP_ID
    , EMP_NAME
    , SALARY
    , BONUS
 FROM EMPLOYEE
WHERE BONUS IS NULL;

-- NULL�� �ƴ� �� ��ȸ
-- ���ʽ��� ���޹޴� ����� ���, �̸�, �޿�, ���ʽ��� ��ȸ
SELECT
      EMP_ID
    , EMP_NAME
    , SALARY
    , BONUS
 FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- �÷��� �÷��� ����
SELECT
      EMP_NAME || SALARY || BONUS
 FROM EMPLOYEE;

-- �÷��� ���ͷ� ����
SELECT
      EMP_NAME || '�� ������ ' || SALARY || '�� �Դϴ�.'
 FROM EMPLOYEE;

--�񱳿�����
-- �μ��ڵ尡 D9�� �ƴ� ����� ���, �̸�, �μ��ڵ� ��ȸ
SELECT
      EMP_ID
    , EMP_NAME
    , DEPT_CODE
 FROM EMPLOYEE
-- WHERE DEPT_CODE != 'D9';
-- WHERE DEPT_CODE ^= 'D9';
WHERE DEPT_CODE <> 'D9';

-- ��� ���ΰ� N�� ������ ��ȸ�ϰ� �ٹ� ���ζ�� ��Ī���� �������̶�� ���ڿ���
-- ��� ���տ� �����ؼ� ��ȸ�Ѵ�. (���, �̸�, �Ի���, �ٹ����� ��ȸ)
SELECT
      EMP_ID
    , EMP_NAME
    , HIRE_DATE
    , '������' �ٹ�����
 FROM EMPLOYEE
WHERE ENT_YN = 'N';

-- �޿��� 350���� �̻�, 550���� ���� �޴� ������
-- �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT
      EMP_NAME
    , DEPT_CODE
    , SALARY
 FROM EMPLOYEE
WHERE SALARY >= 3500000
  AND SALARY <= 5500000;
  
-- ������ 350���� �̻� 550���� ���Ϸ� �޴� �������� �̸�, �μ��ڵ�, ���� ��ȸ
SELECT
      EMP_NAME
    , DEPT_CODE
    , SALARY
 FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 5500000;

-- ���� ���װ� �ݴ��  
-- ������ 350���� �̸� 550���� �ʰ��� �޴� �������� �̸�, �μ��ڵ�, ���� ��ȸ
-- NOT �����ڴ� �÷��� ��, �Ǵ� BETWEEN ������ �տ� ������ �ִ�.
SELECT
      EMP_NAME
    , DEPT_CODE
    , SALARY
 FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 5500000;  
  
-- ���� �达�� ������ �̸�, �Ի��� ��ȸ
SELECT
      EMP_NAME
    , HIRE_DATE
 FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';
  
-- ���� �达�� �ƴ� ������ �̸�, �Ի��� ��ȸ
SELECT
      EMP_NAME
    , HIRE_DATE
 FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��%';  
  
-- �� �� �̸��� ���� �� ������ �̸�, �μ��ڵ� ��ȸ
SELECT
      EMP_NAME
    , DEPT_CODE
 FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- ��ȭ��ȣ ������ 9�� �����ϴ� ������ �̸�, ��ȭ��ȣ ��ȸ
--
SELECT
      EMP_NAME
    , PHONE
 FROM EMPLOYEE
WHERE PHONE LIKE '___9%';

-- ��ȭ��ȣ ������ 4�ڸ��̸鼭 9�� �����ϴ� ������ �̸�, ��ȭ��ȣ ��ȸ
--
SELECT
      EMP_NAME
    , PHONE
 FROM EMPLOYEE
WHERE PHONE LIKE '___9_______';

--�̸��Ͽ��� _ �� ���ڰ� 3�ڸ��� �̸��� �ּҸ� ���� ����� �̸�, �̸��� �ּ� Ȯ��
SELECT
      EMP_NAME
    , EMAIL
 FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%' ESCAPE '#';

-- IN ������
-- �μ� �ڵ尡 D6�̰ų� D8�� ������ �̸�, �μ�, �޿� ��ȸ
SELECT
      EMP_NAME
    , DEPT_CODE
    , SALARY
 FROM EMPLOYEE
WHERE DEPT_CODE IN ('D6', 'D8');

-- �μ� �ڵ尡 D6�̰ų� D8�� ������ ������ �̸�, �μ�, �޿� ��ȸ
SELECT
      EMP_NAME
    , DEPT_CODE
    , SALARY
 FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D6', 'D8')
-- NOT IN ó�� �ϴ��� NULL ���� ��� ���� �����Ƿ� �ʿ��ϴٸ� ���� ������ �ʿ��ϴ�
   OR DEPT_CODE IS NULL;

-- ������ �켱����
-- AND�� OR���� �켱 ������ ����!!
-- J2 ������ �޿� 200���� �̻� �޴� �����̰ų�
-- J7 ������ ������ �̸�, �޿�, ���� �ڵ� ��ȸ
SELECT
      EMP_NAME
    , SALARY
    , JOB_CODE
 FROM EMPLOYEE
WHERE JOB_CODE = 'J7'
   OR JOB_CODE = 'J2'
  AND SALARY >= 2000000;

-- J7 �����̰ų� J2 ������ ������ ��
-- �޿��� 200���� �̻��� ������ �̸�, �޿�, ���� �ڵ� ��ȸ
SELECT
      EMP_NAME
    , SALARY
    , JOB_CODE
 FROM EMPLOYEE
WHERE (JOB_CODE = 'J7'
   OR JOB_CODE = 'J2')
  AND SALARY >= 2000000;
