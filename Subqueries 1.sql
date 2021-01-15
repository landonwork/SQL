use employees;
commit;

SELECT e.*
FROM employees e
WHERE e.hire_date >= '1990-01-01'
        AND e.hire_date < '1995-01-01'
        AND e.emp_no IN (
			SELECT dm.emp_no
			FROM dept_manager dm);
            
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.title = 'Assistant Engineer'
                AND t.emp_no = e.emp_no);