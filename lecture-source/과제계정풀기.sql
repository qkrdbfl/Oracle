--���� ���� Ǯ��
-- ���� ���� ����



























-- �Լ� ���� --

--1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� 
--���������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--( ��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
SELECT
        STUDENT_NO �й�
       ,STUDENT_NAME �̸�
       ,TO_CHAR(ENTRANCE_DATE, 'RRRR-MM-DD')���г⵵
   FROM TB_STUDENT
  WHERE DEPARTMENT_NO = '002'
  ORDER BY  1;

--2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�.
--�� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����.
--(* �̶� �ùٸ��� �ۼ��� SQL������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT
        PROFESSOR_NAME
       ,PROFESSOR_SSN
   FROM TB_PROFESSOR    
  WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
--��, �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�.
--(��, ���� �� 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ���������� �������.)
SELECT
       PROFESSOR_NAME �����̸�
      ,FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(PROFESSOR_SSN, 1, 6),'YYYYMMDD'))/12) ����
  FROM TB_PROFESSOR
 WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
 ORDER BY 2, PROFESSOR_NAME;


