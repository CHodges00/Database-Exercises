
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


# Update your query for 'Irena', 'Vidya', or 'Maya'.
# Use count(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(*), gender
FROM employees
WHERE gender = 'M'
  AND (first_name IN ('Irena', 'Vidya', 'Maya'))
OR gender = 'F'
    AND (first_name IN ('Irena', 'Vidya', 'Maya'))
GROUP BY gender;



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
# SELECT  *
# FROM employees
# WHERE last_name LIKE 'E%'
# AND  last_name LIKE '%E';

# Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'.
#  You should get 846 rows.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%'
AND  last_name LIKE '%E'
GROUP BY first_name, last_name;


# Find all employees with a 'q' in their last name — 1,873 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# Find all employees with a 'q' in their last name but not 'qu' — 547 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';

# Find the unique last names with a 'q' but not 'qu'
SELECT COUNT(*), last_name
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

