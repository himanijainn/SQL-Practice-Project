-- Count total presents and absents per employee.
select e.emp_id, concat(e.first_name, ' ', e.last_name) as employee_name, sum(a.status = 'Present') as total_present, sum(a.status = 'Absent') as total_absent
from employees e
join attendance a on e.emp_id = a.emp_id
group by e.emp_id;

-- Find employees with perfect attendance (no absences).
select concat(e.first_name, ' ', e.last_name) as employee_name
from employees e
where emp_id not in (select emp_id from attendance where status='Absent');
