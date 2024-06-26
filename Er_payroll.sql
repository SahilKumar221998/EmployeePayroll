use payroll_service;
select * from employee_payroll;

use payroll_service;
DELETE FROM employee_payroll WHERE ID  IN(43,44);

use payroll_service;
select * from employee_Department;

select * from employee_payroll e
where BASIC_PAY >(select avg(BASIC_PAY) from employee_payroll
where DEPARTMENT=e.DEPARTMENT);

