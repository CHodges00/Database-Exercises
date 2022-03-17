USE codeup_test_db;

TRUNCATE albums;

INSERT INTO albums (artist, name, release_date, genre, sales)
VALUES ( 'Michael Jackson', 'Thriller', 1982, 'Pop', 49.2),
         ( 'AC/DC', 'Back in Black', 1980, 'Hard Rock', 29.5),
         ( 'Whitney Houston', 'The Bodyguard', 1992, 'Pop', 32.4),
         ( 'Meat Loaf', 'Bat Out of Hell', 1992, 'Hard Rock', 21.7),
         ( 'Eagles', 'Hotel California', 1976, 'Country Rock', 41.2),
         ( 'Bee Gees', 'Saturday Night Fever', 1977, 'Rock',  21.6),
         ( 'Fleetwood Mac', 'Rumors', 1977, 'Soft Rock', 27.9),
         ( 'Shania Twain', 'Come On Over', 1997, 'Disco', 29.6),
         ( 'Led Zeppelin', 'Led Zepplin IV', 1971, 'Soft Rock', 29),
         ( 'Michael Jackson', 'Bad', 1987, 'Pop', 21.1),
         ( 'Alanis Morissette', 'Jagged Little Pill', 1995, 'Rock', 24.3),
        ( 'Michael Jackson', 'Dangerous', 1991, 'Hard Rock', 17),
        ( 'Celine Dion', 'Falling into you', 1996, 'Pop', 21.1),
        ( 'The Beatles', 'Sgt. Pepper''s Lonely Hearts Club Band', 1967, 'Rock', 18.2),
        ( 'Adele', '21', 2011, 'Pop', 26.4),
        ( 'Celine Dion', 'Lets\' Talk About Love', 1997, 'Pop', 19.3),
        ( 'Metallica', 'Metallica', 1991, 'Heavy Metal', 25.2),
        ( 'The Beatles', '1', 2000, 'Rock', 23.5),
        ( 'The Beatles', 'Abbey Road', 1969, 'Rock',  14.4),
        ( 'ABBA', 'Gold', 1992, 'Pop', 23.0),
        ( 'Bruce Springsteen', 'Born in the U.S.A', 1984, 'Heartland Rock', 19.6),
        ( 'Madonna', 'The Immaculate Collection', 1990, 'Pop',  19.5),
        ( 'Pink Floyd', 'The Wall', 1979, 'Progressive Rock',  18.7),
        ( 'James Horner', 'Titanic', 1997, 'Film Score', 18.1),
        ( 'Dire Straits', 'Brothers in Arms', 1985, 'Roots Rock', 17.7),
        ( 'Nirvana', 'Nevermind', 1991, 'Grunge',  16.7),
        ( 'Santana', 'Supernatural', 1999, 'Latin Rock', 20.5),
        ( 'Guns N\' Roses', 'Appetite for Destruction', 1987, 'Hard Rock', 21.9),
        ( 'Elton John', 'Goodbye Yellow Brick Road', 1973, 'Rock',  8.5);