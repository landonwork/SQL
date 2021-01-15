use employees;
commit;

DROP FUNCTION IF EXISTS emp_info;
delimiter $$
CREATE FUNCTION emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE v_salary DECIMAL(10,2);
    SELECT s.salary
    INTO v_salary FROM salaries s
		JOIN employees e ON s.emp_no = e.emp_no
	WHERE e.first_name = p_first_name
		AND e.last_name = p_last_name
	ORDER BY from_date DESC
    LIMIT 1;
    RETURN v_salary;
END$$
delimiter ;

SELECT emp_info('Tse','Herber');
SELECT * FROM employees;