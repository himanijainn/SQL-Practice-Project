-- Employees earning more than company average.
select concat(e.first_name,' ',e.last_name) as employees_name, s.salary
from employees e
join salaries s
on e.emp_id=s.emp_id
where s.salary>(select avg(salary) from salaries);

-- Departments where at least one employee earns above 1,00,000.
select d.dept_name, concat(e.first_name,' ',e.last_name) as employees_name, s.salary
from employees e
join departments d
on e.dept_id=d.dept_id
join salaries s
on s.emp_id=e.emp_id
where s.salary > 100000;

-- Find employees who received a bonus greater than 5,000.
select concat(e.first_name,' ',e.last_name) as employees_name, b.bonus_amount
from employees e
join bonuses b
on e.emp_id=b.emp_id
where b.bonus_amount>5000;
