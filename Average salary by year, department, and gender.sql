use employees_mod;
commit;

# Returns average salaries by gender, year, and department up until 2002
# Four columns, Year, Department, Gender, Average Salary
select
	year(s.from_date) as salary_year,
    d.dept_name as department,
    e.gender as gender,
    avg(s.salary) as avg_salary
from
	t_salaries s
		join
	t_employees e on e.emp_no = s.emp_no
		join
	t_dept_emp de on de.emp_no = s.emp_no
		join
	t_departments d on de.dept_no = d.dept_no
where year(s.from_date) <= 2002
group by salary_year, department, gender
order by salary_year;