
USE employees;

SHOW TABLES ;
DESCRIBE employees;



 SELECT first_name, last_name
FROM employees
WHERE gender = 'M'
  AND   (first_name IN ('Irena', 'Vidya')
    OR first_name IN ('Maya')
    )
ORDER BY first_name DESC , last_name;



# Update your queries for employees whose names start and end with 'E'.
#  Use concat() to combine their first and last name together as a single column in your results.

# Find all employees whose last name starts with 'E' — 7,330 rows
SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

# Find all employees whose last name starts or ends with 'E' — 30,723 rows
SELECT  CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
   OR  last_name LIKE '%E';

# Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows
SELECT  CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
  AND  last_name LIKE '%E';








# Find all employees with a 'q' in their last name — 1,873 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# Find all employees with a 'q' in their last name but not 'qu' — 547 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';


# Find all employees born on Christmas — 842 rows
SELECT first_name, last_name, birth_date
FROM employees
WHERE DATE_FORMAT(birth_date, '%m-%d') IN ('12-25');

# Find all employees hired in the 90s and born on Christmas — 362 rows
SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25;


# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last.
# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company
# It should be Khun Bernini.
SELECT first_name, last_name, birth_date, hire_date,
DATEDIFF (curdate(), hire_date)
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25
ORDER BY year(birth_date), year(hire_date) DESC;






