use employees;
select * from employees where first_name = 'Bart';
# AND has precedence over OR
select * from employees where (first_name = 'Kellie' or first_name = 'Denis') and gender = 'F';
select * from employees where first_name = 'Kellie' and gender = 'M';

# Percent sign is 0 or more characters
select * from employees where first_name like('Mar%');
# Underscore is exactly 1 of any character
select * from employees where first_name like('Mar_');
select * from employees where first_name like('%Jack%');

select * from salaries where salary between 66000 and 70000;
select * from employees where emp_no not between 10004 and 10012;
select dept_name from departments where dept_no between 'd003' and 'd006';

select salary from salaries;
select count(salary) from salaries where salary >= 100000;
select count(*) from dept_manager;

select first_name, count(*) from employees group by first_name order by first_name asc;
select emp_no, avg(salary) as average_salary from salaries group by emp_no having avg(salary) >= 120000;