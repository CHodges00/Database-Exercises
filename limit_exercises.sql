USE employees;
DESCRIBE employees;
DESCRIBE titles;
DESCRIBE salaries;

SELECT DISTINCT title FROM titles;


# List the first 10 distinct last name sorted in descending order
SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC
LIMIT 10;


# Create a query to get the top 5 salaries and display just the employees number from the salaries table.
# 254466
# 492164
# 66793
# 492164
SELECT emp_no FROM salaries
ORDER BY salary DESC
LIMIT 5 OFFSET 45;


# Try to think of your results as batches, sets, or pages.
# The first five results are your first page.
# The five after that would be your second page, etc.
# ^^^^^^^^^^^^^^^^^^^
# Update the previous query to find the tenth page of results.
