-- Create a trigger that logs when a new employee is added.
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(emp_id, action)
    VALUES(NEW.emp_id, 'INSERT');
END$$
DELIMITER ;

-- Trigger to prevent salary from being updated to below 10,000.
DELIMITER $$

CREATE TRIGGER check_salary_update
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be less than 10,000';
    END IF;
END$$
DELIMITER ;

-- Trigger to update employee_projects when an employee is deleted.
DELIMITER $$

CREATE TRIGGER remove_employee_projects
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    DELETE FROM employee_projects
    WHERE emp_id = OLD.emp_id;
END$$
DELIMITER ;

-- Trigger to maintain a salary audit table.
CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER salary_change_audit
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
    INSERT INTO salary_audit(emp_id, old_salary, new_salary)
    VALUES(OLD.emp_id, OLD.salary, NEW.salary);
END$$
DELIMITER ;
