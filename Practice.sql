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













# Made db in console
use practice_db;

# Deletes table every time so new content isn't duplicate
DROP TABLE IF EXISTS authors;

# Make table
CREATE TABLE authors (
         id INT NOT NULL AUTO_INCREMENT,
         first_name VARCHAR(100) NOT NULL,
         last_name VARCHAR(100) NOT NULL,
         PRIMARY KEY (id),
         UNIQUE (first_name, last_name)
     );


SHOW TABLES ;
DESCRIBE authors;

# Insert values into table
INSERT INTO authors (id, first_name, last_name)
VALUES (0, 'tom', 'harry');


# Add same to show no duplicates taken
# INSERT INTO authors (id, first_name, last_name)
# VALUES (0, 'tom', 'harry');

INSERT INTO authors (id, first_name, last_name)
VALUES (0, 'jerry', 'springer');










#  Show all content in table
SELECT * FROM authors
ORDER BY id ASC;