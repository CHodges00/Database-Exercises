
USE employees;

SHOW TABLES ;
DESCRIBE employees;


# Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows
# Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT *
FROM employees
WHERE gender = 'M'
  AND   (first_name IN ('Irena', 'Vidya')
    OR first_name IN ('Maya')
    );


# Find all employees whose last name starts with 'E' — 7,330 rows
SELECT  *
FROM employees
WHERE last_name LIKE 'E%';

# Find all employees whose last name starts or ends with 'E' — 30,723 rows
SELECT  *
FROM employees
WHERE last_name LIKE 'E%'
   OR  last_name LIKE '%E';

# Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows
SELECT  *
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
