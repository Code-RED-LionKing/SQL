SELECT * FROM coopang.member WHERE age NOT between 30 AND 39;
#not 을 쓸 수 있음.
SELECT * FROM coopang.member WHERE age IN (20, 30);
# IN 을 이용해 20과 30의 데이터만 뽑아.

------------------------------------------------------

SELECT * FROM coopang.member WHERE gender != 'm';
#~가 아닌
SELECT * FROM coopang.member WHERE gender <> 'm';
#~가 아닌
SELECT * FROM coopang.member WHERE sign_up_day > '2019-01-01';
#날짜도 부등호 사용 가능.

------------------------------------------------------

SELECT * FROM coopang.member WHERE address LIKE '서울%';
# 서울이라는 단어로 시작하는 모든 문자.
SELECT * FROM coopang.member WHERE address LIKE '%고양시%';
# 고양시가 포함되어 있는 모든 문자.
SELECT * FROM coopang.member WHERE email LIKE 'c_____@%';
# c로 시작하고 6글자를 가진 문자.

-------------------------------------------------------
### 년 월 일 추출하기

#(1)1992년에 태어난 회원들만 조회하기
# YEAR() 함수를 사용한다.
SELECT * FROM coopang.member WHERE YEAR(birthday) = '1992';

#(2) (6,7,8)월에 가입한 회원들만 조회회하기
# MONTH() 함수를 사용하기.
SELECT * FROM coopang.member WHERE MONTH(sign_up_day) IN (6,7,8);

#(3) 각 달의 15일 ~31일에 가입한 회원 조회하기.
SELECT * FROM coopang.member WHERE DAY(sign_up_day) BETWEEN 15 AND 31;

### 날짜 간의 차이 구하기. DATEDIFF() 함수.
### DATEDIFF(날짜 a, 날짜 b)
#DATEDIFF(날짜 a, 날짜 b)를 사용하면 '날짜 a - 날짜 b'를 해서 그 차이 일수를 알려줍니다. 
#예를 들어
#DATEDIFF(’2018-01-05’, ’2018-01-03’)의 값은 2입니다.
SELECT
	email, sign_up_day, DATEDIFF(sign_up_day, '2019-01-01')
FROM coopang.member;

#오늘 날짜 함수 CURDATE()
#오늘 날짜 기준으롱 가입일과의 차 구하기.
SELECT email, sign_up_day, CURDATE(), DATEDIFF(sign_up_day, CURDATE())
FROM coopang.member;


#날짜 더하기 뺴기
#더하는 함수 DATE_ADD()
#빼는 함수 DATE_SUB()
#기준날짜 ex)sign_up_day

SELECT email, sign_up_day, DATE_ADD(sign_up_day, INTERVAL 300 DAY) #날짜 더하기
FROM coopang.member;

SELECT email, sign_up_day, DATE_SUB(sign_up_day, INTERVAL 250 DAY) #날짜 빼기.
FROM coopang.member;

--------------------------------------------------------------------
# 두개 이상의 조건
### 남자면서 서울에 거주하는 회원 조회
### + 25세 ~29세 
SELECT * FROM coopang.member
WHERE gender = 'm'
	AND address like '서울%'
    AND age BETWEEN 25 AND 29;
 
 
 #봄 or 가을에 가입한 회원 조회.
SELECT * FROM coopang.member
#MONTH()함수 사용
WHERE MONTH(sign_up_day) BETWEEN 3 AND 5
OR MONTH(sign_up_day) BETWEEN 9 AND 11;

#남자 회원들 중에서 키가 180 이상 + 여자회원들중에 키가 170이상인 회원 조회.

SELECT * FROM coopang.member
WHERE (gender = 'm' AND height > 180)
	OR (gender = 'F' AND height > 170);

-------------------------------------------------------------------

#정렬
# 오름착순
SELECT * FROM coopang.member
ORDER BY height ASC;
# 내림차순 
SELECT * FROM coopang.member
ORDER BY height DESC;

### 남자 회원들 중 몸무게가 70kg 이상 조회, 정렬
SELECT * FROM coopang.member
WHERE gender = 'm'
	AND weight >= 70
ORDER BY height ASC;


###
SELECT * FROM coopang.member
ORDER BY YEAR(sign_up_day) DESC, email ASC;

### 가입일을 기준으로 내림차순 정렬
### 10명만.
 SELECT * FROM coopang.member
 ORDER BY sign_up_day DESC
 limit 10;