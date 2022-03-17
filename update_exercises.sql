USE codeup_test_db;

# All albums in table
SELECT * FROM albums;
UPDATE albums
SET sales = sales * 10;
SELECT * FROM albums;

# All albums before 1980
SELECT * FROM albums WHERE release_date < 1980;

# All albums by Michael Jackson
SELECT * FROM albums WHERE artist = 'Michael Jackson'