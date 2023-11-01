-- ������ ����
DROP SEQUENCE SEQ_CATEGORY_CODE;
DROP SEQUENCE SEQ_MENU_CODE;
DROP SEQUENCE SEQ_ORDER_CODE;
DROP SEQUENCE SEQ_PAYMENT_CODE;

CREATE SEQUENCE SEQ_CATEGORY_CODE;
CREATE SEQUENCE SEQ_MENU_CODE;
CREATE SEQUENCE SEQ_ORDER_CODE;
CREATE SEQUENCE SEQ_PAYMENT_CODE;

-- ���̺� ����
DROP TABLE tbl_category CASCADE CONSTRAINTS;
DROP TABLE tbl_menu CASCADE CONSTRAINTS;
DROP TABLE tbl_order CASCADE CONSTRAINTS;
DROP TABLE tbl_order_menu CASCADE CONSTRAINTS;
DROP TABLE tbl_payment CASCADE CONSTRAINTS;
DROP TABLE tbl_payment_order;

-- category ���̺� ����
CREATE TABLE tbl_category
(
    category_code    NUMBER NOT NULL,
    category_name    VARCHAR2(30) NOT NULL,
    ref_category_code    NUMBER
);

COMMENT ON COLUMN tbl_category.category_code IS 'ī�װ��ڵ�';
COMMENT ON COLUMN tbl_category.category_name IS 'ī�װ���';
COMMENT ON COLUMN tbl_category.ref_category_code IS '����ī�װ��ڵ�';
COMMENT ON TABLE tbl_category IS 'ī�װ�';

CREATE UNIQUE INDEX index_category_code ON tbl_category
( category_code );

ALTER TABLE tbl_category
 ADD CONSTRAINT pk_category_code PRIMARY KEY ( category_code )
 USING INDEX index_category_code;

ALTER TABLE tbl_category
 ADD CONSTRAINT fk_ref_category_code FOREIGN KEY ( ref_category_code )
 REFERENCES tbl_category ( category_code);

CREATE TABLE tbl_menu
(
    menu_code    NUMBER NOT NULL,
    menu_name    VARCHAR2(30) NOT NULL,
    menu_price    NUMBER NOT NULL,
    category_code    NUMBER NOT NULL,
    orderable_status    CHAR(1) NOT NULL
);

COMMENT ON COLUMN tbl_menu.menu_code IS '�޴��ڵ�';
COMMENT ON COLUMN tbl_menu.menu_name IS '�޴���';
COMMENT ON COLUMN tbl_menu.menu_price IS '�޴�����';
COMMENT ON COLUMN tbl_menu.category_code IS 'ī�װ��ڵ�';
COMMENT ON COLUMN tbl_menu.orderable_status IS '�ֹ����ɻ���';
COMMENT ON TABLE tbl_menu IS '�޴�';

CREATE UNIQUE INDEX index_menu_code ON tbl_menu
( menu_code );

ALTER TABLE tbl_menu
 ADD CONSTRAINT pk_menu_code PRIMARY KEY ( menu_code )
 USING INDEX index_menu_code;

ALTER TABLE tbl_menu
 ADD CONSTRAINT fk_category_code FOREIGN KEY ( category_code )
 REFERENCES tbl_category ( category_code );

CREATE TABLE tbl_order
(
    order_code    NUMBER NOT NULL,
    order_date    VARCHAR2(8) NOT NULL,
    order_time    VARCHAR2(8) NOT NULL,
    total_order_price    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_order.order_code IS '�ֹ��ڵ�';
COMMENT ON COLUMN tbl_order.order_date IS '�ֹ�����';
COMMENT ON COLUMN tbl_order.order_time IS '�ֹ��ð�';
COMMENT ON COLUMN tbl_order.total_order_price IS '���ֹ��ݾ�';
COMMENT ON TABLE tbl_order IS '�ֹ�';

CREATE UNIQUE INDEX index_order_code ON tbl_order
( order_code );

ALTER TABLE tbl_order
 ADD CONSTRAINT pk_order_code PRIMARY KEY ( order_code )
 USING INDEX index_order_code;

CREATE TABLE tbl_order_menu
(
    order_code NUMBER NOT NULL,
    menu_code    NUMBER NOT NULL,
    order_amount    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_order_menu.order_code IS '�ֹ��ڵ�';
COMMENT ON COLUMN tbl_order_menu.menu_code IS '�޴��ڵ�';
COMMENT ON COLUMN tbl_order_menu.order_amount IS '�ֹ�����';
COMMENT ON TABLE tbl_order_menu IS '�ֹ����޴�';
CREATE UNIQUE INDEX index_comp_order_menu_code ON tbl_order_menu
( order_code,menu_code );

ALTER TABLE tbl_order_menu
 ADD CONSTRAINT pk_comp_order_menu_code PRIMARY KEY ( order_code, menu_code )
 USING INDEX index_comp_order_menu_code;

ALTER TABLE tbl_order_menu
 ADD CONSTRAINT fk_order_menu_order_code FOREIGN KEY ( order_code )
 REFERENCES tbl_order ( order_code );

ALTER TABLE tbl_order_menu
 ADD CONSTRAINT fk_order_menu_menu_code FOREIGN KEY ( menu_code )
 REFERENCES tbl_menu ( menu_code );
 
CREATE TABLE tbl_payment
(
    payment_code    NUMBER NOT NULL,
    payment_date    VARCHAR2(8) NOT NULL,
    payment_time    VARCHAR2(8) NOT NULL,
    payment_price    NUMBER NOT NULL,
    payment_type    VARCHAR2(6) NOT NULL
);

COMMENT ON COLUMN tbl_payment.payment_code IS '�����ڵ�';
COMMENT ON COLUMN tbl_payment.payment_date IS '������';
COMMENT ON COLUMN tbl_payment.payment_time IS '�����ð�';
COMMENT ON COLUMN tbl_payment.payment_price IS '�����ݾ�';
COMMENT ON COLUMN tbl_payment.payment_type IS '��������';
COMMENT ON TABLE tbl_payment IS '����';

CREATE UNIQUE INDEX index_payment_code ON tbl_payment
( payment_code );

ALTER TABLE tbl_payment
 ADD CONSTRAINT pk_payment_code PRIMARY KEY ( payment_code)
 USING INDEX index_payment_code;

CREATE TABLE tbl_payment_order
(
    order_code    NUMBER NOT NULL,
    payment_code    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_payment_order.order_code IS '�ֹ��ڵ�';
COMMENT ON COLUMN tbl_payment_order.payment_code IS '�����ڵ�';
COMMENT ON TABLE tbl_payment_order IS '�������ֹ�';

CREATE UNIQUE INDEX index_comp_payment_order_code ON tbl_payment_order
( payment_code,order_code );

ALTER TABLE tbl_payment_order
 ADD CONSTRAINT pk_comp_payment_order_code PRIMARY KEY ( payment_code,order_code )
 USING INDEX index_comp_payment_order_code;

INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '�Ļ�', null);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '����', null);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '����Ʈ', null);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '�ѽ�', 1);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '�߽�', 1);

INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '�Ͻ�', 1);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, 'ǻ��', 1);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, 'Ŀ��', 2);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '�꽺', 2);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '��Ÿ', 2);

INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '����', 3);
INSERT INTO TBL_CATEGORY VALUES (SEQ_CATEGORY_CODE.NEXTVAL, '����', 3);

INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '������ġ��', 4500, 8, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�췰������', 5000, 10, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '����ġ����ũ', 6000, 10, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�����̿��ĸ���', 7000, 10, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�ӹ��ͱ�ġ��', 13000, 4, 'Y');

INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�����û�����', 12000, 4, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '��Ʈ�̿���', 15000, 4, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�ѿ���ⱹ��', 20000, 4, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, 'ȫ�ī��', 9000, 12, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�ڴٸ����û�', 7000, 12, 'Y');

INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�������', 10000, 10, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '��ġ�˽�ũ����', 2000, 10, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '��ȭ���������', 8000, 12, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '���ޱ�ĿƲ��', 13000, 6, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�׹��ġƢ��쵿', 11000, 6, 'Y');

INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�渶�þƸ޸�ī��', 9000, 8, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '���̽��������������', 6000, 10, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�ؾ�ʹ�', 35000, 6, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '������ڳ��꽺', 9000, 9, 'Y');
INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '�������Ѷ��', 22000, 5, 'Y');

INSERT INTO TBL_MENU VALUES (SEQ_MENU_CODE.NEXTVAL, '���̳����鼳��', 5000, 11, 'Y');

COMMIT;