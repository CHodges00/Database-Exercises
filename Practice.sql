use employees;

# COUNTS ALL ROWS IN 'EMPLOYEES'
SELECT COUNT(*) FROM employees;


# SELECTS ALL WITH B-DAY IN 1955
SELECT COUNT(birth_date)
FROM employees
WHERE YEAR(birth_date) =  1955;


# SHOW MOST COMMON/UNCOMMON NAME WITHOUT 'A' IN IT
SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name
ORDER BY first_name DESC ;

# SHOW HOW MANY 'M'/'F'
SELECT gender, COUNT(gender)
FROM employees
GROUP BY gender;

