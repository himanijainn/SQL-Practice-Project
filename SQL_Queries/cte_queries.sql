-- Use a CTE to get average salary per department.
with dept_avg as (
select d.dept_name, round(avg(s.salary), 2) as avg_salary 
from employees e
join departments d
on e.dept_id=d.dept_id
join salaries s
on e.emp_id=s.emp_id
group by dept_name)
select *from dept_avg;
