USE codeup_test_db;

# All albums in table sales * 10
SELECT * FROM albums;
UPDATE albums
SET sales = albums.sales * 10;
SELECT * FROM albums;

# All albums before 1980
SELECT * FROM albums WHERE release_date < 1980;
UPDATE albums
SET release_date = 1850
WHERE 1980 > release_date;
SELECT * FROM albums WHERE release_date < 1980;

# All albums by Michael Jackson
SELECT * FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
SELECT * FROM albums WHERE artist = 'Peter Jackson';