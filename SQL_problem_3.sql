

/*Question_3
 Text-
Compare the average salary of female versus male employees in the entire company until year 2002, 
and add a filter allowing you to see that per each department.
*/

-- Query for QUESTION_3

SELECT
e.gender,
de.dept_name,
YEAR(s.from_date) AS calendar_year,
Round(AVG(s.salary), 2) AS avg_salary
FROM 
t_salaries s 
JOIN 
t_employees e ON e.emp_no=s.emp_no
JOIN 
t_dept_emp d ON d.emp_no=e.emp_no
JOIN 
t_departments de ON de.dept_no=d.dept_no
GROUP BY e.gender, calendar_year, de.dept_no
HAVING calendar_year <= 2002
ORDER BY de.dept_no;



