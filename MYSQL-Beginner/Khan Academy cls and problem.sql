-- Create Table

/** Grocery list: 
Bananas (4)
Peanut Butter (1)
Dark Chocolate Bars (2)
**/

CREATE TABLE groceries( id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER);

INSERT INTO  groceries VALUES (1, 'Bananas', 4);
INSERT INTO groceries VALUES(2, "Peanut Butter", 1);
INSERT INTO groceries VALUES(3,"Dark Chocolate Bars", 2);

SELECT * FROM groceries;

/** Challenge question**/
/** What are your favorite books? You can make a database table to store them in! In this first step, create a table to store your list of books.
 It should have columns for id, name, and rating.**/
 
 CREATE TABLE Fvrt_Books(id INTEGER, name TEXT, rating INTEGER);

INSERT INTO Fvrt_Books VALUES(1, 'Warmth', 4);
INSERT INTO fvrt_Books VALUES(2, 'A Diary of Young girl', 3);
INSERT INTO Fvrt_Books VALUES(3, 'Indian Naga', 4.5);

select * from Fvrt_Books;


CREATE TABLE groceries1 (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, aisle INTEGER);
INSERT INTO groceries1 VALUES (1, "Bananas", 4, 7);
INSERT INTO groceries1 VALUES(2, "Peanut Butter", 1, 2);
INSERT INTO groceries1 VALUES(3, "Dark Chocolate Bars", 2, 2);
INSERT INTO groceries1 VALUES(4, "Ice cream", 1, 12);
INSERT INTO groceries1 VALUES(5, "Cherries", 6, 2);
INSERT INTO groceries1 VALUES(6, "Chocolate syrup", 1, 4);

SELECT * FROM groceries1 WHERE aisle > 5 ORDER BY aisle;


/** This database contains an incomplete list of box office hits and their release year.
 In this challenge, you're going to get the results back out of the database 
in different ways! In this first step, just select all the movies**/

CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);
 
SELECT * FROM movies;

/**Now, add a second query after the first, that retrieves only the movies that were
 released in the year 2000 or later, not before. Sort the results so that the earlier
 movies are listed first. You should have 2 SELECT statements after this step.**/
 
 SELECT * FROM movies WHERE release_year >= 2000 ORDER BY release_year;
 