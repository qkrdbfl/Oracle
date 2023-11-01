-- 11_SEQUENCE

-- ������ ��ü ����
CREATE SEQUENCE SEQ_EMPID
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

-- ��������.CURRVAL : CURRENT VALUE(���� ��) ��ȯ
-- ��������.NEXTVAL : NEXT VALUE(���� ��) ��ȯ

-- NEXTVAL�� 1ȸ �����ؾ� CURRVAL�� �� �� �ִ�.
SELECT SEQ_EMPID.CURRVAL FROM DUAL; --�̰͸� ���� �����Ϸ��� �ϸ� ������ �Ʒ� ������ ���� ������� ���� �ϱ�

SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- 300
SELECT SEQ_EMPID.CURRVAL FROM DUAL; -- 300 --���� ���� Ȯ�� CURRVAL
SELECT SEQ_EMPID.CURRVAL FROM DUAL; -- 305
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- 310
SELECT SEQ_EMPID.CURRVAL FROM DUAL; -- 310
-- maxvalue�� �Ѿ�� �����߻�
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- ���� : (MAXVALUE�� ��ʷ� �� �� �����ϴ�)

-- ������ ��ųʸ� USER_SEQUENCES�� ���� ��ȸ
SELECT * FROM USER_SEQUENCES; -- ���� ������ ������ �ִ� �������� ��Ͽ� ��ȸ��

-- ������ ���� 
-- START WITH ���� ���� �Ұ��ϹǷ� �ش� �� ������ DROP�� ���� �� �ٽ� ����
ALTER SEQUENCE SEQ_EMPID
INCREMENT BY 10 --�������� 10���� �ٲ�
MAXVALUE 400 -- �ƽ����� 400���� ����
NOCYCLE
NOCACHE;

--��ȣ �߻� ��Ű��
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; --320
SELECT SEQ_EMPID.CURRVAL FROM DUAL; -- 320
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- 330
SELECT SEQ_EMPID.CURRVAL FROM DUAL; -- 330

-- ������ ��ü�� ���� ���� ����ϴ� �뵵�� ���̺��� �������� �ĺ���(PK)�� ����ϴ� ���̴�.
CREATE SEQUENCE SEQ_EID
START WITH 300 -- 300���� ����
INCREMENT BY 1 -- 1�� ����
MAXVALUE 10000
NOCYCLE
NOCACHE;

--INSERT�� PK ���� ������ Ȱ��
INSERT
  INTO EMPLOYEE
VALUES
( -- SEQ_EID.NEXTVAL�� pk �뵵�� ����Ѱ�
  SEQ_EID.NEXTVAL, 'ȫ�浿', '660101-1111111', 'hong_gd@greedy.com', '01012345678',
  'D2', 'J7', 'S1', 5000000, 0.1, 200, SYSDATE, NULL, DEFAULT
); -- ���̺���� �÷����� ������� ������

SELECT
        E.*
   FROM EMPLOYEE E; -- �� ȫ�浿�� ���� ��ȸ Ȯ�� ����

ROLLBACK; --�浿�� �ٽ� ���ư�


-- ������ ���� --
DROP SEQUENCE SEQ_EMPID;