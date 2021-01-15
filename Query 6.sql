USE employees;
commit;

drop table if exists departments_dup;
CREATE TABLE departments_dup (
    dept_no CHAR(4),
    dept_name VARCHAR(255)
);
    
insert into departments_dup
	select * from departments;
insert into departments_dup(dept_name)
	values ('Public Relations');
insert into departments_dup(dept_no)
	values ('d010'),('d011');
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
);

INSERT INTO dept_manager_dup
	select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
	VALUES (999904, '2017-01-01'), (999905, '2017-01-01'),
           (999906, '2017-01-01'), (999907, '2017-01-01');

DELETE FROM dept_manager_dup
	WHERE dept_no = 'd001';
SELECT 
    *
FROM
    dept_manager_dup;

SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
    
SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager_dup m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no
ORDER BY dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, t.title
FROM
    employees e
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 10;

select e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
	from employees e
		inner join
	titles t on e.emp_no = t.emp_no
		inner join
	dept_manager m on e.emp_no = m.emp_no
		inner join
	departments d on m.dept_no = d.dept_no
    group by e.emp_no
    order by e.emp_no
    limit 100;
    
select max(salary) from salaries;