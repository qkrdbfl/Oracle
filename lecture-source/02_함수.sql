--02함수 (Function)

--그룹 함수
--sum : 합계를 구하여 리턴
SELECT
        SUM(SALARY)
 FROM EMPLOYEE;

-- AVG : 평균을 구하여 리턴
SELECT
        AVG(SALARY)
 FROM EMPLOYEE;
 
 --MAX : 컬럼에서 가장 큰 값 리턴, 취급하는 자료형은 ANY TYRE.
SELECT
        MAX(EMAIL)
       ,MAX(HIRE_DATE)
       ,MAX(SALARY)
 FROM EMPLOYEE; 
 
 -- MIN : 컬럼에서 가장 작은 값, 취급하는 자료형은 ANY TYRE.
 SELECT
        MIN(EMAIL)
       ,MIN(HIRE_DATE)
       ,MIN(SALARY)
 FROM EMPLOYEE;
 
 -- COUNT : 행의 갯수를 헤아려서 리턴
 SELECT
        COUNT(*) --NULL포함
       ,COUNT(DEPT_CODE)--NULL 안포함
       ,COUNT(DISTINCT DEPT_CODE)
 FROM EMPLOYEE;
 
--단일행 함수
--문자처리 함수
--LENGTH, LENGTHB
SELECT
        LENGTH('오라클')
      , LENGTHB('오라클')
  FROM DUAL;

SELECT
        LENGTH(EMAIL)
      , LENGTHB(EMAIL)
  FROM EMPLOYEE;
 
--INSTR
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1, 2) FROM DUAL;

SELECT
        EMAIL
      , INSTR(EMAIL, '@', -1)위치
  FROM EMPLOYEE;     
 
-- LPAD / RPAD
SELECT LPAD (EMAIL, 20 , '#') FROM EMPLOYEE; --왼쪽을 #로 채운다
SELECT RPAD (EMAIL, 20 , '#') FROM EMPLOYEE; --오른쪽을 #로 채운다
SELECT LPAD (EMAIL, 10 , '#') FROM EMPLOYEE; --왼쪽 뒷부분이 짤림
SELECT RPAD (EMAIL, 10 , '#') FROM EMPLOYEE;--오른쪽 뒷부분이 짤림
SELECT RPAD (EMAIL, 20 ) FROM EMPLOYEE; --나머지는 공백으로 채운다
 
-- LTEIM/ RTRIM / TRIM
SELECT LTRIM(' OHGIRAFFERS') FROM DUAL;
SELECT LTRIM(' OHGIRAFFERS', ' ') FROM DUAL; --공백을 제거
SELECT LTRIM('000123456', '0') FROM DUAL; --0을 다 제거
SELECT LTRIM('123123OHGIRAFFERS', '123') FROM DUAL;--123을 제거
SELECT LTRIM('132123OHGIRAFFERS123', '123') FROM DUAL;--1과 2와 3을 제거한다 각각의 문자로 보고 제거한다 다음 제거할것이 123중 없으면 거기서 멈춤
SELECT LTRIM('ACABACOHGIRAFFERS', 'ABC') FROM DUAL;
SELECT LTRIM('5782OHGIRAFFERS', '0123456789') FROM DUAL;

SELECT RTRIM('OHGIRAFFERS ') FROM DUAL;--오른쪽부터 제거순서
SELECT RTRIM('OHGIRAFFERS ', ' ') FROM DUAL;
SELECT RTRIM('123456000', '0') FROM DUAL;
SELECT RTRIM('OHGIRAFFERS123123', '123') FROM DUAL;
SELECT RTRIM('123123OHGIRAFFERS123', '123') FROM DUAL;
SELECT RTRIM('OHGIRAFFERSACABAC', 'ABC') FROM DUAL;
SELECT RTRIM('OHGIRAFFERS5782', '0123456789') FROM DUAL;

SELECT TRIM(' OHGIRAFFERS ') FROM DUAL; --양옆 공백 제거됨
SELECT TRIM('Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;--양옆이 다 제거
SELECT TRIM(LEADING 'Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL; --왼쪽에서부터
SELECT TRIM(TRAILING 'Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;--오른쪽에서 부터
SELECT TRIM(BOTH 'Z' FROM 'ZZZOHGIRAFFERSZZZ') FROM DUAL;--양옆제거
 
-- SUBSTR 
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;--짜르기 시작할 위치
SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;--7번째 자리에서부터 끝까지 자른다
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;-- -8째에서 3개를 자르겠다
SELECT SUBSTR('쇼우 미 더 머니', 2, 5) FROM DUAL;--2번째부터 5개를 가져와라
 
SELECT
      SUBSTR('ORACLE', 3, 2)--3번째부터 2개 출력한다
    , SUBSTRB('ORACLE', 3, 2)
  FROM DUAL;
SELECT
      SUBSTR('오라클', 2, 2) 
    , SUBSTRB('오라클', 4, 6)--4바이트부터 6개를 출력한다
  FROM DUAL; 
 
--직원들의 주민 번호를 조회하여 사원명, 생년, 생월, 생일을 각각 분리하여 조회(컬럼 별칭 사용) 
SELECT
        EMP_NAME 사원명
       ,SUBSTR(EMP_NO , 1, 2) 생년
       ,SUBSTR(EMP_NO , 3, 2) 생월
       ,SUBSTR(EMP_NO , 5, 2) 생일
  FROM EMPLOYEE;     
 
-- 날짜 데이터에도 SUBSTR 사용 가능
--입사일에서 입사년도, 입사월, 입사 날짜 각각 분리하여 조회 (컬럼명별칭)
SELECT
        HIRE_DATE
       ,SUBSTR(HIRE_DATE, 1, 2)입사년도
       ,SUBSTR(HIRE_DATE, 4, 2)입사월 
       ,SUBSTR(HIRE_DATE, 7, 2) 입사일
  FROM EMPLOYEE;      
 
--WHERE 절에도 함수를 사용가능
-- EMP_NO 를 통해 성별을 판단하여 여성 직원의 모든 칼럼 정보 조회
SELECT
        *
  FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8, 1)='2';
 
 -- WHERE절에는 단일행 함수만 사용가능
SELECT
        *
  FROM EMPLOYEE
 WHERE AVG(SALARY)>100; --오류남 
 
 -- 함수 중첩 사용 가능
 -- 사원명과 주민번호를 조회한다. 주민번호는 생년월일 이후 '-' 다음의 값은 '*'로 바꿔 출력한다
SELECT
        EMP_NAME
       ,RPAD(SUBSTR(EMP_NO, 1, 7), 14, '*')--남는건 *로 채워라
  FROM  EMPLOYEE; 
 
-- 사원명과 이메일을 조회한다. 이메일은 @ 이후를 제거한 아이디만 조회한다 
SELECT
       EMP_NAME 
      ,SUBSTR(EMAIL, 1, INSTR(EMAIL,'@')-1)--골뱅이의 위치 전까지
  FROM EMPLOYEE;   
 
-- LOWER / UPPER / INITCAP
SELECT LOWER('WELCOME TO MY WORLD')FROM DUAL;--소문자로 만들어줌
SELECT UPPER('welcome to my world')FROM DUAL;--대문자로 만들어줌
SELECT INITCAP('welcome to my world')FROM DUAL;--가장 앞의 문자를 대문자로 해줌 
 
-- CONCAT
SELECT CONCAT('가나다라', 'ABCD') FROM DUAL;--문자열 합치기
 
-- REPLACE
SELECT REPLACE('서울 강남구 역삼동',  '역삼동', '삼성동') FROM DUAL;--서울 강남구 역삼동에서 역삼동을 삼성동으로 바꾼다 (순서 이해하기)
 
-- 숫자 처리 함수
--ABS
SELECT ABS(10), ABS(-10) FROM DUAL;--숫자를 절대값으로 반환

-- MOD (%)
SELECT MOD(10, 5), MOD(10, 3) FROM DUAL;-- 10%5 10%3

-- ROUND : 반올림
SELECT ROUND(123.456) FROM DUAL; --123
SELECT ROUND(123.456, 0) FROM DUAL;--123
SELECT ROUND(123.456, 1) FROM DUAL;-- 123,4를 남기는데 반올림해서 123.5가 나옴
SELECT ROUND(123.456, 2) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;--123.에서 3올리고 2까지 올리는데 5안돼서 버림 그래서 100

-- FLOOR : 내림
SELECT FLOOR(123.456) FROM DUAL;--123
SELECT FLOOR(123.678) FROM DUAL;--123 >정수에 맞춰서 소수점 잘라버림

-- TRUNC : 내림 (자리수 설정)
SELECT TRUNC(123.456) FROM DUAL;
SELECT TRUNC(123.678) FROM DUAL;
SELECT TRUNC(123.678, 1) FROM DUAL;
SELECT TRUNC(123.678, 2) FROM DUAL; 
SELECT TRUNC(123.678, -1) FROM DUAL;

-- CEIL : 올림
SELECT CEIL (123.456) FROM DUAL; --124 >정수 기준으로 소수점 올림
SELECT CEIL (123.678) FROM DUAL;
 
-- 날짜 처리 함수
-- SYSDATE
SELECT SYSDATE FROM DUAL; --시스템이 가지고 있는 날짜 가져옴
 
-- MONTHS_BETWEEN : 두 날짜의 개월 수 차이 숫자로 리턴
SELECT 
        EMP_NAME
       ,HIRE_DATE
       ,CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) --소수점자리 올림처리
  FROM EMPLOYEE;
 
 --ADD_MONTHS : 날짜에 숫자만큼 개월 수를 더해서 날짜로 리턴
SELECT
        ADD_MONTHS(SYSDATE, 5)-- 오늘에서부터 5개월을 더해서 알려줘
  FROM DUAL;
 
-- 근무 년수가 20년 이상인 직원들의 모든 컬럼 조회
SELECT
        * 
  FROM EMPLOYEE
-- WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >=240 --이것도 가능
 WHERE ADD_MONTHS(HIRE_DATE, 240) <= SYSDATE;
 
-- NEXT_DAY : 기준 날짜에서 구하려는 요일에 가장 가까운 날짜 리턴
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금요일')FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금')FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6)FROM DUAL;-- 1~7에서 찾는데 1이 일요일 기준
--언어설정에따라 오류남
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'FRIDAY')FROM DUAL;--오류남
--시스템 환경에 따른 언어 설정을 변경 (대신 아메리칸은 한국어가 오류남)
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;--언어를 아메리칸으로 바꾸란 소리임
ALTER SESSION SET NLS_LANGUAGE = KOREAN;--코리아로 다시 바꾸기 

-- LAST_DAY : 해당 월의 마지막 날짜를 리턴
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- 사원명, 입사일, 입사달의 근무 일수(주말 포함)
SELECT
        EMP_NAME
       ,HIRE_DATE
       ,LAST_DAY(HIRE_DATE) - HIRE_DATE + 1 "입사달 근무일수"--날짜-(빼기)날짜를 리턴 = 일수 는 지금0이니까 +1(하루)해준것임
  FROM EMPLOYEE;     

--EXTRACT : 년, 월, 일 정보를 추출하여 리턴
SELECT
        EXTRACT(YEAR FROM SYSDATE) 년도
       ,EXTRACT(MONTH FROM SYSDATE) 월
       ,EXTRACT(DAY FROM SYSDATE) 일
  FROM DUAL;

-- 직원의 이름, 입사일, 근무년수 조회
SELECT
        EMP_NAME
       ,HIRE_DATE
       ,EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
  FROM EMPLOYEE;     

-- 근무년수를 만으로 계산하는 경우에는 월의 차리를 계산한다
SELECT
        EMP_NAME
       ,HIRE_DATE
       ,FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) "만 근무년수"
       --MONTHS_BETWEEN(SYSDATE, HIRE_DATE는 개월수 계산하는 코드
  FROM EMPLOYEE;

-- 형 변환 함수
-- TO_CHAR
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '99999') FROM DUAL; --다섯자리에 맞추라고 하는것
SELECT TO_CHAR(1234, '00000') FROM DUAL; -- 앞에 0으로 포맷
SELECT TO_CHAR(1234, 'L99999') FROM DUAL;
SELECT TO_CHAR(1234, '$99999') FROM DUAL;
SELECT TO_CHAR(1234, '00,000') FROM DUAL; --저 자리에 ,가 찍힘
SELECT TO_CHAR(1234, '999') FROM DUAL;

-- 직원 테이블에서 사원명, 급여 조회
-- 급여는 '\9,000,000' 형식으로 표시하세요
SELECT
       EMP_NAME
     , TO_CHAR(SALARY, 'L99,999,999')-- 앞에 L붙고 세자리마다 ,가 찍힌게한다
  FROM EMPLOYEE;

--포맷문자들
SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL; --24시로 본다는 패턴
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;--YYYY년도
SELECT TO_CHAR(SYSDATE, 'YYYY-fmMM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YEAR, Q') || '분기' FROM DUAL;-- Q는 분기를 나타냄

SELECT
        EMP_NAME
      , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') 입사일
   FROM EMPLOYEE;
SELECT
        EMP_NAME
      , TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"') 입사일 --한글 같은경우 ""를 감싸줘야함
   FROM EMPLOYEE;
SELECT
        EMP_NAME
      , TO_CHAR(HIRE_DATE, 'YYYY/MM/DD HH24:MI:SS') 상세입사일 --초까지
   FROM EMPLOYEE;
--년도를 YY로 쓰지만 RR이라고도 쓸떄가 있다
-- RR은 두자리 년도를 네자리로 바꿀 때 바꿀 년도가 50년 미만이면 2000년을 적용하고
-- 50년 이상이면 1900년을 적용한다.
-- YY는 년도를 바꿀 때 현재 세기(2000년)를 적용한다.
SELECT
        TO_CHAR(TO_DATE('980630', 'YYMMDD'), 'YYYY-MM-DD')--TO_CHAR를 이용해서 YY로(2000년도부터) 
   FROM DUAL;
SELECT
        TO_CHAR(TO_DATE('980630', 'RRMMDD'), 'YYYY-MM-DD')--RR로
   FROM DUAL;

-- 오늘 날짜에서 월만 출력
SELECT
        TO_CHAR(SYSDATE, 'MM')--숫자
      , TO_CHAR(SYSDATE, 'MONTH')--한글
      , TO_CHAR(SYSDATE, 'MON')
      , TO_CHAR(SYSDATE, 'RM')--로마
   FROM DUAL;

-- 오늘 날짜에서 일만 출력
SELECT
        TO_CHAR(SYSDATE, '"1년 기준 " DDD"일 째"')--365을 기준으로 며칠째인지
      , TO_CHAR(SYSDATE, '"달 기준 " DD"일 째"')
      , TO_CHAR(SYSDATE, '"주 기준 " D"일 째"')
   FROM DUAL;

-- 오늘 날짜에서 분기와 요일 출력 처리
SELECT
        TO_CHAR(SYSDATE, 'Q"분기"')
      , TO_CHAR(SYSDATE, 'DAY')
      , TO_CHAR(SYSDATE, 'DY')
   FROM DUAL;

--이름과 입사일 조회
--일사일 포맷은 '2018년 6월 15일 (수)' 형식으로 출력
SELECT
        EMP_NAME
       ,TO_CHAR(HIRE_DATE, 'RRRR"년" fmMM"월" DD"일" (DY) ' )
FROM EMPLOYEE;

-- TO_DATE : 숫자나 문자를 날짜로 바꾼다
SELECT
        TO_DATE('20100101', 'RRRRMMDD')
   FROM DUAL;

SELECT
        TO_CHAR(TO_DATE('20100101', 'RRRRMMDD'), 'RRRR, MON')
   FROM DUAL;

SELECT
        TO_DATE('041030 143000', 'RRMMDD HH24MISS')
   FROM DUAL;

SELECT
        TO_CHAR(TO_DATE('041030 143000', 'RRMMDD HH24MISS'), 'DD-MON-RRRR HH:MI:SS PM')
   FROM DUAL;

-- 2000년도 이후 입사한 사원의 사번, 이름, 입사일 조회
SELECT
        EMP_NO
       ,EMP_NAME
       ,HIRE_DATE
   FROM EMPLOYEE     
-- WHERE HIRE_DATE >= TO_DATE('20001001', 'RRRRMMDD');
 WHERE HIRE_DATE >= '20001001'; --날짜로 자동 형변환됨 위에랑 같은 값이나옴
-- WHERE HIRE_DATE >= TO_DATE(20001001, 'RRRRMMDD');-- 이것도 같은 값나옴
-- WHERE HIRE_DATE >= 20001001;-- 이건 오류남 일관성 없는 데이터

--TO_NUMBER : 숫자로 형변환한다
SELECT '123' + '456' FROM DUAL; -- 이건 숫자 더하기 연산을 함 숫자끼리로 숫자 형변환을 했기때문(중간에 문자가 들어가면 합쳐짐)
SELECT '123' + '456A' FROM DUAL;-- 수치가 부적합 하다는 에러남

--사번이 홀수인 직원들의 정보 조회
SELECT
        *
  FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 1; -- 문자열도 자동 형변환      

--TO_NUMBER는 어떨때 써야할까?
SELECT '1,000,000' + '500,000' FROM DUAL; -- 에러남 이럴때 투넘버로 감싸서 쓰자
SELECT --투넘버로 감싸봄
      TO_NUMBER('1,000,000', '99,999,999') +  TO_NUMBER('500,000', '999,999') 
FROM DUAL;
 
--NULL 처리 함수
-- NVL(컬럼명, NULL 일때 바꿀 값)
SELECT
        EMP_NAME
      , BONUS
      , NVL(BONUS, 0)
   FROM EMPLOYEE;
 
-- NVL2 (컬럼명, 값이 있을 경우의 대체값, NULL일 경우의 대체값) 
-- 보너스 포인트가 NULL인 직원은 0.5로 보너스 포인트가 NULL이 아닌 직원은 0.7로 변경하여 조회
SELECT
        EMP_NAME
      , BONUS
      , NVL2(BONUS, 0.7, 0.5)--NILL이 아닐떈 0.7 NULL이면 0.5
   FROM EMPLOYEE; 
 
-- 선택함수
-- DECODE(컬럼명, 조건값1, 선택값1, 조건값2, 선택값2, ...)
--성별을 구분하여 '남' 또는 '여'로 조회
SELECT
        EMP_NAME
      , EMP_NO
      , DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여')
   FROM EMPLOYEE;

-- 마지막 인자로 조건 값 없이 선택 값을 작성하면 아무런 조건에 해당하지 않을때
--마지막 선택 값을 무조건 선택함
SELECT
        EMP_NAME
      , EMP_NO
      , DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '여')
   FROM EMPLOYEE;

-- 직원 급여 인상
-- 직급 코드 J7 => 10%, J6 => 15%, J5 => 20% 그외 =>5%
SELECT
        EMP_NAME
       ,JOB_CODE
       ,SALARY
       ,DECODE(JOB_CODE, 'J7', SALARY* 1.1,)인상급여
                'J6', SALARY*1.15,
                'J5', SALARY*1.2,
                SALARY*1.05) 인상급여//
   FROM EMPLOYEE;   
 
-- CASE
/*
  CASE
    WHEN 조건식1 THEN 결과값1
    WHEN 조건식2 THEN 결과값2
    ELSE 결과값N
END
*/
-- CASE 예시문 
-- 급여가 500만원을 초과하면 고급, 300~500 사이면 중급, 그 이하면 초급으로 조회 
SELECT
        EMP_NAME
      , SALARY
      , CASE
          WHEN SALARY > 5000000 THEN '고급'
          WHEN SALARY BETWEEN 3000000 AND 5000000 THEN '중급'
          ELSE '초급'
        END 구분
   FROM EMPLOYEE;
 
 
 
 
 
 
 
 
 
 