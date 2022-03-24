# use employees;
#
# # COUNTS ALL ROWS IN 'EMPLOYEES'
# SELECT COUNT(*) FROM employees;
#
#
# # SELECTS ALL WITH B-DAY IN 1955
# SELECT COUNT(birth_date)
# FROM employees
# WHERE YEAR(birth_date) =  1955;
#
#
# # SHOW MOST COMMON/UNCOMMON NAME WITHOUT 'A' IN IT
# SELECT first_name, COUNT(first_name)
# FROM employees
# WHERE first_name NOT LIKE '%a%'
# GROUP BY first_name
# ORDER BY first_name DESC ;
#
# # SHOW HOW MANY 'M'/'F'
# SELECT gender, COUNT(gender)
# FROM employees
# GROUP BY gender;


# # Made db in console
# use practice_db;
#
# # Deletes table every time so new content isn't duplicate
# DROP TABLE IF EXISTS authors;
#
# # Make table
# CREATE TABLE authors (
#          id INT NOT NULL AUTO_INCREMENT,
#          first_name VARCHAR(100) NOT NULL,
#          last_name VARCHAR(100) NOT NULL,
#          PRIMARY KEY (id),
#          UNIQUE (first_name, last_name)
#      );
#
#
# SHOW TABLES ;
# DESCRIBE authors;
#
# # Insert values into table
# INSERT INTO authors (id, first_name, last_name)
# VALUES (0, 'tom', 'harry');
#
#
# # Add same to show no duplicates taken
# # INSERT INTO authors (id, first_name, last_name)
# # VALUES (0, 'tom', 'harry');
#
# INSERT INTO authors (id, first_name, last_name)
# VALUES (0, 'jerry', 'springer');
#
#
# #  Show all content in table
# SELECT * FROM authors
# ORDER BY id ASC;
















# use practice_db;
#
# DROP TABLE IF EXISTS authors;
#
# DROP TABLE IF EXISTS users;
# DROP TABLE IF EXISTS roles;
#
# CREATE TABLE roles
# (
#     id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     name VARCHAR(100) NOT NULL,
#     PRIMARY KEY (id)
# );
#
# CREATE TABLE users
# (
#     id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     name    VARCHAR(100) NOT NULL,
#     email   VARCHAR(100) NOT NULL,
#     role_id INT UNSIGNED DEFAULT NULL,
#     PRIMARY KEY (id),
#     FOREIGN KEY (role_id) REFERENCES roles (id)
# );
#
# INSERT INTO roles (name)
# VALUES ('admin');
# INSERT INTO roles (name)
# VALUES ('author');
# INSERT INTO roles (name)
# VALUES ('reviewer');
# INSERT INTO roles (name)
# VALUES ('commenter');
#
# INSERT INTO users (name, email, role_id)
# VALUES ('bob', 'bob@example.com', 1),
#        ('joe', 'joe@example.com', 2),
#        ('sally', 'sally@example.com', 3),
#        ('adam', 'adam@example.com', 3),
#        ('jane', 'jane@example.com', null),
#        ('mike', 'mike@example.com', null);
#
#
# SHOW TABLES ;
# DESCRIBE roles;
# DESCRIBE users;
#
#
# SELECT * FROM roles;
# SELECT * FROM users;
#
#
# # For a basic join, we can expect that we will get only the results where both the left and right tables have values for
# # their respective keys that are mentioned in the ON part of the query.
# SELECT users.name as user_name, roles.name as role_name
# FROM users
#          JOIN roles ON users.role_id = roles.id;
#
#
# # Since we know that there are six users in the database, and users is the left table of the query,
# # we will get all the users returned, regardless of whether or not they have a role.
# SELECT users.name AS user_name, roles.name AS role_name
# FROM users
#          LEFT JOIN roles ON users.role_id = roles.id;
#
#
# # Since we know that there are four roles in the database, and roles is the right table of the query,
# # we will get all the roles returned regardless of whether or not there is a user that has that role.
# SELECT users.name AS user_name, roles.name AS role_name
# FROM users
#          RIGHT JOIN roles ON users.role_id = roles.id;















#
# use employees;
#
# # Let us try to find the full name and department for the employee with an employee id of 10001:
# SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
# FROM employees as e
#          JOIN dept_emp as de
#               ON de.emp_no = e.emp_no
#          JOIN departments as d
#               ON d.dept_no = de.dept_no
# WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

















use employees;

# # SHOW NAME/B-DAY OF EMPLOYEES IN DEPT_MANAGER
# SELECT first_name, last_name, birth_date
# FROM employees
# WHERE emp_no IN (
#     SELECT emp_no
#     FROM dept_manager
# )
# LIMIT 10;




# find all employees hired on the same date as employee 101010 using subquery
DESCRIBE employees;

# Find hire date of employee 101010
SELECT * FROM employees WHERE emp_no = 101010;

# Hire_date = 1990-10-22

SELECT * FROM employees WHERE hire_date IN (
    SELECT hire_date FROM employees WHERE hire_date = '1990-10-22'
    );