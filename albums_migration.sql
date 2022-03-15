USE codeup_test_db;

CREATE TABLE IF NOT EXISTS albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) DEFAULT 'NONE',
    aritist  VARCHAR(50) DEFAULT 'NONE',
    release_date DATE,
    sales INT UNSIGNED NOT NULL,
    genre VARCHAR(50) DEFAULT 'NONE',
    PRIMARY KEY (id)
);