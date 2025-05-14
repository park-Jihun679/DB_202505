-- WHERE
-- 특정 조건에 맞는 레코드(데이터)만을 선택하는데 사용됨

-- [ = ] 같음 연산자를 사용한 where절
select first_name, -- select 에 담지 않더라도 다른 컬럼의 속성으로 조건을 걸 수 있다.
       last_name
from employees
where gender != 'M' -- 성별이 'M'인 조건만
--  where gender <> 'M'  -- 위 내용과 같음
limit 5;

-- AND 연산자 : 둘 다 true 일 때 true / 하나라도 false면 false
-- OR 연산자 : 둘 중 하나라도 true면 ture
-- AND가 OR보다 우선순위가 높다
select 1 or 0 and 0;
select (1 or 0) and 0;

select first_name,
       last_name
from employees
where gender = 'M'
  and emp_no < '10050'; -- emp_no이 10050 보다 작고, gender가 'M'이 아닌 조건


select *
from employees
where emp_no >= 10050
  and emp_no <= 10060;

/*
 BETWEEN 연산자
 - 경계값을 포함한, 사이값을 포함
 */
select *
from employees
# where emp_no between 10050 and 10060;
where emp_no not between 10050 and 499995; -- 부정 표현(경계값 및 사이값 포함 안하고)

/*
 LIKE
 - 특정 패턴과 일치하는 행을 검색

 패턴
 - %: 0개 이상의 문자를 나타냄
 ex) '%apple%' -> apple이 포함된 모든 문자열
 -_ : 1개의 문자를 나타냄
 ex) 'a_k" 는 a로 시작하고 k로 끝나는 세글자 문자열을 의미
 */
select first_name
from employees
where first_name like 'Aa%';

select first_name
from employees
where first_name like 'Aa__d';  -- Aa로 시작하고 d로 끝나면서 5글자인 모든 데이터

/*
 IN 연산자
 - 특정 열의 값이 지정된 목록 중 하나와 일치하는지 확인하는데 사용
 */
select *
from employees
where emp_no in (1, 2, 3, 4, 5);