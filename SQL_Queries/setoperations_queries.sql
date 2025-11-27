-- Employees who are also managers.
select first_name, last_name
from employees
where emp_id in (select distinct manager_id from employees where manager_id is null);

-- Employees in HR or Finance departments.
select concat(e.first_name,' ',e.last_name), dept_name
from employees e
join departments d
where d.dept_name = 'Human Resources'
union
select concat(e.first_name,' ',e.last_name), dept_name
from employees e
join departments d
where d.dept_name = 'Finance';
