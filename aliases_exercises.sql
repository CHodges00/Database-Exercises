USE employees;


# Return 10 employees in a result set named 'full_name' in the format of 'last name, first name' for each employee.
SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name,
       birth_date AS DOB
FROM employees
GROUP BY full_name, DOB
LIMIT 10;