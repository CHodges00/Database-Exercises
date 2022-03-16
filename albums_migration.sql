USE codeup_test_db;

DROP TABLE IF EXISTS quotes;

CREATE TABLE albums(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name         VARCHAR(50) DEFAULT 'NONE',
    artist      VARCHAR(50) DEFAULT 'NONE',
    release_date DATE,
    sales        INT UNSIGNED NOT NULL,
    genre        VARCHAR(50) DEFAULT 'NONE',
    PRIMARY KEY (id)
);
