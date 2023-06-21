#데이터 일부 추려보기.
### x 번째 가입자 2명 출력
SELECT * FROM coopang.member
ORDER BY sign_up_day DESC
limit 8, 2;


#이스케이프 문자
### 100% satisfied 가 포함된 row 를 출력해야 하는데
### 100%의 % 가 인식되게하려면 이스케이프 문자 \ 가 필요하다.
### 따라서 100\%를하면 인식되고 양끝의 %는 와일드카트 로 쓰일 수 있다.
SELECT * 
FROM review 
WHERE comment LIKE '%100\% satisfied%';


# 바이너리
### yummy 가 포함된 row 를 검색하고 싶은데 대문자 Y도 인식이 된다
### BINARY 를 써주면 대소문자까지 구분해서 yummy 만 뽑힘.
SELECT * 
FROM review 
WHERE comment LIKE BINARY '%yummy%';

 
 
 # 회원 가입일 기준 내림차순 정렬
 ### 5번쨰 row 부터 3개의 row 출력. LIMIT 5, 3
 ### 기존 데이터셋 활용 star -> age 로 변경 
SELECT * FROM coopang.member
ORDER BY age ASC, YEAR(sign_up_day) DESC
LIMIT 0, 5;
---------------------------------------------  
#최대값
#최소값
#평균값
SELECT MAX(height) FROM coopang.member;
SELECT MIN(weight) FROM coopang.member;
### AVG null 값 제외 계산.
SELECT AVG(weight) FROM coopang.member;
SELECT SUM(age) FROM coopang.member;

### 표준편차
SELECT STD(age) FROM coopang.member;

###절대값
SELECT ABS(height) FROM coopang.member;

SELECT SQRT(); # 제곱근 함수
SELECT CEIL();# 올림함수
SELECT FLOOR(); #내림함수

###반올림 함수
SELECT ROUND(height) FROM coopang.member;
--------------------------------------------------
 # NULL
 
SELECT * FROM coopang.member
WHERE address IS NULL;
 
SELECT * FROM coopang.member
WHERE address IS NOT NULL;
 
SELECT * FROM coopang.member
WHERE address IS NULL
	OR weight IS NULL
    OR height IS NULL;
--------------------------------------------------------
# COALESCE 함수 빈값을 정해준 ### @@@ 로 치환해서 출력.
SELECT
	COALESCE(height, '####'),
    COALESCE(weight, '---'),
    COALESCE(address, '@@@')
FROM coopang.member;


 SELECT ROUND(AVG(age), 1) FROM coopang.member
 WHERE age BETWEEN 5 AND 100;
 
 SELECT * FROM coopang.member
 WHERE address NOT LIKE '%호';


---------------------------------------------------------
# 컬럼 끼리의 연산 을하고 새로운 컬럼을 만들어 보자.
SELECT email, height, weight, weight/((height/100) * (height/100)) AS BMI지수
FROM coopang.member
