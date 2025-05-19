create view EMPLOYEES_INFO as
select e.emp_no,
       birth_date,
       first_name,
       last_name,
       gender,
       hire_date,
       title,
       t.from_date as t_from,
       t.to_date   as t_to,
       salary,
       s.from_date as s_from,
       s.to_date   as s_to
from employees e
         inner join titles t on e.emp_no = t.emp_no
         inner join salaries s on e.emp_no = s.emp_no;

select *
from EMPLOYEES_INFO
where s_to = '9999-01-01';

create view EMP_DEPT_INFO as
select emp_no, de.dept_no, dept_name, from_date, to_date
from dept_emp de
         inner join departments d on de.dept_no = d.dept_no
order by emp_no;

select * from EMP_DEPT_INFO
where to_date = '9999-01-01';