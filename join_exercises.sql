use employees;


# TODO
# write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS dept, CONCAT(e.first_name, ' ', e.last_name) AS manager
FROM employees as e
         JOIN dept_manager as dm on e.emp_no = dm.emp_no
         JOIN departments as d on dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';


# TODO
# Find the name of all departments currently managed by women.
SELECT d.dept_name AS Department, CONCAT(e.first_name, ' ', e.last_name) AS 'department manager'
FROM employees as e
         JOIN dept_manager as dm on e.emp_no = dm.emp_no
         JOIN departments as d on dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
  AND gender = 'F';


# TODO
# Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS title, COUNT(t.title) AS Total
FROM titles AS t
         JOIN dept_emp AS de on t.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
WHERE dept_name = 'Customer Service'
  AND de.to_date = '9999-01-01'
  AND t.to_date = '9999-01-01'
GROUP BY t.title;


# TODO
# Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS Manager, s.salary AS 'Salary'
FROM departments AS d
         JOIN dept_manager AS dm on dm.dept_no = d.dept_no
         JOIN employees AS e on e.emp_no = dm.emp_no
         JOIN salaries AS s on e.emp_no = s.emp_no
WHERE dm.to_date > CURDATE()
  AND s.to_date > CURDATE()
ORDER BY d.dept_name;
