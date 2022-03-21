
USE employees;

SHOW TABLES ;
DESCRIBE employees;


# Modify your first query to order by first name. The first result should be Irena Pelz and the last result should be Vidya Awdeh.
SELECT first_name, last_name
FROM employees
WHERE gender = 'M'
 AND   (first_name IN ('Irena', 'Vidya')
 OR first_name IN ('Maya')
)
ORDER BY first_name DESC , last_name;


# Find all employees whose last name starts with 'E' — 7,330 rows
SELECT  *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;

# Find all employees whose last name starts or ends with 'E' — 30,723 rows
SELECT  *
FROM employees
WHERE last_name LIKE 'E%'
   OR  last_name LIKE '%E';

# Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows
SELECT  *
FROM employees
WHERE last_name LIKE 'E%'
  AND  last_name LIKE '%E'
;


# Find all employees with a 'q' in their last name — 1,873 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# Find all employees with a 'q' in their last name but not 'qu' — 547 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';