
-- ���԰�� ���̺� ���� �߰�
INSERT INTO TBL_SIGNUP_PATH(SIGNUP_PATH_CODE,SIGNUP_PATH_NAME)
VALUES(SEQ_TBL_SIGNUP_PATH_NO.NEXTVAL,'�ڻ�������');
INSERT INTO TBL_SIGNUP_PATH(SIGNUP_PATH_CODE,SIGNUP_PATH_NAME)
VALUES(SEQ_TBL_SIGNUP_PATH_NO.NEXTVAL,'īī��');

commit;

-- ���� ���̺� ���� �߰�
INSERT INTO TBL_AUTHORITY(AUTHORITY_CODE,AUTHORITY_NAME,AUTHORITY_DESC)
VALUES(SEQ_TBL_AUTHORITY_NO.NEXTVAL,'ROLE_ADMIN','������');
INSERT INTO TBL_AUTHORITY(AUTHORITY_CODE,AUTHORITY_NAME,AUTHORITY_DESC)
VALUES(SEQ_TBL_AUTHORITY_NO.NEXTVAL,'ROLE_PET_SITTER','�����');
INSERT INTO TBL_AUTHORITY(AUTHORITY_CODE,AUTHORITY_NAME,AUTHORITY_DESC)
VALUES(SEQ_TBL_AUTHORITY_NO.NEXTVAL,'ROLE_MEMBER','�Ϲ�ȸ��');

commit;

-- ������ admin (�ε��� 1)
-- �Ϲ�ȸ�� test1 ~ test3 (�ε��� 2, 3, 4)
-- ����� test4 ~ test8 (�ε��� 5, 6, 7, 8, 9)
-- Ư�� ���̵� ha123

-- ������ ���� �߰�
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'admin@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','�����','������','01012345678','M',03148,'���� ���α� �λ絿 12��','15�� 999ȣ',1000,'Ȱ��','2023-09-24','2023-09-24',0,1);
-- �Ϲ�ȸ�� ���� �߰�
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test1@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','���ظ�','�ظ�����','01012345678','F',05831,'���� ���α� �λ絿 12��','15�� 999ȣ',1000,'Ȱ��','2023-09-24','2023-09-24',0,1);
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test2@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','�ֹ���','��ȣ','01045813947','F',10544,'��� ���� ���籸 ������ 110','999ȣ',9000,'Ȱ��','2023-09-12','2023-09-12',0,1);
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test3@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','�̼���','����','01045813947','M',53062,'�泲 �뿵�� ���װ��1�� 7','999ȣ',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);
-- ����� ȸ�� ���� �߰�
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test4@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','�����','����߾�','01045813947','M',07573,'���� ������ ������ 462','999ȣ',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test5@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','�Ѹ�','ȣ��','01045813947','F',13480,'��� ������ �д籸 ����Ǳ��� 477','999ȣ',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test6@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','��ġ','��ĥ��','01045813947','F',08327,'���� ���α� ������� 87','999ȣ',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test7@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','������','���������','01045813947','M',13581,'��� ������ �д籸 �д�� 190','999ȣ',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);
INSERT INTO TBL_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
VALUES(SEQ_TBL_MEMBER_NO.NEXTVAL,'test8@gmail.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','��浿','�浿�ƺ���','01045813947','M',10134,'��� ������ ������ ������� 119-5','999ȣ',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);
Insert into TBL_MEMBER (MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,NICKNAME,PHONE,GENDER,POST_NO,ADDRESS,ADDRESS2,POINT,MEMBER_STAT,MEMBER_STAT_DATE,REGIST_DATE,WARNING_COUNT,SIGNUP_PATH_CODE)
values (SEQ_TBL_MEMBER_NO.NEXTVAL,'ha123@naver.com','$2a$10$3Vw7wYbmxMgw5MwJO7BxReqqRKoTlla7D6qa8BP5Ea7lIsikZhc4W','����','����','01045678941','F',13475,'��� ������ �д籸 ���Ǳ��� 99','33',1000,'Ȱ��','2023-09-12','2023-09-12',0,1);

commit;


-- ������ admin (�ε��� 1)
-- �Ϲ�ȸ�� test1 ~ test3 (�ε��� 2, 3, 4)
-- ����� test4 ~ test8 (�ε��� 5, 6, 7, 8, 9)

-- ���� ���� ���̺� ���� �߰�
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(1,1);

INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,2);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,3);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,4);

INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(2,5);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,5);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(2,6);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,6);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(2,7);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,7);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(2,8);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,8);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(2,9);
INSERT INTO TBL_ROLE(AUTHORITY_CODE,MEMBER_NO)
VALUES(3,9);

commit;


-- ��� ���̺� ���� �߰�
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'������Ű����20���̻�',5);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ�����������1�� (�ѱ��ݷ����� �ڰ���ȸ)',5);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ������ൿ������ 1�� (�ѱ��ݷ����� �ڰ���ȸ)',5);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ�������������� (�ѱ��ݷ����� �ڰ���ȸ)',5);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�������� 10��',6);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ����� ������ 1�� (�ѱ������ɷ������)',7);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ����� �ൿ���� 1�� (�ѱ������ɷ������)',7);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ְ�ī��, ��ġ�� 1�� �ٹ�',7);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ְ߼� 6���� �ٹ�',7);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�������� ������ũ�ϼ� 6���� �ٹ�',7);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'���� �ְ߿�ǰ�� �',7);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ��� �������� 25�� �̻�',8);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'����� ���� �ټ�',8);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ��� ���� ���� ����',8);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ������ù��б� ���� ����',8);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ����� ��ȭ���� ���� ����',8);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ൿ����,Ư���������Ʒ� ������',8);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'�ݷ��� �������� 25�� �̻�',9);
Insert into TBL_CAREER (CAREER_NO,CAREER_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_CAREER_NO.nextval,'���� �����Ǵ� ��� 12�� ��',10);


commit;


-- �±� ���̺� ���� �߰�
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��ɰ�',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�๰����',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�ǿܹ躯',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����óġ',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'���',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����/�Ʒ�',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��⵹��',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�и�����',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'CCTV',5);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'������',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��ɰ�',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�๰����',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�ǿܹ躯',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����óġ',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�Ѹ�������',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�ݷ��߾���',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�и�����',6);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'������',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��ɰ�',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�ǿܹ躯',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'���',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����/�Ʒ�',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��⵹��',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��������',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�и�����',7);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��ɰ�',8);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�๰����',8);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�ǿܹ躯',8);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����óġ',8);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����/�Ʒ�',8);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�и�����',8);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�๰����',9);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'����óġ',9);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'���',9);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'��⵹��',9);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�и�����',9);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'���̾���',9);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�ǿܹ躯',10);
Insert into TBL_PET_TAG (TAG_NO,TAG_CONTENT,PET_MEMBER_NO) values (SEQ_TBL_PET_TAG_NO.nextval,'�پ��� ��å',10);


commit;

-- ����� ���̺� ���� �߰�
Insert into TBL_PET_SITTER (PET_MEMBER_NO,PET_REGIST_DATE,PET_STAT,PET_TITLE,PET_INTRODUCE,PET_PLACE,PET_CARE_COUNT,PET_BABY_YN,PET_PENCE,PET_MYPET_YN,PET_SMOK_YN,PET_CARE_SIZE,PET_CARE_AGE,PET_CHECKIN,PET_CHECKOUT,PET_REQUEST,PET_IMPOSSIBLE,PET_M_DAY_PAY,PET_M_TIME_PAY,PET_L_DAY_PAY,PET_L_TIME_PAY,PET_BANK,PET_BANK_NO,PET_BANK_NAME) values (5,'2023�� 10�� 18�� 19�� 39�� 47��','����','���Ÿ��������Դϴ�. ������ 20�� �̻�, ����� ���� �����ϴ�.','��Ƽ� ������ �⸣�� �ִ�
�������� ����ϴ� ����Դϴ�.

���� �����ϴ� �� ã�ƺ���
... ������ ����Ͱ� ���� ���� �� �����󱸿�.
�������� �췯 ���ͼ� �ϴ� ���� ���� ��� �����ݾƿ�

�������� �Բ� ������ 20�� �̻��̱���,
�Ӻ�, ����ߺ���, ����͵� ���� �����ϴ�.
�׷��� �������� ���� �� �˰�
��� �ൿ�ϰ� ��ó�ؾ� �ϴ��� �� �����ϰ� �ֽ��ϴ�.

�̿��� ��ȣ�ڴԵ� �ڱ� �ڽ�ó�� Ű�� �ֵ�
������ �ϰ� �ð��ֽø� ������ �������
���� ���� �ߺ����ǰڽ��ϴ�.

��å�� ���� ���� ����� bifc�ǹ� ���� ���ַ� �ϰ� �ֽ��ϴ�.^^
���� cctv�� ������ �Ƚ��ϰ� �ð��ּ���.','����',2,'N','N','Y','N','1~10kg ���� �����մϴ�','1�����~��ɰ߱��� �ɾ���մϴ�','10:00~19:00','10:00~20:00','��� �Դ� ��Ǫ��/����, ��å��ǰ, �����ϴ� �峭�� ��','¢�� ���� ����, ���� ���� ����, ������ ��ȯ �ִ� ���� ��',35000,3500,55000,5500,'����','213-3213-123456','�����');
Insert into TBL_PET_SITTER (PET_MEMBER_NO,PET_REGIST_DATE,PET_STAT,PET_TITLE,PET_INTRODUCE,PET_PLACE,PET_CARE_COUNT,PET_BABY_YN,PET_PENCE,PET_MYPET_YN,PET_SMOK_YN,PET_CARE_SIZE,PET_CARE_AGE,PET_CHECKIN,PET_CHECKOUT,PET_REQUEST,PET_IMPOSSIBLE,PET_M_DAY_PAY,PET_M_TIME_PAY,PET_L_DAY_PAY,PET_L_TIME_PAY,PET_BANK,PET_BANK_NO,PET_BANK_NAME) values (6,'2023�� 10�� 18�� 19�� 44�� 43��','����','����Ʈ ����� 5�аŸ� �޻� ��å�� ���� ���� �մϴ� :D','���� �������� ���ϴ� ������ �׸��ΰ� �� ������ �ϰ� �ֽ��ϴ�.
��å�� ���� �������� ����� ���� ������ �⸦ �� ���� �� ����
�ٸ� �е��� �ݷ������� ������ ����� �����鼭 ���������� �ؿ�

... �츮 ������ �������� �ʹ� �����ؼ�
Ƽ�� �� ���� �׻� ���� ���� ��ť���͸��� �� ���� �Դϴ�.

��Ӵϴ� ���� �����ֺ� ��Ȱ�� �ϰ� ��ð�
��������� �ݷ��߰� ���� �ð��� �����̾��.


����Ʈ �ֺ��� ������ ������ �������ϰ� �ȱ� ���� �����Դϴ�.
�츮 ���� �޺��� ���� �� ������ �������� �� ���̴� ���̶�
�ݷ������鵵 ���ϰ� ���� �� �����Ŷ� �����ؿ�.

��Ź�Ͻô� �͵� �� ì�ܵ帱 �ڽ� �ֽ��ϴ�.','����Ʈ',2,'N','N','N','N','1~35kg','�������� ���� ������~8�� �̻� ��ɰ� ��� �����մϴ�.','08:00~20:00','08:00~20:00','��� �Դ� ��Ǫ��/����, �躯�е�, ��å��ǰ/�ν�ǥ ��','���� �Ͽ︵, ���ų� �������� ����, ���� ���� ���ϰ� ��� ����',35000,2000,40000,2500,'����','213-3213-123456','�Ѹ�');
Insert into TBL_PET_SITTER (PET_MEMBER_NO,PET_REGIST_DATE,PET_STAT,PET_TITLE,PET_INTRODUCE,PET_PLACE,PET_CARE_COUNT,PET_BABY_YN,PET_PENCE,PET_MYPET_YN,PET_SMOK_YN,PET_CARE_SIZE,PET_CARE_AGE,PET_CHECKIN,PET_CHECKOUT,PET_REQUEST,PET_IMPOSSIBLE,PET_M_DAY_PAY,PET_M_TIME_PAY,PET_L_DAY_PAY,PET_L_TIME_PAY,PET_BANK,PET_BANK_NO,PET_BANK_NAME) values (7,'2023�� 10�� 18�� 20�� 08�� 56��','����','�ϰ� �ñ���ִ� ����ȣ�ڸ� �Դϴ�. 24�ð� ���������� ���� ����!','���� ���̸� �� �ð� ���� ������ �������� �����մϴ�.
���ڱ� ���� �ϼž� �ϰų� ���� ���ž� �ϴ� ���ֺе��� ���� ���̸�
24�ð� üũ��, üũ�ƿ��� �����մϴ�.

�ݷ��߿� ���� �ͼ��ϰ�,
�ݷ����� ������ 1��, �ݷ������ൿ����1�� �ڰ������� ���� ���̸�,
��Ǫ�� �ڰ��� ���� �����ϰ� �ִ� ��ŭ,
���̵� �ɾ� ��ŭ�� �ڽ� �ֽ��ϴ�

24�ð� �����ϰ� ������, ��ħ �� �� ���� �������
����, ������ ������ ���� �����ϴ� �ð��� �δ� ������ ���ð� ���� �ּ���!

�������� ���̵� ������ ���� ����ϰ� ���� ��̰� ��� �� �� �ֵ���
�ּ��� ���Ͽ� �ɾ� �ϰڽ��ϴ�. ','����',1,'N','Y','Y','N','1~15kg ���� �����մϴ�.','�� 3���� �̻� ~ 15�� ���� �����մϴ�.','01:00~23:00','01:00~23:00','��� �Դ� ��Ǫ��/����, ��å��ǰ(�������� ����), �����ϴ� �峭�� ��','���� �Ͽ층, ���ų� �������� ����, ���� ���� ���ϰ� ��� ����',35000,3500,45000,4500,'����','213-3213-123456','��ġ');
Insert into TBL_PET_SITTER (PET_MEMBER_NO,PET_REGIST_DATE,PET_STAT,PET_TITLE,PET_INTRODUCE,PET_PLACE,PET_CARE_COUNT,PET_BABY_YN,PET_PENCE,PET_MYPET_YN,PET_SMOK_YN,PET_CARE_SIZE,PET_CARE_AGE,PET_CHECKIN,PET_CHECKOUT,PET_REQUEST,PET_IMPOSSIBLE,PET_M_DAY_PAY,PET_M_TIME_PAY,PET_L_DAY_PAY,PET_L_TIME_PAY,PET_BANK,PET_BANK_NO,PET_BANK_NAME) values (8,'2023�� 10�� 18�� 20�� 15�� 49��','����','������ ���� No, �޻� ������ �Ž�, ���� 1�� ������ ��å��','�ȳ��ϼ���. 25�� �̻� �������� �Բ��ϰ� �ִ� �ݷ��ൿ������ ���� �������Դϴ�.

� ������ �ݷ��߰� �Բ� �ڶ� ������ �����̳� �������� �ڽ��� �ֽ��ϴ�.
�ֺ� ģ�� �� �¶��� Ŀ�´�Ƽ ���� ����ͷ� ������ Ȱ���ؿ԰� ����� �Ӻ��� �߽��ϴ�.
... �׷��� ���� �������� ���ó�� ���ݰ� ������ �ٸ��ٴ� �� �˰� �Ǿ��� �ݷ����� �ɸ� �� �ൿ ������ ���� ���θ� ���� �Ͽ����ϴ�.

�̷��� ��� ������ ������� ������ ����� �ż��� ������ ���� �����ڽ��ϴ�.
�����մϴ�.','����',1,'N','Y','Y','N','15kg �̸� �����մϴ�.','������, ����, ��ɰ� ��� �����մϴ�.','10:00~12:00','14:00~16:00','��� �Դ� ���/����, ��å��ǰ(����, �ν�ǥ), ��ŷ�� ��� �ųʹ�Ʈ ��','������ ��ȯ�� �ִ� ���� ��',35000,3500,40000,4000,'����','213-3213-123456','������');
Insert into TBL_PET_SITTER (PET_MEMBER_NO,PET_REGIST_DATE,PET_STAT,PET_TITLE,PET_INTRODUCE,PET_PLACE,PET_CARE_COUNT,PET_BABY_YN,PET_PENCE,PET_MYPET_YN,PET_SMOK_YN,PET_CARE_SIZE,PET_CARE_AGE,PET_CHECKIN,PET_CHECKOUT,PET_REQUEST,PET_IMPOSSIBLE,PET_M_DAY_PAY,PET_M_TIME_PAY,PET_L_DAY_PAY,PET_L_TIME_PAY,PET_BANK,PET_BANK_NO,PET_BANK_NAME) values (9,'2023�� 10�� 18�� 20�� 22�� 05��','����','�����ϰ� ������ �����⿡�� �� �ݷ���ó�� �ɾ��ϰڽ��ϴ�.','�ȳ��ϼ���~^^ �ݷ��� ůů�̿� 4��° �Բ��ϰ� �ִ� ��ȣ���Դϴ�.

ůů��ó�� ��������� ���̵��� �Բ� �ɾ��ϸ� ������ ������ �װ� �; ����ÿ� �ϰ� �Ǿ����!
���� ���� �ݷ����������� �ڰ����� ����� Ȱ���ϰ� �ֽ��ϴ�.
... �ľ�� ����� ��å�� �� �� �𸣴� �̺� ������ ůů�̸�
��å�� ȯ���ϴ� �ǰ��� ���̷� �ݷ��ϰ� �ִ� ��ŭ å�Ӱ��ְ� �ٸ� ���̵鵵 �ɾ��ϰڽ��ϴ�.

�� ��ó ��å�δ� ���������� ���ȸ��� �ֱ���.
��å�ΰ� ��� �̾��� �ִ¸�ŭ ��� ��å �ð��� 1�ð����� 1�ð� 30������ �ҿ�˴ϴ�.','���ǽ���',3,'N','Y','Y','N','1~3.5kg���� �����մϴ�.','���� ���� ���� ������ ~ �� 8�� ���� �����մϴ�.','10:00~23:00','11:00~23:00','��� �Դ� ��Ǫ��/����, �����峭��, �漮, ��å ������','������ �ְų� ���ݼ��� �ִ� ����/ �躯�Ʒ��� �ȵǾ� �ִ� ����',30000,3000,40000,4000,'����','213-3213-123456','��浿');
Insert into TBL_PET_SITTER (PET_MEMBER_NO,PET_REGIST_DATE,PET_STAT,PET_TITLE,PET_INTRODUCE,PET_PLACE,PET_CARE_COUNT,PET_BABY_YN,PET_PENCE,PET_MYPET_YN,PET_SMOK_YN,PET_CARE_SIZE,PET_CARE_AGE,PET_CHECKIN,PET_CHECKOUT,PET_REQUEST,PET_IMPOSSIBLE,PET_M_DAY_PAY,PET_M_TIME_PAY,PET_L_DAY_PAY,PET_L_TIME_PAY,PET_BANK,PET_BANK_NO,PET_BANK_NAME) values (10,'2023�� 10�� 18�� 20�� 29�� 58��','����','�����ִ� ��!! �������� �پ� ��� ��!!! ','�ȳ��ϼ���!
������ �־ �������� �����Ӱ� �پ�� �� �ִ� ���Դϴ�.
��å �� �ߵ� �� ���� �� �־��!
�ð��ּ���!!!','����',2,'N','Y','N','N','����','5��','09:00','18:00','����, ���� ì���ּ���! �൵ ì���ּ���!','���� �ȵſ�',40000,4000,60000,6000,'����','131321561321','����');


commit;

-- ����Ϳ������� ���̺� ���� �߰�
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-30','����Ұ�',5);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-23','����Ұ�',5);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-26','����Ұ�',6);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-27','����Ұ�',6);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-30','����Ұ�',7);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-29','����Ұ�',7);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-22','����Ұ�',7);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-23','����Ұ�',7);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-30','����Ұ�',8);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-26','����Ұ�',8);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-28','����Ұ�',8);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-30','����Ұ�',9);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-31','����Ұ�',9);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-24','����Ұ�',9);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-23','����Ұ�',9);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-27','����Ұ�',9);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-26','����Ұ�',9);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-21','����Ұ�',10);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-22','����Ұ�',10);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-28','����Ұ�',10);
Insert into TBL_SITTER_SCHEDULE (PET_MEMBER_RES_NO,PET_MEMBER_REG_DAY,PET_MEMBER_STATUS,PET_MEMBER_NO) values (SEQ_TBL_SITTER_SCHEDULE_NO.nextval,'2023-10-29','����Ұ�',10);

commit;



-- ÷������ ���̺� ���� �߰�
-- ����� ������ �� --
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-1.png','0_img_57c4b314-08c3-415d-b2f9-95f78c52d8f1.png','.png','/upload/original/','/upload/thumbnail/thumbnail_0_img_57c4b314-08c3-415d-b2f9-95f78c52d8f1.png','MainImg',0,0,0,5,5);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-2.png','1_img_77803cf9-fb8a-42b4-879c-159e52ecc35b.png','.png','/upload/original/','No','SubImg',0,0,0,5,5);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-3.png','2_img_eb084b4f-469c-48c1-9a85-5f8c39c6b549.png','.png','/upload/original/','No','SubImg',0,0,0,5,5);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-4.png','3_img_63214ee2-2c48-483d-9c01-9961e2f3c534.png','.png','/upload/original/','No','SubImg',0,0,0,5,5);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-5.png','4_img_35fe293b-2c87-4947-9cbf-4bf247658aa4.png','.png','/upload/original/','No','SubImg',0,0,0,5,5);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-6.png','5_img_b78c91d8-4cd1-4adb-a03c-4f56c7be33ad.png','.png','/upload/original/','No','SubImg',0,0,0,5,5);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test5-1.jpeg','0_img_095a7a75-92fb-43fd-aba7-443ba66cff73.jpeg','.jpeg','/upload/original/','/upload/thumbnail/thumbnail_0_img_095a7a75-92fb-43fd-aba7-443ba66cff73.jpeg','MainImg',0,0,0,6,6);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test5-2.jpeg','1_img_e7d013f1-9ff8-4a23-a68e-caabf1d89395.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,6,6);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test5-3.jpeg','2_img_1c1761bb-2755-449c-8562-d8e8584822c4.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,6,6);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test5-4.jpeg','3_img_94b48162-3b9f-4eba-a90d-9ff5af77ba9b.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,6,6);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test5-5.jpeg','4_img_970c74c0-2cdb-45ff-ad4d-36047946da70.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,6,6);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test5-6.jpeg','5_img_f928d068-90ed-419c-a86c-38e0370bd170.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,6,6);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test4-1.jpg','0_img_2ae9a219-ae9c-4711-8698-05b275de1a54.jpg','.jpg','/upload/original/','/upload/thumbnail/thumbnail_0_img_2ae9a219-ae9c-4711-8698-05b275de1a54.jpg','MainImg',0,0,0,7,7);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test4-2.jpg','1_img_47243a9d-d026-4e13-aff7-46c620fb16cf.jpg','.jpg','/upload/original/','No','SubImg',0,0,0,7,7);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test4-3.jpg','2_img_bbb8487a-41c1-4425-a463-85f9f3ed4a08.jpg','.jpg','/upload/original/','No','SubImg',0,0,0,7,7);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test4-4.jpg','3_img_7b88390e-9d60-4c03-a78c-243824bc277a.jpg','.jpg','/upload/original/','No','SubImg',0,0,0,7,7);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-1.jpeg','0_img_c993aaff-159b-4bd4-8041-baf18ecac7db.jpeg','.jpeg','/upload/original/','/upload/thumbnail/thumbnail_0_img_c993aaff-159b-4bd4-8041-baf18ecac7db.jpeg','MainImg',0,0,0,8,8);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-2.jpeg','1_img_742cb616-2f75-40f0-a18f-70a16988d2f6.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,8,8);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-3.jpeg','2_img_d01e9fe4-7f1a-485b-95b9-9aa7352e5708.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,8,8);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-4.jpeg','3_img_55516076-1e47-49d9-86ee-e7166f3b137f.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,8,8);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-5.jpeg','4_img_9cc053ef-bbd6-466e-ad09-66f22a9b8a01.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,8,8);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-6.jpeg','5_img_1de1961f-a2c9-41f8-9c23-c92a7880f3d4.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,8,8);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test1-1.jpg','0_img_ee126b56-9ea5-445d-be09-12772f49ebb8.jpg','.jpg','/upload/original/','/upload/thumbnail/thumbnail_0_img_ee126b56-9ea5-445d-be09-12772f49ebb8.jpg','MainImg',0,0,0,9,9);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test1-2.jpg','1_img_abef2d40-491a-4ce7-b1e7-d786a049d001.jpg','.jpg','/upload/original/','No','SubImg',0,0,0,9,9);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test1-3.jpg','2_img_2a624a9c-d8a2-4916-a00c-cc65864d3f97.jpg','.jpg','/upload/original/','No','SubImg',0,0,0,9,9);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test1-4.jpg','3_img_6ecb28c8-07d8-4bdd-a814-6476cd8d936a.jpg','.jpg','/upload/original/','No','SubImg',0,0,0,9,9);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-3.png','0_img_e057f031-b89e-495c-85e6-2769d8933e1f.png','.png','/upload/original/','/upload/thumbnail/thumbnail_0_img_e057f031-b89e-495c-85e6-2769d8933e1f.png','MainImg',0,0,0,10,10);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test2-1.jpeg','1_img_ddbb35bd-b2b0-45e7-ad17-b0b09f02f7c0.jpeg','.jpeg','/upload/original/','No','SubImg',0,0,0,10,10);
Insert into TBL_FILE (FILE_NO,FILE_ORI_NAME,FILE_SAVE_NAME,FILE_EXT_NAME,FILE_PATH_NAME,FILE_T_PATH_NAME,FILE_TYPE,PET_NO,BOARD_NO,REV_NO,MEMBER_NO,PET_MEMBER_NO) values (SEQ_TBL_FILE_NO.nextval,'sitter_test3-2.png','2_img_f6243b0d-106f-4159-9836-85b25e889802.png','.png','/upload/original/','No','SubImg',0,0,0,10,10);
-- ����� ������ �� --

-- ���⿡ �˾Ƽ� �߰�~~~~~���ּ���~~~~


commit;


-- �Խ��� ī�װ� ���̺� ���� �߰�
INSERT INTO TBL_BOARD_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (1,'�Ϲݰ���');
INSERT INTO TBL_BOARD_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (2,'�߿����');
INSERT INTO TBL_BOARD_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (3,'�Ű���');
INSERT INTO TBL_BOARD_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (4,'�Ϲݹ���');
INSERT INTO TBL_BOARD_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (5,'��������');
INSERT INTO TBL_BOARD_CATEGORY (CATEGORY_CODE,CATEGORY_NAME) values (6,'��Ÿ����');

commit;

-- �Խ��� ���̺� ���� �߰�
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ϲݰ��� 1','����1','20231017','0','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ϲݰ��� 2','<p>����2</p>','20231017','1','20231017','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ϲݰ��� 3','<p>����3<br></p>','20231017','0','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ϲݰ��� 4','<p>����4<br></p>','20231017','0','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ϲݰ��� 5','<p>����5<br></p>','20231017','0','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�߿���� 6','<p>����6</p>','20231017','0','','Y','','1','',1,2,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�߿���� 7','<p>���� 7</p>','20231017','0','','Y','','1','',1,2,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�߿���� 8','<p>���� 8</p>','20231017','0','','Y','','1','',1,2,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�߿���� 9','<p>����9</p>','20231017','0','','Y','','1','',1,2,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�߿���� 10','<p>���� 10;</p>','20231017','0','','Y','','1','',1,2,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�߿����11','<p>����</p>','20231017','1','','Y','','1','',1,2,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'dd','<p>dd</p>','20231017','1','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'ddd','<p>ddd</p>','20231017','4','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'dd','<p>ddd</p>','20231017','1','','Y','','1','',1,1,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'��������','��������','20231017','0','','Y','','2','',1,5,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ű���','�Ű��� ','20231017','0','','Y','','2','',1,3,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'�Ϲݹ���','�Ϲݹ���','20231017','0','','Y','','2','',1,4,'');
Insert into TBL_BOARD (BOARD_NO,BOARD_NAME,BOARD_DETAIL,BOARD_REGIST_DATE,BOARD_VIEWS,BOARD_REVISE_DATE,BOARD_STAT,BOARD_DELETE_DATE,BOARD_SORT,BOARD_SECRET,MEMBER_NO,CATEGORY_CODE,REF_BOARD_NO) values (SEQ_TBL_BOARD_NO.NEXTVAL,'��Ÿ����','��Ÿ����','20231017','0','','Y','','2','',1,6,'');

commit;


-- �ı� ���̺� ���� �߰�
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'5',
'���ට���� ó�� ���ͺв� ��Ź�Ѱǵ� �ʹ� ģ���Ͻð� �Žð����� �� �߰� �Ϸ�� ��� ������ ������ ���� ����ּ̾��.
 �ٸ����� ����ϼż� �Ǵº� ã�Ҵ��ǵ� ������ �� ���� �����̾��� �� ���ƿ�!
 �� ���� �������־������� �ٳ�� �ڿ� �Ҿ����ϰų� ����������ʾҾ��.
�̹��� ���� ������ �� ������ �ñ�� ���� ��� �� �����Ͱ��ƿ�!! �� ��ȸ�� �ȴٸ� �� ���ʹԲ� ��Ź�� �����Դϴ�.
 ����!!!! ȣ�ڸ����� �ξ� ���� �����ΰͰ����ϴ�~','2023-09-12','2023-09-17','Y',3,1,5);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'4',
'�ֵ��� �ʹ� �� ���Գ�����. ����� �˰� ���� ������ ��հ� ������ �� �� ���ƿ�.
���п� �������� ��� �ٳ�� �� �־����. �������� �� ��� �� ������ �ñⷯ �ðԿ�!',
'2023-09-28','2023-09-28','Y',3,2,6);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'2',
'��å ���� �����ֽŴٰ� �ߴµ� ���� �Ƚ�Ű���󱸿�. �����̶�� �ϼ̴µ� �װ͵� �ƴ� �� ���ƿ�. ',
'2023-10-01','2023-10-01','N',4,3,6);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'5',
'�ְ��� ����Ͷ�� �� ���� �帮�� �;����!! ó������ ������ �ִ� �Ͷ� ���� ���� �Ҿ��ߴµ� �����δ� �ϰ� �ñ� �� �ְھ��.
���� �������� �Ʋ��ּż� �� ����...',
'2023-10-07','2023-10-08','Y',4,4,7);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'4',
'�и��Ҿ��� �� �־ ȣ�ڸ��� �ñ��ڴ� ���� �����ǰ� �Ҿ��ؼ� �ִ��� ���� ����� ȯ���� ã���� ���͸� ã�Եƾ��.
���� ���� ���͸� ���� �� ���ƿ�. �Ⱦ��ϴ� �� �� ���� ���¢�� �� �˾Ҵµ� ���� �ƴϾ ������ ������ �� ���������. �ɾ� �� ���ּż� �����ؿ�.',
'2023-10-07','2023-10-10','Y',5,5,8);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'4',
'�̰� ���� �䱸���׵� ���Ƽ� ���� ���������ٵ� �����ϰ� �ɾ����ֽð� ���÷� ������ �����ּż� �Ƚ��ϰ� ���� �ó׿�. �ʹ� �����ؿ�.',
'2023-09-07','2023-09-07','Y',5,6,9);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'4',
'���� �ְ� �ǿܹ躯�ؾ��ϴµ� ��å�� �� �� �����ּż� ��� �����̾��^^. 
�� ���γ� ���� �����ִ� ������ ���� �Ƚ��� �� �� �ۿ� ���׿�.',
'2023-09-25','2023-09-26','Y',3,7,9);
INSERT INTO TBL_REVIEW(REV_CODE,REV_SCORE,REV_CONTENT,REV_CREATED_DATE,REV_MODIFY_DATE,REV_STATUS,MEMBER_NO,RESERV_CODE,PET_MEMBER_NO)
VALUES(SEQ_TBL_REVIEW_NO.NEXTVAL,'3',
'ª�� �ð������� ���� ������ ����� ��� �̴ּ��� ���������� ���� �� �����ִ��󱸿䤻����. �� �ɾ����ּż� �����ؿ�:) .',
'2023-10-01','2023-10-01','N',4,8,8);





commit;


-- ���� ���̺� ���� �߰�
-- ���� �Ϸ�
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-09-12 09:30','2023-09-17 21:30','���񽺿Ϸ�',0,70000,5,12,3000,'2023. 9. 8. ���� 11:47:36','2023. 9. 8. ���� 11:47:36',3,5);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-09-28 09:30','2023-09-28 18:30','���񽺿Ϸ�',0,70000,0,9,3000,'2023. 9. 18. ���� 8:47:36','2023. 9. 18. ���� 8:47:36',3,6);

INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-01 13:30','2023-10-01 20:30','���񽺿Ϸ�',0,70000,0,7,3000,'2023. 9. 8. ���� 8:47:36','2023. 9. 8. ���� 8:47:36',4,6);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-07 10:00','2023-10-08 13:00','���񽺿Ϸ�',0,70000,1,3,3000,'2023. 10. 1. ���� 8:47:36','2023. 10. 1. ���� 8:47:36',4,7);

INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-07 14:30','2023-10-10 14:30','���񽺿Ϸ�',0,70000,3,0,3000,'2023. 10. 2. ���� 8:47:36','2023. 10. 2. ���� 8:47:36',5,8);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-08 09:30','2023-10-08 21:30','���񽺿Ϸ�',0,70000,0,12,3000,'2023. 10. 8. ���� 8:47:36','2023. 10. 8. ���� 8:47:36',5,9);

INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-09-07 09:30','2023-09-07 21:30','���񽺿Ϸ�',0,70000,0,12,3000,'2023. 8. 18. ���� 8:47:36','2023. 8. 18. ���� 8:47:36',3,9);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-01 13:30','2023-10-01 22:30','���񽺿Ϸ�',0,70000,0,9,3000,'2023. 9. 8. ���� 8:47:36','2023. 9. 8. ���� 8:47:36',4,8);

-- ���
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-11-15 09:30','2023-11-16 21:30','���',0,70000,1,12,3000,'2023. 10. 18. ���� 8:47:36','2023. 10. 18. ���� 8:47:36',2,9);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-12-01 10:00','2023-12-01 22:00','���',0,70000,0,9,3000,'2023. 9. 8. ���� 8:47:36','2023. 9. 8. ���� 8:47:36',3,3);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-11-05 12:30','2023-11-06 21:30','���',0,70000,1,11,3000,'2023. 8. 18. ���� 8:47:36','2023. 8. 18. ���� 8:47:36',4,9);

-- ���� ���
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-24 13:30','2023-10-24 22:30','�������',0,70000,0,9,3000,'2023. 9. 8. ���� 8:47:36','2023. 9. 8. ���� 8:47:36',2,8);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-11-07 10:30','2023-11-09 21:30','�������',0,70000,2,11,3000,'2023. 10. 18. ���� 8:47:36','2023. 10. 18. ���� 8:47:36',3,5);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-22 13:30','2023-10-26 22:30','�������',0,70000,4,9,3000,'2023. 9. 8. ���� 8:47:36','2023. 9. 8. ���� 8:47:36',4,7);


-- ���
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-09-07 09:30','2023-09-07 21:30','���',0,70000,0,12,3000,'2023. 8. 18. ���� 8:47:36','2023. 8. 18. ���� 8:47:36',2,5);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-10-01 13:30','2023-10-01 22:30','���',0,70000,0,9,3000,'2023. 9. 8. ���� 8:47:36','2023. 9. 8. ���� 8:47:36',3,6);
INSERT INTO TBL_RESERVATION(RESERV_CODE,RESERV_START,RESERV_END,RESERV_STATUS,RESERV_ACCUM,RESERV_TOTAL_AMOUNT,RESERV_DAY_COUNT,RESERV_TIME_COUNT,RESERV_VAT,RESERV_APP_DATE,RESERV_UPDATE_DATE,MEMBER_NO,PET_MEMBER_NO)
VALUES(SEQ_TBL_RESERVATION_NO.NEXTVAL,'2023-09-07 09:30','2023-09-07 21:30','���',0,70000,0,12,3000,'2023. 8. 18. ���� 8:47:36','2023. 8. 18. ���� 8:47:36',4,6);


commit;


-- �ݷ��� ���̺� ���� �߰�
INSERT INTO TBL_MYPET(PET_CODE,PET_NAME,PET_AGE,PET_GENDER,NEUTRAL_YN,PET_BREED,PET_WEIGHT,PET_REGIST,P_SOCIAL,A_SOCIAL,BARK_LEVEL,SEP_ANXIETY,PET_DISEASE,PET_DISEASE_EXP,PET_ALLERGY,PET_ALLERGY_EXP,POTTY_TRAIN,MARKING_IN,VACCIN,HOS_NAME,HOS_PHONE,HOS_ADDRESS,MEMBER_NO,REGIST_STATUS)
VALUES(SEQ_TBL_MYPET_NO.NEXTVAL,'����','7','����','��','������',4,'������','�����̿���','�����̿���','����','��','��','�����̱�','�ƴϿ�','','��','��','ȥ�տ����ֻ�(DHPPL),�ڷγ��忰(�� 1ȸ),���ߺ�','��������������','02-337-0042','����� ���۱�',2,'Y');
INSERT INTO TBL_MYPET(PET_CODE,PET_NAME,PET_AGE,PET_GENDER,NEUTRAL_YN,PET_BREED,PET_WEIGHT,PET_REGIST,P_SOCIAL,A_SOCIAL,BARK_LEVEL,SEP_ANXIETY,PET_DISEASE,PET_DISEASE_EXP,PET_ALLERGY,PET_ALLERGY_EXP,POTTY_TRAIN,MARKING_IN,VACCIN,HOS_NAME,HOS_PHONE,HOS_ADDRESS,MEMBER_NO,REGIST_STATUS)
VALUES(SEQ_TBL_MYPET_NO.NEXTVAL,'���','3','����','��','���',15,'������','���ƿ�','���ݾ��ؿ�','�ƴϿ�','�ƴϿ�','�ƴϿ�','','�ƴϿ�','','��','��','ȥ�տ����ֻ�(DHPPL),�ڷγ��忰(�� 1ȸ),���ߺ�,�������(�� 1ȸ,��������(�� 1ȸ)','��������������','02-337-0042','����� ���۱�',2,'Y');

commit;








-- -- �������� ���̺� --
--
-- -- ������ ���̺� ���� �߰�
-- INSERT INTO TBL_ACCUMULATE(ACCUM_POINT_CODE,ACCUM_REGIST_DATE,AMOUNT,ACCUM_DIVISION,ACCUM_STAT,ACCUM_STAT_DATE,MEMBER_NO)
-- VALUES(SEQ_TBL_ACCUMULATE_NO.NEXTVAL,'',0,'','','',0);
--
-- commit;
--
-- -- �˸� ���̺� ���� �߰�
-- INSERT INTO TBL_ALERT(NT_CODE,NT_SORT,NT_DATE_SENT,NT_CONTENT,MEMBER_NO)
-- VALUES(SEQ_TBL_ALERT_NO.NEXTVAL,'','','',0);
--
-- commit;
--
-- -- ��������� ���̺� ���� �߰�
-- INSERT INTO TBL_FAVORITE_SITTER(MEMBER_NO,PET_MEMBER_NO)
-- VALUES(0,0);
--
-- commit;
--
-- -- ���� ���̺� ���� �߰�
-- INSERT INTO TBL_ADJUSTMENT(PETMEMBER_SUM_NO,TOTAL_PAYMENT,TOTAL_SUM,SUM_COMPLETE_DAY,STARTDAY,ENDDAY,ACCOUNT_HOLDER,BANK_NM,ACCOUNT,PET_MEMBER_NO)
-- VALUES(SEQ_TBL_ADJUSTMENT_NO.NEXTVAL,0,0,'','','','','',0,0);
--
-- commit;
--
-- -- ���� ���̺� ���� �߰�
-- INSERT INTO TBL_PAYMENT(PAY_RECORD_CODE,PAY_PRICE,PAY_STAT,PAY_DATE,PAYMENT_CODE,RESERV_CODE)
-- VALUES(SEQ_TBL_PAYMENT_NO.NEXTVAL,0,'','',0,0);
--
-- commit;
--
-- -- ȯ�� ���̺� ���� �߰�
-- INSERT INTO TBL_REFUND(RESERV_CODE,RESERV_CCL_DATE,RESERV_CCL_DESC,RESERV_CCL_DESC_DE)
-- VALUES(0,'','','');
--
-- commit;