-- 현재 재직 중인 직원의 정보를 출력하세요
-- ○ 출력 항목: emp_no, first_name, last_name, title
select emp_no, first_name, last_name, title
from employees
         join titles using (emp_no)
where to_date = '9999-01-01';

-- 현재 재직 중인 직원 정보를 출력하세요
-- ○ 출력항목: 직원의 기본 정보 모두, title, salary
select e.*, t.title, s.salary
from employees e
         join titles t on e.emp_no = t.emp_no
         join salaries s on e.emp_no = s.emp_no
where t.to_date = '9999-01-01'
  and s.to_date = '9999-01-01';

-- 현재 재직중인 직원의 정보를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, department
-- ○ 정렬: emp_no 오름 차순
select emp_no, first_name, last_name, dept_name
from employees
         join dept_emp using (emp_no)
         join departments using (dept_no)
order by emp_no

-- 부서별 재직중인 직원의 수를 출력하세요.
-- ○ 출력 항목: 부서 번호, 부서명, 인원수
-- ○ 정렬: 부서 번호 오름차순
select dept_no, dept_name, count(*)
from departments
         join dept_emp using (dept_no)
where to_date = '9999-01-01'
group by dept_no, dept_name
order by dept_no;

-- 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
select emp_no, first_name, last_name, dept_name, from_date, to_date
from employees
         join dept_emp using (emp_no)
         join departments using (dept_no)
where emp_no = '10209';

