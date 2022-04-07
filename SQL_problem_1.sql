USE employees_mod;
/*- QUESTION_1
Text-
Create a visualization that provides a breakdown between the male and female employees working in the company each year,
 starting from 1990. 
*/


-- Query for QUESTION_1
SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON e.emp_no = d.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990
ORDER BY calendar_year;


