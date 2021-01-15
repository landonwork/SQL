USE employees;

DROP FUNCTION IF EXISTS emp_info;
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name VARCHAR(40),p_last_name VARCHAR(40)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE v_salary DECIMAL(10,2);
    SELECT s.salary
	INTO v_salary FROM salaries s
		JOIN employees e ON s.emp_no = e.emp_no
	WHERE e.first_name = 'Huan'
		AND e.last_name = 'Lortz'
	ORDER BY from_date DESC
	LIMIT 1;
    RETURN v_salary;
END$$
DELIMITER ;