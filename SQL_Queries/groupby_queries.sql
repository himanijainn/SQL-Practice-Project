-- Find the average salary by department.
select d.dept_name, avg(s.salary) as avg_salary 
from employees e
join departments d
on e.dept_id=d.dept_id
join salaries s
on s.emp_id=e.emp_id
group by d.dept_name;

-- Count employees per project.
select p.proj_name, count(e.first_name) as employee_names
from employees e
join projects p
on e.dept_id=p.dept_id
group by p.proj_name;

-- Show department with the highest average salary.
select d.dept_name, round(avg(s.salary),2) as avg_salary
from employees e
join salaries s
on s.emp_id=e.emp_id
join departments d
on d.dept_id=e.dept_id
group by d.dept_name
order by avg_salary desc
limit 1;
