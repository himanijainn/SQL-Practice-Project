-- Create a stored procedure to get salary details of an employee by emp_id.
delimiter //
create procedure SalaryDetails(in emp_id int)
begin
select e.emp_id, concat(e.first_name,' ',e.last_name), s.salary
from employees e
join salaries s
on e.emp_id=s.emp_id
where e.emp_id = emp_id;
end//
delimiter ;

-- Create a stored procedure that returns all employees in a given department.
delimiter //
create procedure EmployeesAccordingToDepartments(in dept_id int)
begin
select concat(e.first_name,' ',e.last_name) as employee_name, d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id
where d.dept_id = dept_id;
end//
delimiter ;

-- Create a stored procedure that inserts a new employee.
delimiter //
create procedure AddEmployees(in first_name varchar(25), in last_name varchar(25),
in dept_id int, in hire_date date, in manager_id int)
begin 
insert into employees (first_name, last_name, dept_id, hire_date, manager_id)
values(first_name, last_name, dept_id, hire_date, manager_id);
end//
delimiter ;
call AddEmployees('Himani','Jain', 2, '2020-03-01', 2);

-- Create a stored procedure to update an employee’s salary.
delimiter //
create procedure UpdateEmployeeSalary(in emp_id int, in salary decimal(10,2))
begin
update salaries s
set s.salary = salary
where s.emp_id = emp_id;
end//
delimiter ;
call UpdateEmployeeSalary(2, '50000');

-- Create a stored procedure to return the highest paid employee.
delimiter //
create procedure HighestPaidEmployee()
begin
select concat(e.first_name,' ',e.last_name) as employee_name, s.salary
from employees e
join salaries s
on e.emp_id=s.emp_id
order by s.salary desc
limit 1;
end//
delimiter ;


