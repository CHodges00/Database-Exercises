use employees;

# TODO
# Find all the employees with the same hire date as employee 101010 using a subquery.
# 69 Rows
SELECT *
FROM employees
WHERE hire_date IN(
    SELECT hire_date FROM employees
    WHERE emp_no = '101010');


# TODO
# Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles
SELECT *
FROM titles
WHERE emp_no IN(
    SELECT emp_no FROM employees
    WHERE first_name = 'Aamod');


# TODO
# Find all the current department managers that are female.
SELECT *
FROM employees
WHERE emp_no IN(
    SELECT emp_no FROM dept_manager
    WHERE to_date > curdate()
    AND gender = 'F');

# DROP DATABASE IF EXISTS food_db;
# create database if not exists food_db;
# # CREATE DATABASE food_db;
# SHOW DATABASES;

