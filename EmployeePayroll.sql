create database payroll_service;
show database;
use payroll_service;

use payroll_service;
create table employee_payroll(
ID INTEGER PRIMARY KEY IDENTITY(1,1),
NAME VARCHAR(20) NOT NULL,
SALARY DECIMAL(19,4),
START_DATE DATETIME2);

USE payroll_service;
INSERT INTO employee_payroll
VALUES
('Sahil Kumar', 50000.00, '2023-01-15'),
    ('Rakesh Singh', 60000.00, '2022-11-30'),
    ('Suresh Kumar', 75000.00, '2022-08-22'),
    ('Bahagyashree Chouksey', 55000.00, '2023-03-10'),
    ('Chris Davis', 58000.00, '2022-12-05'),
    ('Sarah Wilson', 62000.00, '2023-02-28'),
    ('Sachin Jigar', 68000.00, '2022-10-18T08:30:00'),
    ('Amanda Taylor', 70000.00, '2023-01-05'),
    ('Ram Yadav', 72000.00, '2022-09-14'),
    ('Linda Clark', 56000.00, '2022-11-01'),
    ('Daniel Garcia', 65000.00, '2023-04-20'),
    ('Melissa Allen', 58000.00, '2022-12-30'),
    ('Raju Shrivastav', 63000.00, '2023-03-15'),
    ('Jennifer Hall', 69000.00, '2022-10-08'),
    ('Matthew Hernandez', 71000.00, '2023-02-10'),
    ('Lisa White', 59000.00, '2022-11-15'),
    ('Eric Scott', 74000.00, '2022-08-05'),
    ('Samantha Lopez', 60000.00, '2023-01-25'),
    ('Patrick Green', 67000.00, '2022-09-30'),
    ('Michelle Adams', 73000.00, '2022-12-23');

use payroll_service;
alter table employee_payroll
alter column NAME varchar(40);

use payroll_service;
select * from employee_payroll;

USE payroll_service;
SELECT * FROM employee_payroll
WHERE NAME in ('Sahil Kumar','Suresh Kumar');

USE payroll_service;
SELECT * FROM employee_payroll
WHERE START_DATE BETWEEN CAST('2022-08-22' AS date)
AND CAST(GETDATE() AS date);

USE payroll_service;
SELECT * FROM employee_payroll
WHERE START_DATE BETWEEN CAST('2023-01-22' AS date)
AND CONVERT(date,GETDATE());

USE payroll_service;
ALTER TABLE employee_payroll
ADD GENDER CHAR(1);

USE payroll_service;
UPDATE employee_payroll set GENDER='M' 
WHERE ID IN(1,2,3,5,7,9,11,13,15,17,19);

USE payroll_service;
UPDATE employee_payroll set GENDER='F' 
WHERE ID IN(4,6,8,10,12,14,16,18,20);

use payroll_service;
select max(salary) FROM employee_payroll
group by GENDER HAVING GENDER='M';

use payroll_service;
select max(salary) FROM employee_payroll
group by GENDER HAVING GENDER='F';

use payroll_service;
SELECT MIN(SALARY) FROM employee_payroll
GROUP BY GENDER HAVING GENDER='M';

use payroll_service;
SELECT MIN(SALARY) FROM employee_payroll
GROUP BY GENDER HAVING GENDER='F';

use payroll_service;
SELECT SUM(SALARY) FROM employee_payroll
GROUP BY GENDER HAVING GENDER='M';

use payroll_service;
SELECT SUM(SALARY) FROM employee_payroll
GROUP BY GENDER HAVING GENDER='F';

use payroll_service;
SELECT AVG(SALARY) FROM employee_payroll
GROUP BY GENDER HAVING GENDER='M';

use payroll_service;
SELECT AVG(SALARY) FROM employee_payroll
GROUP BY GENDER HAVING GENDER='F';

USE payroll_service;
SELECT * FROM employee_payroll;

USE payroll_service;
GO
ALTER table employee_payroll
add EMPLOYEE_PHONE varchar(10) check(len(EMPLOYEE_PHONE)=10),
ADDRESS VARCHAR(50) DEFAULT 'Banglore',
DEPARTMENT VARCHAR(15) ;
GO

USE payroll_service;
GO

UPDATE employee_payroll SET EMPLOYEE_PHONE = '1234567890', ADDRESS = 'Bangalore', DEPARTMENT = 'HR' WHERE ID = 1;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '2345678901', ADDRESS = 'Chennai', DEPARTMENT = 'Finance' WHERE ID = 2;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '3456789012', ADDRESS = 'Mumbai', DEPARTMENT = 'IT' WHERE ID = 3;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '4567890123', ADDRESS = 'Delhi', DEPARTMENT = 'Marketing' WHERE ID = 4;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '5678901234', ADDRESS = 'Hyderabad', DEPARTMENT = 'Sales' WHERE ID = 5;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '6789012345', ADDRESS = 'Pune', DEPARTMENT = 'Admin' WHERE ID = 6;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '7890123456', ADDRESS = 'Kolkata', DEPARTMENT = 'HR' WHERE ID = 7;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '8901234567', ADDRESS = 'Jaipur', DEPARTMENT = 'Finance' WHERE ID = 8;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '9012345678', ADDRESS = 'Ahmedabad', DEPARTMENT = 'IT' WHERE ID = 9;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '0123456789', ADDRESS = 'Chandigarh', DEPARTMENT = 'Marketing' WHERE ID = 10;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '1123456789', ADDRESS = 'Lucknow', DEPARTMENT = 'Sales' WHERE ID = 11;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '2234567890', ADDRESS = 'Patna', DEPARTMENT = 'Admin' WHERE ID = 12;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '3345678901', ADDRESS = 'Indore', DEPARTMENT = 'HR' WHERE ID = 13;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '4456789012', ADDRESS = 'Bhopal', DEPARTMENT = 'Finance' WHERE ID = 14;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '5567890123', ADDRESS = 'Guwahati', DEPARTMENT = 'IT' WHERE ID = 15;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '6678901234', ADDRESS = 'Ranchi', DEPARTMENT = 'Marketing' WHERE ID = 16;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '7789012345', ADDRESS = 'Bhubaneswar', DEPARTMENT = 'Sales' WHERE ID = 17;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '8890123456', ADDRESS = 'Surat', DEPARTMENT = 'Admin' WHERE ID = 18;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '9901234567', ADDRESS = 'Amritsar', DEPARTMENT = 'HR' WHERE ID = 19;
UPDATE employee_payroll SET EMPLOYEE_PHONE = '1012345678', ADDRESS = 'Coimbatore', DEPARTMENT = 'Finance' WHERE ID = 20;
GO

ALTER TABLE employee_payroll
alter column DEPARTMENT VARCHAR(15) NOT NULL;

ALTER TABLE employee_payroll
ALTER COLUMN SALARY  BASIC_PAY;

EXEC sp_rename 'employee_payroll.SALARY','BASIC_PAY','COLUMN';

USE payroll_service;
SELECT * FROM employee_payroll;

USE payroll_service;
ALTER TABLE employee_payroll
ADD DEDUCTIONS INTEGER,
TAXABLE_PAY INTEGER,
TAX INTEGER,
NET_PAY INTEGER;

UPDATE employee_payroll SET DEDUCTIONS = 500, TAXABLE_PAY = 4500, TAX = 300, NET_PAY = 4200 WHERE ID = 1;
UPDATE employee_payroll SET DEDUCTIONS = 600, TAXABLE_PAY = 5400, TAX = 400, NET_PAY = 5000 WHERE ID = 2;
UPDATE employee_payroll SET DEDUCTIONS = 700, TAXABLE_PAY = 6300, TAX = 500, NET_PAY = 5800 WHERE ID = 3;
UPDATE employee_payroll SET DEDUCTIONS = 800, TAXABLE_PAY = 7200, TAX = 600, NET_PAY = 6600 WHERE ID = 4;
UPDATE employee_payroll SET DEDUCTIONS = 900, TAXABLE_PAY = 8100, TAX = 700, NET_PAY = 7400 WHERE ID = 5;
UPDATE employee_payroll SET DEDUCTIONS = 1000, TAXABLE_PAY = 9000, TAX = 800, NET_PAY = 8200 WHERE ID = 6;
UPDATE employee_payroll SET DEDUCTIONS = 1100, TAXABLE_PAY = 9900, TAX = 900, NET_PAY = 9000 WHERE ID = 7;
UPDATE employee_payroll SET DEDUCTIONS = 1200, TAXABLE_PAY = 10800, TAX = 1000, NET_PAY = 9800 WHERE ID = 8;
UPDATE employee_payroll SET DEDUCTIONS = 1300, TAXABLE_PAY = 11700, TAX = 1100, NET_PAY = 10600 WHERE ID = 9;
UPDATE employee_payroll SET DEDUCTIONS = 1400, TAXABLE_PAY = 12600, TAX = 1200, NET_PAY = 11400 WHERE ID = 10;
UPDATE employee_payroll SET DEDUCTIONS = 1500, TAXABLE_PAY = 13500, TAX = 1300, NET_PAY = 12200 WHERE ID = 11;
UPDATE employee_payroll SET DEDUCTIONS = 1600, TAXABLE_PAY = 14400, TAX = 1400, NET_PAY = 13000 WHERE ID = 12;
UPDATE employee_payroll SET DEDUCTIONS = 1700, TAXABLE_PAY = 15300, TAX = 1500, NET_PAY = 13800 WHERE ID = 13;
UPDATE employee_payroll SET DEDUCTIONS = 1800, TAXABLE_PAY = 16200, TAX = 1600, NET_PAY = 14600 WHERE ID = 14;
UPDATE employee_payroll SET DEDUCTIONS = 1900, TAXABLE_PAY = 17100, TAX = 1700, NET_PAY = 15400 WHERE ID = 15;
UPDATE employee_payroll SET DEDUCTIONS = 2000, TAXABLE_PAY = 18000, TAX = 1800, NET_PAY = 16200 WHERE ID = 16;
UPDATE employee_payroll SET DEDUCTIONS = 2100, TAXABLE_PAY = 18900, TAX = 1900, NET_PAY = 17000 WHERE ID = 17;
UPDATE employee_payroll SET DEDUCTIONS = 2200, TAXABLE_PAY = 19800, TAX = 2000, NET_PAY = 17800 WHERE ID = 18;
UPDATE employee_payroll SET DEDUCTIONS = 2300, TAXABLE_PAY = 20700, TAX = 2100, NET_PAY = 18600 WHERE ID = 19;
UPDATE employee_payroll SET DEDUCTIONS = 2400, TAXABLE_PAY = 21600, TAX = 2200, NET_PAY = 19400 WHERE ID = 20;
GO

INSERT INTO employee_payroll
(NAME,BASIC_PAY,START_DATE,GENDER,EMPLOYEE_PHONE,ADDRESS,DEPARTMENT)
VALUES('Terissa',200000.0,'2022-08-11','F','9876543211','Nagpur','Marketing'),
('Terissa',400000,'2023-02-08','F','9878893211','Delhi','Sales');

USE payroll_service;
select * from employee_payroll;

use payroll_service;
UPDATE employee_payroll SET DEDUCTIONS = 2100, TAXABLE_PAY = 19700, TAX = 2200, NET_PAY = 18600 WHERE ID = 41;
UPDATE employee_payroll SET DEDUCTIONS = 2900, TAXABLE_PAY = 21600, TAX = 2300, NET_PAY = 19400 WHERE ID = 42;

use payroll_service;
create table employee_Department
(EMPLOYEE_ID INTEGER NOT NULL,DEPARTMENT_ID INTEGER NOT NULL);

use payroll_service;
INSERT INTO employee_department (employee_id, department_id)
VALUES
(1, 103), (1, 104), (1, 105),
(2, 101),(2, 105),
(3, 104), (3, 105),
(4, 101), (4, 102),(4, 105),
(5, 101), 
(6, 101), (6, 102), (6, 103), (6, 104), (6, 105),
(7, 101), (7, 102), (7, 103),
(8, 102), (8, 103), (8, 104), (8, 105),
(9, 105),
(10, 101), (10, 102), (10, 103), (10, 104), (10, 105),
 (11, 103), (11, 104), (11, 105),
(12, 101), (12, 102), (12, 103), (12, 104), 
(13, 101), (13, 102), (13, 103), (13, 104), (13, 105),
(14, 101), (14, 102), (14, 103),(14, 105),
(15, 101), (15, 104), (15, 105),
(16, 101), (16, 102),
(17, 101), (17, 102), (17, 103), (17, 104), (17, 105),
(18, 101), (18, 102), 
(19, 101),(19, 104), (19, 105),
(20, 101), (20, 102), (20, 103), (20, 104), (20, 105),
(41, 101), (42, 102);

USE payroll_service;
select Distinct p.* from employee_Department e,employee_payroll p
where e.EMPLOYEE_ID=p.ID and e.DEPARTMENT_ID in (101,105);