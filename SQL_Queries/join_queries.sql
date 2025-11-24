-- List all employees with their department names. (INNER JOIN)
 select concat(e.first_name,' ',e.last_name) as employee_name, d.dept_name
 from employees e
 inner join departments d
 on e.dept_id=d.dept_id;
 
-- Show employee names and their project names. (INNER JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, p.proj_name
from employees e
inner join projects p
on e.dept_id=p.dept_id;

-- Display employee names and their salaries. (INNER JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, s.salary
from employees e
inner join salaries s
on e.emp_id=s.emp_id;

-- Get a list of projects with their department names. (INNER JOIN)
select d.dept_name, p.proj_name
from departments d
inner join projects p
on d.dept_id=p.dept_id;

-- Find all employees who are assigned to a project in their own department. (INNER JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, p.proj_name
from employees e
inner join employee_projects ep
on e.emp_id=ep.emp_id
inner join projects p
on p.proj_id=ep.proj_id;

-- List all employees and the projects they’re assigned to, including those with no projects. (LEFT JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, p.proj_name
from employees e
left join projects p
on e.dept_id=p.dept_id;

-- Show all projects and the employees assigned to them, even if no employee is assigned. (LEFT JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, p.proj_name
from projects p
left join employees e
on e.dept_id=p.dept_id;

-- List employees who do not belong to any department (should be none, but test logic). (LEFT JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, d.dept_name
from employees e
left join departments d
on e.dept_id=d.dept_id
where d.dept_id is null;

-- Show employees with or without salary records. (LEFT JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, s.salary
from employees e
left join salaries s
on e.emp_id=s.emp_id;

-- List all projects and the employees assigned to them using a RIGHT JOIN. (RIGHT JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, p.proj_name
from projects p
right join employees e
on e.dept_id=p.dept_id;

-- Show all departments, including those without employees. (RIGHT JOIN)
select concat(e.first_name,' ',e.last_name) as employee_name, dept_name
from departments d
right join employees e
on d.dept_id=e.dept_id;

-- Display all employees with department info, ensuring departments appear even with no employees. (RIGHT JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, dept_name, location
from employees e
right join departments d
on e.dept_id=d.dept_id;

-- Show all possible combinations of departments and projects. (CROSS JOIN)
select d.dept_name,p.proj_name
from departments d 
cross join projects p;

-- Generate a list of every employee and every project (use LIMIT to shorten results). (CROSS JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, p.proj_name
from employees e
cross join projects p
limit 20;

-- Display employees and their managers (manager_id points to emp_id). (SELF JOIN)
select concat(e.first_name,' ',e.last_name) as employees_name, m.first_name
from employees e
join employees m 
on e.manager_id=m.emp_id;

-- Show all employees who share the same manager. (SELF JOIN)
select e1.first_name as Employee1, e2.first_name as Employee2, m.first_name as Manager
from employees e1
join employees e2 
on e1.manager_id = e2.manager_id and e1.emp_id <> e2.emp_id
join employees m 
on e1.manager_id = m.emp_id;

-- Find employees who are managers of at least one other employee. (SELF JOIN)
select distinct m.emp_id, m.first_name, m.last_name
from employees e
join employees m 
on e.manager_id = m.emp_id;

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
