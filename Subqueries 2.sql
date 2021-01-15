use employees;
commit;

drop table if exists emp_manager;
create table emp_manager (
	emp_no int not null,
    dept_no char(4) null,
    manager_id int not null
    );

TRUNCATE TABLE emp_manager;
INSERT INTO emp_manager
	SELECT U.*
	FROM (
		SELECT A.*
        FROM (
			SELECT e.emp_no, MIN(de.dept_no), (SELECT emp_no FROM dept_manager WHERE emp_no = 110022)
			FROM employees e
				JOIN dept_emp de ON e.emp_no = de.emp_no
			WHERE e.emp_no > 10000
			GROUP BY e.emp_no
			ORDER BY e.emp_no
            LIMIT 20) AS A
		UNION SELECT B.*
        FROM (
			SELECT e.emp_no, MIN(de.dept_no), (SELECT emp_no FROM dept_manager WHERE emp_no = 110039)
			FROM employees e
				JOIN dept_emp de ON e.emp_no = de.emp_no
			WHERE e.emp_no > 10020
			GROUP BY e.emp_no
			ORDER BY e.emp_no
            LIMIT 20) AS B
		UNION SELECT C.*
		FROM (
			SELECT e.emp_no, MIN(de.dept_no), (SELECT emp_no from dept_manager WHERE emp_no = 110039)
			FROM employees e
				JOIN dept_emp de ON e.emp_no = de.emp_no
			WHERE e.emp_no = 110022
			GROUP BY e.emp_no
			ORDER BY e.emp_no) AS C
		UNION SELECT D.*
		FROM (
			SELECT e.emp_no, MIN(de.dept_no), (SELECT emp_no from dept_manager WHERE emp_no = 110022)
			FROM employees e
				JOIN dept_emp de ON e.emp_no = de.emp_no
			WHERE e.emp_no = 110039
			GROUP BY e.emp_no
			ORDER BY e.emp_no) AS D
		) AS U;
        
SELECT * FROM emp_manager;