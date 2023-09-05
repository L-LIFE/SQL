# 원하는 데이터 검색
#select 조회할 거 from 어디서(데이터베이스명. 데이블명)
select * from classicmodels.customers; #classicmodels.customers의 모든 내용
select customernumber from classicmodels.customers; #classicmodels.customers의 customernumber조회
select customernumber, customername from classicmodels.customers; #classicmodels.customers의 customernumber, customername 조회

#집계함수
select * from classicmodels.payments; #내용확인을 위해 전체 조회
select amount, checkNumber from classicmodels.payments; #classicmodels.payments의 amount, checkNumber 조회
select sum(amount), count(checkNumber) from classicmodels.payments; #sum:합계, count: 숫자세기
#--주의!-- (주석한 코드)
#집계함수에서 부르는 내용의 개수가 다르면 오류가 발생.
#select sum(amount), checkNumber from classicmodels.payments; #결과가 1개, 여러개 결과로 조회가 되기에 오류가 발생.

#컬럼명 지정( select 조회한 것으로 데이터베이스에는 영향을 주지 않는다.=원본 데이터엔 영향X)
select sum(amount) as S_am, count(checkNumber) as C_cm from classicmodels.payments; #sum(amount)을 S_am으로 count(checkNumber)을 C_cm으로 지정.

#중복제거
select orderNumber from classicmodels.orderdetails; #중복제거 전
select distinct orderNumber from classicmodels.orderdetails; #중복제거 후

#where절 (조건문)
select orderNumber from classicmodels.orderdetails; #정보 확인
select orderNumber from classicmodels.orderdetails where orderNumber>=10400; #10400이상인 내용만 조회

#or절 ('이거나') and절 ('이면서')
#or과 and의 차이점
select orderNumber from classicmodels.orderdetails where orderNumber>=10300 and orderNumber<=10350; #10300이상이면서 10350이하인 것 조회
select distinct orderNumber from classicmodels.orderdetails where orderNumber>=10300 and orderNumber<=10350; #중복제거
select orderNumber from classicmodels.orderdetails where orderNumber=10300 or orderNumber=10350; #10300이거나 10350인 거 조회

#between연산자 (between A and B)
#and연산자 대신 between연산자를 사용하면 좀 더 편리함.
select distinct orderNumber from classicmodels.orderdetails where orderNumber>=10300 and orderNumber<=10350; #and연산자
select distinct orderNumber from classicmodels.orderdetails where orderNumber between 10300 and 10350; #between연산자

#in연산자 : 속해있다./ 있는지를 알 수 있음.
#원하는 데이터를 부를 때 or연산자보다 많이 사용함.
select orderNumber from classicmodels.orderdetails where orderNumber in (10300,10350);
select customerNumber from classicmodels.customers where country in ('USA', 'Canada');
select customerNumber, country from classicmodels.customers where country in ('USA', 'Canada');

#not: 제외하고 조회
select customerNumber, country from classicmodels.customers where country not in ('USA', 'Canada');

#기본적인 비교 연산자는 알아두는 것이 좋다

#is NULL/ NULL은 비교연산자 사용X
#where orderNumber is not null(!= 대신 is not을 사용) / where orderNumber is null (= 대신 is를 사용)
#<> , !=: 다르다
select orderNumber from classicmodels.orderdetails where orderNumber != 10300;
select orderNumber from classicmodels.orderdetails where orderNumber is null;
select orderNumber from classicmodels.orderdetails where orderNumber is not null;

#like :문자열 부분일치 검색
# %: 0~무한대 글자, _:1글자
# Q. A_sum 컬럼에서 abc로 시작하는 모든 내용을 찾으시오.
where A_sum like 'abc%' #결과 예시: abc, abc12, abcnjfsdnk123
# Q. A_sum 컬럼에서 앞에 한글자 있고, 두번째 글자부터 abc로 시작하는 모든 내용을 찾으시오.
where A_sum like '_abc%'
# Q. A_sum 컬럼에서 앞에 세글자가 있고, 두번째 글자부터 abc로 시작하는 모든 내용을 찾으시오.
where A_sum like'___abc%' #_3개를 사용. %의 경우 0개도 존재할 수 있다는 의미 때문에 _를 사용.
# Q. add1 컬럼에서 ST가 들어있는 문자 모두 찾으시오
where add1 like '%ST%' 