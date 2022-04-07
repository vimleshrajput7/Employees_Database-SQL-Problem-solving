
/*Question_4
 Text-
Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain 
salary range. Let this range be defined by two values the user can insert when calling the procedure.
Finally, visualize the obtained result-set in Tableau as a double bar chart. 
*/

-- Query for QUESTION_4
DELIMITER $$
CREATE PROCEDURE Filter_salary(IN p_salary_range_1 FLOAT, IN p_salary_range_2 FLOAT)
BEGIN
SELECT
e.gender, de.dept_name, AVG(s.salary) AS avg_salary
FROM
t_employees e
JOIN 
t_salaries s ON e.emp_no=s.emp_no
JOIN 
t_dept_emp d ON d.emp_no=s.emp_no
JOIN
t_departments de ON d.dept_no= de.dept_no
WHERE s.salary BETWEEN  p_salary_range_1 AND p_salary_range_2
GROUP BY e.gender, d.dept_no;
END$$
DELIMITER ;

call Filter_salary(50000 , 90000);
