-- 시퀀스 생성
DROP SEQUENCE SEQ_GENRE_CODE;
DROP SEQUENCE SEQ_BOOK_CODE;
DROP SEQUENCE SEQ_RENTAL_CODE;
DROP SEQUENCE SEQ_PAYMENT_CODE;

CREATE SEQUENCE SEQ_GENRE_CODE;
CREATE SEQUENCE SEQ_BOOK_CODE;
CREATE SEQUENCE SEQ_RENTAL_CODE;
CREATE SEQUENCE SEQ_PAYMENT_CODE;

-- 테이블 생성
DROP TABLE tbl_genre CASCADE CONSTRAINTS;
DROP TABLE tbl_book CASCADE CONSTRAINTS;
DROP TABLE tbl_rental CASCADE CONSTRAINTS;
DROP TABLE tbl_rental_book CASCADE CONSTRAINTS;
DROP TABLE tbl_payment CASCADE CONSTRAINTS;
DROP TABLE tbl_payment_rental;

-- genre 테이블 생성
CREATE TABLE tbl_genre
(
    genre_code    NUMBER NOT NULL,
    genre_name    VARCHAR2(30) NOT NULL,
    ref_genre_code    NUMBER
);

COMMENT ON COLUMN tbl_genre.genre_code IS '장르코드';
COMMENT ON COLUMN tbl_genre.genre_name IS '장르명';
COMMENT ON COLUMN tbl_genre.ref_genre_code IS '상위장르코드';
COMMENT ON TABLE tbl_genre IS '장르';

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

COMMENT ON COLUMN tbl_book.book_code IS '책코드';
COMMENT ON COLUMN tbl_book.book_name IS '책명';
COMMENT ON COLUMN tbl_book.book_price IS '책가격';
COMMENT ON COLUMN tbl_book.genre_code IS '장르코드';
COMMENT ON COLUMN tbl_book.rental_available IS '대여가능상태';
COMMENT ON TABLE tbl_book IS '책';

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

COMMENT ON COLUMN tbl_rental.rental_code IS '대여코드';
COMMENT ON COLUMN tbl_rental.rental_date IS '대여일자';
COMMENT ON COLUMN tbl_rental.rental_time IS '대여시간';
COMMENT ON COLUMN tbl_rental.total_rental_price IS '총대여금액';
COMMENT ON TABLE tbl_rental IS '대여';

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

COMMENT ON COLUMN tbl_rental_book.rental_code IS '대여코드';
COMMENT ON COLUMN tbl_rental_book.book_code IS '책코드';
COMMENT ON COLUMN tbl_rental_book.rental_amount IS '대여수량';
COMMENT ON TABLE tbl_rental_book IS '대여한책';
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

COMMENT ON COLUMN tbl_payment.payment_code IS '결제코드';
COMMENT ON COLUMN tbl_payment.payment_date IS '결제일';
COMMENT ON COLUMN tbl_payment.payment_time IS '결제시간';
COMMENT ON COLUMN tbl_payment.payment_price IS '결제금액';
COMMENT ON COLUMN tbl_payment.payment_type IS '결제구분';
COMMENT ON TABLE tbl_payment IS '결제';

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

COMMENT ON COLUMN tbl_payment_rental.rental_code IS '대여코드';
COMMENT ON COLUMN tbl_payment_rental.payment_code IS '결제코드';
COMMENT ON TABLE tbl_payment_rental IS '결제별대여';

CREATE UNIQUE INDEX index_comp_payment_rental_code ON tbl_payment_rental
( payment_code,rental_code );

ALTER TABLE tbl_payment_rental
 ADD CONSTRAINT pk_comp_payment_rental_code PRIMARY KEY ( payment_code,rental_code )
 USING INDEX index_comp_payment_rental_code;

INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '만화책', null);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '소설', null);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '웹툰', null);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '로맨스', 1);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '공포', 1);

INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '요리', 1);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '이세계', 1);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '스포츠', 2);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '추리', 2);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '회귀', 2);

INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '성인', 3);
INSERT INTO TBL_GENRE VALUES (SEQ_GENRE_CODE.NEXTVAL, '무협', 3);

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '늑대소년과 흑왕자', 4500, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'ReRe헬로', 5000, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '새벽의연화', 3500, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '아오하라이드', 4000, 4, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '이토준이치컬렉션', 13000, 5, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '신체찾기', 5000, 5, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '어나더', 5000, 5, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '초밥왕', 7000, 6, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '요리왕비룡', 4500, 6, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '심야식당', 4000, 6, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '거미입니다만,문제라도?', 8000, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '흔해빠진직업으로세계최강', 7500, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'RE:제로부터시작하는이세계생활', 8000, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '악역영애로환생해버렸다', 6000, 7, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '무직전생', 11000, 7, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '축구를너무잘함', 7000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '기적의올라운더', 6000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '농구의황태자', 7000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '검도의신', 6000, 8, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '살인자의쇼필몰', 12000, 9, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '칵테일,러브,좀비', 15000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '셜록홈즈', 19000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '덫', 16000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '모방범', 21000, 9, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '나를위해살겠다', 9000, 10, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '내가키운S급들', 20000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '다시한번더', 9000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '일천회귀록', 13000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, 'FFF급관심용사', 5000, 10, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '나만1회차', 9000, 10, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '앞집에는나리가살고있다', 5000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '성스러운작가생활', 9000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '버림받은왕녀의은밀한침실', 22000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '비즈니스여친', 35000, 11, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '1을줄게', 9000, 11, 'Y');

INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '월령검제', 10500, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '화산귀환', 8600, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '환생표사', 7000, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '아비무쌍', 5000, 12, 'Y');
INSERT INTO TBL_Book VALUES (SEQ_Book_CODE.NEXTVAL, '고수', 9500, 12, 'Y');


COMMIT;