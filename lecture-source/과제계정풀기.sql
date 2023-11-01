--과제 문제 풀기
-- 문법 연산 문제



























-- 함수 문제 --

--1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 
--빠른순으로 표시하는 SQL 문장을 작성하시오.
--( 단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
SELECT
        STUDENT_NO 학번
       ,STUDENT_NAME 이름
       ,TO_CHAR(ENTRANCE_DATE, 'RRRR-MM-DD')입학년도
   FROM TB_STUDENT
  WHERE DEPARTMENT_NO = '002'
  ORDER BY  1;

--2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다.
--그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자.
--(* 이때 올바르게 작성한 SQL문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
SELECT
        PROFESSOR_NAME
       ,PROFESSOR_SSN
   FROM TB_PROFESSOR    
  WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오.
--단, 이때 나이가 적은 사람에서 맋은 사람 순서로 화면에 출력되도록 맊드시오.
--(단, 교수 중 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 핚다. 나이는 ‘만’으로 계산핚다.)
SELECT
       PROFESSOR_NAME 교수이름
      ,FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(PROFESSOR_SSN, 1, 6),'YYYYMMDD'))/12) 나이
  FROM TB_PROFESSOR
 WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
 ORDER BY 2, PROFESSOR_NAME;


