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
