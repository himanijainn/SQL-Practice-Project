create database company_database;
use company_database;

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'New York'),
('Finance', 'Chicago'),
('Engineering', 'San Francisco'),
('Marketing', 'Los Angeles'),
('Sales', 'Houston');

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    hire_date DATE,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees (first_name, last_name, dept_id, hire_date, manager_id) VALUES
('Alice', 'Johnson', 1, '2018-04-15', NULL),
('Bob', 'Smith', 2, '2019-06-01', 1),
('Carol', 'Davis', 3, '2020-01-10', 3),
('David', 'Brown', 4, '2017-09-20', 1),
('Eve', 'Miller', 5, '2021-02-05', 2),
('Frank', 'Wilson', 3, '2022-11-18', 3),
('Grace', 'Taylor', 3, '2018-12-30', 3),
('Henry', 'Anderson', 2, '2019-08-09', 2),
('Ivy', 'Thomas', 1, '2020-03-25', 1),
('Jack', 'Moore', 5, '2022-01-19', 5),
('Karen', 'Jackson', 4, '2018-07-13', 4),
('Leo', 'White', 2, '2021-10-08', 2),
('Mona', 'Harris', 3, '2020-06-06', 3),
('Nina', 'Martin', 1, '2021-05-11', 1),
('Oscar', 'Clark', 5, '2019-12-14', 5),
('Paul', 'Rodriguez', 3, '2018-03-02', 3),
('Queen', 'Lewis', 2, '2021-11-21', 2),
('Ruth', 'Walker', 4, '2022-05-09', 4),
('Steve', 'Hall', 5, '2021-08-18', 5),
('Tina', 'Allen', 3, '2020-10-10', 3),
('Uma', 'Young', 1, '2022-02-11', 1),
('Victor', 'King', 2, '2019-07-29', 2),
('Wendy', 'Scott', 3, '2018-09-17', 3),
('Xavier', 'Green', 4, '2019-03-12', 4),
('Yara', 'Adams', 5, '2022-09-30', 5);

-- Projects Table
CREATE TABLE projects (
    proj_id INT PRIMARY KEY AUTO_INCREMENT,
    proj_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO projects (proj_name, start_date, end_date, dept_id) VALUES
('HR Management System', '2022-01-01', '2023-01-01', 1),
('Payroll Automation', '2021-03-15', '2023-03-15', 2),
('AI Platform', '2020-06-01', '2023-06-01', 3),
('Marketing Analytics', '2021-07-01', '2022-12-31', 4),
('E-commerce CRM', '2022-02-01', '2024-02-01', 5);

-- Employee_Projects Table (Many-to-Many)
CREATE TABLE employee_projects (
    emp_id INT,
    proj_id INT,
    assigned_date DATE,
    PRIMARY KEY (emp_id, proj_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES projects(proj_id)
);

INSERT INTO employee_projects (emp_id, proj_id, assigned_date) VALUES
(1, 1, '2022-01-15'),
(2, 2, '2021-04-01'),
(3, 3, '2020-07-01'),
(4, 4, '2021-07-15'),
(5, 5, '2022-03-01'),
(6, 3, '2022-11-20'),
(7, 3, '2022-12-01'),
(8, 2, '2021-08-10'),
(9, 1, '2022-04-01'),
(10, 5, '2022-02-15'),
(11, 4, '2021-07-20'),
(12, 2, '2021-11-10'),
(13, 3, '2020-06-15'),
(14, 1, '2021-05-20'),
(15, 5, '2020-01-10'),
(16, 3, '2019-05-11'),
(17, 2, '2022-01-05'),
(18, 4, '2022-05-15'),
(19, 5, '2022-06-22'),
(20, 3, '2020-10-15'),
(21, 1, '2022-02-20'),
(22, 2, '2019-07-29'),
(23, 3, '2019-09-20'),
(24, 4, '2020-04-12'),
(25, 5, '2022-09-30');

-- Salaries Table
CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO salaries (emp_id, salary, effective_date) VALUES
(1, 90000, '2023-01-01'),
(2, 85000, '2023-01-01'),
(3, 120000, '2023-01-01'),
(4, 75000, '2023-01-01'),
(5, 65000, '2023-01-01'),
(6, 95000, '2023-01-01'),
(7, 98000, '2023-01-01'),
(8, 87000, '2023-01-01'),
(9, 70000, '2023-01-01'),
(10, 67000, '2023-01-01'),
(11, 72000, '2023-01-01'),
(12, 89000, '2023-01-01'),
(13, 99000, '2023-01-01'),
(14, 71000, '2023-01-01'),
(15, 65000, '2023-01-01'),
(16, 105000, '2023-01-01'),
(17, 88000, '2023-01-01'),
(18, 76000, '2023-01-01'),
(19, 69000, '2023-01-01'),
(20, 97000, '2023-01-01'),
(21, 64000, '2023-01-01'),
(22, 85000, '2023-01-01'),
(23, 91000, '2023-01-01'),
(24, 73000, '2023-01-01'),
(25, 66000, '2023-01-01');

-- Bonuses Table
CREATE TABLE bonuses (
    bonus_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    bonus_amount DECIMAL(10,2),
    bonus_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO bonuses (emp_id, bonus_amount, bonus_date) VALUES
(1, 5000, '2023-12-10'),
(3, 10000, '2023-12-10'),
(5, 3000, '2023-12-10'),
(10, 2000, '2023-12-10'),
(13, 8000, '2023-12-10'),
(16, 12000, '2023-12-10'),
(19, 4000, '2023-12-10'),
(23, 6000, '2023-12-10');

-- Attendance Table
CREATE TABLE attendance (
    attend_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    attend_date DATE,
    status ENUM('Present','Absent','On Leave'),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance (emp_id, attend_date, status) VALUES
(1, '2023-11-01', 'Present'),
(1, '2023-11-02', 'Absent'),
(2, '2023-11-01', 'Present'),
(2, '2023-11-02', 'Present'),
(3, '2023-11-01', 'Present'),
(3, '2023-11-02', 'Present'),
(4, '2023-11-01', 'Absent'),
(4, '2023-11-02', 'Present'),
(5, '2023-11-01', 'On Leave'),
(5, '2023-11-02', 'Present'),
(6, '2023-11-01', 'Present'),
(6, '2023-11-02', 'Absent');

-- Vendors Table
CREATE TABLE vendors (
    vendor_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_name VARCHAR(100),
    service_type VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO vendors (vendor_name, service_type, city) VALUES
('ABC Furniture', 'Office Rent', 'New York'),
('TechZone Ltd', 'IT Equipment', 'San Francisco'),
('QuickPrints', 'Marketing Material', 'Los Angeles'),
('Metro Cleaners', 'Housekeeping', 'Chicago'),
('DataSoft', 'Cloud Hosting', 'Houston');

-- Vendors Payments Table
CREATE TABLE vendor_payments (
    pay_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_id INT,
    amount DECIMAL(10,2),
    pay_date DATE,
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
);

INSERT INTO vendor_payments (vendor_id, amount, pay_date) VALUES
(1, 15000, '2023-10-01'),
(2, 45000, '2023-09-15'),
(3, 8000, '2023-10-10'),
(4, 5000, '2023-10-25'),
(5, 30000, '2023-09-20');
