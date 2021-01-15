use employees_mod;
commit;

# This query returns the number of employees at the company by year and gender
# It is my pride and joy
SELECT 
    a.calendar_year, e.gender, COUNT(e.emp_no)
FROM
    t_employees e
        JOIN
    (SELECT 
        s.emp_no,
            YEAR(MIN(s.from_date)) AS from_year,
            YEAR(MAX(s.to_date)) AS to_year,
            b.calendar_year AS calendar_year
    FROM
        t_salaries s
    CROSS JOIN (SELECT 
        YEAR(from_date) AS calendar_year
    FROM
        t_salaries
    WHERE
        YEAR(from_date) >= 1990 UNION SELECT 
        YEAR(to_date) AS calendar_year
    FROM
        t_salaries
    WHERE
        YEAR(to_date) <= 2005) AS b
    GROUP BY emp_no , b.calendar_year
    HAVING YEAR(MIN(s.from_date)) <= b.calendar_year
        AND YEAR(MAX(s.to_date)) >= b.calendar_year) AS a ON a.emp_no = e.emp_no
GROUP BY a.calendar_year , e.gender
ORDER BY a.calendar_year , e.gender;

select e.*, a.* from t_employees e
	cross join (
		select year(from_date) as calendar_year
		from t_salaries
		where year(from_date) >= 1990
		union select year(to_date) as calendar_year
		from t_salaries
	) as a;