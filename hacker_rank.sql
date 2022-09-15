# use practice_db;

#
#
#
# The CITY table is described as follows:
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
('Miami', 'USA', 'Florida', 20),
('Tokyo', 'JPN', 'Tokyo', 3000000);

# Query all columns for all American cities in the CITY table with populations larger than 100000.
# The CountryCode for America is USA.
SELECT * from city where countrycode = 'USA' and population > 100000;


# Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT name from city where countrycode = 'USA' and population > 120000;

# Query all columns (attributes) for every row in the CITY table
SELECT * from city;

# Query all columns for a city in CITY with the ID 1661.
SELECT * from city where id = 1661;

# Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT * from city where countrycode = 'JPN';

# Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT name from city where countrycode = 'JPN';

#
#
#
# The STATION table is described as follows:
DROP TABLE IF EXISTS station;

CREATE TABLE station (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    city VARCHAR(21),
    state VARCHAR(2),
    lat_n INT,
    long_w INT,
    PRIMARY KEY (id)
);

INSERT INTO station (city, state, lat_n, long_w) VALUES
    ('Macon', 'GA', 21, 45),
    ('San Antonio', 'TX', 34, 78);

# Query a list of CITY and STATE from the STATION table.
SELECT city, state from station;

# Query a list of CITY names from STATION for cities that have an even ID number.
# Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT city from station where id%2 = 0;

# Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

