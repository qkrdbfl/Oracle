--04. JOIN

--����Ŭ ���뱸��

--���ῡ ����� �� �÷����� �ٸ� ���
SELECT
        EMP_ID
       ,EMP_NAME
       ,DEPT_CODE
       ,DEPT_TITLE
   FROM EMPLOYEE
       ,DEPARTMENT
  WHERE DEPT_CODE = DEPT_ID;--JOIN���Ǿ��� NULL�̾��� ��� 2���� �������� �ʰ� ����      

--���ῡ ����� �� �÷����� ���� ���
--���̺���� �������� ������ ���� ���ǰ� �ָ��ϴٴ� ������!
SELECT
        EMPLOUEE.EMP_ID
       ,EMPLOUEE.EMP_NAME
       ,EMPLOUEE.JOB_CODE --���̺�� ���ֱ�
       ,JOB.JOB_NAME
  FROM EMPLOYEE
       ,JOB
 --WHERE JOB_CODE = JOB_CODE;--���� ���ǰ� �ָ��ϴٴ� ����      
 WHERE EMPLOUEE.JOB_CODE = JOB.JOB_CODE;-- ���̺�� ���ֱ�

--���̺�� ��Ī�� ��� ������
SELECT
        E.EMP_ID
       ,E.EMP_NAME
       ,E.JOB_CODE 
       ,J.JOB_NAME
  FROM EMPLOYEE E --�̷��� ���̱� ����
       ,JOB J
 WHERE E.JOB_CODE = J.JOB_CODE;

--ANSI ǥ�� ����

--���ῡ ����� �� �÷����� ���� ���(�������� ������ �̿��� �Ẹ��)
SELECT
        EMP_ID
       ,EMP_NAME
       ,JOB_CODE 
       ,JOB_NAME
  FROM EMPLOYEE
  JOIN JOB USING(JOB_CODE);--USING(JOB_CODE)���� ���ǹ� USING�� ������쿡 ����

--���ῡ ����� �� �÷����� �ٸ����
SELECT
        EMP_ID
       ,EMP_NAME
       ,JOB_CODE 
       ,JOB_NAME
  FROM EMPLOYEE
  JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);--ON(DEPT_CODE = DEPT_ID)���ǹ� ON�� ���� �ٸ��� ����

--�÷����� ���� ��쿡�� ON���� �ۼ� �����ϴ�
SELECT
        E.EMP_ID
       ,E.EMP_NAME
       ,E.JOB_CODE 
       ,J.JOB_NAME
  FROM EMPLOYEE E --��� ���̺���� ������ ���������
  JOIN JOB J ON(E.DEPT_CODE = J.JOB_CODE);

-- ERPARTMENT ���̺�� LOCATION ���̺��� �����Ͽ� ��� �÷� ��ȸ
--ORACLE ����
SELECT
        *
  FROM DEPARTMENT
     , LOCATION
 WHERE LOCATION_ID = LOCAL_CODE;

--ANSI ǥ��
SELECT
        *
  FROM DEPARTMENT
  JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);  

-- ������ �⺻������ ��ġ�ϴ� �ุ ����� �����ϴ�  INNER JOIN���� ����ȴ�
--��ġ�ϴ� ���� ��� ����� ���� ��Ű�� ���� ��� OUTER JOIN�� ��������� �ؾ��Ѵ�

--LEFT OUTER JOIN
--ANST ǥ��
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE  
   LEFT /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);--OUTER���� ����
   
-- ORACLE ����   
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT
  WHERE DEPT_CODE = DEPT_ID(+);-- DEPT_ID+���ؾ� EMPLOYEE�� �����ϰڴٴ� ��

--RIGHT OUTER JOIN
--ANST ǥ��
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE  
   RIGHT /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- ORACLE ����   
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT
  WHERE DEPT_CODE(+) = DEPT_ID;
  
--FULL OUTER JOIN  
--ANST ǥ��
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE  
   FULL /*OUTER*/ JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- ORACLE ����   
--FULL OUTER JOIN�� ���� ���Ѵ�.
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT
  WHERE DEPT_CODE(+) = DEPT_ID(+);-- outer-join�� ���̺��� 1���� ������ �� �ִٴ� ����  
  
--CROSS JOIN : �� ���̺��� ��� ���� ���������� ��ȯ��
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE
 CROSS JOIN DEPARTMENT;  

--�̰͵� CROSS JOIN�� ���´�  
SELECT
        EMP_NAME
       ,DEPT_TITLE
   FROM EMPLOYEE 
       ,DEPARTMENT;  
  
--NON EQUAL JOIN
-- ��ȣ �̿��� �񱳿����ڸ� ����Ͽ� �����ϴ� ��

--ANST ǥ��
SELECT
        EMP_NAME
       ,SALARY
       ,E.SAL_LEVEL "EMPLOYEE�� SAL_LEVEL"
       ,S.SAL_LEVEL "SAL_GRADE�� SAL_LEVEL"
   FROM EMPLOYEE E
   JOIN SAL_GRADE S ON(SALARY BETWEEN MIN_SAL AND MAX_SAL);--������(EMPLOYEE�÷�)�� �ΰ��� ���̿� �����ϴ� Ʈ�縦 ã�°� 

-- ORACLE ����
SELECT
       EMP_NAME
       ,SALARY
       ,E.SAL_LEVEL "EMPLOYEE�� SAL_LEVEL"
       ,S.SAL_LEVEL "SAL_GRADE�� SAL_LEVEL"
   FROM EMPLOYEE E
       ,SAL_GRADE S 
  WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;
  
-- SELF JOIN
-- ANSI ǥ��
SELECT
        E1.EMP_ID ���
      , E1.EMP_NAME �����
      , E1.MANAGER_ID �����ڻ��
      , E2.EMP_NAME �����ڸ�
   FROM EMPLOYEE E1
   JOIN EMPLOYEE E2 ON(E1.MANAGER_ID = E2.EMP_ID);-- INNER JOIN�̶� �����ڰ� �ִ� ����� ����

-- ORACLE ����
SELECT
        E1.EMP_ID ���
      , E1.EMP_NAME ������
      , E1.MANAGER_ID �����ڻ��
      , E2.EMP_NAME �����ڸ�
   FROM EMPLOYEE E1
      , EMPLOYEE E2
  WHERE E1.MANAGER_ID = E2.EMP_ID;

----���� JOIN : �ΰ� �̻��� ���̺� JOIN
--ANSI ǥ��
--���� ���� ���� ������ �����ؾ��Ѵ�!
SELECT
        EMP_NAME
       ,DEPT_TITLE
       ,LOCAL_NAME
   FROM EMPLOYEE
   JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
   JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);
-- JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)-- ���� ���Ѽ� �ϱ� �̰� ������ �������� ����

-- ORACLE ����
--���̺���� ���� ������ �������!
SELECT
        EMP_NAME
       ,DEPT_TITLE
       ,LOCAL_NAME
   FROM EMPLOYEE
       ,DEPARTMENT-- ����Ŭ������ �ϴ� ���ҿ� �� �����ϰ�
       ,LOCATION  
 WHERE DEPT_CODE = DEPT_ID-- �־�� ���� ����
   AND LOCATION_ID = LOCAL_CODE; --�̰Ŵ� �������� �Ἥ ���� ����Ѵٴ� �ǹ̷� ����ó�� ������ ��Ű�� �ʾƵ� �� ��µ�
  
--������ �븮�̸鼭 �ƽþ� ������ �ٹ��ϴ� ������
--�̸�, ���޸�, �μ���, �ٹ������� ��ȸ

--ANSI ǥ��
SELECT
        EMP_NAME
       ,JOB_NAME
       ,DEPT_TITLE
       ,LOCAL_NAME
   FROM EMPLOYEE--���⼭����
   JOIN JOB USING(JOB_CODE)
   JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
   JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)--������� �����ϰڴ� ��� ��
  WHERE JOB_NAME = '�븮'
    AND LOCAL_NAME LIKE 'ASIA%';

--ORACLE ����
SELECT
        E.EMP_NAME --������
      , J.JOB_NAME
      , D.DEPT_TITLE
      , L.LOCAL_NAME
   FROM EMPLOYEE E--�������
      , JOB J
      , DEPARTMENT D
      , LOCATION L--������� ���̺� ����
  WHERE E.JOB_CODE = J.JOB_CODE--������� �־�� �ص���� �����Ͽ� �ɷ�����(Ʈ��/�޽�)
    AND E.DEPT_CODE = D.DEPT_ID
    AND D.LOCATION_ID = L.LOCAL_CODE--�������.
    AND JOB_NAME = '�븮'-- ���� ���� ����� �߰�����
    AND LOCAL_NAME LIKE 'ASIA%';-- ���� ���� ����� �߰�����