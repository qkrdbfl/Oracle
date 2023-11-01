-- ������ ����
DROP SEQUENCE SEQ_GENRE_CODE;
DROP SEQUENCE SEQ_BOOK_CODE;
DROP SEQUENCE SEQ_RENTAL_CODE;
DROP SEQUENCE SEQ_PAYMENT_CODE;

CREATE SEQUENCE SEQ_GENRE_CODE;
CREATE SEQUENCE SEQ_BOOK_CODE;
CREATE SEQUENCE SEQ_RENTAL_CODE;
CREATE SEQUENCE SEQ_PAYMENT_CODE;

-- ���̺� ����
DROP TABLE tbl_genre CASCADE CONSTRAINTS;
DROP TABLE tbl_book CASCADE CONSTRAINTS;
DROP TABLE tbl_rental CASCADE CONSTRAINTS;
DROP TABLE tbl_rental_book CASCADE CONSTRAINTS;
DROP TABLE tbl_payment CASCADE CONSTRAINTS;
DROP TABLE tbl_payment_rental;

-- genre ���̺� ����
CREATE TABLE tbl_genre
(
    genre_code    NUMBER NOT NULL,
    genre_name    VARCHAR2(30) NOT NULL,
    ref_genre_code    NUMBER
);

COMMENT ON COLUMN tbl_genre.genre_code IS '�帣�ڵ�';
COMMENT ON COLUMN tbl_genre.genre_name IS '�帣��';
COMMENT ON COLUMN tbl_genre.ref_genre_code IS '�����帣�ڵ�';
COMMENT ON TABLE tbl_genre IS '�帣';

CREATE UNIQUE INDEX index_genre_code ON tbl_genre
( genre_code );

ALTER TABLE tbl_genre
 ADD CONSTRAINT pk_genre_code PRIMARY KEY ( genre_code )
 USING INDEX index_genre_code;

ALTER TABLE tbl_genre
 ADD CONSTRAINT fk_ref_genre_code FOREIGN KEY ( ref_genre_code )
 REFERENCES tbl_genre ( genre_code);

CREATE TABLE tbl_book
(
    book_code    NUMBER NOT NULL,
    book_name    VARCHAR2(100) NOT NULL,
    book_price    NUMBER NOT NULL,
    genre_code    NUMBER NOT NULL,
    rental_available    CHAR(1) NOT NULL
);

COMMENT ON COLUMN tbl_book.book_code IS 'å�ڵ�';
COMMENT ON COLUMN tbl_book.book_name IS 'å��';
COMMENT ON COLUMN tbl_book.book_price IS 'å����';
COMMENT ON COLUMN tbl_book.genre_code IS '�帣�ڵ�';
COMMENT ON COLUMN tbl_book.rental_available IS '�뿩���ɻ���';
COMMENT ON TABLE tbl_book IS 'å';

CREATE UNIQUE INDEX index_book_code ON tbl_book
( book_code );

ALTER TABLE tbl_book
 ADD CONSTRAINT pk_book_code PRIMARY KEY ( book_code )
 USING INDEX index_book_code;

ALTER TABLE tbl_book
 ADD CONSTRAINT fk_genre_code FOREIGN KEY ( genre_code )
 REFERENCES tbl_genre ( genre_code );

CREATE TABLE tbl_rental
(
    rental_code    NUMBER NOT NULL,
    rental_date    VARCHAR2(8) NOT NULL,
    rental_time    VARCHAR2(8) NOT NULL,
    total_rental_price    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_rental.rental_code IS '�뿩�ڵ�';
COMMENT ON COLUMN tbl_rental.rental_date IS '�뿩����';
COMMENT ON COLUMN tbl_rental.rental_time IS '�뿩�ð�';
COMMENT ON COLUMN tbl_rental.total_rental_price IS '�Ѵ뿩�ݾ�';
COMMENT ON TABLE tbl_rental IS '�뿩';

CREATE UNIQUE INDEX index_rental_code ON tbl_rental
( rental_code );

ALTER TABLE tbl_rental
 ADD CONSTRAINT pk_rental_code PRIMARY KEY ( rental_code )
 USING INDEX index_rental_code;

CREATE TABLE tbl_rental_book
(
    rental_code NUMBER NOT NULL,
    book_code    NUMBER NOT NULL,
    rental_amount    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_rental_book.rental_code IS '�뿩�ڵ�';
COMMENT ON COLUMN tbl_rental_book.book_code IS 'å�ڵ�';
COMMENT ON COLUMN tbl_rental_book.rental_amount IS '�뿩����';
COMMENT ON TABLE tbl_rental_book IS '�뿩��å';
CREATE UNIQUE INDEX index_comp_rental_book_code ON tbl_rental_book
( rental_code,book_code );

ALTER TABLE tbl_rental_book
 ADD CONSTRAINT pk_comp_rental_book_code PRIMARY KEY ( rental_code, book_code )
 USING INDEX index_comp_rental_book_code;

ALTER TABLE tbl_rental_book
 ADD CONSTRAINT fk_rental_book_rental_code FOREIGN KEY ( rental_code )
 REFERENCES tbl_rental ( rental_code );

ALTER TABLE tbl_rental_book
 ADD CONSTRAINT fk_rental_book_book_code FOREIGN KEY ( book_code )
 REFERENCES tbl_book ( book_code );
 
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

CREATE TABLE tbl_payment_rental
(
    rental_code    NUMBER NOT NULL,
    payment_code    NUMBER NOT NULL
);

COMMENT ON COLUMN tbl_payment_rental.rental_code IS '�뿩�ڵ�';
COMMENT ON COLUMN tbl_payment_rental.payment_code IS '�����ڵ�';
COMMENT ON TABLE tbl_payment_rental IS '�������뿩';

CREATE UNIQUE INDEX index_comp_payment_rental_code ON tbl_payment_rental
( payment_code,rental_code );

ALTER TABLE tbl_payment_rental
 ADD CONSTRAINT pk_comp_payment_rental_code PRIMARY KEY ( payment_code,rental_code )
 USING INDEX index_comp_payment_rental_code;

INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '��ȭå', null);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '�Ҽ�', null);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '����', null);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '�θǽ�', 1);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '����', 1);

INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '�丮', 1);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '�̼���', 1);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '������', 2);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '�߸�', 2);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, 'ȸ��', 2);

INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '����', 3);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '����', 3);

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '����ҳ�� �����', 4500, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'ReRe���', 5000, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�����ǿ�ȭ', 3500, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ƿ��϶��̵�', 4000, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '��������ġ�÷���', 13000, 5, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '��üã��', 5000, 5, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '���', 5000, 5, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ʹ��', 7000, 6, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�丮�պ��', 4500, 6, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ɾ߽Ĵ�', 4000, 6, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�Ź��Դϴٸ�,������?', 8000, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '���غ����������μ����ְ�', 7500, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'RE:���κ��ͽ����ϴ��̼����Ȱ', 8000, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ǿ����ַ�ȯ���ع��ȴ�', 6000, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '��������', 11000, 7, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�౸���ʹ�����', 7000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�����ǿö���', 6000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '����Ȳ����', 7000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�˵��ǽ�', 6000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�������Ǽ��ʸ�', 12000, 9, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'Ĭ����,����,����', 15000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ȷ�Ȩ��', 19000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '��', 16000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '����', 21000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�������ػ�ڴ�', 9000, 10, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '����Ű��S�޵�', 20000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ٽ��ѹ���', 9000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '��õȸ�ͷ�', 13000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'FFF�ް��ɿ��', 5000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '����1ȸ��', 9000, 10, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�������³���������ִ�', 5000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '���������۰���Ȱ', 9000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '���������ճ���������ħ��', 22000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '����Ͻ���ģ', 35000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '1���ٰ�', 9000, 11, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '���ɰ���', 10500, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'ȭ���ȯ', 8600, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'ȯ��ǥ��', 7000, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '�ƺ񹫽�', 5000, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '���', 9500, 12, 'Y');


COMMIT;