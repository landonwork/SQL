use employees;
commit;

create or replace view v_avg_manager_salary as
	select round(avg(s.salary),2) as avg_manager_salary
    from salaries s
		join dept_manager dm on s.emp_no = dm.emp_no;
        
select * from v_avg_manager_salary;

delimiter $$
create procedure avg_salary()
	begin
		select avg(salary) from salaries;
	end$$
delimiter ;
call avg_salary();