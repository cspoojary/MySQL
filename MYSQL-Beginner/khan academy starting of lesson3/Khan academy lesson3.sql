-- JOINING RELATED TABLES

CREATE TABLE students01 (id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT);

INSERT INTO students01 (first_name, last_name, email, phone, birthdate)
    VALUES ("Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students01 (first_name, last_name, email, phone, birthdate)
    VALUES ("Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04");
    
CREATE TABLE student_grades01 (id INTEGER PRIMARY KEY AUTO_INCREMENT,
    student_id INTEGER,
    test TEXT,
    grade INTEGER);

INSERT INTO student_grades01 (student_id, test, grade)
    VALUES (1, "Nutrition", 95);
INSERT INTO student_grades01 (student_id, test, grade)
    VALUES (2, "Nutrition", 92);
INSERT INTO student_grades01 (student_id, test, grade)
    VALUES (1, "Chemistry", 85);
INSERT INTO student_grades01 (student_id, test, grade)
    VALUES (2, "Chemistry", 95);
    
SELECT * FROM student_grades01;

-- STUDENT NAME AND EMAIL AFTER TEST COLUMN
/* cross join */
SELECT * FROM student_grades01, students01;

/* implicit inner join */
SELECT * FROM student_grades01, students01
    WHERE student_grades01.student_id = students.id;
    
/* explicit inner join - JOIN */
SELECT students01.first_name, students01.last_name, students01.email,
 student_grades01.test, student_grades01.grade FROM students01
    JOIN student_grades01
    ON students01.id = student_grades01.student_id
    WHERE grade > 90;
    
/*INNER JOIN
Definition:
Combines rows from two tables only where there is a match in both tables.

Result:
Returns only the matching rows between the two tables.

Use Case:
Use when you need data only where there is a relationship between tables.
*/
    
-- Challenge 
/** 
We've created a database of people and hobbies, and each row in hobbies is related to a row in persons via the person_id column.
CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
**/

CREATE TABLE persons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name TEXT,
    age INT
);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);

SELECT * FROM persons;

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

SELECT * FROM hobbies;

/** step 1
In this first step, insert one more row 
in persons and then one more row in hobbies that is related to the newly inserted person.
**/
INSERT INTO persons (name, age) VALUES ("Chaithanya", 21);

INSERT INTO hobbies ( person_id, name) VALUES (5, "Yoga");

/** Step 2
Now, select the 2 tables with a join so that you can see each person's name next to their hobby.
**/
SELECT hobbies.name, persons.name FROM persons 
JOIN hobbies 
ON persons.id = hobbies.person_id;

/* step3
Show only the name and hobbies of 'Bobby McBobbyFace', using JOIN combined with WHERE.
*/
SELECT persons.name, hobbies.name FROM persons 
JOIN hobbies 
ON persons.id = hobbies.person_id
WHERE persons.name = "Bobby McBobbyFace";

-----------------------------------------------------------------------------------------------------------
 -- Joining related tables with left outer joins
 
CREATE TABLE students03 (id INTEGER PRIMARY KEY auto_increment,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT);

INSERT INTO students03 (first_name, last_name, email, phone, birthdate)
    VALUES ("Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students03 (first_name, last_name, email, phone, birthdate)
    VALUES ("Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04");
    
CREATE TABLE student_grades02 (id INTEGER PRIMARY KEY auto_increment,
    student_id INTEGER,
    test TEXT,
    grade INTEGER);

INSERT INTO student_grades02 (student_id, test, grade)
    VALUES (1, "Nutrition", 95);
INSERT INTO student_grades02 (student_id, test, grade)
    VALUES (2, "Nutrition", 92);
INSERT INTO student_grades02 (student_id, test, grade)
    VALUES (1, "Chemistry", 85);
INSERT INTO student_grades02 (student_id, test, grade)
    VALUES (2, "Chemistry", 95);

CREATE TABLE student_projects01 (id INTEGER PRIMARY KEY auto_increment,
    student_id INTEGER,
    title TEXT);
    
INSERT INTO student_projects01 (student_id, title)
    VALUES (1, "Carrotapault");

-- Now we want list of student name and projects they are working
/* outer join */ 
SELECT students03.first_name, students03.last_name, student_projects01.title
    FROM students03
    LEFT OUTER JOIN student_projects01
    ON students03.id = student_projects01.student_id;
    
    
/* OUTER JOIN
Definition:
Combines rows from two tables, including non-matching rows, depending on the type of OUTER JOIN.
Result:
Returns matching rows and also includes unmatched rows from one or both tables.
Use Case:
Use when you need all rows from one or both tables, regardless of matches.
*/

-- CHALLENGES

/*
We've created a database for customers and their orders. Note, not all of the customers 
have made orders. 

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);
*/

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);
    
/*Come up with a query that lists the name and email of every
 customer followed by the item and price of orders they've made. Use a LEFT OUTER JOIN 
 so that a customer is listed even if they've made no orders, and don't add any 
 ORDER BY.*/

 SELECT customers.name, customers.email, orders.item, orders.price
 FROM customers
 LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id;

 /*Create another query that will result in one row per each customer, with their name, 
 email, and total amount of money they've spent on orders. Sort the rows according to 
 the total money spent, from the most spent to the least spent.
(Tip: You should always GROUP BY on the column that is most likely to be unique 
in a row.)*/

 SELECT customers.name, customers.email, SUM(orders.price) AS "total"
 FROM customers
 LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id
 GROUP BY customers.id
 ORDER BY orders.price DESC;

--------------------------------------------------------------------------------------------------
-- Joining tables to themselves with self-joins

    CREATE TABLE students04 (id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT,
	buddy_id INTEGER);
    
 -- BUDDY_id is an id that realtes to student that thay buddy up with.alter
 
INSERT INTO students04
    VALUES (1, "Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24", 2);
INSERT INTO students04
    VALUES (2, "Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04", 1);
INSERT INTO students04
    VALUES (3, "Aladdin", "Lampland", "aladdin@lampland.com", "555-3333", "2001-05-10", 4);
INSERT INTO students04 
    VALUES (4, "Simba", "Kingston", "simba@kingston.com", "555-1111", "2001-12-24", 3);
    
SELECT id, first_name, last_name, buddy_id FROM students04;

/* self join */
SELECT students04.first_name, students04.last_name, buddies.email as buddy_email
    FROM students04
    JOIN students04 buddies
    ON students04.buddy_id = buddies.id;
    
-- Challenges
/*    
  
We've created a table with all the 'Harry Potter'
 movies, with a sequel_id column that matches the id of the sequel for each movie.  
*/
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    released INTEGER,
    sequel_id INTEGER);

INSERT INTO movies 
    VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies 
    VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies 
    VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies 
    VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies 
    VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies 
    VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies 
    VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies 
    VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);
    
/* Issue a SELECT that will show the title of each movie next to its sequel's 
title (or NULL if it doesn't have a sequel).*/
SELECT movies.title AS "movie_title", sequel.title AS "sequel_title"
FROM movies
LEFT OUTER JOIN movies sequel
ON movies.sequel_id = sequel.id;
	
---------------------------------------------------------------------------------------------
 -- Combining multiple joins
 
    CREATE TABLE students05 (id INTEGER PRIMARY KEY auto_increment,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT);

INSERT INTO students05 (first_name, last_name, email, phone, birthdate)
    VALUES ("Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students05 (first_name, last_name, email, phone, birthdate)
    VALUES ("Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04");
INSERT INTO students05 (first_name, last_name, email, phone, birthdate)
    VALUES ("Aladdin", "Lampland", "aladdin@lampland.com", "555-3333", "2001-05-10");
INSERT INTO students05 (first_name, last_name, email, phone, birthdate)
    VALUES ("Simba", "Kingston", "simba@kingston.com", "555-1111", "2001-12-24");
    
CREATE TABLE student_projects02 (id INTEGER PRIMARY KEY auto_increment,
    student_id INTEGER,
    title TEXT);
    
INSERT INTO student_projects02 (student_id, title)
    VALUES (1, "Carrotapault");
INSERT INTO student_projects02 (student_id, title)
    VALUES (2, "Mad Hattery");
INSERT INTO student_projects02 (student_id, title)
    VALUES (3, "Carpet Physics");
INSERT INTO student_projects02 (student_id, title)
    VALUES (4, "Hyena Habitats");
    
drop table project_pairs;
CREATE TABLE project_pairs (id INTEGER PRIMARY KEY auto_increment,
    project1_id INTEGER,
    project2_id INTEGER);

INSERT INTO project_pairs (project1_id, project2_id)
    VALUES(1, 2);
INSERT INTO project_pairs (project1_id, project2_id)
    VALUES(3, 4);
    
SELECT * FROM project_pairs
	JOIN student_projects a
	JOIN student_projects b;
    
SELECT a.title, b.title FROM project_pairs
    JOIN student_projects02 a
    ON project_pairs.project1_id = a.id
    JOIN student_projects02 b
    ON project_pairs.project2_id = b.id;
    
-- Challenges
/* 
We've created a database for a friend networking site, with a table storing data on each person, 
a table on each person's hobbies, and a table of friend connections between the people.*/

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

drop table hobbies;
CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);


INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);
  
/*
In this first step, use a JOIN to display a table showing people's names with their hobbies.
*/

SELECT persons.fullname, hobbies.name
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

/*Now, use another SELECT with a JOIN to show the names of each pair of friends,
based on the data in the friends table.
*/

SELECT a.fullname, b.fullname
FROM friends
JOIN persons a
ON a.id = friends.person1_id
JOIN persons b
ON b.id = friends.person2_id;


-- Project
/*
In this project, you’re going to make your own table with some small set of “famous people”, then make more tables about things they do and join those to create nice human readable lists.

For example, here are types of famous people and the questions your data could answer:

Movie stars: What movies are they in? Are they married to each other?
Singers: What songs did they write? Where are they from?
Authors: What books did they write?
Fictional characters: How are they related to other characters? What books do they show up in?
*/
CREATE TABLE billionares (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fullname TEXT,
    age INTEGER,
    nationality TEXT);
    
INSERT INTO billionares (fullname, age, nationality) VALUES ("Jeff Bezos", 54, "US");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Bill Gates", 62, "US");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Warren Buffet", 87, "US");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Bernard Arnault", 69, "France");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Mark Zucherberg", 33, "US");

CREATE table wealth (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    billionare_id INTEGER,
    net_worth TEXT,
    source_wealth TEXT);
    
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (1, "112 billion", "Amazon");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (2, "90 billion", "Microsoft");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (3, "84 billion", "Berkshire Hathaway");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (4, "72 billion", "LVMH");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (5, "71 billion", "Facebook");


/*Return total net worth for each billionare*/
SELECT billionares.fullname, wealth.net_worth
FROM billionares
JOIN wealth
ON billionares.id = wealth.billionare_id;
