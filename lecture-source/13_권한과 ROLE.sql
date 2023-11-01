-- 13_���Ѱ� ROLE

-- 1. �ý��� ����

-- <�ý��� �������� ����>
CREATE USER C##SAMPLE IDENTIFIED BY SAMPLE;

-- ������ �������� ���� �õ� �� ���� ����(CREATE SESSION)�� ��� ���� �Ұ�
-- <�ý��� �������� ����>
GRANT CREATE SESSION TO C##SAMPLE;

--<���� �������� ����>
CREATE TABLE TEST_TABLE(
  COL1 VARCHAR2(20),
  COL2 NUMBER
);

-- ���̺� ���� ������ ���� �����Ұ�
-- <�ý��� �������� ����> �� ���� �ڵ� ���ð������� �ٽ� �����ϱ�
GRANT CREATE TABLE TO C##SAMPLE;

-- WITH ADMIN OPTION : ����ڿ��� �ý��� ������ �ο��Ҷ� ����ϴ� �ɼ�
-- ������ �ο����� ����ڴ� �ٸ� ����ڿ��� ������ �����Ҽ� �ִ�

--<�ý��� �������� ����>
GRANT CREATE SESSION TO C##SAMPLE -- ���ӱ����� �ְ�
WITH ADMIN OPTION; --�ٸ� ����ڿ��Ե� ������ �ִ� �ɼǵ� ���� ��

--<�ý��� �������� ����>
CREATE USER C##SAMPLE2 IDENTIFIED BY SAMPLE2;

-- <���� �������� ����>
-- WITH ADMIN OPTION ���� �ο� ���� CREATE SESSION �� �ٸ� ����ڿ��� �ο� �����ϳ�
--�� ���� ������ �ο��� �� �ִ� ������ ���� �Ұ����ϴ�.
GRANT CREATE SESSION TO C##SAMPLE2;
GRANT CREATE TABLE TO C##SAMPLE2; -- ������ ���� �Ұ��� ����

-- 2. ��ü ����

-- WITH GRAMT OPTLON : ����ڰ� Ư�� ��ü�� �����ϰų� �����Ҽ� �ִ� ������ �ο������鼭
-- �� ������ �ٸ� ����ڿ��� �ٽ� �ο��Ҽ� �ִ� ���� �ɼ�

--<�ý��� �������� ����>
GRANT SELECT ON C##EMPLOYEE.EMPLOYEE TO C##SAMPLE
WITH GRANT OPTION;

-- <���� �������� ����>
-- ��ȸ ������ �ֿ� �޾ұ� ������ SAMPLE ������ ���� EMPLOYEE ���̺� ��ȸ�� �����ϴ�
-- �� ���� DEPARTMENT ���̺� ���� SAMPLE �������� ��ȸ �Ҽ� ����
SELECT
        EE.*
   FROM C##EMPLOYEE.EMPLOYEE EE;     

SELECT --- ��ȸ�ȴ�
        ED.*
   FROM C##EMPLOYEE.EMPLOYEE ED;

--<���� �������� ����>
-- WITH GRANT OPTION ���� �ο� ���� SELECT ������ �ٸ� �������� �ο� �����ϳ�
-- �� ���� ������ �ο��� �� ����.
GRANT SELECT ON C##EMPLOYEE.EMPLOYEE TO C##SAMPLE2;
GRANT INSERT ON C##EMPLOYEE.EMPLOYEE TO C##SAMPLE2; --���� ����

--���� ȸ�� �ϱ�
--<�ý��� �������� ����>
-- REVOKE : ���� öȸ
REVOKE SELECT ON C##EMPLOYEE.EMPLOYEE FROM C##SAMPLE; -- ���⼭ FROM�� ����ڷκ��� ��� ��

-- <���� �������� ����>
-- ��ȸ ������ öȸ�Ǿ� ��ȸ �Ұ�������
SELECT
        EE.*
   FROM C##EMPLOYEE.EMPLOYEE EE;
-- ����) WITH GRANT OPTION�� REVOKE�� �ٸ� ����ڿ��� �ο��� ���ѵ� �Բ� ȸ���Ѵ�
-- WITH ADMIN OPTION �� Ư�� ������� ���Ѹ� ȸ���ǰ� 
-- ������ �ٸ� ����ڿ��� �ο��� ������ ȸ�� ���� �ʴ´�.

-- ROLE : �������� ������ ��� ����ϴ� ��
-- ����ڿ��� �ο��� ������ �����ϰ��� �ҋ��� �� �Ѹ� �����ϸ�
-- �ش� ���� ������ �ο� ���� ����ڵ��� ������ �ڵ����� ���� �ȴ�.


-- 1. ���� ���ǵ� �� : ����Ŭ ��ġ �� �ý��ۿ��� �⺻������ ����
SELECT
        GRANTEE
      , PRIVILEGE
   FROM DBA_SYS_PRIVS
  WHERE GRANTEE = 'RESOURCE'
     OR GRANTEE = 'CONNECT';

-- 2. ����ڰ� �����ϴ� ��
-- ���� ������ �� �ѿ� ������ �߰��ϰ� ����ڿ��� ���� �ο�
CREATE ROLE C##MYROLE; -- �� �̸��� �����ؼ� ����
GRANT CREATE VIEW, CREATE SEQUENCE TO C##MYROLE; -- ���� �� �ѿ� ���ϴ� ���ѵ��� �߰�
GRANT C##MYROLE TO C##SAMPLE; -- ����ڿ��� �� �ο�

-- C##MYROLE�� ���� Ȯ�� ��ȸ
SELECT
        GRANTEE
      , PRIVILEGE
   FROM DBA_SYS_PRIVS
  WHERE GRANTEE = 'C##MYROLE';

-- C##SAMPLE ������ �� ���� Ȯ�� ��ȸ
SELECT
        DRP.*
   FROM DBA_ROLE_PRIVS DRP
  WHERE GRANTEE = 'C##SAMPLE';


--<���� �������� ����>
-- ������ �ο����� �������� ��� ������ ���¿��� ��� �ο� ���� ���ѿ� ���� Ȯ���� ����� ���� �ִ�
-- �ش� ���� ���� ���� �� �������Ͽ� �׽�Ʈ.
CREATE SEQUENCE SEQ_TEST; 


