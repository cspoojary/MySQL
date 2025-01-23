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