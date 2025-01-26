-- Create Table and inserting

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

---------------------------------------------------------------------------------------------- 
 
-- AGGREGATE DATA
/** 1)  SUM()
Calculates the total sum of a numeric column.
Example: SELECT SUM(salary) FROM employees;

2) AVG()
Calculates the average value of a numeric column.
Example: SELECT AVG(salary) FROM employees;

3) COUNT()
Counts the number of rows or non-NULL values in a column.
Example: SELECT COUNT(*) FROM employees;

4) MAX()
Returns the maximum value in a column.
Example: SELECT MAX(salary) FROM employees;

5) MIN()
Returns the minimum value in a column.
Example: SELECT MIN(salary) FROM employees;

6) GROUP_CONCAT() 
Concatenates values from a group into a single string.
Example: SELECT GROUP_CONCAT(employee_name) FROM employees;

7) STDEV() / STDDEV() 
Calculates the standard deviation of a numeric column.
Example: SELECT STDEV(salary) FROM employees; (SQL Server)

8) VARIANCE()
Calculates the variance of a numeric column.
Example: SELECT VARIANCE(salary) FROM employees;

Note:
>Aggregate functions are often used with the GROUP BY clause to group rows for calculations.
>They ignore NULL values unless explicitly handled. For example, COUNT(column) ignores NULLs,
 but COUNT(*) does not.
**/

SELECT aisle, SUM(quantity) FROM groceries1 GROUP BY aisle;

/** Challenege for aggregate data topic
1.Here's a table containing a TODO list with the number of minutes it will take to complete each item. Insert 
another item to your todo list with the estimated minutes it will take.
CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);**/

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
/** I created**/
INSERT INTO todo_list VALUES(4, "Washing Dress", 45);

/** Select the SUM of minutes it will take to do all of the
 items on your TODO list. You should only have one SELECT statement.**/
 
 select sum(minutes) FROM todo_list;

---------------------------------------------------------------------------------------------- 
 
 -- Project Based on what I leant still here.
 /**Create your own store! Your store should sell one type of things, like clothing or bikes,
 whatever you want your store to specialize in. You should have a table for all the items 
 in your store, and at least 5 columns for the kind of data you think you'd need to store.
 You should sell at least 15 items, and use select statements
 to order your items by price and show at least one statistic about the items.**/
 
 CREATE TABLE Clothing_Products1(Product_ID INT PRIMARY KEY,       -- Unique identifier for each product
    Product_Name VARCHAR(100),        -- Name/description of the clothing item
    Category VARCHAR(50),             -- Type of clothing (e.g., Shirt, Dress, Pants)
    Price DECIMAL(10, 2),             -- Price of the clothing item in USD (up to 99999999.99)
    Stock INT );
 
 INSERT INTO Clothing_Products1 (Product_ID, Product_Name, Category, Price, Stock) 
 VALUES
 (1, 'Classic White Shirt','Shirt', 25.99, 150),
 (2, 'Slim Fit Denim Jeans','Pants', 49.99, 120),
 (3, 'Summer Floral Dress','Dress', 39.99, 80),
 (4, 'Leather Jacket','Jacket', 129.99, 25),
 (5, 'Casual Polo Shirt','Shirt', 19.99, 200),
 (6, 'Chino Pants','Pants', 34.99, 100),
 (7, 'Little Black Dress','Dress', 59.99, 60),
 (8, 'Hoodie Sweatshirt','Jacket', 45.99, 90),
 (9, 'Plaid Flannel Shirt','Shirt', 29.99, 110),
 (10, 'Maxi Evening Gown','Dress', 79.99, 15),
 (11, 'Bomber Jacket','Jacket', 99.99, 30),
 (12, 'Relaxed Fit Joggers','Pants', 29.99, 95),
 (13, 'Graphic T-Shirt', 'Shirt', 14.99, 300),
 (14, 'Formal Suit Pants','Pants', 54.99, 50),
 (15, 'Quilted Winter Coat','Jacket', 149.99, 10);
 
 SELECT * FROM Clothing_Products1;
 
 -- 1.Ordering items by prince in Ascending order.
 SELECT Product_ID, Product_Name, Category, Price
 FROM Clothing_Products1 ORDER BY Price ASC;
 
 -- 2. Calculating the Average Price of All Products.
 SELECT AVG(Price) AS Average_Price From Clothing_Products1;
 
 -- 3. Finding Most Expensive Product.
 SELECT Product_ID, Product_Name, Price 
 FROM Clothing_Products1 ORDER BY Price DESC LIMIT 1;
 
 -- 4. Counts Products Below $30
 SELECT Product_ID, Product_Name, Price 
 FROM Clothing_Products1 WHERE Price < 30;
 
 -- 5.Counts Products by Category
 SELECT Category, COUNT(*) AS Number_of_Products
 FROM Clothing_Products1 GROUP BY Category;
 
 --------------------------------------------------------------------------------------------
 -- More Complex Queries with AND / OR
 
 CREATE TABLE exercise_logs1 ( id INTEGER PRIMARY KEY AUTO_INCREMENT, type TEXT,
 minutes INTEGER, calories INTEGER, heart_rate INTEGER);
 
 INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("Biking", 30, 100, 110);
 INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("Biking", 10, 30, 105);
 INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("Dancing", 15, 200, 120);
 
 -- here Id is kept in autoincrement so we no need to specify the id every time.
 
 SELECT * FROM exercise_logs1;
 
 SELECT * FROM exercise_logs1 WHERE calories > 50 ORDER BY calories;
 
 /* AND */
 SELECT * FROM exercise_logs1 WHERE calories > 50 AND minutes < 30;
 
 /* OR */
 SELECT * FROM exercise_logs1 WHERE calories > 50 OR heart_rate > 100;

 -- Challenges
 /**
Ever sung karaoke? It's a place where you sing songs with your friends, and it's a lot of fun. We've created a table with songs, and in this challenge, you'll use queries
 to decide what songs to sing.
 Given Table
 CREATE TABLE songs (
    id INTEGER PRIMARY KEY,
    title TEXT,
    artist TEXT,
    mood TEXT,
    duration INTEGER,
    released INTEGER);
    
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Bohemian Rhapsody", "Queen", "epic", 60, 1975);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Let it go", "Idina Menzel", "epic", 227, 2013);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will survive", "Gloria Gaynor", "epic", 198, 1978);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Twist and Shout", "The Beatles", "happy", 152, 1963);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("La Bamba", "Ritchie Valens", "happy", 166, 1958);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("I will always love you", "Whitney Houston", "epic", 273, 1992);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Sweet Caroline", "Neil Diamond", "happy", 201, 1969);
INSERT INTO songs (title, artist, mood, duration, released)
    VALUES ("Call me maybe", "Carly Rae Jepsen", "happy", 193, 2011);
 **/
 CREATE TABLE songs1 (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title TEXT,
    artist TEXT,
    mood TEXT,
    duration INTEGER,
    released INTEGER);
    
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("Bohemian Rhapsody", "Queen", "epic", 60, 1975);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("Let it go", "Idina Menzel", "epic", 227, 2013);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("I will survive", "Gloria Gaynor", "epic", 198, 1978);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("Twist and Shout", "The Beatles", "happy", 152, 1963);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("La Bamba", "Ritchie Valens", "happy", 166, 1958);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("I will always love you", "Whitney Houston", "epic", 273, 1992);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("Sweet Caroline", "Neil Diamond", "happy", 201, 1969);
INSERT INTO songs1 (title, artist, mood, duration, released)
    VALUES ("Call me maybe", "Carly Rae Jepsen", "happy", 193, 2011);
 
/** For the first step, select all the song titles. **/

SELECT title FROM songs1;

/** 
Step 2
Maybe your friends only like singing either recent songs or truly epic songs.
Add another SELECT that uses OR to show the titles of the songs that have an 'epic' mood 
or a release date after 1990.

(Tip: If you're not sure how to select rows where a column equals a value, remember
 that you can check the documentation below.)
**/

 SELECT title FROM songs1 WHERE mood = 'epic' or released > 1990;
 
 /**
 Step 3
People get picky at the end of the night. Add another SELECT that uses AND to 
show the titles of songs that are 'epic', and released after 1990, and less than 4 minutes long.

Note that the duration column is measured in seconds.
**/

 SELECT title FROM songs1 WHERE mood = 'epic'AND released > 1990 AND duration < 240 ; 
 -------------------------------------------------------------------------------------------
 -- Querying IN subqueries
 
 INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs1(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);
 
 SELECT * FROM exercise_logs1;
 
 SELECT * FROM exercise_logs1 WHERE type = "biking" OR type = "hiking" 
 OR type = "tree climbing" OR type = "rowing";
 
 /* IN */-- Same query for above select statement.
SELECT * FROM exercise_logs1 WHERE type  IN ("biking" ,"hiking" 
 , "tree climbing" , "rowing");
 
 -- We can make above statement as inverse statement by not.
 SELECT * FROM exercise_logs1 WHERE type NOT IN ("biking" ,"hiking" 
 , "tree climbing" , "rowing");
 
 CREATE TABLE drs_favorite
    (id INTEGER PRIMARY KEY auto_increment,
    type TEXT,
    reason TEXT);

INSERT INTO drs_favorite(type, reason) VALUES ("biking", "Improves endurance and flexibility.");
INSERT INTO drs_favorite(type, reason) VALUES ("hiking", "Increases cardiovascular health.");
 
SELECT type FROM drs_favorite;
 
SELECT * FROM exercise_logs1 WHERE type  IN ("biking" ,"hiking");
 
 SELECT * FROM exercise_logs1 WHERE type  IN (SELECT type FROM drs_favorite);
 
SELECT * FROM exercise_logs1 WHERE type  IN (SELECT type FROM drs_favorite WHERE reason = 'Increases cardiovascular health');
-- it can't exact matching.
-- So we can use like operator.

/* LIKE */
SELECT * FROM exercise_logs1 WHERE type  IN 
(SELECT type FROM drs_favorite WHERE reason  LIKE '%cardiovascular%');

 -- Challenges
 /** We've created a database of songs and artists,
 and you'll make playlists from them in this challenge.**/
 
 CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    country TEXT,
    genre TEXT);
 
INSERT INTO artists (name, country, genre)VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artists (name, country, genre)VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists (name, country, genre)VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artists (name, country, genre)VALUES ("Queen", "UK", "Rock");
INSERT INTO artists (name, country, genre)VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artists (name, country, genre)VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artists (name, country, genre)VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artists (name, country, genre)VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artists (name, country, genre)VALUES ("Rihanna", "US", "Pop");
INSERT INTO artists (name, country, genre)VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists (name, country, genre)VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artists (name, country, genre)VALUES ("Bob Marley", "Jamaica", "Reggae");
 
 SELECT * FROM artists;
 
CREATE TABLE songs2 (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    artist TEXT,
    title TEXT);

INSERT INTO songs2 (artist, title)VALUES ("Taylor Swift", "Shake it off");
INSERT INTO songs2 (artist, title)VALUES ("Rihanna", "Stay");
INSERT INTO songs2 (artist, title)VALUES ("Celine Dion", "My heart will go on");
INSERT INTO songs2 (artist, title)VALUES ("Celine Dion", "A new day has come");
INSERT INTO songs2 (artist, title)VALUES ("Shania Twain", "Party for two"); 
INSERT INTO songs2 (artist, title)VALUES ("Gloria Estefan", "Conga");
INSERT INTO songs2 (artist, title)VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO songs2 (artist, title)VALUES ("ABBA", "Mamma mia");
INSERT INTO songs2 (artist, title)VALUES ("Queen", "Bicycle Race"); 
INSERT INTO songs2 (artist, title)VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO songs2 (artist, title)VALUES ("Guns N' Roses", "Don't cry"); 

SELECT * FROM songs2;
 
/**In this first step, select the title of all the songs by the artist named 'Queen'.**/
SELECT title FROM songs2 WHERE artist = 'Queen';
 
 /**tep 2
 Now you'll make a 'Pop' playlist. In preparation, select the name of all of
 the artists from the 'Pop' genre.
(Tip: Make sure you type it 'Pop', SQL considers that different from 'pop'.**/
 
SELECT name FROM artists WHERE genre = 'Pop';

/** Step 3
To finish creating the 'Pop' playlist, add another query that will select the title of all 
the songs from the 'Pop' artists.It should use IN on a nested subquery that's based on your
 previous query.**/
 
 SELECT title FROM songs2 WHERE artist IN ( SELECT name FROM artists WHERE genre = 'Pop');
 --------------------------------------------------------------------------------------------
 -- Restricting grouped results with HAVING
 
 CREATE TABLE exercise_logs2
    (id INTEGER PRIMARY KEY AUTO_INCREMENT,
    type TEXT,
	minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("biking", 30, 115, 110);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("biking", 10, 45, 105);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 165, 120);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs2(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);
 
 SELECT * FROM exercise_logs2;
 
 -- SEEING HOW MUCH CALORIES BURNT FRO EACH TYPE. 
 SELECT type, SUM(calories) AS total_calories FROM exercise_logs2 GROUP BY type;
 
 -- MORE 150 CALORIES BURNT TOTALLY.
 -- USING WHERE CLAUSE.\
 -- WHERE TYPE IS SING FOR INDIVIDUALS VALUES.
 SELECT type, SUM(calories) AS total_calories FROM exercise_logs2 WHERE calories > 150
 GROUP BY type;
 
 -- USING HAVING CLAUSE
 -- IT IS APPLYING CONDITION FOR GROUPED VALUES NOT INDIVIDUAL VALUES
 SELECT type, SUM(calories) AS total_calories FROM exercise_logs2 
 GROUP BY type HAVING total_calories > 150; 
   
-- AVERAGE CALORIES FOR ALL THE EXERCISE FOR MORE THAN 70.
 SELECT type, AVG(calories) AS avg_calories FROM exercise_logs2
 GROUP BY type HAVING avg_calories > 70;
 
 SELECT type FROM exercise_logs2 GROUP BY 
 type HAVING COUNT(*) >=2;
 
 -- cHALLENG QUESTION
 /**
 We've created a database of afew popular authors and their books, with word counts
 for each book.
 **/
 
 CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    author TEXT,
    title TEXT,
    words INTEGER);
    
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Philosopher's Stone", 79944);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Chamber of Secrets", 85141);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Prisoner of Azkaban", 107253);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Goblet of Fire", 190637);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Order of the Phoenix", 257045);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Half-Blood Prince", 168923);
INSERT INTO books (author, title, words)
    VALUES ("J.K. Rowling", "Harry Potter and the Deathly Hallows", 197651);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Twilight", 118501); 
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "New Moon", 132807);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Eclipse", 147930);
INSERT INTO books (author, title, words)
    VALUES ("Stephenie Meyer", "Breaking Dawn", 192196);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "The Hobbit", 95022);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Fellowship of the Ring", 177227);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Two Towers", 143436);
INSERT INTO books (author, title, words)
    VALUES ("J.R.R. Tolkien", "Return of the King", 134462);
    
/**Step 1
In this first step, select all the authors who have written more than 1 million words,
 using GROUP BY and HAVING. Your results table should include the 'author' and their total
 word count as a 'total_words' column.
 **/
 
SELECT author, SUM(words) AS total_words FROM books GROUP BY author HAVING 
total_words > 1000000;   

/** 
Step 2
Now select all the authors that write more than an average of 150,000 words per book. 
Your results table should include the 'author' and average words as an 'avg_words' column.
**/ 
    
  SELECT author, AVG(words) AS avg_words
  FROM books group by author HAVING avg_words > 150000;  