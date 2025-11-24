-- List employees, their departments, and salaries. (MULTIPLE TABLE JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, d.dept_name, s.salary
from employees e
join departments d
on e.dept_id=d.dept_id
join salaries s
on e.emp_id=s.emp_id;

-- Show employees, their project names, and the project’s department location. (MULTIPLE TABLE JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, p.proj_name, d.location
from departments d
join projects p
on d.dept_id=p.dept_id
join employees e
on e.dept_id=d.dept_id;

-- Display employees working on projects with start date after ‘2021-01-01’. (MULTIPLE TABLE JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, p.proj_name
from employees e
join projects p
on e.dept_id=p.dept_id
where p.start_date>'2021-01-01';

-- Find all employees earning more than their department’s average salary. (MULTIPLE TABLE JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, s.salary, d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id
join salaries s
on e.emp_id=s.emp_id
where s.salary> (select avg(salary)
from employees e
join salaries s
on e.emp_id=s.emp_id);

-- List employees with the number of projects they’re assigned to. (MULTIPLE TABLE JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, count(ep.proj_id) as project_count
from employees e
join employee_projects ep
on e.emp_id=ep.emp_id
group by e.emp_id;
   
-- Show total salary expenditure per department. (MULTIPLE TABLE JOIN)
select d.dept_name, sum(s.salary) as total_salary
from departments d
join employees e
on d.dept_id=e.dept_id
join salaries s
on e.emp_id=s.emp_id
group by d.dept_name;

-- Display departments with no employees assigned to any project. (MULTIPLE TABLE JOIN)
select d.dept_name, p.proj_name 
from projects p
join departments d
on p.dept_id=d.dept_id
where p.proj_name is null;
