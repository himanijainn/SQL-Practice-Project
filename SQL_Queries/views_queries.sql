-- View combining salary + bonus
create view employee_compensation as
select e.emp_id, concat(e.first_name,' ',e.last_name), d.dept_name, s.salary, ifnull(b.bonus_amount,0) as bonus,
s.salary + IFNULL(b.bonus_amount,0) AS total_compensation
from employees e
join departments d
on d.dept_id=e.dept_id
join salaries s
on s.emp_id=e.emp_id
join bonuses b
on b.emp_id=e.emp_id;

select * from employee_compensation;

-- Query to find employees earning more than 1,00,000 total compensation
select * from employee_compensation
where total_compensation > 100000;

-- Create view to show salary expense per department
create view salary_expense as
select d.dept_name, sum(s.salary) as total_salary
from employees e 
join departments d
on d.dept_id=e.dept_id
join salaries s
on s.emp_id=e.emp_id
group by d.dept_name;

select * from salary_expense;

-- View to list all employees + their project names
create view project_assigned as
select concat(e.first_name,' ',e.last_name) as employee_name, p.proj_name
from employees e
join projects p
on p.dept_id=e.dept_id;

select * from project_assigned;

-- View for attendance summary
create view attendance_summary as
select 
    e.emp_id,
    concat(e.first_name, ' ', e.last_name) as employee_name,
    sum(a.status = 'Present') as total_present,
    sum(a.status = 'Absent') as total_absent
from employees e
join attendance a on e.emp_id = a.emp_id
group by e.emp_id;

select * from attendance_summary;
