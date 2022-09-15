# use practice_db;


# Query all columns for all American cities in the CITY table with populations larger than 100000.
# The CountryCode for America is USA.
DROP TABLE IF EXISTS city;

CREATE TABLE city(
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(17),
                       countrycode VARCHAR(3),
                       district VARCHAR(20),
                       population INT,
                       PRIMARY KEY (id)
);

INSERT INTO  city (name, countrycode, district, population) VALUES
('Atlanta', 'USA', 'Georgia', 200000),
('Miami', 'USA', 'Florida', 20);

SELECT * from city where countrycode = 'USA' and population > 100000;