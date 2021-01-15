use employees;
commit;

SELECT 
    e.*, d.dept_no as dnum
FROM
    employees e
        CROSS JOIN
    (SELECT 
        dept_no
    FROM
        departments) AS d
WHERE d.dept_no != 'd002'
ORDER BY emp_no, dept_no
LIMIT 1000;