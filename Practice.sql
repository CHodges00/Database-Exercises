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


# use employees;
#
# # # SHOW NAME/B-DAY OF EMPLOYEES IN DEPT_MANAGER
# # SELECT first_name, last_name, birth_date
# # FROM employees
# # WHERE emp_no IN (
# #     SELECT emp_no
# #     FROM dept_manager
# # )
# # LIMIT 10;
#
#
#
#
# # find all employees hired on the same date as employee 101010 using sub-query
# DESCRIBE employees;
#
# # Find hire date of employee 101010
# SELECT * FROM employees WHERE emp_no = 101010;
#
# # Hire_date = 1990-10-22
#
# SELECT * FROM employees WHERE hire_date IN (
#     SELECT hire_date FROM employees WHERE hire_date = '1990-10-22'
#     );


# Guide to Database Design

#### Normalization

# The process of "normalizing" a relational database design. Different levels of normalization are possible, each level further seperating concerns and abstracting data over multiple tables.

#### Entity Relationship Diagram (ERD)

# A way to visually describe the schema of a database and the relationships between tables.

#### One-to-One Relationship
# - ***Definition:*** a relationship where one record on a table matches with one record on another table.
# - ***Example:*** users and user_details
# - ***Common strategy to implement:*** the owner table of the relationship should have a foreign key to the non-owner.

#### One-to-Many Relationship

# - ***Definition:*** a relationship where one record on a table matches with several records on another table.
# - ***Example:*** users and posts
# - ***Common strategy to implement:*** the table on the many side should have a foreign key pointing to the single owner from the owning-side table.

#### Many-to-Many Relationship
#
# - ***Definition:*** a relationship where one record on a table matches with several records on another table and a record on the other table matches with several records on the first table.
# - ***Example:*** users and events
# - ***Common strategy to implement:*** neither table should have a foreign key to the other and instead, an associative (join) table should be used to link the two together via two foreign key columns, each linking to a primary key of both tables in the many-to-many relationship.

# <div style="page-break-after: always;"></div>

## DB Design Conventions to Follow

# "RULES OF NORMALIZATION"
# ^^^^^^^^^^^^^^^^^^^^^^^^
# 1. All tables except associative tables should have a single primary key called id.
#
# 	```
# 	users
# 	  id
# 	  username
# 	  email
# 	  password
# 	```

# 2. All table cells must contain atomic data (a single cell cannot contain multiple values).
#
# 	```
# 	  users
# 	    id
# 	    username
# 	    phone_numbers
#
# 	  1 | bob123| 2105554545, 2105556767, 2105553232 <--- AVOID THIS!
# 	```

# 3. All columns within a single row should be independent from one another (if not, another table may be needed).
#
# 	```
# 	  users
# 	    id
# 	    name
# 	    favorite_color_1
# 	    favorite_color_2
#
#       A better alternative...
#
# 	  users
# 	    id
# 	    name
#
# 	  colors
# 	    id
# 	    name
#
# 	  color_user
# 	    color_id
# 	    user_id
# 	```
# #
# 4. When duplicate values exist accross multiple rows, consider breaking out the column(s) into another table.
#
#   ```
#   users
#       id
#       username
#       email
#       password
#       home_state
#
#   1 | bob123 | bob@email.com | JKL3J2JHSURNZ931H | Texas
#   2 | kev123 | kev@email.com | JKL3J2JHSURNZ931H | Texas <--- duplicate!
#   3 | dan123 | dan@email.com | JKL3J2JHSURNZ931H | Arizona
#   4 | mat123 | mat@email.com | JKL3J2JHSURNZ931H | Washington
#   5 | rob123 | rob@email.com | JKL3J2JHSURNZ931H | Texas <--- duplicate!
#
#   Consider a states table.

# STATES TABLE
# PK(ID) | STATE_NAME
# ---------------------
# 1 | ALABAMA
# 2 | ALASKA
# 50 | LAST_STATE
#
# USERS TABLE
# ------------------------------
# PK(ID) | USERNAME | EMAIL | PW
# 1 | IROWURBOAT | BLAH@YAHOO.COM | HC6GTE7WG8GF
# 2 | FRESHAVAC | YEE@GMAIL.COM | DHJ8Q9WHD79Q
#
# USERS_STATES TABLE [ASSOCIATIVE TABLE]
# -------------------------------
# PK(ID) | STATE_ID | USER_ID
# 1 | 2 | 5
# 2 | 50 | 3
# 3 | 1 | 1

#  ```

## Helpful Links

##### Additional Info
# - ERDs Explained: [https://www.lucidchart.com/pages/er-diagrams](https://www.lucidchart.com/pages/er-diagrams)
# - Guide to Crow's Foot notation: [https://www.vertabelo.com/blog/crow-s-foot-notation/](https://www.vertabelo.com/blog/crow-s-foot-notation/)
#
# ##### ERD Creation Apps
#
# - [draw.io](https://google.com)
# - [lucidchart](https://www.lucidchart.com)
# - [sqldbm](https://sqldbm.com)
# - Don't forget about good 'ol pencil and paper or a whiteboard!
#


#
# use practice_db;
#
#
#
#
# DROP TABLE IF EXISTS quote_topic;
# DROP TABLE IF EXISTS quotes;
# DROP TABLE IF EXISTS authors;
# DROP TABLE IF EXISTS topics;
#
#
# CREATE TABLE IF NOT EXISTS authors (
#                          id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                          first_name VARCHAR(50),
#                          last_name  VARCHAR(100) NOT NULL,
#                          PRIMARY KEY (id)
# );
#
# INSERT INTO authors(first_name, last_name) VALUES
#                                                ('Douglas', 'Adams'),
#                                                ('Mark', 'Twain'),
#                                                ('Kurt', 'Vonnegut');
#
# CREATE TABLE if not exists quotes (
#                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                         content TEXT NOT NULL,
#                         author_id INT UNSIGNED NOT NULL,
#                         PRIMARY KEY (id),
#                         FOREIGN KEY (author_id) REFERENCES authors (id)
# );
#
# # Seeds
# INSERT INTO quotes (author_id, content)
# VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
#         'I love deadlines. I love the whooshing noise they make as they go by.');
# INSERT INTO quotes (author_id, content)
# VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
#         'Time is an illusion. Lunchtime doubly so.');
# INSERT INTO quotes (author_id, content)
# values ((select id from authors where first_name = 'Mark' and last_name = 'Twain'),
#         'Clothes make the man. Naked people have little or no influence on society.');
# INSERT INTO quotes (author_id, content)
# values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
#         'The universe is a big place, perhaps the biggest.');
# INSERT INTO quotes (author_id, content)
# VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');
#
#
# CREATE TABLE IF NOT EXISTS topics (
#                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                         name VARCHAR(255),
#                         PRIMARY KEY (id)
# );
#
# INSERT INTO topics(name) VALUES
#                              ('Space and Time'),
#                              ('Humor'),
#                              ('Office Life'),
#                              ('Hitchiker''s Guide to the Galaxy');
#
#
# CREATE TABLE IF NOT EXISTS quote_topic (
#                              quote_id INTEGER UNSIGNED NOT NULL,
#                              topic_id INTEGER UNSIGNED NOT NULL,
#                              FOREIGN KEY (quote_id) REFERENCES quotes(id),
#                              FOREIGN KEY (topic_id) REFERENCES topics(id)
# );
#
# INSERT INTO quote_topic(quote_id, topic_id)
# VALUES (1, 2), (1, 3), (2, 4), (3, 1),
#        (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);
#
#
#
#
# SELECT * FROM authors;
# SELECT * FROM quotes;
# SELECT * FROM topics;
# SELECT * FROM quote_topic;
#
#
#


# USE OnlineShop;
# -- Create Customers Table
# DROP TABLE IF EXISTS Customers;
# CREATE TABLE Customers(
#                           UserId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
#                           Name VARCHAR(80) NOT NULL,
#                           Phone VARCHAR(15),
#                           State VARCHAR(2)
# );
#
# # COULD CREATE STATE TABLE ALSO
# INSERT INTO Customers VALUES (0, 'Jimmy','4567891230','GA');
# INSERT INTO Customers VALUES (0, 'Henry','1234567890','FL');
# INSERT INTO Customers VALUES (0, 'Ruby','7539514682','GA');
# INSERT INTO Customers VALUES (0, 'Julia','3571592486','TX');
# INSERT INTO Customers VALUES (0, 'Anna','0231456785','OK');
#
#
# # ITEMS TABLE
# DROP TABLE IF EXISTS Items;
# CREATE TABLE Items(
#                       ItemId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
#                       CategoryId INT,
#                       Name VARCHAR(100) NOT NULL,
#                       Price FLOAT
# );
# INSERT INTO items VALUES (0, 1, 'Androud Mobile Phone', 250.00);
# INSERT INTO items VALUES (0, 1, 'i7 processor, 8GB RAM Laptop', 1000.00);
# INSERT INTO items VALUES (0, 2, 'How to train your cat', 25.00);
# INSERT INTO items VALUES (0, 2, 'Healthy dog food recipes', 19.00);
# INSERT INTO items VALUES (0, 2, 'Learn how to meditate for mental health', 30.00);
# INSERT INTO items VALUES (0, 3, 'Beautiful Black T-Shirts', 99.00);
# INSERT INTO items VALUES (0, 3, 'Blue Colored Jeans', 150.00);
#
#
# # ORDER HISTORY TABLE
# DROP TABLE IF EXISTS OrderHistory;
# CREATE TABLE OrderHistory (
#                               OrderHistoryId INT PRIMARY KEY AUTO_INCREMENT,
#                               UserId INT NOT NULL,
#                               Itemid INT NOT NULL,
#                               OrderedAmount INT NOT NULL,
#                               FOREIGN KEY (UserId) REFERENCES Customers (UserId)
#
# );
# INSERT INTO OrderHistory VALUES (0, 5, 1, 2);
# INSERT INTO OrderHistory VALUES (0, 1, 1, 7);
# INSERT INTO OrderHistory VALUES (0, 5, 3, 45);
# INSERT INTO OrderHistory VALUES (0, 1, 3, 1);
#
# # SHOW ALL CONTENT IN TABLES
# SHOW TABLES;
# SELECT * FROM Customers;
# SELECT * FROM Items;
# SELECT * FROM OrderHistory;


use practice_db;

# DROP TABLE IF EXISTS quote_topic;
# DROP TABLE IF EXISTS quotes;
# DROP TABLE IF EXISTS topics;
# DROP TABLE IF EXISTS users;
# DROP TABLE IF EXISTS authors;
# DROP TABLE IF EXISTS roles;
# DROP TABLE  user;

# CREATE TABLE IF NOT EXISTS user
# (
#     id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     first_name VARCHAR(25),
#     last_name  VARCHAR(25),
#     user_name  VARCHAR(40),
#     PRIMARY KEY (id)
# );
# INSERT INTO user VALUES (0, 'tim', 'toolman', 'TimmyTom');


#
# CREATE TABLE IF NOT EXISTS password(
#     pass_id INT UNSIGNED NOT NULL,
#     password VARCHAR(50),
#     PRIMARY KEY (pass_id)
# #     FOREIGN KEY (pass_id) REFERENCES user (id)
# );

#
# SHOW TABLES ;
# SELECT * FROM user;
# SELECT * FROM password;

use many_db;

DROP TABLE IF EXISTS userorder;
DROP TABLE IF EXISTS userpassword;
DROP TABLE IF EXISTS siteuser;


CREATE TABLE IF NOT EXISTS siteuser
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(25),
    last_name  VARCHAR(25),
    user_name  VARCHAR(40) UNIQUE ,
    PRIMARY KEY (id)
);
INSERT IGNORE siteuser VALUES (0, 'Tim', 'Toolman', 'Taylor1967');
INSERT IGNORE siteuser VALUES (0, 'Jane', 'Doe', 'DeerWhispeR');
INSERT IGNORE siteuser VALUES (0, 'John', 'Cena', 'UcantSEEme');
INSERT IGNORE siteuser VALUES (0, 'Mike', 'Jones', 'MikeWho?');




CREATE TABLE IF NOT EXISTS userpassword
(
    pass_user VARCHAR(40),
    password VARCHAR(50),
    FOREIGN KEY (pass_user) REFERENCES siteuser (user_name),
    PRIMARY KEY (pass_user)
);
INSERT IGNORE userpassword (pass_user, password) VALUES ((select user_name from siteuser where first_name = 'Tim' and last_name = 'Toolman'), 'Timaay87');
INSERT IGNORE userpassword (pass_user, password) VALUES ((select user_name from siteuser where first_name = 'Jane' and last_name = 'Doe'), 'Bleat123');
INSERT IGNORE userpassword (pass_user, password) VALUES ((select user_name from siteuser where first_name = 'John' and last_name = 'Cena'), 'elbisivni');
INSERT IGNORE userpassword (pass_user, password) VALUES ((select user_name from siteuser where first_name = 'Mike' and last_name = 'Jones'), 'YouKNOW!');


CREATE TABLE IF NOT EXISTS userorder
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ordr_num INT UNSIGNED NOT NULL,
    ordr_ttl INT UNSIGNED NOT NULL ,
    user VARCHAR(40),
    FOREIGN KEY (user) REFERENCES siteuser (user_name),
    PRIMARY KEY (id)
);
INSERT IGNORE userorder (id, ordr_num, ordr_ttl, user) VALUES (0, 23, 857, (
    select user_name from siteuser where first_name = 'Tim'));
INSERT IGNORE userorder (id, ordr_num, ordr_ttl, user) VALUES (0, 67, 78, (
    select user_name from siteuser where first_name = 'Jane'));
INSERT IGNORE userorder (id, ordr_num, ordr_ttl, user) VALUES (0, 2, 7897, (
    select user_name from siteuser where first_name = 'John'));
INSERT IGNORE userorder (id, ordr_num, ordr_ttl, user) VALUES (0, 143, 200, (
    select user_name from siteuser where first_name = 'Mike'));




SHOW TABLES ;
SELECT * FROM siteuser;
SELECT * FROM userpassword;
SELECT * FROM userorder;