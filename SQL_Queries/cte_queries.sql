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

-- Use a CTE to find employees earning above their department average.
with dept_avg as (
select d.dept_id, round(avg(s.salary), 2) as avg_salary 
from employees e
join departments d
on e.dept_id=d.dept_id
join salaries s
on e.emp_id=s.emp_id
group by dept_id)
select concat(e.first_name,' ',e.last_name) as employee_name, s.salary, d.dept_name
from employees e
join salaries s on s.emp_id=e.emp_id
join departments d on d.dept_id=e.dept_id
join dept_avg da on da.dept_id=e.dept_id
where s.salary>da.avg_salary;

